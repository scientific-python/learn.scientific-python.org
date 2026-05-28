# ADR 0009 — Integrate scientific-python-myst-theme via copier (committed files)

Date: 2026-05-28
Status: Proposed
Branch: lb/myst-migration

## Context

`scientific-python/scientific-python-myst-theme` provides shared MyST styling,
config, plugins (`team-grid.mjs`), assets (logo, favicon, CSS), and a footer
template. It is distributed as a **copier template**, not a pip/npm package: the
intended consumption pattern is for a site's `myst.yml` to `extends:` a
`config/scientific-python.yml` shipped in the template.

The theme is brand-new (created 2026-05-18, 0 tagged releases), so upstream
`main` HEAD is the only pinning target. We need a strategy for pulling theme
files into `content/` that is reproducible on Netlify CI (`make html-all`), on a
fresh `git clone` + `myst start`, and across maintainer machines.

Constraint: MyST resolves `myst.yml` paths (`extends:`, `style:`, `logo:`,
plugins) relative to the `myst.yml` location, which is `content/`. Theme files
must land at predictable paths under `content/`.

## Decision

Adopt **committed theme files, vendored selectively from a copier render** (a
refinement of Option 2).

Upstream is a _scaffold-a-new-site_ template: a full `copier copy` renders
`index.md`, `myst.yml`, `about.md`, `news.md`, `Makefile`, `.gitignore`
alongside the theme infrastructure. Our `content/` already holds a populated
site, so a direct copy would clobber `index.md`/`myst.yml` and add unwanted
pages. We therefore render to a throwaway dir and copy in only the theme files.

Implementation (as performed):

- Render once to a temp dir via `pixi exec --spec copier copier copy --trust
--defaults gh:scientific-python/scientific-python-myst-theme <tmp>` (copier is
  run ephemerally; it is not a project dependency).
- Vendor only these into `content/`, committed: `config/scientific-python.yml`,
  `assets/css/scientific-python.css`, `assets/images/logo.svg`,
  `assets/images/favicon.ico`, `team-grid.mjs`, `footer.md`, and
  `.copier-answers.yml` (provenance: records upstream `_commit`).
- Add `extends: config/scientific-python.yml` to `content/myst.yml`; `style`
  (`assets/css/scientific-python.css`) is inherited from it. No local style
  override: mystmd >=1.10 requires `style` to be a single string, and MyST does
  not bundle a stylesheet's CSS `@import`s, so theme CSS plus a separate local
  override file cannot coexist. The former local `custom.css` (a navbar Lato
  font tweak) was dropped.
- Remove the previously duplicated top-level `assets/` (logo/favicon byte
  identical to theme copies); `content/assets/` is now the single source.
- Do not add copier to the Netlify build or `make prepare`; CI consumes the
  committed files as-is.

Update path: `copier update` cannot run cleanly (it conflicts on the diverged
scaffold files), so updates are done by re-rendering to a temp dir and diffing
the vendored files by hand. Revisit Option 3 once upstream separates "theme
core" from "site scaffold" and cuts tagged releases.

Known upstream gap: `config/scientific-python.yml` sets
`primary_sidebar_footer: sidebar-footer.md`, which the template does not ship; the
build emits a non-fatal warning. To be raised upstream, not stubbed.

`external-content/cookie` is unaffected (ADR 0004). Cookie is also a MyST site
and also extends a vendored `config/scientific-python.yml`, but it vendors its
own copy and its build is upstream's; the theme files here are consumed by
`learn`'s MyST build only. The two copies have already drifted (cookie sets
`hide_toc: false` and ships no `style`, `plugins`, or `primary_sidebar_footer`),
which is expected: each site tunes the shared base for itself.

## Options considered

1. **Git submodule** (mirror cookie) — introduces transient copied files, dual
   source of truth, and a copy step on every `myst start`; a copier template is
   not a runnable artifact, so a source submodule is a structural mismatch.
2. **Copier copy, committed files** (chosen) — zero new build-time deps,
   `myst start` works on fresh clone. Tradeoff: manual update cadence, drift risk.
3. **Scheduled GitHub Action + copier update** — cron PR on diff; automatic but
   adds a workflow and auto-PR conflict maintenance. Premature with no releases.
4. **Pre-commit hook running copier update** — slows every commit, doesn't help
   CI on fresh checkout, surprises contributors without copier. Rejected.
5. **Rethink cookie integration** — cookie's independent release cadence and its
   own upstream build keep submodule + Makefile right for it; this decision does
   not alter ADR 0004.

## Consequences

- `netlify.toml` and `make prepare` are unchanged; `make html-all` (the
  Netlify build path) works because all theme files are on disk after `git
clone`. Fresh clone `git clone && cd content && myst start` needs no setup.
- `pixi.toml` `build`/`serve` tasks (local-only, git-excluded) were fixed to run
  with `cwd = content`.
- Manual updates risk upstream drift; pin `.copier-answers.yml` to the first
  tagged release when available, and revisit Option 3 then.

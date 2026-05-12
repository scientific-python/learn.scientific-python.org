# MyST Migration — Requirements Document

> Author: Lundy Bernard
> Date: 2026-05-11
> Branch: lb/myst-migration
> Issue: https://github.com/scientific-python/scientific-python.org/issues/846
> Deadline: SciPy 2026 — 2026-07-13 (Minneapolis)
> Plan: [PLAN.md](PLAN.md)

---

## Purpose

Replace the Hugo-based build system for `learn.scientific-python.org` with
[MyST-MD](https://mystmd.org/) (the `mystmd` CLI). The migration must be
exploratory and reviewable: the git history and accompanying documentation
should tell the story clearly enough that other Scientific Python maintainers
can evaluate the approach, raise concerns, and vote to adopt or reject it.

---

## Context

### Repository layout

`learn.scientific-python.org` has three build layers today:

| Layer                   | Tool                                                  | Status                  |
| ----------------------- | ----------------------------------------------------- | ----------------------- |
| Main site               | Hugo + `scientific-python-hugo-theme` (git submodule) | Active — `make html`    |
| External/cookie content | Jekyll (`external-content/cookie` submodule)          | Active — `make cookie`  |
| CI / deploy             | Netlify (auto-deploy on push to main, PR previews)    | Active — `netlify.toml` |

Starting state on branch `lb/myst-migration` (clean branch off updated main):

- `content/_index.md` and 5 subdirectory index files use Hugo naming
  convention (`_index.md`)
- No `myst.yml` exists; Phase 1 creates it new at the repo root
- `docs/decisions/0001-myst-migration/` — ADR set committed; all seven ADRs
  `Status: Proposed`, pending maintainer review

### Hugo artifacts to remove (after MyST is working)

- `config.yaml` — Hugo site config
- `themes/scientific-python-hugo-theme` — git submodule
- `netlify.toml` — Hugo/Dart Sass toolchain setup removed; file kept and updated
- `Makefile` — targets to be updated; see ADR 0001 and ADR 0004

### External content (cookie)

`external-content/cookie` is a Jekyll site (git submodule). It is built
separately and its output merged into `public/`. See ADR 0004 for the
options considered and proposed decision.

### Scientific Python ecosystem scope

`learn.scientific-python.org` is one subdomain of the Scientific Python
ecosystem. Other repos that may need parallel or follow-on treatment:

| Repo                                             | Domain                      | Build tool today |
| ------------------------------------------------ | --------------------------- | ---------------- |
| `scientific-python/scientific-python.org`        | scientific-python.org       | Hugo             |
| `scientific-python/blog.scientific-python.org`   | blog.scientific-python.org  | Hugo             |
| `scientific-python/tools.scientific-python.org`  | tools.scientific-python.org | Hugo             |
| `scientific-python/scientific-python-hugo-theme` | (shared theme submodule)    | N/A              |

All four repos share `scientific-python-hugo-theme`. A MyST migration of
`learn` decouples it from the theme; the other repos remain on Hugo until they
migrate independently. Cross-site nav links (`/`, blog, tools) are plain URLs
and do not break. No shared build pipeline couples the repos.

### CI / deployment

Current state: Netlify auto-deploys on push to `main` using the build command
in `netlify.toml`. Netlify also handles PR preview deploys. GitHub Actions runs
`lint.yml` (pre-commit checks) only. Local dev: `make serve` →
`localhost:3000`.

Target: update `netlify.toml` to remove the Hugo and Dart Sass toolchain
setup and add `pip install mystmd`; the build command (`make html-all`),
publish directory, and `netlify-plugin-checklinks` are otherwise unchanged.
See ADR 0007.

### Footer / quicklinks

`config.yaml` defines footer social icons and quicklinks columns. MyST has no
built-in equivalent. See ADR 0005 for options considered and proposed decision.

---

## Requirements

### R1 — Reviewable git history

Each logical change must be a separate, self-contained commit with a clear
message explaining _why_ not just _what_. The PR must be readable as a
narrative: "here is what we changed, here is why each step was necessary."

See [PLAN.md](PLAN.md) for the commit-by-commit sequence.

### R2 — Decision log

The ADR set in `docs/decisions/0001-myst-migration/` documents each
significant decision. ADRs are currently `Status: Proposed` and become
`Accepted` (or modified / rejected) on maintainer review. Topics covered:

- Why MyST over alternatives (Hugo, jupyter-book) — ADR 0001
- How shortcode mapping was chosen — ADR 0002
- What happens to the Hugo theme submodule (removal timeline) — ADR 0003
- What happens to the cookie/Jekyll external content — ADR 0004
- Footer/quicklinks approach — ADR 0005
- Whether and when other SP repos migrate — ADR 0006
- Deploy strategy: update Netlify for MyST, gh-pages as future option — ADR 0007

### R3 — No regressions in rendered content

Before removing Hugo artifacts, a rendered-output comparison must be run:

- Every page that exists in the Hugo build must exist in the MyST build
- Nav links, card grids, admonitions must render correctly
- External links must not break (verified by `netlify-plugin-checklinks`
  during the Phase 6 Netlify preview deploy)

### R4 — CI must be green on the final commit

Each commit on the PR branch must leave CI in a defined state (pass or
known-failing with documented reason). Netlify deploy is intentionally broken
from Phase 2 (renames break Hugo) through Phase 5 (Makefile rewrite); this is
documented in each phase's CI status note. Lint must pass throughout. The
final commit (Phase 6 netlify.toml update) must have fully green CI.

### R5 — Other SP repos unblocked, not broken

The PR must not require simultaneous changes to other SP repos. Cross-site nav
uses plain URLs; no shared pipeline coupling. Document which follow-on issues
to open for the other repos.

### R6 — External content decision documented

The cookie/Jekyll submodule decision must be documented before the PR is
opened, even if the decision is "defer."

### R7 — MyST config complete

`myst.yml` must cover all metadata currently in `config.yaml`:

- Site title, domain, nav
- Footer social links (deferred; follow-up issue number recorded in `myst.yml` comment block)
- Quicklinks (deferred; follow-up issue number recorded in `myst.yml` comment block)

---

## Success criteria

- `myst build --html` produces a complete site with no warnings about missing
  directives or broken references
- All shortcodes converted; no Hugo syntax remains in `content/`
- `netlify.toml` updated: Hugo/Dart Sass toolchain removed, `pip install mystmd` added,
  `make html-all` retained as build command; Netlify deploys successfully
- Hugo artifacts (`config.yaml`, theme submodule) removed or removal committed
  with a clear timeline
- PR is self-contained: a reviewer with no prior context can follow the git
  history and understand every decision

# Implementation Plan — Hugo → MyST-MD migration

Branch: `lb/myst-migration`
Issue: scientific-python/scientific-python.org#846
Deadline: 2026-07-13 (SciPy 2026)

This plan is structured commit-by-commit. Every commit is independently
reviewable and the history is intended to read as a narrative for other
Scientific Python maintainers evaluating MyST.

---

## Phase 0 — Pre-work (no code; decisions only)

Goal: lock the six open questions from REQUIREMENTS.md before writing
production code. Output of this phase is the full planning record in
`docs/decisions/0001-myst-migration/`.

### Commits

1. `docs: add ADRs for MyST migration decisions`
   - Files: `docs/decisions/README.md` (new),
     `docs/decisions/0001-myst-migration/README.md` (new),
     `docs/decisions/0001-myst-migration/0001-migrate-to-mystmd.md` (new),
     `docs/decisions/0001-myst-migration/0002-shortcode-mapping.md` (new),
     `docs/decisions/0001-myst-migration/0003-remove-hugo-theme-submodule.md` (new),
     `docs/decisions/0001-myst-migration/0004-defer-cookie-jekyll.md` (new),
     `docs/decisions/0001-myst-migration/0005-defer-footer-quicklinks.md` (new),
     `docs/decisions/0001-myst-migration/0006-sibling-repo-migration.md` (new),
     `docs/decisions/0001-myst-migration/0007-deploy-strategy.md` (new)
   - Why: every subsequent commit references a decision in this directory.
     Reviewers can read the "why" once and the diffs become small. ADR
     format ensures these records survive as an archive even after the
     migration is complete.

2. `docs: add REQUIREMENTS and PLAN to migration ADR directory`
   - Files: `docs/decisions/0001-myst-migration/REQUIREMENTS.md` (new),
     `docs/decisions/0001-myst-migration/PLAN.md` (new)
   - Why: REQUIREMENTS and PLAN are part of the migration record. Keeping
     them alongside the ADRs means a reviewer has the full context —
     what was needed, what was decided, and how it was sequenced — in
     one directory.

### Verification

- All 7 ADRs answer their question with Context → Decision → Options
  considered → Consequences (Decision-first style — rationale follows).
- No build artifacts touched; `make html` still produces the existing
  Hugo site.

### CI status: green (no code changed).

### Recommended answers to the six open questions

| #   | Question            | Recommendation                                                                                                                    | One-line rationale                                                                                                                   |
| --- | ------------------- | --------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------ |
| 1   | Footer / quicklinks | **Defer**: file follow-up issue, ship MyST default footer                                                                         | Custom MyST theme work blocks the migration; visual parity is not a SciPy 2026 must-have.                                            |
| 2   | Cookie / Jekyll     | **Defer**: keep the submodule and `make cookie` target unchanged in this PR                                                       | External content lives at `/development/`; touching Jekyll doubles the PR scope.                                                     |
| 3   | Netlify             | **Update `netlify.toml`**: remove Hugo/Dart Sass toolchain setup; add `pip install mystmd`; keep `make html-all` as build command | Netlify is the active deploy target for the live site and PR previews. Minimal change; see ADR 0007.                                 |
| 4   | Preview deploy      | **No change needed**: Netlify handles PR previews automatically from `netlify.toml`                                               | Updating the build command in Phase 5 is sufficient; no workflow changes required.                                                   |
| 5   | Other SP repos      | **Tracking issues only**, filed at end of PR                                                                                      | This PR proves the pattern; sibling repos adopt independently. No code coupling.                                                     |
| 6   | Theme submodule     | **Remove in this PR**                                                                                                             | The submodule is consumed only by Hugo, which is being removed. The other three repos vendor their own submodule and are unaffected. |

---

## Phase 1 — Foundation: get `myst build` working

Goal: a developer who clones the repo and runs `myst build --html` gets a
complete site. Hugo is still present and still builds; the two systems coexist.
Installation of `mystmd` is left to the developer's preference (pip, conda,
npm, etc.).

### Commits

1. `build: add myst.yml in content/`
   - Files: `content/myst.yml` (new)
   - Create `content/myst.yml` with `site:` and `project:` config; set
     `toc:` file paths relative to `content/` (e.g. `file: _index.md`);
     Phase 2 updates these entries after the renames.
   - Set `project.id` to a freshly generated UUID (e.g. via
     `python3 -c "import uuid; print(uuid.uuid4())"`) — without this MyST
     regenerates the id on each build, breaking caching and cross-references.
   - Place `myst.yml` inside `content/` so MyST treats `content/` as the
     project root. This means `site.options.folders: true` generates
     `/about/governance/` not `/content/about/governance/` — matching Hugo's
     URL structure with no content edits required. Build output lands at
     `content/_build/`; all `myst` commands run via `cd content && myst …`.
   - Set `site.options.folders: true` so directory structure maps to URLs.
   - Note: MyST supports separating the toc into a standalone file via the
     `extends:` key in `myst.yml` (`extends: _toc.yml`). Docs:
     https://mystmd.org/guide/frontmatter#composing-myst-yml — the community
     preference (per `tools.scientific-python.org` PR #81 review) is to keep
     toc and site config separate once the toc grows. For `learn` the toc is
     small enough to inline for now; split it in a follow-up if it grows.

### Verification

- `cd content && myst build --html` exits 0 and writes to `content/_build/html/`.
  Note: `_index.md` files are explicitly listed in `toc:`, so MyST processes
  them even though `_`-prefixed files are excluded from auto-discovery.
- Spot-check `content/_build/html/index.html` exists and renders content from
  `content/_index.md` (file is renamed to `index.md` in Phase 2).
- MyST bundles thebe (for executable notebooks) even when unused; expect
  `*thebe*.js` files in `content/_build/html/`. Harmless — do not add a cleanup
  step unless output size becomes a concern.
- `make html` (Hugo) still works — coexistence proven.

### CI status: still green.

Only `lint.yml` runs at this point; no deploy workflow exists yet.

---

## Phase 2 — File renames: align with MyST conventions

Goal: every section index is `index.md`, not `_index.md`. No content
changes.

### Commits

1. `content: rename _index.md to index.md (6 files)`
   - Files renamed:
     - `content/_index.md` → `content/index.md`
     - `content/about/_index.md` → `content/about/index.md`
     - `content/community/_index.md` → `content/community/index.md`
     - `content/contributors/_index.md` → `content/contributors/index.md`
     - `content/documentation/_index.md` → `content/documentation/index.md`
     - `content/maintainers/_index.md` → `content/maintainers/index.md`
   - Update `myst.yml` `toc:` entries to match.
   - Why: `_index.md` is a Hugo idiom; MyST excludes `_`-prefixed files
     from auto-discovery. Renaming once now means every later commit
     references the final filename.
   - Use `git mv` so blame is preserved.

### Verification

- `myst build --html` still succeeds.
- Hugo build (`make html`) is now broken — acceptable; we are
  intentionally cutting over.

### CI status: **Netlify deploy fails** (Hugo can no longer find section

indices after the rename). Lint passes. This is the first commit where
the deploy is intentionally broken; it remains broken through Phase 5.
All commits on this PR are merged together — local `myst build --html`
is the test during development. Deploy is restored in Phase 6.

---

## Phase 3 — Shortcode conversion (split by directive type)

Goal: zero Hugo shortcodes remain in `content/`. Reviewers evaluate the
mapping pattern **once per shortcode type**, not nine times.

### Commits

1. `content: convert {{< grid >}} to MyST grid/card directives`
   - Files (3):
     - `content/index.md`
     - `content/contributors/index.md`
     - `content/documentation/index.md`
   - Mapping (canonical, documented in ADR 0002):

     ```
     {{< grid columns="1 2 2 3" >}}     →   ::::{grid} 1 2 2 3

     [[item]]                            →   :::{card} <title>
     type = 'card'                            :link: <link>
     title = 'X'
     link = 'y'                               <body>
     body = 'z'                          :::

     {{< /grid >}}                       →   ::::
     ```

   - Note: `content/contributors/index.md` contains **two** grid blocks;
     its diff is larger than the other two files.
   - Why: one commit, one pattern. A reviewer reads this diff and learns
     the entire grid mapping; the per-file changes are mechanical.

2. `content: convert {{< admonition >}} to MyST admonitions`
   - Files (6):
     - `content/maintainers/index.md`
     - `content/maintainers/interacting-with-new-contributors.md`
     - `content/maintainers/managing-conflict.md`
     - `content/maintainers/meeting_types.md`
     - `content/contributors/first-contribution.md`
     - `content/community/onboarding.md`
   - Mapping:
     ```
     {{< admonition warning >}} … {{< /admonition >}}  →  :::{warning}
                                                          …
                                                          :::
     {{< admonition note >}}    … {{< /admonition >}}  →  :::{note}
     ```
   - Why: same rationale — one diff, one pattern.

### Verification

- `grep -rE '\{\{<' content/` returns no matches.
- `myst build --html` builds with zero "unknown directive" warnings.
- Visual diff: open `content/_build/html/contributors/index.html` and confirm
  cards render with titles, body text, and working links.

### CI status: Netlify deploy still failing (same reason as Phase 2).

**Note:** Phase 3 card `:link:` values and inline markdown links use
Hugo-style hierarchical URLs (`/contributors/`, `/about/governance`, etc.).
These resolve correctly because `myst.yml` lives in `content/` with
`site.options.folders: true`, generating matching URL paths. No fixup needed.

---

## Phase 4 — MyST config completeness

Goal: `myst.yml` carries the metadata that used to live in
`config.yaml`, **except** for what we explicitly deferred (footer,
quicklinks).

**Execution note:** commit 1 was done immediately before Phase 7 to
preserve `config.yaml` as a reference before deletion. Commit 2 remains
deferred pending follow-up issue filing.

### Commits

1. `config: populate myst.yml site metadata`
   - Files: `content/myst.yml`, `assets/images/logo.svg` (renamed from `static/images/logo.svg`)
   - Add `project.description`, `site.options.domain`, `site.nav`,
     and `site.options.logo` from `config.yaml`'s `params`.
   - `site.options.logo_dark` omitted — no dark logo exists in the repo.
   - `site.options.favicon` omitted — MyST provides a default favicon;
     no `favicon.ico` was present in the Hugo `static/` directory either.
   - Rename `static/` → `assets/` (Hugo directory convention → MyST
     convention; MyST does not serve `static/` automatically).
   - Why: feature parity for everything except footer/quicklinks, which
     ADR 0005 defers.

2. `config: document deferred footer/quicklinks` _(deferred)_
   - Files: add a comment block at the bottom of `myst.yml` with
     footer/quicklinks deferred, including the actual follow-up issue
     numbers.
   - **Prerequisite — file these four follow-up issues before writing
     this commit** (so real issue numbers are in the comment from the
     start; no follow-up docs commit needed):
     1. "MyST: footer + quicklinks parity with Hugo theme" (ADR 0005)
     2. "MyST: migrate external-content/cookie off Jekyll" (ADR 0004)
     3. "MyST: gh-pages PR preview for fork contributors" (ADR 0007)
     4. "MyST: replace netlify-plugin-checklinks with lychee GH Actions"
        (ADR 0007 option 3)
   - Why: issue numbers known before the commit is written; comment is
     complete from the start.

### Verification

- `myst build --html` produces no warnings about unknown config keys.
- Header nav links to scientific-python.org, blog, tools.

### CI status: Netlify deploy still failing (same reason as Phase 2).

---

## Phase 5 — Makefile: update for MyST

Goal: `make html` builds with MyST, `make html-all` builds MyST site plus
cookie content into `public/`. Netlify can then call `make html-all` unchanged.

### Commits

1. `build: rewrite Makefile for MyST`
   - Files: `Makefile`
   - New targets:
     - `html` → `cd content && myst build --html` (output: `content/_build/html/`)
     - `serve` → `cd content && myst start`
     - `clean` → `rm -rf content/_build public`
     - `html-all` → `make html`, then `mkdir -p public && cp -r content/_build/html/. public/`,
       then `make external` overlays cookie at `public/development/`
     - `cookie` / `external` / `cookie_ruby_deps` / `cookie_web_prepare` /
       `prepare` / `help` — keep (ADR 0004: cookie deferred; `help` is
       `.DEFAULT_GOAL`)
     - Update `.PHONY` declaration to list the new and retained targets
   - Why: Makefile must be updated before netlify.toml so Phase 6 can
     call `make html-all` and produce the full site including cookie.
   - Note: `make html-all` does not invoke `prepare` automatically. On a
     fresh clone, run `make prepare` first to initialise the cookie
     submodule before running `make html-all`.

### Verification

- `make html` → site at `content/_build/html/`.
- `make serve` → live reload at `http://localhost:3000` (MyST default).
- `make html-all` → MyST output plus cookie merged into `public/`.

**Pre-Phase 6 sign-off (R3):** before updating Netlify, confirm:

- Every page in the Hugo build has a counterpart in `content/_build/html/`.
  Hugo is broken on this branch since Phase 2; produce the reference list
  by running `make html` from a clean checkout of `main` (Hugo still works
  there) and listing `public/`.
- Nav links, card grids, and admonitions render correctly in the MyST build.

Note: automated parity tests were considered and rejected — the site is static
content with no dynamic behaviour; a manual visual comparison is sufficient for
a one-time migration.

### CI status: Netlify deploy still failing (Hugo still in netlify.toml).

---

## Phase 6 — CI: update netlify.toml for MyST

Goal: Netlify deploys the full MyST-built site including cookie content.
PR previews resume. This is the cutover — after
this phase the live site is built by MyST.

### Commits

1. `ci: update netlify.toml to build with mystmd`
   - Files: `netlify.toml`
   - Remove `HUGO_VERSION`, `DART_SASS_VERSION`, `DART_SASS_URL` env vars
     and the Dart Sass download/install steps from the build command
   - Add `pip install mystmd` before `make html-all`
   - Keep `make html-all` as the build command (unchanged)
   - Keep `publish = "public"` (unchanged)
   - Keep `PYTHON_VERSION = "3.13"` (needed for pip)
   - Keep `netlify-plugin-checklinks` (link checking preserved)
   - Why: the build command already calls `make html-all`; only the
     Hugo/Dart Sass toolchain setup needs replacing. `pip install mystmd`
     is the chosen install method — see ADR 0001.

### Verification

Verify before opening the PR. **Assumes the branch is pushed to the
upstream repo** (`scientific-python/learn.scientific-python.org`), not a
fork — Netlify preview deploys are only triggered for branches in the
upstream repo. A fork-based contributor cannot verify this way before
opening the PR; the Netlify build log on the opened PR is the first
opportunity. The gh-pages PR preview follow-up issue (filed in Phase 4)
covers that gap.

- Push the branch; Netlify preview build log shows `make html-all`
  running and completing with exit 0.
- `netlify-plugin-checklinks` (kept in `netlify.toml`) reports no broken
  external links.
- Confirm `/development/` cookie content is present in the preview deploy.
- Confirm the Netlify preview renders pages correctly.

### CI status: **green** (lint passes; Netlify deploy succeeds).

---

## Phase 7 — Remove Hugo artifacts

Goal: a fresh clone has no Hugo references.

### Commits

1. `chore: remove Hugo site config`
   - Files: delete `config.yaml`
   - Why: nothing reads it.

2. `chore: remove scientific-python-hugo-theme submodule`
   - Files: `.gitmodules` (edit), `themes/scientific-python-hugo-theme`
     (deinit + remove)
   - Steps:
     ```
     git submodule deinit -f themes/scientific-python-hugo-theme
     git rm themes/scientific-python-hugo-theme
     rm -rf .git/modules/themes/scientific-python-hugo-theme
     ```
   - Why: ADR 0003 — the submodule is only consumed by Hugo. The
     other three SP repos vendor their own copy; this removal is
     unilateral and safe.

3. `chore: update .gitignore for MyST output`
   - Files: `.gitignore`
   - Drop `.hugo*` (Hugo build cache) and `resources/` (Hugo generated
     assets); add `content/_build/`. Keep `public/` (`html-all` writes there).
     `*~` and `.DS_Store` remain unchanged.
   - Why: clean working tree.
   - Note: `static/` → `assets/` rename was done in Phase 4 commit 1.

### Verification

- `rg -i hugo .` returns matches only in `docs/decisions/` and git history.
- `git submodule status` shows only `external-content/cookie`.
- `myst build --html` still green.
- CI still green.

### CI status: green.

---

## Phase 8 — PR + tracking issues

Goal: ship.

No code commits in this phase. Deferred-work follow-up issues were filed
as a Phase 4 prerequisite and their numbers are already in `myst.yml`.

### Actions

1. **Open PR** against `scientific-python/learn.scientific-python.org:main`.
   - Title: `Migrate from Hugo to MyST-MD`
   - Body: link to `docs/decisions/0001-myst-migration/`, summarise phases, link to issue #846.
   - Request review from the maintainers tagged on #846.

2. **File sibling-repo tracking issues** (one per repo, ADR 0006; filed
   after PR opens so each issue can link to it as a worked example):
   - `scientific-python/scientific-python.org`: "Evaluate MyST-MD
     migration (parallel to learn)"
   - `scientific-python/blog.scientific-python.org`: same
   - `scientific-python/tools.scientific-python.org`: same

### Verification

- PR open, all checks green, myst.yml comment block links to all four
  deferred-work issues.

---

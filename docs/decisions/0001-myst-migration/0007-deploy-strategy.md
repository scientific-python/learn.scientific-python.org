# ADR 0007 — Update netlify.toml for MyST build

Date: 2026-05-11
Status: Proposed
Branch: lb/myst-migration

## Context

Both `scientific-python.org` and `learn.scientific-python.org` deploy via
Netlify, which auto-deploys on push to `main` and generates PR preview deploys.
The build command is defined in `netlify.toml`. The current command builds with
Hugo + Dart Sass.

GitHub Actions runs only a lint workflow (`lint.yml`). There is no gh-pages
deploy workflow.

## Decision

Update `netlify.toml` in Phase 6 of the migration: remove the Dart Sass and
Hugo toolchain setup; add `pip install mystmd` before the existing
`make html-all` call. Build command, publish directory, and
`netlify-plugin-checklinks` are otherwise unchanged.

## Options considered

1. **Update `netlify.toml`** — minimal change; keeps Netlify as the deploy
   target, PR previews continue to work automatically.
2. **Replace Netlify with gh-pages** — larger change; requires creating new
   GitHub Actions deploy workflows, reconfiguring DNS, and losing Netlify PR
   previews. Out of scope for this PR.
3. **Keep `netlify.toml` for the checklinks plugin only** — the Netlify
   checklinks plugin can be replaced by a `lychee`-based GitHub Actions job
   as a separate improvement; not required for this migration.
4. **Drop Netlify entirely; use CircleCI for builds + circleci-artifacts-
   redirector-action for PR previews** — demonstrated by
   `tools.scientific-python.org` PR #81. Viable but introduces CircleCI
   account dependency and is a larger infrastructure change than needed here.
5. **Migrate to Read the Docs** — RTD has first-class MyST/Sphinx support,
   built-in PR preview deploys (including for forks), and is already used
   widely across the Scientific Python ecosystem. Would replace Netlify
   entirely; requires a `.readthedocs.yaml` config and DNS reconfiguration.
   Resolves the fork-contributor preview gap (ADR 0007 future work item 1)
   as a side effect. Not pursued in this PR — custom domain setup and RTD
   account provisioning are out of scope for the migration itself.

## Consequences

- Dart Sass and Hugo version pins removed from `netlify.toml`
- `pip install mystmd` added before `make html-all` in the build command
- Build command (`make html-all`), publish dir (`public/`), and
  `netlify-plugin-checklinks` are unchanged
- Netlify auto-deploy and PR previews continue unchanged

## Future work (out of scope)

Two follow-up improvements; both filed as issues before Phase 4 commit 2
(see PLAN.md Phase 4 prerequisite):

- **gh-pages PR preview**: allows contributors working from a fork to
  preview builds on their own GitHub Pages without requiring Netlify access.
- **Replace `netlify-plugin-checklinks` with a `lychee`-based GitHub Actions
  job**: keeps link checking in CI, removes the Netlify plugin dependency.

# ADR 0005 — Sibling SP repos migrate independently

Date: 2026-05-11
Status: Accepted
Branch: lb/myst-migration

## Context

The Scientific Python ecosystem has four Hugo-based sites sharing the same
theme submodule:

- learn.scientific-python.org
- scientific-python.org
- blog.scientific-python.org
- tools.scientific-python.org

Cross-site nav links are plain absolute URLs (not build-time references).
There is no shared build pipeline coupling the repos.

`tools.scientific-python.org` already has an open MyST migration PR
([#81](https://github.com/scientific-python/tools.scientific-python.org/pull/81),
brianhawthorne, opened October 2025, stale as of May 2026). It demonstrates
a working shortcode conversion and a footer implementation using
`site.parts.footer:` + custom CSS.

## Decision

`learn` migrates first. File one tracking issue per sibling repo after this
PR merges, each linking to this PR as a worked example. Sibling repos adopt
MyST on their own schedule.

## Other options considered

- **Migrate all four in lock-step** — synchronizes visual consistency; blocks
  `learn` on the slowest-moving repo.
- **Wait for MyST theme parity** — defers everything until full footer parity
  lands in the shared theme (ADR 0007); not necessary since content parity is
  achievable now.

## Consequences

- Cross-site nav continues to work: all links are absolute URLs
- Sibling repos remain on Hugo until they choose to migrate; no visual
  breakage to end users
- This PR and `tools.scientific-python.org` PR #81 together form the reference
  corpus for sibling repos evaluating MyST migration
- Tracking issues are filed in Phase 8 of the migration plan
- The `scientific-python-hugo-theme` submodule removal in ADR 0003 affects
  only this repo; the other three repos remove it in their own migration PRs

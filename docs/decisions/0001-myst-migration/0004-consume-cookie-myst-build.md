# ADR 0004 — Consume the cookie MyST build

Date: 2026-05-11
Status: Proposed
Branch: lb/myst-migration

## Context

`external-content/cookie` is a MyST site (git submodule, pinned to `272a70d`).
It is built separately via `make cookie` and its output is merged into
`public/development/` before deploy. It has its own upstream release cadence and
contributors independent of `learn`.

Cookie builds itself with `mystmd`, driven by its own `package.json` build
script and lockfile. It owns that build; `learn` is a consumer of its output.

## Decision

Consume cookie's own MyST build. `learn` does not vendor, fork, or reimplement
cookie's build: it invokes it and overlays the output at `/development/`.

The `make cookie`, `make external`, and `prepare` Makefile targets are retained.
`make html-all` builds the MyST `learn` site, then merges cookie's MyST output
into `public/`.

Both sides of the deployed site are built by `mystmd`.

How `learn` invokes cookie's build — which `mystmd` version, installed how — is
a separate concern, deliberately out of scope here so that this decision stays
stable if the build tooling changes.

## Options considered

1. **Consume cookie's MyST build** — chosen. Cookie owns its build; `learn`
   consumes the output. No duplicated build logic, no fork, and cookie's
   independent release cadence is preserved.
2. **Vendor cookie's content into `learn`** — would collapse the two sites into
   a single build, removing the submodule and the two-step overlay. Discards
   cookie's independent release cadence and its own contributor base, and makes
   `learn` responsible for content it does not own. Rejected.
3. **Reimplement cookie's build inside `learn`** — drive `mystmd` against
   cookie's sources directly rather than calling its build script. Duplicates
   logic cookie already maintains and silently drifts whenever cookie changes
   its build. Rejected.
4. **Drop cookie** — would break the `/development/` path; not acceptable
   without a replacement.

## Consequences

- `external-content/cookie` submodule is pinned to `272a70d`; this branch does
  not move the pin
- `public/development/` is produced by `mystmd`
- `learn` depends on cookie's build contract (`docs/_build/html`), not on its
  toolchain internals — cookie can change how it builds without breaking `learn`
  so long as that output path holds
- Cookie's build is upstream's to change; a breaking change there surfaces in
  `learn`'s deploy, not in review

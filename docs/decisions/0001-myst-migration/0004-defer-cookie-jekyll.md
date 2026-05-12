# ADR 0004 — Defer migration of external-content/cookie (Jekyll)

Date: 2026-05-11
Status: Proposed
Branch: lb/myst-migration

## Context

`external-content/cookie` is a Jekyll site (git submodule, pinned to
`2025.10.01`). It is built separately via `make cookie` and its output is
merged into `public/development/` before deploy. It has its own upstream
release cadence and contributors independent of `learn`.

## Decision

Leave `external-content/cookie` unchanged in this PR. File a follow-up issue:
_"MyST: migrate external-content/cookie off Jekyll"_.

The `make cookie`, `make external`, `cookie_ruby_deps`, `cookie_web_prepare`,
and `prepare` Makefile targets are preserved. `make html-all` continues to
build the MyST site then merge the Jekyll output into `public/`.

## Options considered

1. **Keep as-is permanently** — MyST output and Jekyll output coexist forever;
   `ghp-import` merges them. Lowest risk but leaves a Jekyll dependency
   indefinitely.
2. **Convert cookie to MyST** — large, independent effort; distracts from this
   PR and would require its own review.
3. **Drop cookie** — would break the `/development/` path; not acceptable
   without a replacement.
4. **Defer with follow-up issue** — keep `make cookie` working now; track
   conversion separately so it gets its own focused review.

## Consequences

- `external-content/cookie` submodule remains at `2025.10.01`
- `public/development/` continues to be produced by Jekyll
- The `html-all` Makefile target reconciles MyST's `_build/html/` output
  with cookie's `public/development/` via `mkdir -p public && cp -r _build/html/* public/`
  before `make external` overlays `/development/`
- A follow-up issue tracks the eventual Jekyll → MyST conversion

# ADR 0003 — Remove scientific-python-hugo-theme submodule

Date: 2026-05-11
Status: Proposed
Branch: lb/myst-migration

## Context

`themes/scientific-python-hugo-theme` is a git submodule pinned to `v0.21`.
The same theme submodule is also referenced by three sibling repos:
`scientific-python.org`, `blog.scientific-python.org`, and
`tools.scientific-python.org`. Each repo pins the submodule independently in
its own `.gitmodules`; they do not share a checkout.

MyST-MD does not use Hugo themes. Once Hugo is removed from this repo, the
submodule has no consumer here.

## Decision

Remove the submodule from this repo in Phase 7 of the migration.

```bash
git submodule deinit -f themes/scientific-python-hugo-theme
git rm themes/scientific-python-hugo-theme
rm -rf .git/modules/themes/scientific-python-hugo-theme
```

## Options considered

1. **Remove in this PR** — clean cut; no dead code after Hugo is gone.
2. **Keep until all four SP repos migrate** — delays cleanup by months or
   quarters; leaves a submodule that nothing in this repo uses.
3. **Vendor a snapshot** — no benefit; MyST doesn't use it.

## Consequences

- The `themes/` directory is deleted from this repo
- The three sibling repos are **unaffected** — they reference the submodule
  from their own `.gitmodules` and pin their own SHA
- The upstream `scientific-python-hugo-theme` repo is not affected
- A follow-up PR to the sibling repos removes their copies when they migrate
  (see ADR 0006)

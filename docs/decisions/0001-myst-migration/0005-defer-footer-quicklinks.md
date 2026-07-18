# ADR 0005 — Defer footer and quicklinks to follow-up

Date: 2026-05-11
Status: Proposed
Branch: lb/myst-migration

## Context

Hugo `config.yaml` defines two visual elements that have no direct equivalent
in MyST default templates:

1. **Footer social icons** — GitHub, YouTube, Mastodon, Discourse, Discord
2. **Quicklinks columns** — three columns of site-wide nav links (About,
   Maintainers/SPECs, Press kit)

MyST's default HTML template renders a minimal footer with no configurable
social links or quicklinks.

## Decision

Ship this PR with the MyST default footer. File a follow-up issue:
_"MyST: footer + quicklinks parity with Hugo theme"_.

Add a comment block at the bottom of `myst.yml` pointing at the follow-up
issue number so the gap is immediately discoverable.

## Options considered

1. **Custom MyST theme / template override** — achieves full parity but is a
   month of separate work; blocks the migration on a visual detail.
2. **Static HTML injected via template** — fragile; bypasses MyST conventions
   and creates a maintenance burden.
3. **`site.parts.footer:` with a `footer.md` file + custom CSS + scienceicons
   plugin** — uses MyST's built-in parts mechanism; no custom theme required.
   Demonstrated in `tools.scientific-python.org` PR #81 (brianhawthorne,
   October 2025). Viable path for the follow-up issue.
   [`scientific-python/scientific-python-myst-theme`](https://github.com/scientific-python/scientific-python-myst-theme) (a copier template in
   active development as of 2026-05) provides a reference `footer.md` and
   `config/scientific-python.yml` using this exact pattern; worth tracking
   as it matures before implementing independently.
4. **Defer with documented issue** — unblocks the migration for SciPy 2026;
   footer work is tracked and discoverable.

## Consequences

- The deployed site will have a minimal footer until the follow-up is resolved
- `config.yaml`'s `params.footer` and `params.quicklinks` sections are not
  ported to `myst.yml`
- The follow-up issue is linked from `myst.yml` and from the PR description
- Option 3 above (`site.parts.footer:` + CSS) is the recommended implementation
  path for the follow-up; `tools.scientific-python.org` PR #81 is the reference
- If the SP community decides MyST theming is too limited, this ADR is a
  natural decision point to reconsider the tool choice (see ADR 0001)

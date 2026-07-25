# ADR 0002 — Hugo shortcode → MyST directive mapping

Date: 2026-05-11
Status: Accepted
Branch: lb/myst-migration

## Context

Nine content files use Hugo shortcodes that MyST does not understand
(pre-Phase-2 names):

`{{< grid >}}` / `[[item]]`

- `_index.md` (root)
- `contributors/_index.md`
- `documentation/_index.md`

`{{< admonition >}}`

- `maintainers/_index.md`
- `maintainers/interacting-with-new-contributors.md`
- `maintainers/managing-conflict.md`
- `maintainers/meeting_types.md`
- `contributors/first-contribution.md`
- `community/onboarding.md`

## Decision

Convert shortcodes, using the following canonical mappings:

```
{{< grid columns="1 2 2 3" >}}   →   ::::{grid} 1 2 2 3

[[item]]                          →   :::{card} <title>
  type = 'card'                         :link: <link>
  title = 'X'
  link = 'y'                            <body>
  body = 'z'                        :::

{{< /grid >}}                     →   ::::

{{< admonition warning >}}…       →   :::{warning}
{{< /admonition >}}                    …
                                       :::

{{< admonition note >}}…          →   :::{note}
{{< /admonition >}}                    …
                                       :::
```

## Other options considered

- **Custom MyST plugin** to interpret Hugo TOML shortcode syntax — high effort,
  no value once content is converted.

## Consequences

- Reviewers can verify correctness by comparing rendered output against the
  Hugo-built site for these nine pages
- `grep -rE '\{\{<' content/` returns zero matches after these commits
- `content/index.md` is the canonical style reference going forward

# ADR 0008 — Remove netlify-plugin-checklinks

Date: 2026-05-19
Status: Accepted
Branch: lb/myst-migration

## Context

`netlify-plugin-checklinks` v4.1.1 has been in `netlify.toml` since the
initial Netlify setup. During the MyST migration CI run it produced three
distinct failure categories:

**Category 1 — Broken internal links (12 failures, genuine)**
MyST's default flat-slug URL mode didn't match Hugo's hierarchical URLs.
Fixed by moving `myst.yml` into `content/` and enabling `site.options.folders:
true`. Checklinks correctly caught this problem.

**Category 2 — ES2022 JS parse error (1 failure, false positive)**
MyST bundles JavaScript using ES2022 class static initializer blocks
(`StaticBlock`). The plugin's parser predates ES2022 and fails on this syntax.
Hugo never copied JS bundles into `public/`, so this was never exposed before.
The plugin is structurally incompatible with MyST's output without skipping
the entire `public/build/` directory.

**Category 3 — CDN ETIMEDOUT (3 failures, false positive)**
Netlify's build sandbox cannot reach `cdn.jsdelivr.net`. MyST injects CDN
references for katex (math rendering) and jupyter-matplotlib (widget CSS)
into the built HTML; Hugo's theme did not. `unpkg.com` was already in
`skipPatterns` for the same reason, indicating the CDN-blocking pattern was
known. This requires an ever-growing skip list as MyST or the cookie submodule
adds new CDN dependencies.

The plugin itself is unmaintained: no releases since mid-2023, open issues
about ES2022 parsing and Netlify network restrictions unaddressed.

MyST's own build step (`myst build --html`) warns on broken cross-references
during the build, covering the plugin's only validated use case (category 1).
External CDN link checking is unreliable in the Netlify sandbox environment.

Stephan (sp-org maintainer) has confirmed the plugin can be removed if it
continues to be a headache.

## Decision

Remove `netlify-plugin-checklinks` from `netlify.toml`.

Rely on `myst build` cross-reference warnings for internal link integrity.
Do not replace with another link-checker at this time.

## Options considered

1. **Remove the plugin** — eliminates false positives; internal links still
   caught by `myst build`; CDN availability not checked (acceptable: CDNs
   have their own uptime monitoring).
2. **Keep patching `skipPatterns`** — each MyST or cookie update may introduce
   new CDN or bundle paths requiring another skip; ongoing maintenance burden
   with no clear endpoint.
3. **Pin to a newer version** — no newer version exists; the repository has
   been dormant since mid-2023.
4. **Replace with a different link-checker** — introduces new dependency;
   the same CDN-blocking and JS-parsing problems would likely recur; deferred
   unless a concrete need emerges post-merge.

## Consequences

- Netlify CI will pass without false positives from CDN timeouts or JS parse
  errors
- Broken internal links are still caught: `myst build` emits warnings for
  unresolved cross-references; these become visible in the Netlify build log
- External CDN availability is not verified in CI; this is acceptable since
  CDNs are monitored independently and failures are user-visible immediately
- If a link-checker is wanted in future, `myst build --check` or a
  `htmltest`-based approach that understands modern JS would be more suitable
  than `netlify-plugin-checklinks` v4.1.1

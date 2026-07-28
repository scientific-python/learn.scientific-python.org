# learn.scientific-python.org

Source for [learn.scientific-python.org](https://learn.scientific-python.org),
built with [MyST-MD](https://mystmd.org/) (the `mystmd` CLI).

## Layout

- `content/` — the MyST source project (`myst.yml` lives here). This is the
  main site.
- `external-content/cookie/` — the [cookie](https://github.com/scientific-python/cookie)
  submodule, a separate MyST site. Its build is overlaid at `/development/`.
- `public/` — build output. The merged, deployable static site (main +
  cookie). Written by `make html-all`; published by Netlify.

## Prerequisites

- **mystmd** — the `myst` CLI. See the
  [MyST install guide](https://mystmd.org/guide/quickstart).
- **Node** — the cookie overlay builds via `npx mystmd`, so a full build needs
  Node available.
- **git** — the cookie content is a submodule; `make prepare` initializes it.

## Local development

| Command            | What it does                                                            |
| ------------------ | ----------------------------------------------------------------------- |
| `make serve`       | Live-reload dev server for the **main site only**, at `localhost:3000`. |
| `make html`        | Build the main site to `content/_build/html/`.                          |
| `make html-all`    | Build main + cookie, merged into `public/`.                             |
| `make build-serve` | Run `html-all`, then serve the full merged site at `localhost:3000`.    |
| `make clean`       | Remove build output (`content/_build`, `public/`).                      |

**Previewing `/development/` (cookie) locally:** `make serve` (and `myst start`)
serve `content/` only — the cookie overlay is **not** visible there. To preview
the full site, including `/development/`, use `make build-serve`. It is a static
build (no live reload); rerun it after edits.

## Decisions

Architecture decisions are recorded in
[`docs/decisions/`](docs/decisions/). See
[`0001-myst-migration/`](docs/decisions/0001-myst-migration/) for the
Hugo → MyST migration.

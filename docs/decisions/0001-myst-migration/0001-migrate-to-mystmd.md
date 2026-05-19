# ADR 0001 — Migrate build system from Hugo to MyST-MD

Date: 2026-05-11
Accepted: 2026-05-18
Status: Accepted
Branch: lb/myst-migration
Issue: scientific-python/scientific-python.org#846

## Context

`learn.scientific-python.org` builds with Hugo via `make html` and deploys via
Netlify (auto-deploy on push to `main`). We want to convert the content files
to MyST syntax.

Three realistic MyST toolchain options exist. They are not equivalent:
`jupyter-book` is a higher-level tool built on top of `mystmd`; `mystmd` is the
underlying engine and is available as both a Node package (npm) and a Python
package (pip/conda) that bundles Node internally.

## Decision

Replace Hugo with **`mystmd` Python package** (`pip install mystmd`,
`myst build --html`) as the build tool.

## Options considered

| Option                                             | Pros                                                                                                                                                                                                                                                   | Cons                                                                                                                                                                                                                                                    |
| -------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Stay on Hugo**                                   | Theme parity with sibling SP sites; no content changes needed                                                                                                                                                                                          | Hugo is not Python; MyST content conversion still desirable long-term                                                                                                                                                                                   |
| **jupyter-book 2.x**                               | Pure Python (`pip install jupyter-book`); SP ecosystem familiar with JB; conda-forge package; handles notebook execution natively                                                                                                                      | Wraps `mystmd` under the hood — extra abstraction; config format (`_config.yml`, `_toc.yml`) is not portable to plain `myst.yml` if JB is dropped later; JB 2.x released late 2024 — docs and community experience thin; feature lag vs direct `mystmd` |
| **mystmd — Node CLI** (`npm install mystmd`)       | Native runtime; latest npm releases immediately; same `myst.yml` config; active ExecutableBooks development                                                                                                                                            | Requires Node.js in every build environment (Netlify, RTD, CI); unfamiliar to Python contributors                                                                                                                                                       |
| **mystmd — Python package** (`pip install mystmd`) | Python-centric install (pip/conda-forge); bundles Node internally — no separate Node needed; same `myst.yml` config as Node CLI (no extra abstraction layer); proven by `tools.scientific-python.org` PR #81; works on all considered deploy platforms | Node bundled internally — slightly opaque; PyPI/conda releases may lag npm by 1–7 days                                                                                                                                                                  |

## Rationale for proposed decision

**Why not jupyter-book:** `learn.scientific-python.org` contains no Jupyter
notebooks; JB's primary value (notebook execution, Sphinx integration) does not
apply here. JB 2.x uses `mystmd` as its build engine, so the team would get
`mystmd` indirectly with an extra config layer on top. The JB config format
(`_config.yml`, `_toc.yml`) is not portable — if JB were dropped later, the
config would need to be rewritten to `myst.yml` from scratch.

**Why not the Node CLI:** Requires Node.js in every build environment. SP
contributors and maintainers work in Python environments; npm is unfamiliar and
adds friction for new contributors. The Python package provides identical
functionality without any Node setup.

**Why the Python package:** Fits SP's Python-centric workflow; `conda install
-c conda-forge mystmd` works for conda users. No Node.js needed in Netlify,
RTD, or GitHub Actions (Node is bundled inside the package). The `myst.yml`
config is identical to the Node CLI — switching delivery method later is a
one-line change.

## Installation

For Netlify builds and RTD: `pip install mystmd` (no Node configuration needed
in `netlify.toml`; see ADR 0007).

Local dev: install via any preferred method (pip, conda, npm — developer's
choice). The repo does not mandate a specific local environment.

## Consequences

- `myst build --html` replaces `make html` (Hugo)
- `pip install mystmd` is the chosen delivery method; no Node toolchain required
  in CI or `netlify.toml`
- The `scientific-python-hugo-theme` submodule is removed (see ADR 0003)
- `netlify.toml` is updated to use `mystmd` (see PLAN.md Phase 6)
- Nine content files require shortcode conversion (see ADR 0002)
- Footer/quicklinks are not yet supported in MyST default templates (see ADR 0005)
- Other SP repos remain on Hugo until they choose to migrate (see ADR 0006)

# ADR 0001 — Migrate build system from Hugo to MyST-MD

Date: 2026-05-11
Status: Accepted
Branch: lb/myst-migration

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

- Python-centric install (pip/conda-forge) [pro]
- Bundles Node internally — no separate Node needed [pro]
- Same `myst.yml` config as Node CLI (no extra abstraction layer) [pro]
- Proven by `tools.scientific-python.org` PR #81 [pro]
- Works on all considered deploy platforms [pro]
- Node bundled internally — slightly opaque [con]
- PyPI/conda releases may lag npm by 1–7 days [con]

## Other options considered

### Stay on Hugo

- Theme parity with sibling SP sites [pro]
- No content changes needed [pro]
- Hugo is not Python [con]
- MyST content conversion still desirable long-term [con]

### jupyter-book 2.x

- Pure Python (`pip install jupyter-book`) [pro]
- SP ecosystem familiar with JB; conda-forge package [pro]
- Handles notebook execution natively [pro]
- Wraps `mystmd` under the hood — extra abstraction [con]
- Config format (`_config.yml`, `_toc.yml`) is not portable to plain
  `myst.yml` if JB is dropped later [con]
- JB 2.x released late 2024 — docs and community experience thin [con]
- Feature lag vs direct `mystmd` [con]

### mystmd — Node CLI (`npm install mystmd`)

- Native runtime; latest npm releases immediately [pro]
- Same `myst.yml` config [pro]
- Active ExecutableBooks development [pro]
- Requires Node.js in every build environment (Netlify, RTD, CI) [con]
- Unfamiliar to Python contributors [con]

## Rationale

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
in `netlify.toml`; see ADR 0006).

Local dev: install via any preferred method (pip, conda, npm — developer's
choice). The repo does not mandate a specific local environment.

## Consequences

- `myst build --html` replaces `make html` (Hugo)
- `pip install mystmd` is the chosen delivery method; no Node toolchain required
  in CI or `netlify.toml`
- The `scientific-python-hugo-theme` submodule is removed (see ADR 0003)
- `netlify.toml` is updated to use `mystmd` (see ADR 0006)
- Nine content files require shortcode conversion (see ADR 0002)
- Footer/quicklinks come from the shared `scientific-python-myst-theme`
  (see ADR 0007)
- Other SP repos remain on Hugo until they choose to migrate (see ADR 0005)

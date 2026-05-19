# 0001 — MyST-MD Migration

Decisions made during the migration of `learn.scientific-python.org` from
Hugo to MyST-MD (`mystmd` CLI).

Branch: `lb/myst-migration` — Issue: scientific-python/scientific-python.org#846

## AI assistance disclosure

The planning documents and ADRs in this directory were drafted with the
assistance of Claude Code (Anthropic). The author reviewed, tested, and takes
full responsibility for all content. All final editorial decisions, commit
messages, and PR communication are human-authored.

Scientific Python does not yet have a published AI contribution policy.
This disclosure follows the spirit of [SciPy's AI contribution
policy](https://scipy.github.io/devdocs/dev/conduct/ai_policy.html), the
closest published reference in the ecosystem.

## Planning docs

| File                               | Purpose                                                    |
| ---------------------------------- | ---------------------------------------------------------- |
| [REQUIREMENTS.md](REQUIREMENTS.md) | What the migration must achieve; testable success criteria |
| [PLAN.md](PLAN.md)                 | Commit-by-commit implementation sequence                   |

## ADRs

| #                                           | Title                                               | Status   |
| ------------------------------------------- | --------------------------------------------------- | -------- |
| [0001](0001-migrate-to-mystmd.md)           | Migrate build system from Hugo to MyST-MD           | Proposed |
| [0002](0002-shortcode-mapping.md)           | Hugo shortcode → MyST directive mapping             | Proposed |
| [0003](0003-remove-hugo-theme-submodule.md) | Remove scientific-python-hugo-theme submodule       | Proposed |
| [0004](0004-defer-cookie-jekyll.md)         | Defer migration of external-content/cookie (Jekyll) | Proposed |
| [0005](0005-defer-footer-quicklinks.md)     | Defer footer and quicklinks to follow-up            | Proposed |
| [0006](0006-sibling-repo-migration.md)      | Sibling SP repos migrate independently              | Proposed |
| [0007](0007-deploy-strategy.md)             | Update netlify.toml for MyST build                  | Proposed |

**ADR status convention:** `Proposed` means the decision is implemented on
this branch and awaiting maintainer review. `Accepted` means the PR has
merged and the decision stands. The Decision section of each ADR uses
present tense to describe what the branch implements, not to assert a
final verdict.

# 0001 — MyST-MD Migration

Decisions made during the migration of `learn.scientific-python.org` from
Hugo to MyST-MD (`mystmd` CLI).

Branch: `lb/myst-migration` — Issue: scientific-python/scientific-python.org#846
Accepted: 2026-05-18

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

## ADRs

| #                                           | Title                                         | Status   |
| ------------------------------------------- | --------------------------------------------- | -------- |
| [0001](0001-migrate-to-mystmd.md)           | Migrate build system from Hugo to MyST-MD     | Accepted |
| [0002](0002-shortcode-mapping.md)           | Hugo shortcode → MyST directive mapping       | Accepted |
| [0003](0003-remove-hugo-theme-submodule.md) | Remove scientific-python-hugo-theme submodule | Accepted |
| [0004](0004-consume-cookie-myst-build.md)   | Consume the cookie MyST build                 | Accepted |
| [0005](0005-sibling-repo-migration.md)      | Sibling SP repos migrate independently        | Accepted |
| [0006](0006-deploy-strategy.md)             | Update netlify.toml for MyST build            | Accepted |
| [0007](0007-myst-theme-integration.md)      | MyST theme integration via copier             | Accepted |

**ADR status convention:** `Proposed` means the decision is still open —
drafted but not yet settled. `Accepted` means the decision is settled and is
what this branch proposes to merge. It is set before the PR merges, because
un-accepted ADRs are not merged to `main`. The Decision section of each ADR
uses present tense to describe what the branch implements.

# Architecture Decision Records

Significant decisions made during the development of
`learn.scientific-python.org`. Each ADR captures context, options considered,
and rationale so future contributors understand _why_ the codebase looks the
way it does.

## Conventions

- **Grouped changes** get a numbered subdirectory: `NNNN-topic/`. Files inside
  restart numbering from `0001`.
- **Standalone decisions** live directly here as `NNNN-title.md`.
- ADRs are immutable once accepted. To reverse a decision, write a new ADR with
  `Status: Supersedes NNNN`.

Statuses: `Proposed → Accepted → Deprecated / Superseded by NNNN`

## Index

| #                            | Title                           | Status   |
| ---------------------------- | ------------------------------- | -------- |
| [0001](0001-myst-migration/) | MyST-MD migration (7 decisions) | Proposed |

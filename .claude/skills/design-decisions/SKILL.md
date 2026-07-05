---
name: design-decisions
description: Record design/architecture decisions as lightweight ADRs at the moment they are made. Use whenever choosing between viable alternatives, abandoning an approach, accepting a trade-off, amending a plan, or when anyone would later ask why is it done this way. I'll-document-it-later is a protocol violation.
---

# Design decisions

Any choice a future reader would ask "why?" about gets a record — at the moment of the decision, not at the end. "I'll document it later" is a protocol violation; later, the alternatives you rejected are forgotten and the record is worthless.

## Triggers
- Choosing between 2+ viable approaches (tech, structure, method, format, source).
- Abandoning an approach (record WHY it failed — this is the highest-value record of all).
- Amending a plan in a way that changes direction.
- Accepting a trade-off, constraint, or known limitation.
- Overriding a convention or an earlier decision.

## Format
`docs/decisions/NNNN-<slug>.md`, sequential numbering, using `templates/decision.md`. One decision per file. Keep it under a page — an ADR nobody reads is an ADR that doesn't exist.

Required fields: **Status** (proposed/accepted/superseded by NNNN), **Context** (the forces at play), **Decision** (one sentence, active voice), **Alternatives rejected** (each with the reason for rejection), **Consequences** (what gets easier, what gets harder, what future work this creates).

## Rules
- Rejection reasons are the payload. "We chose X" is weak; "we rejected Y because Z" is what saves the next person a week.
- Decisions are immutable once accepted. Changed your mind? New ADR that supersedes the old one; update the old one's Status line only.
- Every ADR gets a memory entry pointing at it (memory skill), so recall works even before the file is found.
- At orient time (Phase 0), scan the decisions index — contradicting a recorded decision without superseding it is a defect.

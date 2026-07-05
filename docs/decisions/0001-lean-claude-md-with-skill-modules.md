# 0001 — Lean CLAUDE.md with skill modules

- **Date:** 2026-07-06
- **Status:** accepted

## Context
The protocol covers ten concerns (planning, loops, critique, fan-out, diff management, cleanup, final check, handover, decisions, memory). It could live in one large CLAUDE.md or be split.

## Decision
CLAUDE.md holds the workflow spine and hard rules; each concern gets a full skill in `.claude/skills/` that Claude loads when the concern is active.

## Alternatives rejected
- **Single mega CLAUDE.md** — rejected because it is always in context, so every token competes with task context; detailed procedures would be skimmed, not followed.
- **Skills only, no CLAUDE.md protocol** — rejected because skills load on trigger; the phase discipline must be unconditional and therefore always-loaded.

## Consequences
- Easier: per-concern depth without context bloat; skills individually improvable and testable.
- Harder: cross-references must be kept in sync (final-check gate includes this).
- Future work: eval the skills' trigger descriptions with skill-creator.

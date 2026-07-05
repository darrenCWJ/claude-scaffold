# 0006 — Task tiers (S/M/L) right-size the protocol

- **Date:** 2026-07-06
- **Status:** accepted

## Context
The protocol as written applies the full pipeline (plan file, ledger, critique, loop, cleanup, final-check, memory, handover) to every non-trivial task. For a 10-minute fix that is ~8 artifacts of ceremony around 1 unit of work. Uniform heaviness is the classic failure mode of process systems: the overhead trains silent skipping, and once one gate is silently skipped, the authority of every gate erodes. The protocol needs a legitimate lightweight path so the heavyweight path stays credible.

## Decision
Every task gets classified S, M, or L at orient time, out loud, and the tier sets which artifacts are mandatory (see CLAUDE.md "Task tiers"). When unsure, round up. Misclassification discovered mid-task = reclassify upward immediately (never downward mid-task).

## Alternatives rejected
- **Keep the uniform full protocol** — rejected: observed cost ~8 artifacts per trivial fix guarantees non-compliance; unenforced rules rot the credibility of the enforced ones.
- **Pure judgment call ("use the protocol when it helps")** — rejected: "judgment" is exactly how planning silently disappears under time pressure; named tiers make the call auditable — a mis-tiered task is a visible defect, not a vibe.
- **Automatic tier detection (hooks measuring diff size etc.)** — rejected: over-engineering; classification is a one-sentence call at orient time, and post-hoc measurement can't gate work that already happened.

## Consequences
- Easier: small fixes are cheap again; the full pipeline is reserved for work that repays it; compliance becomes realistic and therefore checkable.
- Harder: tier inflation/deflation is a new failure mode — the critique skill should flag "this was tiered S but touched 6 files".
- Future work: dogfooding milestone should log whether tier boundaries are set right.

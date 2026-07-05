---
name: planning
description: Produce a phased, verifiable plan before any non-trivial work. Use at the start of EVERY task with more than one step — whenever the user says plan, build, create, implement, refactor, or describes multi-part work — and again when scope changes mid-task. If unsure whether a task needs a plan, it needs a plan.
---

# Planning

## When to plan
Any task with >1 step, any ambiguity, or any risk of rework. If unsure whether it needs a plan, it needs a plan. Trivial single-step tasks are exempt.

## Procedure

1. **Restate the goal** in one sentence. If you can't, you don't understand the task — go back to the user.
2. **List non-goals.** Explicitly name adjacent things you will NOT do. This is the main defense against scope creep.
3. **List unknowns and assumptions.** For each unknown: resolvable by investigation (do it now via the research skill, or assign to a fan-out agent) or only by the user (batch all user questions into one ask)? Run the orient skill first if the territory is unfamiliar.
4. **Break into phases.** Each phase must have:
   - A deliverable — a thing that exists afterward
   - Exit criteria — an objective test (command passes, file exists with X, critic approves against checklist Y)
   - A size of roughly one comfortable work session; split anything bigger
5. **Order phases by risk.** Do the riskiest, most uncertain phase first — if the plan is going to die, find out early.
6. **Plan verification per phase**, not just at the end: "How will I know this phase actually worked?"
7. **Define abort/rollback.** What condition means "stop and re-plan"? What gets reverted?
8. **Plan the fan-out.** Mark subtasks parallelizable vs sequential. Independent + exploratory = candidate for subagents (see fan-out skill).
9. **Write the plan** to `docs/plans/YYYY-MM-DD-<slug>.md` using `templates/plan.md`, then mirror phases into the task list tool.

## Quality bar
- A stranger could execute the plan without asking you anything.
- Every phase has a falsifiable exit criterion — not "improve X" but "X passes test Y".
- It states what you will NOT do.

## Plan amendments
Plans are living documents. When reality diverges: stop, append an amendment (what changed, why, impact on remaining phases), record a design decision if a choice was involved, then continue. Silent divergence is a protocol violation.

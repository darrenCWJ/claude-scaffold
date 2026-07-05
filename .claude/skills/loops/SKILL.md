---
name: loops
description: Run bounded improve-verify loops on any deliverable. Use after every critique that finds issues, whenever iterating toward a quality bar, when the user says iterate, improve, fix, try again, or not good enough — any time work cycles more than once. Set the budget BEFORE the first iteration.
---

# Loops

A loop = execute → verify → critique → fix. Loops are how quality happens; unbounded loops are how sessions die. Every loop needs a budget and an exit condition BEFORE it starts.

## Setup (before iterating)

1. **Define done.** The exit condition must be objective: tests green, checklist satisfied, critic approves. "Feels good" is not an exit condition.
2. **Set the budget.** Default: 3 iterations. Complex/high-stakes work: 5. Write the budget down.
3. **Pick the verifier.** Automated check > fresh subagent critic > self-review, in that order of preference.

## Each iteration

1. Fix ONLY what the last critique/verification flagged. No opportunistic extras — those go to the task list as separate items.
2. Re-run the SAME verification. Changing the test mid-loop invalidates the loop.
3. Log one line per iteration: `Loop N: fixed X, Y | remaining: Z`. This log goes in the handover if the session ends mid-loop.
4. Check convergence: is the remaining-issues list strictly shrinking?

## Exit rules

- **Converged:** exit condition met → proceed to ship phase.
- **Failing for non-obvious reasons:** switch to the debugging skill — hypothesis-driven, not blind re-fixing.
- **Budget spent, still failing:** STOP. Report to the user: what was attempted each iteration, what still fails, your best hypothesis why, and 2–3 options. Never silently accept failure; never loop past budget.
- **Diverging** (new issues appearing faster than fixes, or the same issue reappearing): stop immediately even with budget left — the approach is wrong. Re-plan; record a design decision about the abandoned approach and why it failed.
- **Oscillating** (fix A breaks B, fix B breaks A): stop, the two constraints conflict. Surface the conflict as a design decision for the user.

## Anti-patterns
- Polishing beyond the exit condition ("one more pass") — done is done.
- Widening scope mid-loop.
- Re-verifying with a weaker check than the one that failed.

---
name: final-check
description: The ship gate — a verification checklist that must pass before any task is declared done. Use as the LAST step of every M/L task, after cleanup, and whenever about to tell the user done, finished, complete, or shipped. No PASS verdict, no done.
---

# Final check

Nothing is "done" until this gate passes. Run it AFTER cleanup, on the true final state. If any item fails, the task is not done — loop or escalate.

## The gate

1. **Original request, word by word.** Re-read the user's actual message(s), not your summary of them. Every explicit requirement met? Every implicit one? Anything silently reinterpreted along the way?
2. **Plan exit criteria.** Every phase's exit criterion re-verified against the final state — not "it passed earlier". Earlier doesn't count; loops and cleanup happened since.
3. **Fresh verification run.** Execute the verification commands/checks NOW, from clean state, per the verification skill (strongest available verifier, evidence recorded). Paste/record actual results, not recollections.
4. **Feature differential closed.** The planned-vs-delivered table (diff-management skill) has no silent gaps — every gap fixed or explicitly reported.
5. **Critique debt.** All blocker/major critique findings fixed or explicitly waived by the user. Minors documented.
6. **Artifacts in place.** Deliverables at their promised paths, openable, non-empty, final versions (not the draft you meant to replace).
7. **State persisted.** Memory written (memory skill triggers all honored), design decisions recorded, handover current if the session may end.
8. **Cleanup done.** Sweep list from the cleanup skill completed; workspace inspection-ready.

## Independence rule
For substantial work, hand this checklist to a fresh subagent along with the original request and the deliverables. The gate-keeper must not be the author. For small work, self-run it in full skeptic mode.

## Reporting

End with an explicit verdict:
- **PASS** — every item green, evidence recorded. Only now say "done".
- **PASS WITH NOTES** — done, with documented minor caveats the user should see.
- **FAIL** — list failing items; return to the loop or escalate to the user. Saying "done" on a FAIL is the single worst protocol violation.

---
name: cleanup
description: Remove work debris and resolve loose ends before shipping. Use in the ship phase of every M/L task, after loops conclude, when the user says clean up or tidy, or when temp files, debug residue, stale TODOs, or unexplained ledger rows have accumulated. Always runs BEFORE final-check.
---

# Cleanup

Debris compounds. Every task ends with a cleanup pass BEFORE the final check — never after (cleanup can break things; the final check must see the true final state).

## Sweep list

1. **Temp artifacts** — scratch files, debug outputs, `test2_final_v3` files, downloaded intermediates, probe files. Delete or move to an explicit `scratch/` that's gitignored.
2. **Dead work** — code paths, doc sections, or plan branches abandoned mid-task. Remove them; the design-decision record (not commented-out corpses) preserves the history.
3. **Debug residue** — print/log statements, hardcoded test values, commented-out experiments, verbose flags left on.
4. **TODOs** — every TODO you introduced: either do it now (< 5 min), convert it to a task-list item / plan future-work entry, or delete it. No orphan TODOs.
5. **Naming and placement** — files where they belong per repo structure, names that describe contents, no `untitled` / `new` / `copy`.
6. **The ledger** — reconcile the diff-management change ledger: every row accounted for, every `In plan? = no` row resolved (amended or reverted).
7. **Docs drift** — README/docs statements invalidated by this task's changes get fixed now, not "later".
8. **Task list** — close finished items, delete stale ones, ensure remaining items are real future work.

## Issue triage (loose ends found during cleanup)

For each open issue discovered: fix now if < 5 minutes AND in scope; otherwise record it (task list + handover Landmines section) with enough context that future-you doesn't have to rediscover it. The worst outcome is a known issue that becomes unknown again.

## Rules
- Cleanup never adds features. If you feel the urge, task-list it.
- Cleanup changes go through the same diff discipline (ledger rows, committed separately as `cleanup:` if in git).
- After cleanup, re-run the primary verification once — cleanup breaks things more often than anyone expects.

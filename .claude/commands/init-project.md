---
description: Bootstrap a new project created from this scaffold (run once, first session)
---
This project was just created from the Claude scaffold. Bootstrap its operating state: $ARGUMENTS

1. Gather what's missing in ONE batched ask (skip anything already answered by $ARGUMENTS or visible in the repo): the project's goal in one sentence, and the first milestone with an observable done-state.
2. Create `docs/ROADMAP.md` from `templates/roadmap.md`: goal at the top, first milestone in Now with falsifiable exit criteria.
3. Write the first memory entry `memory/project-origin.md` (goal, owner intent, today's date) and index it in `memory/MEMORY.md`.
4. Find the project's verification path (test/build/lint commands — or "none yet" for a fresh repo) and record it as a memory entry.
5. Run `bash scripts/check.sh` — it must end PASS.
6. Report: roadmap created, memory seeded, verification path recorded. From here on, the normal workflow in CLAUDE.md applies.

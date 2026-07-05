---
name: critique
description: Adversarial review of a deliverable against its plan and the original request. Use before declaring ANYTHING done, after each execution phase, and whenever the user says review, check this, or is this good — even when the work looks clean, especially when it looks clean.
---

# Critique

The author is the worst judge of their own work. Critique is an attack, not a proofread: actively try to make the work fail.

## Who critiques

- **Substantial work:** spawn a fresh subagent as critic. Give it the deliverable, the plan's exit criteria, and this checklist — NOT your reasoning or excuses. Fresh eyes only.
- **Small work:** self-critique, but switch stance: assume the work is wrong and hunt for proof.

## The attack checklist

1. **Requirements audit.** Re-read the ORIGINAL request word by word. List every explicit and implicit requirement. Mark each: met / partially met / missed / silently reinterpreted. The last category is the most dangerous.
2. **Exit criteria.** Run every exit criterion from the plan literally, using the verification skill's evidence standards. "Probably passes" = fails.
3. **Falsification attempt.** For each claim the work makes, ask: what input, edge case, or reading would break this? Try at least 3 concrete attacks (empty input, extreme values, hostile reader, missing dependency, wrong environment...).
4. **Consistency.** Does the work contradict itself anywhere? Does it contradict the design decisions on record, or memory?
5. **Completeness of the invisible.** What's NOT there: missing error handling, missing citation, unstated assumption, unhandled case, missing file the plan promised?
6. **Overreach.** Did anything get built that wasn't asked for? Scope creep is a defect too.

## Output format

A findings list, each item: **severity** (blocker / major / minor / nit), **location**, **what's wrong**, **evidence**. No fixes in the critique itself — fixing happens in the loop (see loops skill).

## Rules
- A critique that finds nothing is suspect. Look harder once; if still clean, say "clean after second pass" explicitly.
- Critique findings feed the loops skill. Blockers and majors MUST be fixed or explicitly accepted by the user; minors/nits may be batched or waived with a note.
- Never soften findings to protect the work. The work has no feelings.

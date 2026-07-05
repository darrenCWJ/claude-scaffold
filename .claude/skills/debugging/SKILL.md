---
name: debugging
description: Hypothesis-driven debugging for any failing system — code, pipeline, document build, tool call, or process. Use whenever something errors, behaves unexpectedly, produces wrong output, or fails intermittently, and ALWAYS before attempting a second blind fix ("let me just try changing X" twice in a row means this skill should be active).
---

# Debugging

Debugging is science, not thrashing. One observation, one hypothesis, one experiment at a time. Two consecutive blind fixes = stop and start this protocol properly.

## The loop

1. **Reproduce first.** Find the minimal, deterministic reproduction. If you cannot reproduce it, you cannot verify any fix — reproduction IS the first deliverable. For intermittent failures, find the frequency ("fails ~1 in 5") so you know how many clean runs prove a fix.
2. **Read the actual error.** The full message, the full stack, the actual line. Do not pattern-match on the first word and guess. The answer is in the error more often than pride allows.
3. **State the expected vs observed** in one sentence each. If you can't state expected behavior precisely, the bug might be in your understanding of the spec.
4. **Form ONE hypothesis** that explains ALL observations — not just the most recent one. A hypothesis that ignores an observation is wrong.
5. **Design the cheapest discriminating experiment** — one that will give a different result depending on whether the hypothesis is true. Prefer observation (logging, inspecting state, bisecting input) over mutation (changing code to see what happens).
6. **Run it. Update.** Hypothesis confirmed → fix the ROOT CAUSE, not the symptom. Refuted → record it (see ledger below) and return to step 4 with the new information.
7. **Verify the fix** (verification skill): reproduction now passes, AND the rest still passes — a fix that breaks something else is a new bug, not a fix.

## The hypothesis ledger

Keep a running list in the task notes: `H1: <hypothesis> → <experiment> → CONFIRMED/REFUTED (<evidence>)`. This prevents re-testing dead hypotheses, makes handovers survivable mid-debug, and exposes when you're going in circles.

## Standard moves when stuck

- **Bisect** — halve the input / commit range / pipeline until the failure isolates. Fastest generic weapon.
- **Diff against last-known-good** — what changed between working and broken? (git diff, file timestamps, dependency versions, environment).
- **Check the boring things** — wrong file, stale cache, wrong directory, wrong environment, unsaved change, case-sensitive path. Rule these out EARLY; they are disproportionately common and maximally embarrassing late.
- **Question the diagnosis, not just the fix** — after 3 refuted hypotheses, the frame is probably wrong: the bug may be in a different layer entirely.

## Exit rules
Debugging respects the loops skill budget. After the budget (default 3 full loop iterations) is spent: write up the reproduction, the hypothesis ledger, and the narrowed search space — then escalate to the user. That write-up has real value; thrashing does not.

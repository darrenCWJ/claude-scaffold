---
name: handover
description: Write a handover that lets a zero-context Claude resume the work in one read. Use when a session may end, context is running long, before major fan-out, when switching major tasks, or when the user says handover, continue tomorrow, or pick this up later. Written too late is written badly — be early.
---

# Handover

A handover succeeds if a fresh Claude with ZERO context — no conversation history, no memory of this session — can resume the work after one read. Write against that standard and nothing weaker.

## Triggers (write one without being asked)
- Session likely ending, or context getting long (be proactive — a handover written too late is written badly).
- About to fan out major parallel work (the handover doubles as orchestrator state).
- Switching to a different major task.
- User says "handover", "pick this up later", "continue tomorrow".

## Location
`docs/handovers/YYYY-MM-DD-HHMM-<slug>.md` using `templates/handover.md`. Newest file = current state. Never overwrite an old handover; supersede it.

## Required content (all sections, no exceptions)

1. **Mission** — the original request, verbatim or near-verbatim, plus current interpretation.
2. **State** — what is DONE (with evidence: paths, passing checks), what is IN PROGRESS (exactly where it stopped, mid-loop iteration count if looping), what is NOT STARTED.
3. **Next action** — the single concrete step the successor should take first. Not a theme; a step ("run X, it currently fails with Y, the fix is likely in Z").
4. **Live plan** — link to the plan file + any amendments since.
5. **Landmines** — everything that will waste the successor's time: failed approaches and WHY they failed, misleading file names, flaky checks, things that look done but aren't.
6. **Decisions since last handover** — links to ADRs.
7. **Open questions for the user** — anything blocked on user input.
8. **Verification state** — which checks pass right now, which fail, exact commands to re-run them.

## Quality test
Before finishing, re-read the handover pretending you know nothing. Every "as discussed", "the usual place", "continue the approach" is a failure — replace with explicit content. Paths absolute or repo-relative, commands copy-pasteable, no references to conversation context.

## On resume (successor protocol)
Read newest handover → read linked plan → verify claimed state (re-run the passing checks; trust nothing) → take the Next action. If claimed state doesn't verify, write that discrepancy down before proceeding.

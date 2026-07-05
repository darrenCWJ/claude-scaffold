---
name: context-management
description: Keep the context window lean and survive compaction without losing the thread. Use when a session runs long, when many large files or logs have been loaded, before fanning out major work, when you catch yourself re-reading or re-deriving established facts, or when compaction looms — write state down BEFORE it is lost, not after.
---

# Context management

Context is a budget, not a given. Everything held only in conversation is one compaction away from gone; everything written to artifacts survives. Manage accordingly.

## Keep it lean (during work)

- **Don't load what a subagent can read for you.** Bulk file reading, broad searches, long logs → fan out (fan-out skill) and keep only the conclusions.
- **Read narrowly.** The section, not the file; the diff, not the repo; the failing test's output, not the whole run.
- **Don't re-read to "confirm".** A file you just edited is in the state the tool result reported.
- **Summarize as you go.** Long tool output becomes one line in the plan ledger or task list; the artifact remembers so the context doesn't have to.

## Warning signs (act when you see them)

- Re-deriving facts already established this session, or re-opening files already read.
- Raw dumps sitting in context where a one-line conclusion would do.
- Starting a large new phase while carrying a finished phase's debris.
- The session is long AND the newest handover is stale — the gap between reality and paper is the amount you lose on compaction.

## Before compaction (or any risk of context loss)

1. **Handover NOW** (handover skill) — zero-context resumability is the standard.
2. **Flush memory writes** (memory skill) — preferences, failures, and decisions still only in conversation get files immediately.
3. **Sync the paper trail** — plan ledger current, task list statuses true, roadmap honest.

## After compaction / on resume

Re-orient (orient skill): memory index → newest handover → roadmap → verify claimed state against reality. Trust the artifacts over the summary's confidence — summaries compress, artifacts don't.

## Rules

- State written to artifacts beats state held in context, always.
- A phase boundary is the natural shedding point: ledger updated, memory written, then move on light.
- Never let the FIRST handover of a long session be the one written at 95% context — by then the details worth handing over are already gone.

---
name: fan-out
description: Delegate work to parallel subagents correctly — when to fan out, the briefing contract, and merge protocol. Use whenever a plan contains independent subtasks, broad multi-source searches, parallel verification, or the user says in parallel, agents, or delegate. Also read it to decide NOT to fan out.
---

# Agent fan-out

## When to fan out
- Subtasks are **independent** (no shared files, no ordering dependency) AND each needs meaningful exploration or generation.
- Broad research/search across many sources or files where you only need conclusions.
- Independent verification: a fresh critic agent reviewing finished work.

## When NOT to fan out
- Single lookups you can do in 1–2 tool calls yourself.
- Tightly coupled edits (agents stepping on each other's files).
- When you'd spend more effort briefing than doing.
- Deep sequential reasoning — parallelism doesn't help a chain.

## Briefing an agent (the contract)

Every spawned agent gets ALL of:
1. **Scope** — exactly what to do, with file paths / sources / boundaries.
2. **Deliverable** — exact output format ("return a markdown list of findings, each with file:line evidence").
3. **Non-goals** — what NOT to touch or do. Explicitly forbid writing outside its assigned paths.
4. **Context** — the minimum background it needs (it starts with zero context; it cannot see this conversation).
5. **Quality bar** — how it should verify its own work before reporting.

A brief the agent could misinterpret WILL be misinterpreted. Write briefs like API contracts.

## Orchestration rules

- Launch independent agents **in parallel** — one message, multiple Task calls.
- **Never** let two agents write to the same file. Partition by directory or file list.
- Writers get disjoint scopes; readers can overlap freely.
- Keep a fan-out ledger in the task list: one task per agent, marked with its scope.
- Cap parallelism at what you can meaningfully verify (typically 3–5 agents per wave).
- For continuing work with an existing agent, message it rather than spawning a fresh one and re-briefing.

## Merging results (fan-in)

1. Verify each result against its brief BEFORE integrating — spot-check claims, run its outputs, read its diffs. Blind merging is a protocol violation.
2. Look for cross-agent conflicts: contradictory findings, incompatible edits, duplicated work.
3. Integrate sequentially, verifying after each merge, not after all merges.
4. Record in the plan which results were accepted, rejected, or reworked — and why (design decision if significant).

## Failure handling
An agent that returns garbage gets ONE re-brief with the misunderstanding corrected. If it fails again, do that subtask yourself — repeated re-delegation wastes more than it saves.

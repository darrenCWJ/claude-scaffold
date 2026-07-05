---
name: memory
description: Aggressively persist facts, preferences, failures, and state so nothing is lost between sessions. Use continuously — the moment the user states a preference or correction, an approach fails, a decision lands, a phase completes, or anything surprising appears. If you wondered whether to save it, save it.
---

# Memory

Bias hard toward over-writing. Redundant memory is cheap; lost context is expensive. Nothing is left unturned: if you wondered "should I save this?", the answer was yes.

## Write triggers (act immediately, unprompted)
- User states a preference, correction, or way-of-working (type: user or feedback — include the WHY).
- A design decision is made (pointer to the ADR).
- An approach FAILS (record why — failure memory prevents repeated failure).
- A phase completes (state snapshot: what's done, what's next).
- Something surprising is discovered about the project, tools, or environment.
- A recurring entity appears (a person, service, convention, or constraint that will matter again).

## Format
One fact per file in `memory/`, kebab-case name, with frontmatter:

    ---
    name: <slug>
    description: <one-line summary used for recall relevance>
    type: user | feedback | project | reference | failure | decision
    date: YYYY-MM-DD
    ---
    <the fact. For feedback/failure: add **Why:** and **How to apply:** lines.
    Link related memories with [[slug]].>

After every write, add/update one line in `memory/MEMORY.md`:
`- [name](file.md) — hook`. The index is the recall surface — a memory missing from the index is lost.

## Hygiene
- Before writing, check for an existing file that covers it — update rather than duplicate.
- Wrong memories get corrected or deleted immediately; a false memory is worse than none.
- Convert relative dates ("last week") to absolute before saving.
- Don't store what the repo already records (code, git history, the plans/decisions files themselves) — store pointers plus the non-obvious part.
- Never store secrets, credentials, or sensitive personal data.

## Read protocol (Phase 0 of every task)
Read `memory/MEMORY.md` fully; open any entry whose description might touch the task. Memories reflect when they were written — verify stale-looking facts before relying on them.

## Consolidation
When the index exceeds ~40 lines or feels noisy: merge duplicates, delete dead facts, cluster related entries. Consolidation is a real task — plan it, don't do it as a side effect.

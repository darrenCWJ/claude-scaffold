# CLAUDE.md — Operating Protocol

This repo is a general-purpose scaffold. It defines HOW Claude works, not WHAT it works on. Drop it into any project (code, research, writing, analysis) and follow this protocol.

## Prime directives

1. **Never work without a plan.** Anything beyond a trivial one-step task gets a plan first (see `.claude/skills/planning/`).
2. **Never trust first output.** Every deliverable gets at least one critique loop before it counts as done (see `.claude/skills/critique/` and `.claude/skills/loops/`).
3. **Never lose state.** Write memory aggressively, record design decisions, and leave a handover whenever a session may end (see `.claude/skills/memory/`, `.claude/skills/design-decisions/`, `.claude/skills/handover/`).
4. **Never leave a mess.** Every task ends with cleanup and a final check (see `.claude/skills/cleanup/` and `.claude/skills/final-check/`).

These directives bind through the task-tier table below: an S-tier task satisfies them with verification plus a memory note. Two duties are tier-independent — any non-obvious choice gets an ADR, and scope drift is never silent.

## Task tiers — classify at Phase 0, out loud

Phase 0 (Orient) runs for EVERY task — it is where the tier gets set. Tiers govern Phases 1–5. When unsure, round up. Reclassify upward the moment a task outgrows its tier — never downward mid-task.

| Tier | Definition | Required | Not required |
|---|---|---|---|
| **S** | ALL of: single-step, unambiguous, ≲15 min, ≤2 files | Verify the result (verification skill); memory note if anything surprised you | Plan file, critique file, loops, cleanup pass, final-check report, handover, roadmap update |
| **M** (default) | Fits one session; fails any S condition | Full workflow (Phases 0–5); self-critique acceptable; handover if the session may end | Subagent critic, subagent final-check |
| **L** | Multi-session, architectural, or high-stakes (security, data loss, external publication) | Full workflow + subagent critic + subagent final-check + handover + roadmap update | Nothing |

- Everything not listed as "Not required" stays mandatory at that tier.
- A task that exceeds its tier's definition mid-flight (an "S" fix now touching a third file) is mis-tiered: say so, re-tier, and run the newly required gates retroactively.
- Some skill descriptions use absolutist triggers ("every task", "ANYTHING"). The tier table governs: read them as "every M/L task" — except verification and memory, which apply at every tier.

## The workflow: Plan → Execute → Critique → Loop → Ship

Phase 0 runs for every task; M and L tasks continue through Phases 1–5 in order. Do not skip phases; do explicitly state which phase you are in.

### Phase 0 — Orient
- Invoke the **orient** skill: read `memory/MEMORY.md`, `docs/ROADMAP.md` (if present), the latest file in `docs/handovers/` (if any), and `docs/decisions/` index; map unfamiliar territory before touching it; find the project's verification path and run it for a baseline.
- Restate the task in your own words. List unknowns. Ask clarifying questions ONLY if an unknown blocks planning; otherwise state assumptions explicitly and proceed.

### Phase 1 — Plan
- Solution space open (multiple viable approaches, or none obvious)? Run the **brainstorm** skill FIRST — the first idea never becomes the plan without competition.
- Invoke the **planning** skill. Output a plan file in `docs/plans/` using `templates/plan.md`.
- Plans must have: goal, non-goals, phases with exit criteria, risks, verification strategy, and a rollback/abort condition.
- For work with parallelizable parts, plan the agent fan-out here (see **fan-out** skill).

### Phase 2 — Execute
- Work phase-by-phase. A phase is done only when its exit criteria pass — proven per the **verification** skill (evidence, not confidence).
- Gathering facts? Use the **research** skill. Something failing? Use the **debugging** skill — no second blind fix, ever.
- Web deliverable (site, app, HTML, dashboard)? It is verified in a real browser via the **web-testing** skill (Playwright) — never by reading the HTML.
- Track everything in the task list (TaskCreate/TaskUpdate or TodoWrite). One task per phase minimum.
- Manage change scope with the **diff-management** skill: know at all times what changed, why, and whether it's inside plan scope. Out-of-scope changes require a plan amendment, not silent drift.
- Record every non-obvious choice as a design decision the moment you make it (see **design-decisions** skill). "I'll document it later" is a protocol violation.

### Phase 3 — Critique
- Invoke the **critique** skill: adversarial self-review against the plan's exit criteria.
- Prose deliverables additionally get the **writing-review** skill — first drafts are never final drafts.
- Prefer a fresh subagent as the critic for anything substantial — the author is the worst judge of their own work.

### Phase 4 — Loop
- Feed critique findings back into Phase 2. Use the **loops** skill for loop budgets and exit conditions.
- Default budget: max 3 improvement loops. Escalate to the user if still failing after budget is spent — do not loop forever, do not silently accept failure.

### Phase 5 — Ship
- Run the **cleanup** skill (remove debris, dead code, temp files, stale TODOs).
- Run the **final-check** skill (verification checklist — this gates completion).
- Update memory, write/refresh the handover, and finalize design-decision records.
- Multi-milestone project? Update `docs/ROADMAP.md` per the **roadmap** skill — progress the milestone, log the done, keep Now/Next honest.

## Agent fan-out rules (summary — full detail in `.claude/skills/fan-out/`)

- Fan out when subtasks are independent and each needs meaningful exploration. Don't fan out for lookups you can do in one step.
- Every spawned agent gets: exact scope, exact deliverable format, what NOT to do, and where to report.
- Launch independent agents in parallel (single message, multiple Task calls). Never have two agents write to the same file.
- The orchestrator (you) never blindly merges agent output — verify each result against its brief before integrating.

## Memory rules (summary — full detail in `.claude/skills/memory/`)

- Write memory at these triggers, without being asked: user states a preference; a decision is made; an approach fails (record WHY); a phase completes; anything surprising is discovered.
- Memory lives in `memory/` as one fact per file, indexed in `memory/MEMORY.md`. Update the index every time.
- Bias hard toward over-writing memory. Redundant memory is cheap; lost context is expensive.

## Handover rules (summary — full detail in `.claude/skills/handover/`)

- Write a handover to `docs/handovers/` whenever: a session is ending, context is getting long, you're about to fan out major work, or the user says "handover".
- A handover must let a fresh Claude with zero context resume within one read. Test it against that standard.

## Design decisions (summary — full detail in `.claude/skills/design-decisions/`)

- Any choice between alternatives that a future reader would ask "why?" about gets an ADR in `docs/decisions/`, numbered sequentially, using `templates/decision.md`.
- Record rejected alternatives and the reason for rejection. The rejection reasons are usually more valuable than the choice itself.

## Precedence & coexistence

This scaffold usually runs alongside a large global layer (`~/.claude` rules, plugins like superpowers/ECC) that overlaps it. Resolution order:

1. Explicit user instruction in the session
2. This CLAUDE.md and this repo's skills — **process authority**: phases, artifacts, gates
3. Global rules/skills — **domain authority**: language patterns, review checklists, TDD mechanics, tool recipes
4. Model defaults

When a global process skill overlaps a scaffold skill (brainstorming, planning, debugging, verification), the scaffold's artifact and gate win; use the global one for technique only. Never run two overlapping process protocols for the same step.

## Slash commands

- `/init-project <goal>` — bootstrap a fresh project created from this scaffold (run once, first session: roadmap, first memory, verification path)
- `/plan <task>` — start Phase 1 for a task
- `/critique` — run adversarial review on current work
- `/handover` — write a handover now
- `/final-check` — run the ship gate
- `/decision <title>` — record an ADR

## Style

- State which phase you're in when you switch phases.
- Say "I don't know" and "this failed" plainly. Never paper over a failing check.
- Prefer small, verifiable steps over large leaps.

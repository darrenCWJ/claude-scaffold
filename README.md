# Claude Scaffold

An all-purpose operating scaffold for Claude Code. It makes Claude plan before working, loop with budgets, critique its own output adversarially, fan out subagents safely, control scope drift, clean up, pass a ship gate, record design decisions, write memory aggressively, and hand over cleanly between sessions.

## Use it

Copy this repo's contents into any project (or start projects from it as a template). Claude Code picks up `CLAUDE.md` automatically; skills in `.claude/skills/` load when their concern is active; slash commands come from `.claude/commands/`.

```
git clone <this repo> my-project && cd my-project
claude
```

First session in the new project: run `/init-project <goal>` — it creates `docs/ROADMAP.md`, writes the first memory entry, and records the project's verification path. The scaffold ships with these state directories empty on purpose; every project fills them with its own plans, decisions, memories, and handovers.

## Structure

```
CLAUDE.md                    # Always-loaded protocol: Plan → Execute → Critique → Loop → Ship
.claude/
  skills/                    # One skill per concern
    planning/                #   phased plans with falsifiable exit criteria
    loops/                   #   bounded improve-verify loops (budget, exit, divergence rules)
    critique/                #   adversarial review, fresh-subagent critic
    fan-out/                 #   parallel subagents: briefing contract, merge protocol
    diff-management/         #   change ledger, scope discipline, feature differential
    cleanup/                 #   debris sweep + issue triage before shipping
    final-check/             #   the ship gate (PASS / PASS WITH NOTES / FAIL)
    handover/                #   zero-context resumability standard
    design-decisions/        #   lightweight ADRs, rejection reasons required
    memory/                  #   aggressive fact persistence + index
    orient/                  #   Phase 0 done properly: resume protocol + new-territory mapping
    verification/            #   evidence standards: prove it works, don't assert it
    debugging/               #   hypothesis-driven debugging, hypothesis ledger
    research/                #   source ranking, independent confirmation, disconfirmation hunt
    writing-review/          #   3-pass prose review for any human-facing document
    brainstorm/              #   diverge (8-15 ideas, forced lenses) then converge (criteria first)
    web-testing/             #   Playwright browser verification: load/render/work/sizes/fail
    roadmap/                 #   living project-level phases: Now/Next/Later, done log, exit criteria
  commands/                  # /init-project /plan /critique /handover /final-check /decision
docs/
  ROADMAP.md                 # living project map (created by /init-project): Now/Next/Later, done log
  plans/                     # one file per plan (starts empty)
  handovers/                 # newest file = current state (starts empty)
  decisions/                 # numbered ADRs (starts empty)
templates/                   # plan, handover, decision, critique, roadmap
memory/                      # MEMORY.md index + one fact per file (starts empty)
scripts/check.sh             # the scaffold's own verification path (structural consistency)
```

## The workflow

Every task is tiered first — **S** (trivial: verify + memory note), **M** (default: full workflow), **L** (multi-session: full workflow + independent gates). M and L tasks run: **Orient** (read memory, roadmap, handover, decisions) → **Plan** (phased, riskiest first) → **Execute** (ledger every change) → **Critique** (attack the work) → **Loop** (max 3 by default, then escalate) → **Ship** (cleanup, final check, persist state).

Hard rules for M and L tasks: no work without a plan, no "done" without the final-check gate, no session end without a handover. At every tier: no silent scope drift, no decision without an ADR.

Running alongside a global `~/.claude` config? This scaffold owns **process** (phases, artifacts, gates); the global layer owns **domain technique**. See "Precedence & coexistence" in CLAUDE.md.

Verify the scaffold itself: `bash scripts/check.sh` (exit 0 = structurally consistent).

## Design rationale (why it's shaped this way)

- **Lean CLAUDE.md + one skill per concern** — always-loaded text competes with task context; depth lives in skills that load on trigger.
- **Execution skills, not just process skills** — verification, debugging, research, writing-review exist because completion claims need evidence, not confidence.
- **Capabilities are elicited, not assumed** — brainstorming and browser-verification are named skills with concrete recipes, so the scaffold degrades gracefully on weaker models.
- **Roadmap above plans** — plans are per-task and get archived; one living `docs/ROADMAP.md` answers "where are we" across many sessions.
- **Precedence over global config** — a big `~/.claude` layer (rules, plugins, domain skills) will overlap this scaffold; the scaffold wins process conflicts, globals supply technique. Duplicating domain skills here would create drift and trigger ambiguity.
- **Task tiers (S/M/L)** — a uniform heavyweight protocol on trivial fixes trains silent rule-skipping; tiering right-sizes the ceremony so the full pipeline keeps its authority.
- **Template ships empty** — plans, decisions, memory, handovers are per-project state; the scaffold provides the containers, templates, and gates, and `/init-project` seeds them.

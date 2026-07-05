# Claude Scaffold

An all-purpose operating scaffold for Claude Code. It makes Claude plan before working, loop with budgets, critique its own output adversarially, fan out subagents safely, control scope drift, clean up, pass a ship gate, record design decisions, write memory aggressively, and hand over cleanly between sessions.

## Use it

Copy this repo's contents into any project (or start projects from it as a template). Claude Code picks up `CLAUDE.md` automatically; skills in `.claude/skills/` load when their concern is active; slash commands come from `.claude/commands/`.

```
git clone <this repo> my-project && cd my-project
claude
```

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
  commands/                  # /plan /critique /handover /final-check /decision
docs/
  plans/                     # one file per plan
  handovers/                 # newest file = current state
  decisions/                 # numbered ADRs
templates/                   # plan, handover, decision, critique
memory/                      # MEMORY.md index + one fact per file
```

## The workflow

Every non-trivial task: **Orient** (read memory, handover, decisions) → **Plan** (phased, riskiest first) → **Execute** (ledger every change) → **Critique** (attack the work) → **Loop** (max 3 by default, then escalate) → **Ship** (cleanup, final check, persist state).

Hard rules: no work without a plan, no "done" without the final-check gate, no silent scope drift, no decision without an ADR, no session end without a handover.

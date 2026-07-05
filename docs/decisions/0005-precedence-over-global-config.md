# 0005 — Scaffold owns process; global config owns domain; explicit precedence

- **Date:** 2026-07-06
- **Status:** accepted

## Context
The scaffold is deployed into environments that already carry a large global layer (`~/.claude`: ECC rules, superpowers plugin, dozens of skills and agents). Many concerns exist on both sides — brainstorming, planning, debugging, verification, TDD, code review. Both layers claim mandatory authority ("MUST use", "not negotiable"), so in a real session Claude faces contradictory mandates and double-triggering: two planning protocols, two brainstorming protocols, two "verify before done" gates. Overlap without precedence is worse than either layer alone.

## Decision
The scaffold owns **process** (phases, artifacts, gates: plan files, ADRs, handovers, loops, final-check); the global layer owns **domain technique** (language patterns, review checklists, TDD mechanics, framework recipes). For any overlapping process step, the scaffold's skill and artifact format win; the global counterpart may inform technique but never replaces the scaffold's artifact or gate. Precedence order: explicit session instruction > project CLAUDE.md + scaffold skills > global rules/skills > model defaults.

## Alternatives rejected
- **Strip scaffold process skills and rely on globals (superpowers etc.)** — rejected: the scaffold must be self-contained on machines and projects without those plugins; its artifact spine (docs/plans, decisions, handovers, memory) is the whole point and globals don't produce it.
- **Duplicate global domain content (TDD, review checklists, security) into the scaffold** — rejected: drift against upstream and worse trigger ambiguity — the same reasoning as ADR 0002's "leave vendor skills alone".
- **Do nothing / let the model arbitrate per session** — rejected: arbitration is invisible and unstable; the same task can take different paths on different days, and both layers' "mandatory" language trains rule-skipping.

## Consequences
- Easier: one deterministic answer to "which skill runs this step"; global layer remains useful as a technique library; scaffold portable to clean machines.
- Harder: the overlap map must actually be built (roadmap: global-config dedupe audit) — until then the rule is applied per-case.
- Future work: dedupe audit milestone on the roadmap; consider trimming the global layer per its own agent-sort tooling.

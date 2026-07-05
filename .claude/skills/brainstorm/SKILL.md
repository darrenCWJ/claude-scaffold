---
name: brainstorm
description: Structured divergent-then-convergent ideation before committing to an approach. Use whenever the solution space is open — the user says brainstorm, ideas, options, what are the ways, how should we, name this, or design this — and BEFORE writing any ADR that would otherwise have only one alternative. If the first idea is about to become the plan without competition, this skill is overdue.
---

# Brainstorm

The first idea is rarely the best idea; it is merely the most available one. Brainstorming exists to force real alternatives into existence before convergence — and to converge honestly afterward. Never evaluate while generating; never generate while evaluating.

## Phase 1 — Frame (2 minutes)

State: the actual problem (not the assumed solution), hard constraints (real ones — budget, compatibility, deadline), and what "good" means here. A mis-framed brainstorm generates 20 answers to the wrong question. Challenge the frame once: "is this the real problem, or a symptom of a bigger one?"

## Phase 2 — Diverge

Generate 8–15 candidates. Quantity IS the mechanism — the obvious ideas must be exhausted before the interesting ones appear. Rules:

- **No evaluation during generation.** No "but that won't work because..." — capture it and move on. Killing ideas early kills the branches that would have grown from them.
- **Force variety with lenses.** Generate at least one idea from each: the conventional answer; the opposite/inversion of the conventional answer; what you'd do with 10x the resources; what you'd do with 1/10th; how an adjacent domain solves this (analogy); removing the assumed-fixed constraint; combining two earlier ideas; and **do nothing** (always a candidate — its cost is the baseline every idea must beat).
- **Include one idea you dislike.** Authored aversion is data about you, not the idea.
- For substantial problems, fan out 2–3 subagents with different lenses (fan-out skill) — independent generation beats one mind's clustering.

## Phase 3 — Converge (criteria first, then scores)

1. **Write the criteria BEFORE looking back at the list** (impact, effort, risk, reversibility, fit with standing ADRs — pick 3–5, weight them). Criteria written after seeing options become post-hoc rationalization of the favorite.
2. Cluster the candidates; name the clusters — clusters often reveal a dimension of choice nobody stated.
3. Score the plausible ones against the criteria. Kill criteria first (violates a hard constraint = out, no matter how clever).
4. Keep the top 2–3 as genuine finalists with trade-offs stated. Present to the user when the choice is theirs; decide when it's yours.

## Phase 4 — Record

The chosen approach AND the rejected finalists (with reasons) go into an ADR (design-decisions skill). The brainstorm's raw list goes into the plan file or a `docs/plans/<slug>-brainstorm.md` appendix — discarded ideas are free inventory for the next problem.

## Anti-patterns
- Brainstorming to decorate a decision already made — dishonest and slower than just deciding.
- Converging after 3 ideas because one "feels right" (availability bias wearing a process costume).
- Letting the loudest constraint (usually effort) silently become the only criterion.

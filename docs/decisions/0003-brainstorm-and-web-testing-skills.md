# 0003 — Encode brainstorming and browser-verification as skills, not model assumptions

- **Date:** 2026-07-06
- **Status:** accepted

## Context
D observed newer models (Fable) brainstorming well, setting decisions, and knowing tools like Playwright. Capabilities live in the model and vary by model/version; a scaffold that assumes them silently degrades on weaker models. What a repo CAN control is elicitation: naming trigger moments and giving concrete recipes.

## Decision
Add two skills — brainstorm (divergent→convergent protocol feeding ADRs) and web-testing (Playwright gate for any browser-rendered deliverable) — and wire their triggers into CLAUDE.md Phases 1 and 2.

## Alternatives rejected
- **Rely on the model's native ability** — rejected: untriggered ability is unreliable; the scaffold must work across models and sessions.
- **A general "tools Claude should know" list in CLAUDE.md** — rejected: always-loaded tool trivia bloats context (ADR 0001); tool recipes belong in skills that load when relevant.
- **Merging brainstorm into design-decisions** — rejected: brainstorming happens before a decision exists; different trigger moment, and merged descriptions worsen undertriggering (ADR 0002).

## Consequences
- Easier: plans start from competing alternatives; web work can't claim "works" without a browser run; ADRs get real rejected-alternatives sections fed by brainstorms.
- Harder: 17 skills to keep consistent.
- Future work: consider similar tool-recipe skills for API testing and data pipelines if those recur in D's work.

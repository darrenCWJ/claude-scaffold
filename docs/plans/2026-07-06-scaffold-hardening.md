# Plan: Scaffold self-audit and hardening

- **Date:** 2026-07-06
- **Status:** active
- **Original request:** "Can you help me improve my claude scaffold repo. It should improve my way of using agentic coding. Critique what is already there, how i can have useful skills to improve my work. Rules that needs to follow, Skills that knows how to be used and proper roadmap and decisions"

## Goal
Make the scaffold obey its own rules and coexist cleanly with the owner's global Claude config, so it improves agentic coding instead of adding ceremony.

## Non-goals
- No new domain/coding skills (TDD, code review, security are already covered by the global layer — duplicating them creates trigger ambiguity; see ADR 0005).
- No rewrite of the 18 existing skills' content (they are well-written; the gaps are structural).
- No changes to `~/.claude` global config (separate concern, separate repo).
- No move of the repo out of OneDrive (flagged to owner; their call).

## Unknowns & assumptions
| Item | Type | Resolution |
|---|---|---|
| Does the owner want git init here? | assumption | README says "pushed to GitHub and reused" — yes; reversible |
| Which global skills actually fire alongside scaffold skills | assumption | Observed in this session: superpowers claims mandatory precedence; treat overlap as real |

## Phases
### Phase 1 — Foundation (riskiest first: git in OneDrive)
- **Deliverable:** git repo with baseline commit; work branch `scaffold-hardening`
- **Exit criteria:** `git log --oneline` shows baseline; branch active
- **Verification:** `git status` clean after baseline commit
- **Fan-out:** none

### Phase 2 — Roadmap
- **Deliverable:** `docs/ROADMAP.md` seeded with real milestones incl. the "future work" items ADRs 0002/0003/0004 promised but never tracked
- **Exit criteria:** file exists; every milestone has falsifiable exit criteria; Now ≤ 2 items
- **Verification:** read-back against templates/roadmap.md structure
- **Fan-out:** none

### Phase 3 — Coexistence + tiering rules
- **Deliverable:** ADR 0005 (precedence vs global config), ADR 0006 (task tiers), CLAUDE.md updated with both rules
- **Exit criteria:** both ADRs have ≥2 rejected alternatives with reasons; CLAUDE.md sections < 15 lines each
- **Verification:** read-back; consistency with ADR 0001 (lean CLAUDE.md)
- **Fan-out:** none

### Phase 4 — Verification path for the scaffold itself
- **Deliverable:** `scripts/check.sh` structural checker (skills frontmatter, ADR numbering, memory index integrity, template existence, roadmap present)
- **Exit criteria:** script exits 0 on current repo AND exits non-zero when a defect is planted (failure-path test per verification skill)
- **Verification:** run both cases, record output
- **Fan-out:** none

### Phase 5 — Ship
- **Deliverable:** README drift fixed, subagent critique run, findings fixed, memory + handover + roadmap updated, merged to main
- **Exit criteria:** final-check gate PASS; check.sh green on final state
- **Verification:** scripts/check.sh + critic findings resolved
- **Fan-out:** one critic subagent

## Abort / rollback
- Abort if: git misbehaves in OneDrive (lock/sync corruption) → continue without git, record failure memory.
- Rollback by: `git checkout main` discards the branch; pre-git state recoverable from baseline commit.

## Change ledger
| # | File/artifact | Change | Phase | In plan? |
|---|---|---|---|---|
| 1 | docs/plans/2026-07-06-scaffold-hardening.md | created | 1 | yes |
| 2 | .git/ | initialized | 1 | yes |
| 3 | docs/ROADMAP.md | created | 2 | yes |
| 4 | docs/decisions/0005-*.md | created | 3 | yes |
| 5 | docs/decisions/0006-*.md | created | 3 | yes |
| 6 | CLAUDE.md | tiers + precedence sections | 3 | yes |
| 7 | scripts/check.sh | created | 4 | yes |
| 8 | README.md | drift fixes + verification path | 5 | yes |
| 9 | memory/* | new entries + index | 5 | yes |
| 10 | docs/handovers/* | handover | 5 | yes |

## Feature differential (fill at critique time)
| Requirement | Planned | Delivered | Gap |
|---|---|---|---|
| Critique of what's there | full critique in final report | | |
| Useful skills to improve work | coexistence rule + roadmap items, NOT new skills | | |
| Rules that need to be followed | precedence + tier rules in CLAUDE.md | | |
| Skills that know how to be used | trigger-eval milestone + ADR 0005 overlap rule | | |
| Proper roadmap | docs/ROADMAP.md | | |
| Proper decisions | ADRs 0005, 0006 | | |

## Amendments
<!-- Append-only. -->

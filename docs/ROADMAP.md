# Roadmap: Claude Scaffold

- **Updated:** 2026-07-06 (bump on every edit)
- **Goal:** An operating scaffold that measurably improves agentic coding across all of D's projects — and obeys its own rules.

## Now (max 1–2)
| Milestone | Status | Exit criteria | Plan |
|---|---|---|---|
| Scaffold self-audit & hardening | 🔄 | Repo under git; ROADMAP exists; coexistence + tier rules recorded (ADR 0005/0006); `scripts/check.sh` green | docs/plans/2026-07-06-scaffold-hardening.md |

## Next (ordered)
| Milestone | Exit criteria | Notes |
|---|---|---|
| Dogfood on a real coding project | Scaffold copied into one active repo (e.g. facility-booking); ≥2 weeks of use; friction log written to memory; ≥1 ADR amending the scaffold from real evidence | The scaffold has never been used in anger — everything before this is theory |
| Skill-trigger evaluation | Each of the 18 skills has ≥1 documented fire/no-fire test scenario; descriptions fixed where triggers miss | Promised in ADRs 0001, 0002, 0003 "future work"; use skill-creator eval guidance |
| Global-config dedupe audit | Written map of scaffold skill ↔ global (~/.claude, superpowers, ECC) overlap; per-pair winner per ADR 0005; global layer trimmed or scoped where it double-fires | Depends on ADR 0005 precedence rule existing first |

## Later (unordered, no fake dates)
- Tool-recipe skills for API testing / data pipelines — only if those recur in real work (ADR 0003 future work)
- `/roadmap` slash command — only if manual roadmap updates become frequent (ADR 0004 future work)
- Windows/PowerShell environment recipes skill — quoting, paths with spaces, OneDrive quirks; only if friction log shows recurring pain
- Publish to GitHub as a template repo — after dogfooding proves the shape

## Done
| Date | Milestone | Evidence |
|---|---|---|
| 2026-07-06 | Initial scaffold build (protocol, 18 skills, commands, templates) | ADRs 0001–0004; baseline commit 9fd179c |

## Dropped / Paused
| Milestone | Why | ADR |
|---|---|---|
| — | | |

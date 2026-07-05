# Handover: scaffold-hardening

- **Written:** 2026-07-06 12:00
- **Supersedes:** none (first handover in this repo)
- **Plan:** docs/plans/2026-07-06-scaffold-hardening.md (status: done)

## 1. Mission
Owner asked: "improve my claude scaffold repo… Critique what is already there, how i can have useful skills to improve my work. Rules that needs to follow, Skills that knows how to be used and proper roadmap and decisions." Interpretation: audit + harden the scaffold itself; do NOT add domain skills (globals cover them — ADR 0005).

## 2. State
**Done (with evidence):**
- Repo under git, branch merged to main — `git log --oneline`
- docs/ROADMAP.md exists and is current — `bash scripts/check.sh` section 7 passes
- ADR 0005 (precedence vs global config), ADR 0006 (S/M/L task tiers) — docs/decisions/
- CLAUDE.md: tier table + precedence section + prime-directive binding clause
- scripts/check.sh — the repo's verification path; PASS on clean state, exit 1 on planted defects (empty skill dir, ADR gap, ghost skill ref all verified caught)
- Subagent critique run: 7 majors all fixed, minors fixed, nits fixed or waived (see plan Amendments)
- Memory: ADR pointer entries for 0005/0006, index updated

**In progress:** nothing.

**Not started:** everything in ROADMAP Now/Next — dogfooding, skill-trigger evaluation, global-config dedupe audit.

## 3. Next action
Start the dogfood milestone: copy this repo's contents into one active project (facility-booking is the obvious candidate), work normally for ≥2 weeks, and write every point of protocol friction to that project's memory. The tier boundaries (S ≤2 files / ≲15 min) are theory — dogfooding decides if they're right.

## 4. Landmines
- The 18 skill descriptions still use absolutist triggers ("EVERY task", "ANYTHING"). CLAUDE.md's tier section has a reading rule that overrides them; a full description rewrite is deliberately deferred to the trigger-eval milestone. Don't "fix" one description ad hoc — do them all together with fire/no-fire tests.
- The global ~/.claude layer (ECC rules, superpowers) still claims supremacy in its own text and will double-fire on process steps. ADR 0005 governs in-session; the permanent fix is the dedupe audit milestone.
- check.sh greps strip `\r` deliberately — don't "simplify" that; verdicts must match across Windows/Linux.
- When testing check.sh by planting defects on a dirty tree, restore surgically — `git checkout -- <file>` discarded uncommitted fixes once this session.
- Repo lives under OneDrive with a space in the path: quote all paths; watch for sync/lock weirdness with .git (none observed yet).

## 5. Decisions since last handover
- docs/decisions/0005-precedence-over-global-config.md — scaffold owns process, globals own technique
- docs/decisions/0006-task-tiers.md — S/M/L tiers right-size the protocol

## 6. Open questions for the user
- Which project to dogfood on first (suggestion: facility-booking)?
- Should the scaffold be pushed to GitHub now or after dogfooding? (Roadmap places publish after dogfooding.)

## 7. Verification state
| Check | Command | Status |
|---|---|---|
| Structural consistency | `bash scripts/check.sh` | pass |
| Failure path (checker catches defects) | plant defect (e.g. `mkdir .claude/skills/zz-bogus`) → run → restore | pass (exit 1 while planted) |
| Git state | `git status` clean on main after merge | pass |

## Successor protocol
Read this → read the plan → re-run `bash scripts/check.sh` (trust nothing) → take the Next action. Record any discrepancy between claimed and actual state before proceeding.

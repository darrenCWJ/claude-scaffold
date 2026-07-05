---
name: diff-management
description: Track and control what changes during execution — change ledger, scope discipline, planned-vs-delivered differential. Use during EVERY execution phase that modifies files, when asked what changed, when tempted to fix something while you're here, and at critique time to build the feature differential.
---

# Diff management

Know, at every moment: what changed, why, and whether it was supposed to. The differential = planned changes vs actual changes. Keeping it near zero (or explicitly amended) is the goal.

## The change ledger

Maintain a running ledger during execution (in the plan file's "Change ledger" section, or the task list):

    | # | File/artifact | Change | Phase | In plan? |

- Every file created, modified, or deleted gets a row.
- `In plan? = no` requires immediate action (see below). Never leave a "no" unexplained.

## In-repo (git) projects

- Work on a branch, never on main. One plan = one branch.
- Commit at every phase boundary with a message referencing the plan phase. Small commits > big commits.
- Before each commit: `git status` + `git diff --stat` — read it. Every unexpected path in that output is a scope alarm.
- Never `git add -A` blindly. Add specific paths you can account for.

## Non-git work (docs, research, analysis)
Same discipline, manual: snapshot key artifacts at phase boundaries (e.g. `docs/plans/<plan>-phase2-snapshot.md` or versioned filenames) so you can diff and roll back.

## When the diff exceeds the plan

An out-of-scope change is either:
1. **Necessary** → stop, write a plan amendment (what, why, impact), record a design decision if a choice was made, then continue; or
2. **Opportunistic** ("while I'm here...") → revert it, add it to the task list as future work. Do not smuggle it in.

## Feature differential (planned vs delivered)

At critique time, build the differential table:

    | Requirement/feature | Planned | Delivered | Gap |

Every gap is either fixed in a loop or explicitly surfaced to the user as a known limitation. A silent gap is a defect.

## Red flags
- "I also cleaned up a few other things" — that's undocumented drift.
- Diff touching config/infrastructure for a feature-level task.
- Deletions you can't explain in one sentence.

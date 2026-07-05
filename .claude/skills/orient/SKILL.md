---
name: orient
description: Systematic onboarding to an unfamiliar project, repo, codebase, or resumed session — Phase 0 done properly. Use at the start of EVERY session in this scaffold, when entering a repo for the first time, when resuming after a gap, or before planning work in territory you haven't mapped.
---

# Orient

Work done on a wrong mental model is worse than no work — it must be found, understood, and undone. Orientation is cheap insurance. Never skip it because the task "seems simple"; simple tasks in misunderstood territory are how messes start.

## Resume protocol (this scaffold's own state)

In order — later sources override earlier ones when they conflict:
1. `memory/MEMORY.md` — read fully; open any entry whose description might touch the task.
2. Newest file in `docs/handovers/` — the successor protocol in the handover skill applies: verify claimed state, trust nothing.
3. `docs/decisions/` — scan titles; open ADRs adjacent to the task. Contradicting a standing decision without superseding it is a defect.
4. `docs/plans/` — is there an active (status: active/amended) plan this task belongs to?

## New-territory protocol (unfamiliar repo/project)

1. **Read the self-descriptions first**: README, CLAUDE.md, CONTRIBUTING, package manifests (package.json / pyproject.toml / go.mod...), CI config. These say what the project THINKS it is.
2. **Map the shape cheaply**: directory tree 2 levels deep; where does source live, where do tests live, where does config live. Don't read files yet — map first, read second.
3. **Check the ground truth**: `git log --oneline -20` (what's actually being worked on), recently modified files, TODO/FIXME density. The gap between self-description and ground truth is where surprises live.
4. **Find the conventions**: naming style, error-handling pattern, test structure — from 2–3 representative files. New work must look native, not transplanted.
5. **Locate the verification path**: how does THIS project prove things work (test command, build, lint)? Run it BEFORE changing anything — a pre-existing red baseline discovered after your changes looks like your fault and costs an hour of misdirected debugging.

## Output (the orientation statement)

Before planning, state briefly: the task restated in your own words; what exists that's relevant; the conventions that apply; the verification path; unknowns split into "will investigate" vs "must ask user". If any unknown blocks planning, batch ALL user questions into one ask.

## Budget
Orientation is minutes, not hours — timebox it (5–15 min of reading for most tasks). Going deeper than needed is procrastination wearing a safety vest; the plan phase will drive targeted deep-dives where they matter.

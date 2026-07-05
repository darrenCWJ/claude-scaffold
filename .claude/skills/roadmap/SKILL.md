---
name: roadmap
description: Maintain a living project-level roadmap of phases and milestones across many tasks and sessions. Use when a project outgrows a single plan, when the user asks where are we, what is next, show the roadmap, or describes multi-week/multi-milestone ambitions — and update it at EVERY ship phase and plan completion. Plans are per-task; the roadmap is the map they live on.
---

# Roadmap

A plan answers "how do I do this task"; the roadmap answers "where is this project, and what happens next". One roadmap per project, at `docs/ROADMAP.md`, created from `templates/roadmap.md`. It is a living document — a stale roadmap is worse than none because it lies with authority.

## Structure (three horizons + status)

- **Milestones/phases** — large units of value ("v1 shippable", "research complete", "migrated to X"), each with: status (⬜ not started / 🔄 in progress / ✅ done / ⏸ paused / ❌ dropped), exit criteria (what observable state means done — same falsifiability bar as plans), and links to the plan files that implement it.
- **Now / Next / Later** — the honest priority view. NOW: at most 1–2 items actually being worked. NEXT: queued, roughly ordered. LATER: acknowledged, unordered, no false precision (no fake dates on things nobody has scoped).
- **Done log** — completed milestones with dates, newest first. This is where progress becomes visible and morale lives.
- **Dropped** — abandoned milestones WITH the reason (link the ADR). Silently deleting a milestone erases the learning.

## Update triggers (the roadmap is updated, not rewritten)

- A plan ships (Phase 5) → its milestone progresses or completes; Done log gets a line.
- A phase completes mid-plan → status note on the milestone.
- Scope changes / new milestone appears → add it to the right horizon; record an ADR if it displaces something.
- Something is dropped or paused → move it, with reason.
- Session start (orient skill) → READ it; the roadmap is context, not decoration.

## Rules

- **Roadmap ≠ task list.** Task lists churn hourly and live in tools; the roadmap changes on milestone boundaries. If an item would be done within a day, it belongs in a plan, not the roadmap.
- **Exit criteria over dates.** For personal/agent-driven projects, sequence and doneness matter more than calendar promises. Add dates only when something external actually depends on them.
- **Keep it under a page.** A roadmap nobody can hold in their head has stopped being a map.
- **The differential check** (diff-management skill, project level): at every ship, compare roadmap-promised vs actually-delivered. Recurring gaps mean milestones are too big — split them.

## Relationship to other artifacts
Roadmap (project, many sessions) → plans in `docs/plans/` (one task each) → task list (one session's steps). Handovers point at the roadmap for "where are we"; ADRs record why the roadmap changed shape.

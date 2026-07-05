# 0004 — Add a project-level roadmap layer above per-task plans

- **Date:** 2026-07-06
- **Status:** accepted

## Context
The scaffold tracked work at two levels: plans (one task) and task lists (one session). Nothing tracked a project across many tasks/sessions — which milestones are done, in flight, or next. D observed phased roadmaps in newer Claude workflows and wants that persistent.

## Decision
One living `docs/ROADMAP.md` per project (template + roadmap skill), with milestone statuses, exit criteria, Now/Next/Later horizons, a done log, and a dropped-with-reason section. Orient reads it; ship updates it.

## Alternatives rejected
- **Roadmap section inside each plan file** — rejected: plans are per-task and archived; the roadmap must outlive them all in one findable place.
- **Dated Gantt-style roadmap** — rejected: fake dates on unscoped work create false precision; exit criteria + sequence are the honest currency for agent-driven projects.
- **Using the handover as the roadmap** — rejected: handovers are session snapshots (superseded constantly); the roadmap is a single continuously edited document.

## Consequences
- Easier: "where are we / what's next" answerable in one read; progress visible in the done log; cross-session continuity no longer rides on handovers alone.
- Harder: one more artifact to keep honest (ship-phase update trigger + orient read make staleness detectable).
- Future work: `/roadmap` slash command if updating it manually becomes frequent.

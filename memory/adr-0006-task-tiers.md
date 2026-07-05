---
name: adr-0006-task-tiers
description: Every task classified S/M/L at Phase 0; tier sets which protocol artifacts are mandatory
type: decision
date: 2026-07-06
---

ADR 0006 (docs/decisions/0006-task-tiers.md): tasks are tiered S (trivial: verify + memory note only), M (default: full workflow, self-critique ok), or L (multi-session/architectural/high-stakes: full workflow + subagent gates) at Phase 0, out loud. Round up when unsure; reclassify upward only. Reason: uniform full protocol on trivial fixes trains silent rule-skipping. Watch for tier inflation/deflation during dogfooding — the critique skill's checklist item 7 audits this.

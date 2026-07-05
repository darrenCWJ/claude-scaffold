---
name: adr-0005-precedence-over-global-config
description: Scaffold owns process and wins process conflicts; global ~/.claude owns domain technique
type: decision
date: 2026-07-06
---

ADR 0005 (docs/decisions/0005-precedence-over-global-config.md): when this scaffold runs alongside the global layer (ECC rules, superpowers, other plugins), the scaffold's skills and artifacts win every PROCESS conflict (planning, critique, verification, brainstorming); globals supply domain technique only. Precedence: session instruction > repo CLAUDE.md + skills > globals > defaults. Residual risk: globals can't see this rule — double-firing is evidence for the dedupe-audit milestone ([[scaffold-origin]], roadmap Next).

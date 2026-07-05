# 0002 — Add five execution-layer skills; leave vendor skills alone

- **Date:** 2026-07-06
- **Status:** accepted

## Context
Audit of D's installed skills (2026-07-06): Anthropic format skills (docx, pptx, pdf, xlsx, canvas, brand, schedule, skill-creator, consolidate-memory, setup-cowork) and plugin suites (bigdata financial, data, HR) are vendor-maintained and read-only in sessions. The scaffold's 10 workflow skills covered process (plan/loop/critique/ship) but not the execution layer: how to verify, debug, research, review prose, or onboard to territory.

## Decision
Add five owned skills — orient, verification, debugging, research, writing-review — and upgrade the existing 10 with pushy trigger-rich descriptions per skill-creator guidance (Claude undertriggers skills; descriptions carry all "when to use" info).

## Alternatives rejected
- **Rewriting/duplicating vendor skills into the repo** — rejected: they're maintained upstream, duplicating creates drift, and they're already good.
- **Folding the five concerns into CLAUDE.md** — rejected per ADR 0001 (always-loaded context should stay lean).
- **A single "quality" mega-skill** — rejected: verification/debugging/research trigger in different situations; merged descriptions would blur triggers and worsen undertriggering.

## Consequences
- Easier: completion claims need evidence; debugging is protocolized; research output is citable.
- Harder: 15 skills to keep consistent (final-check covers cross-references).
- Future work: eval trigger accuracy with skill-creator's eval harness.

---
name: research
description: Multi-source research with source ranking, claim verification, and honest uncertainty. Use whenever gathering facts to answer a question, comparing options, investigating a topic, or collecting material for a report/deck/analysis — any time more than one source will be consulted or a factual deliverable depends on the findings.
---

# Research

Research quality = quality of sources × independence of confirmation × honesty about gaps. Volume of text is not a quality metric.

## Procedure

1. **Decompose the question.** Break into sub-questions, each answerable independently. Note for each: what would a GOOD answer look like (a number, a comparison, a mechanism)?
2. **Plan the search, then fan out.** Independent sub-questions with meaningful search depth → parallel subagents (fan-out skill), each briefed with its sub-question, required output format, and source-quality bar. Quick lookups → do inline.
3. **Rank sources as you collect.** Tier 1: primary (original papers, official docs, filings, raw data, the actual code). Tier 2: reputable secondary (major outlets, established references, expert analyses). Tier 3: everything else (forums, blogs, SEO content) — leads only, never load-bearing. A Tier 3 claim gets promoted only by finding its Tier 1/2 origin.
4. **Verify load-bearing claims.** Any claim the conclusion depends on needs either a Tier 1 source or two INDEPENDENT Tier 2 sources — independent means not citing the same upstream origin; ten articles echoing one press release are one source.
5. **Hunt disconfirmation.** Before concluding, search explicitly for the opposite claim ("X is not true", "X criticism", "X failed"). Confirmation-only research is advocacy.
6. **Date-check everything.** Note each key fact's as-of date. For anything that changes (prices, versions, laws, leadership, benchmarks), prefer the newest source and state the as-of date in the output.

## Synthesis rules

- Separate FINDINGS (sourced), INFERENCE (your reasoning on findings), and ASSUMPTION (unverified) — visibly, in the deliverable.
- Every non-obvious factual statement carries its source. Uncited facts in the final output are defects (critique skill treats them as majors).
- State confidence honestly: "confirmed by primary source" ≠ "single blog post says". If sources conflict, present the conflict — do not silently pick a side.
- Record what was NOT found: searches that came up empty are findings too, and they save the next researcher the same dead end.

## Failure modes to catch in critique
Citation laundering (Tier 3 dressed as fact), stale data presented as current, survivorship of the first plausible answer, and answering a different (easier) question than the one asked.

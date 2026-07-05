---
name: verification
description: Prove that a claim, output, or fix actually works using evidence, not confidence. Use whenever about to say "done", "fixed", "works", "passes", or "should be fine" — any completion claim needs this skill first, even for small changes and even when the work obviously looks right.
---

# Verification

Confidence is not evidence. A thing is verified when you have run a check that COULD have failed and watched it pass. Verification that cannot fail is theater.

## Pick the strongest available verifier

Strongest first — drop down only when the stronger option genuinely doesn't exist:

1. **Execution** — run the code, command, or script; observe actual output. For files: open/parse the real artifact (render the docx, run the notebook, load the CSV).
2. **Automated checks** — tests, linters, type checkers, schema validators, link checkers. Run from clean state; cached green is not green.
3. **Independent recomputation** — redo the calculation a different way (different tool, different method) and compare. Never verify math by re-reading the math; compute it programmatically.
4. **Fresh-agent inspection** — subagent with no authorship bias checks the deliverable against the requirement.
5. **Line-by-line self-review** — weakest; acceptable only for trivial changes, and still against the original requirement, not memory of it.

## Rules of evidence

- Record WHAT was run, the ACTUAL result, and WHEN. "Tests pass" without the command and output is a claim, not evidence.
- Verify the requirement, not the implementation: the question is "does it do what was asked", not "does my code run".
- Test the failure path too: a verifier that passes everything is broken. When feasible, break the thing intentionally once to confirm the check catches it.
- Verify at boundaries: empty input, maximum size, wrong type, missing dependency, non-ASCII text, concurrent/repeated invocation — whichever apply.
- After ANY later change (cleanup, formatting, "one tiny fix"), re-verify. The most embarrassing failures ship in the commit after the verified one.

## Verifying claims in content (research, docs, analysis)

- Every factual claim gets a source or a computation behind it. Mark anything unverifiable as an assumption, visibly.
- Numbers: recompute from raw data. Quotes: check against the original. Links: fetch them.
- Dates and "current" facts: check against today's date, not training memory.

## Output
A verification record (in the plan's ledger, the critique file, or the final-check report): check performed → command/method → actual result → verdict.

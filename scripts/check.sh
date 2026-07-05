#!/usr/bin/env bash
# Structural consistency check for the scaffold itself.
# This is the repo's verification path (orient skill: run it for a baseline;
# final-check skill: run it on the true final state).
# Usage: bash scripts/check.sh   — exits 0 when consistent, 1 with findings otherwise.

set -u
cd "$(dirname "$0")/.."

fail=0
say_fail() { echo "FAIL: $1"; fail=1; }
say_ok()   { echo "  ok: $1"; }

echo "== 1. Every skill has frontmatter with name: and description: =="
for f in .claude/skills/*/SKILL.md; do
  head -1 "$f" | grep -q '^---$' || say_fail "$f: missing frontmatter opener"
  awk '/^---$/{n++} n==1' "$f" | grep -q '^name:' || say_fail "$f: missing name:"
  awk '/^---$/{n++} n==1' "$f" | grep -q '^description:' || say_fail "$f: missing description:"
done
[ "$fail" -eq 0 ] && say_ok "$(ls .claude/skills | wc -l | tr -d ' ') skills have valid frontmatter"

echo "== 2. Skill dir names match frontmatter name: =="
for f in .claude/skills/*/SKILL.md; do
  dir=$(basename "$(dirname "$f")")
  fmname=$(awk '/^---$/{n++} n==1' "$f" | grep '^name:' | sed 's/^name:[[:space:]]*//')
  [ "$dir" = "$fmname" ] || say_fail "$f: dir '$dir' != name '$fmname'"
done

echo "== 3. ADRs numbered sequentially from 0001, no gaps or duplicates =="
nums=$(ls docs/decisions/ | grep -E '^[0-9]{4}-' | cut -c1-4 | sort)
expect=1
for n in $nums; do
  printf -v want '%04d' "$expect"
  [ "$n" = "$want" ] || say_fail "ADR numbering: expected $want, found $n"
  expect=$((expect + 1))
done
say_ok "$(echo "$nums" | wc -l | tr -d ' ') ADRs, sequential"

echo "== 4. Memory index integrity (every entry resolves; every file indexed) =="
grep -E '^- \[' memory/MEMORY.md | grep -oE '\]\(([^)]+\.md)\)' | sed 's/](\(.*\))/\1/' | while read -r m; do
  [ -f "memory/$m" ] || echo "FAIL: MEMORY.md links missing file memory/$m"
done | tee /tmp/memcheck.$$
grep -q FAIL /tmp/memcheck.$$ && fail=1; rm -f /tmp/memcheck.$$
for m in memory/*.md; do
  b=$(basename "$m")
  [ "$b" = "MEMORY.md" ] && continue
  grep -q "($b)" memory/MEMORY.md || say_fail "memory/$b not listed in MEMORY.md index"
done

echo "== 5. Templates referenced by skills/commands exist =="
for t in plan handover decision critique roadmap; do
  [ -f "templates/$t.md" ] || say_fail "templates/$t.md missing"
done

echo "== 6. Core artifacts present =="
[ -f docs/ROADMAP.md ] || say_fail "docs/ROADMAP.md missing (ADR 0004 mandates it)"
grep -q '^- \*\*Updated:\*\*' docs/ROADMAP.md 2>/dev/null || say_fail "ROADMAP.md missing Updated: line"
[ -f CLAUDE.md ] || say_fail "CLAUDE.md missing"
[ -f README.md ] || say_fail "README.md missing"

echo "== 7. Every skill named in CLAUDE.md exists on disk =="
grep -oE '\*\*[a-z-]+\*\* skill' CLAUDE.md | sed 's/\*\*\([a-z-]*\)\*\* skill/\1/' | sort -u | while read -r s; do
  [ -d ".claude/skills/$s" ] || echo "FAIL: CLAUDE.md references skill '$s' with no directory"
done | tee /tmp/skillcheck.$$
grep -q FAIL /tmp/skillcheck.$$ && fail=1; rm -f /tmp/skillcheck.$$

echo
if [ "$fail" -eq 0 ]; then
  echo "PASS: scaffold structurally consistent"
  exit 0
else
  echo "FAIL: findings above"
  exit 1
fi

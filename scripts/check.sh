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

# All text reads strip \r so verdicts match across Windows and Linux checkouts.
frontmatter() { awk '/^---\r?$/{n++; next} n==1' "$1" | tr -d '\r'; }

echo "== 1. Every skill dir has SKILL.md with name: and description: =="
count=0
for d in .claude/skills/*/; do
  f="${d}SKILL.md"
  if [ ! -f "$f" ]; then say_fail "$d: no SKILL.md"; continue; fi
  head -1 "$f" | tr -d '\r' | grep -q '^---$' || say_fail "$f: missing frontmatter opener"
  fm=$(frontmatter "$f")
  echo "$fm" | grep -q '^name:' || say_fail "$f: missing name:"
  echo "$fm" | grep -q '^description:' || say_fail "$f: missing description:"
  count=$((count + 1))
done
say_ok "checked $count SKILL.md files (failures, if any, listed above)"

echo "== 2. Skill dir names match frontmatter name: =="
for d in .claude/skills/*/; do
  f="${d}SKILL.md"
  [ -f "$f" ] || continue  # already failed in section 1
  dir=$(basename "$d")
  fmname=$(frontmatter "$f" | grep '^name:' | sed 's/^name:[[:space:]]*//')
  [ "$dir" = "$fmname" ] || say_fail "$f: dir '$dir' != name '$fmname'"
done

echo "== 3. ADRs numbered sequentially from 0001, no gaps or duplicates =="
adrs=$(ls docs/decisions/ 2>/dev/null | grep -E '^[0-9]{4}-' | cut -c1-4 | sort)
if [ -z "$adrs" ]; then
  say_ok "no ADRs yet (fresh project — the first recorded decision creates 0001)"
else
  expect=1 seq_ok=1
  for n in $adrs; do
    printf -v want '%04d' "$expect"
    if [ "$n" != "$want" ]; then say_fail "ADR numbering: expected $want, found $n"; seq_ok=0; fi
    expect=$((expect + 1))
  done
  [ "$seq_ok" -eq 1 ] && say_ok "$(echo "$adrs" | wc -l | tr -d ' ') ADRs, sequential"
fi

echo "== 4. Memory index integrity (every entry resolves; every file indexed) =="
tmp=$(mktemp)
grep -E '^- \[' memory/MEMORY.md | grep -oE '\]\([^)]+\.md\)' | sed 's/](\(.*\))/\1/' | while read -r m; do
  [ -f "memory/$m" ] || echo "FAIL: MEMORY.md links missing file memory/$m"
done | tee "$tmp"
grep -q FAIL "$tmp" && fail=1; rm -f "$tmp"
for m in memory/*.md; do
  b=$(basename "$m")
  [ "$b" = "MEMORY.md" ] && continue
  grep -q "($b)" memory/MEMORY.md || say_fail "memory/$b not listed in MEMORY.md index"
done

echo "== 5. Core templates exist =="
for t in plan handover decision critique roadmap; do
  [ -f "templates/$t.md" ] || say_fail "templates/$t.md missing"
done

echo "== 6. Every command has description frontmatter =="
for f in .claude/commands/*.md; do
  frontmatter "$f" | grep -q '^description:' || say_fail "$f: missing description:"
done

echo "== 7. Core artifacts present =="
if [ -f docs/ROADMAP.md ]; then
  tr -d '\r' < docs/ROADMAP.md | grep -q '^- \*\*Updated:\*\*' || say_fail "ROADMAP.md missing Updated: line"
else
  echo "note: docs/ROADMAP.md not created yet — run /init-project when starting a real project"
fi
[ -f CLAUDE.md ] || say_fail "CLAUDE.md missing"
[ -f README.md ] || say_fail "README.md missing"

echo "== 8. Every skill referenced in CLAUDE.md / README exists on disk =="
tmp=$(mktemp)
{
  grep -hoE '\*\*[a-z-]+\*\* skill' CLAUDE.md 2>/dev/null | sed 's/\*\*\([a-z-]*\)\*\* skill/\1/'
  grep -hoE '\.claude/skills/[a-z-]+' CLAUDE.md README.md 2>/dev/null | sed 's|.*skills/||'
} | sort -u | while read -r s; do
  [ -d ".claude/skills/$s" ] || echo "FAIL: referenced skill '$s' has no directory"
done | tee "$tmp"
grep -q FAIL "$tmp" && fail=1; rm -f "$tmp"

echo
if [ "$fail" -eq 0 ]; then
  echo "PASS: scaffold structurally consistent"
  exit 0
else
  echo "FAIL: findings above"
  exit 1
fi

#!/bin/bash
# Report @rpath links to third-party frameworks (potential missing binary targets).
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
STAGING="${1:-$REPO_ROOT/build/staging/NetworkSDKs}"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

echo "Auditing @rpath dependencies under: $STAGING"
echo ""

found_issue=0
for xc in "$STAGING"/*.xcframework; do
  [[ -e "$xc" ]] || continue
  name="$(basename "$xc" .xcframework)"
  bin="$(find "$xc" -path "*simulator*" -type f | while read -r f; do
    file "$f" | grep -q 'Mach-O' && echo "$f" && break
  done)"
  [[ -n "$bin" ]] || continue
  rpaths="$(otool -L "$bin" 2>/dev/null | grep '@rpath' | grep -v "${name}.framework" | grep -v 'libswift' || true)"
  if [[ -n "$rpaths" ]]; then
    echo "=== $name ==="
    echo "$rpaths"
    while read -r line; do
      dep="$(echo "$line" | sed -n 's/.*@rpath\/\([^ ]*\)\.framework.*/\1/p')"
      if [[ -n "$dep" && ! -d "$STAGING/${dep}.xcframework" ]]; then
        echo "  ⚠ MISSING in staging: ${dep}.xcframework"
        found_issue=1
      fi
    done <<< "$rpaths"
    echo ""
  fi
done

if [[ "$found_issue" -eq 0 ]]; then
  echo "No missing @rpath framework dependencies detected."
else
  echo "Add missing frameworks to versions.lock.json and Package.swift before releasing."
  exit 1
fi

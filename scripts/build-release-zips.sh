#!/bin/bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
STAGING="$REPO_ROOT/build/staging"
DIST="$REPO_ROOT/dist"
RESOURCES="$REPO_ROOT/Sources/AppLovinMediation/Resources"
VERSION=""
WRITE_CHECKSUMS=0

usage() {
  echo "Usage: $0 --version <tag> [--write-checksums]"
  echo "  Zips xcframeworks from build/staging into dist/ and copies PAGAdSDK.bundle."
  exit 1
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --version) VERSION="$2"; shift 2 ;;
    --write-checksums) WRITE_CHECKSUMS=1; shift ;;
    -h|--help) usage ;;
    *) echo "Unknown option: $1"; usage ;;
  esac
done

[[ -n "$VERSION" ]] || usage
[[ -d "$STAGING/Adapters" ]] || { echo "Missing $STAGING/Adapters — run ./scripts/download-artifacts.sh first"; exit 1; }

mkdir -p "$DIST"

zip_xcframework() {
  local path="$1"
  local name
  name="$(basename "$path")"
  echo "→ dist/${name}.zip"
  rm -f "$DIST/${name}.zip"
  ditto -c -k --sequesterRsrc --keepParent "$path" "$DIST/${name}.zip"
}

for xc in "$STAGING"/Adapters/*.xcframework "$STAGING"/NetworkSDKs/*.xcframework; do
  [[ -e "$xc" ]] || continue
  zip_xcframework "$xc"
done

BUNDLE_SRC="$STAGING/NetworkSDKs/PAGAdSDK.bundle"
if [[ -d "$BUNDLE_SRC" ]]; then
  echo "→ Sources/AppLovinMediation/Resources/PAGAdSDK.bundle"
  rm -rf "$RESOURCES/PAGAdSDK.bundle"
  mkdir -p "$RESOURCES"
  cp -R "$BUNDLE_SRC" "$RESOURCES/"
fi

echo "$VERSION" > "$REPO_ROOT/VERSION"

if [[ "$WRITE_CHECKSUMS" -eq 1 ]]; then
  python3 "$REPO_ROOT/scripts/update-package-swift.py" --version "$VERSION" --dist "$DIST"
fi

echo ""
echo "Release zips ready in dist/ ($(ls -1 "$DIST"/*.zip 2>/dev/null | wc -l | tr -d ' ') files)"
echo "Next: commit, tag $VERSION, gh release create $VERSION dist/*.zip"

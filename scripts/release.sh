#!/bin/bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
VERSION="${1:-}"

if [[ -z "$VERSION" ]]; then
  echo "Usage: $0 <version>   e.g. 1.0.2"
  exit 1
fi

cd "$REPO_ROOT"
./scripts/download-artifacts.sh --force
./scripts/audit-rpath-dependencies.sh
./scripts/build-release-zips.sh --version "$VERSION" --write-checksums
echo ""
echo "Ready to tag and upload release $VERSION"

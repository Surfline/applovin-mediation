#!/usr/bin/env python3
"""
Download AppLovin MAX mediation adapters and network SDKs from versions.lock.json.

Run from repo root:
  python3 scripts/download-artifacts.py [--if-needed] [--force]
"""

from __future__ import annotations

import argparse
import hashlib
import json
import shutil
import sys
import tempfile
import urllib.request
import zipfile
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parents[1]
LOCKFILE = REPO_ROOT / "versions.lock.json"
STAGING_ROOT = REPO_ROOT / "build" / "staging"
USER_AGENT = "applovin-mediation/1.0"


def sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for chunk in iter(lambda: handle.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def download(url: str, dest: Path) -> None:
    request = urllib.request.Request(url, headers={"User-Agent": USER_AGENT})
    with urllib.request.urlopen(request) as response, dest.open("wb") as out:
        shutil.copyfileobj(response, out)


def find_xcframework(root: Path, name: str | None = None) -> Path | None:
    matches = list(root.rglob("*.xcframework"))
    if name:
        matches = [path for path in matches if path.name == name]
    return matches[0] if matches else None


def install_path(relative: str) -> Path:
    return STAGING_ROOT / relative


def is_installed(path: Path) -> bool:
    return path.is_dir() and any(path.rglob("*"))


def extract_adapter_xcframework(archive: Path, dest: Path) -> None:
    work = Path(tempfile.mkdtemp())
    try:
        with zipfile.ZipFile(archive) as zf:
            zf.extractall(work)
        xc = find_xcframework(work)
        if xc is None:
            raise RuntimeError(f"No xcframework in {archive.name}")
        shutil.rmtree(dest, ignore_errors=True)
        shutil.copytree(xc, dest)
    finally:
        shutil.rmtree(work, ignore_errors=True)


def extract_xcframework_by_name(archive: Path, dest: Path, name: str) -> None:
    work = Path(tempfile.mkdtemp())
    try:
        with zipfile.ZipFile(archive) as zf:
            zf.extractall(work)
        xc = find_xcframework(work, name)
        if xc is None:
            raise RuntimeError(f"Missing {name} in {archive.name}")
        shutil.rmtree(dest, ignore_errors=True)
        shutil.copytree(xc, dest)
    finally:
        shutil.rmtree(work, ignore_errors=True)


def extract_pangle_sdk_zip(archive: Path, dests: list[str]) -> None:
    work = Path(tempfile.mkdtemp())
    try:
        with zipfile.ZipFile(archive) as zf:
            zf.extractall(work)
        for relative in dests:
            name = Path(relative).name
            matches = list(work.rglob(name))
            if not matches:
                raise RuntimeError(f"Missing {name} in Pangle SDK.zip")
            target = install_path(relative)
            shutil.rmtree(target, ignore_errors=True)
            if matches[0].is_dir():
                shutil.copytree(matches[0], target)
            else:
                target.parent.mkdir(parents=True, exist_ok=True)
                shutil.copy2(matches[0], target)
    finally:
        shutil.rmtree(work, ignore_errors=True)


def process_artifact(artifact: dict, *, force: bool, if_needed: bool) -> None:
    artifact_id = artifact["id"]
    extract = artifact["extract"]

    if extract == "pangle_sdk_zip":
        targets = [install_path(dest) for dest in artifact["dests"]]
        if if_needed and all(is_installed(t) for t in targets) and not force:
            print(f"○ {artifact_id} (already present)")
            return
    else:
        targets = [install_path(artifact["dest"])]
        if if_needed and all(is_installed(t) for t in targets) and not force:
            print(f"○ {artifact_id} (already present)")
            return

    print(f"↓ {artifact_id}")
    with tempfile.TemporaryDirectory() as tmp:
        archive = Path(tmp) / "archive.zip"
        try:
            download(artifact["url"], archive)
        except Exception as error:  # noqa: BLE001
            if artifact.get("optional"):
                print(f"  ⚠ skipped ({error})")
                if artifact.get("manual_note"):
                    print(f"    {artifact['manual_note']}")
                return
            raise

        expected = artifact.get("sha256")
        if expected:
            actual = sha256_file(archive)
            if actual != expected:
                raise RuntimeError(f"checksum mismatch for {artifact_id}: {actual} != {expected}")

        if extract == "adapter_xcframework":
            extract_adapter_xcframework(archive, targets[0])
        elif extract == "xcframework_by_name":
            extract_xcframework_by_name(archive, targets[0], artifact["xcframework_name"])
        elif extract == "pangle_sdk_zip":
            extract_pangle_sdk_zip(archive, artifact["dests"])
            targets = [install_path(dest) for dest in artifact["dests"]]
        else:
            raise RuntimeError(f"Unknown extract mode: {extract}")

    for target in targets:
        print(f"  → {target.relative_to(REPO_ROOT)}")


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--if-needed", action="store_true")
    parser.add_argument("--force", action="store_true")
    args = parser.parse_args()

    lock = json.loads(LOCKFILE.read_text())
    STAGING_ROOT.mkdir(parents=True, exist_ok=True)
    (STAGING_ROOT / "Adapters").mkdir(exist_ok=True)
    (STAGING_ROOT / "NetworkSDKs").mkdir(exist_ok=True)

    for artifact in lock["artifacts"]:
        process_artifact(artifact, force=args.force, if_needed=args.if_needed)

    print(f"\nStaging complete: {STAGING_ROOT}")
    return 0


if __name__ == "__main__":
    sys.exit(main())

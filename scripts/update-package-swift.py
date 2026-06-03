#!/usr/bin/env python3
"""Regenerate Package.swift binaryTarget checksums and 1.0.x release URLs from dist/*.zip."""

from __future__ import annotations

import argparse
import re
import subprocess
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parents[1]
PACKAGE_SWIFT = REPO_ROOT / "Package.swift"

# dist zip basename -> SPM binaryTarget name
TARGET_NAMES = {
    "AppLovinMediationFyberAdapter": "AppLovinMediationFyberAdapter",
    "AppLovinMediationGoogleAdManagerAdapter": "AppLovinMediationGoogleAdManagerAdapter",
    "AppLovinMediationGoogleAdapter": "AppLovinMediationGoogleAdapter",
    "AppLovinMediationInMobiAdapter": "AppLovinMediationInMobiAdapter",
    "AppLovinMediationUnityAdsAdapter": "AppLovinMediationUnityAdsAdapter",
    "AppLovinMediationVungleAdapter": "AppLovinMediationVungleAdapter",
    "AppLovinMediationByteDanceAdapter": "AppLovinMediationByteDanceAdapter",
    "AppLovinMediationOguryPresageAdapter": "AppLovinMediationOguryPresageAdapter",
    "IASDKCore": "IASDKCore",
    "InMobiSDK": "InMobiSDK",
    "UnityAds": "UnityAds",
    "PAGAdSDK": "PAGAdSDK",
    "TikTokBusinessSDK": "TikTokBusinessSDK",
    "OgurySdk": "OgurySdk",
    "OguryCore": "OguryCore",
    "OguryAds": "OguryAds",
    "OMSDK_Ogury": "OMSDK_Ogury",
}

MEDIATION_DEPS = [
    "AppLovinMediationFyberAdapter",
    "AppLovinMediationGoogleAdManagerAdapter",
    "AppLovinMediationGoogleAdapter",
    "AppLovinMediationInMobiAdapter",
    "AppLovinMediationUnityAdsAdapter",
    "AppLovinMediationVungleAdapter",
    "AppLovinMediationByteDanceAdapter",
    "AppLovinMediationOguryPresageAdapter",
    "IASDKCore",
    "InMobiSDK",
    "UnityAds",
    "PAGAdSDK",
    "TikTokBusinessSDK",
    "OgurySdk",
    "OguryCore",
    "OguryAds",
    "OMSDK_Ogury",
]


def compute_checksum(path: Path) -> str:
    result = subprocess.run(
        ["swift", "package", "compute-checksum", str(path)],
        check=True,
        capture_output=True,
        text=True,
        cwd=REPO_ROOT,
    )
    return result.stdout.strip()


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--version", required=True, help="GitHub release tag, e.g. 1.0.2")
    parser.add_argument("--dist", default=str(REPO_ROOT / "dist"))
    args = parser.parse_args()

    dist = Path(args.dist)
    blocks: list[str] = []
    for zip_path in sorted(dist.glob("*.xcframework.zip")):
        stem = zip_path.name.replace(".xcframework.zip", "")
        target_name = TARGET_NAMES.get(stem)
        if target_name is None:
            print(f"skip unknown zip: {zip_path.name}")
            continue
        checksum = compute_checksum(zip_path)
        url = (
            f"https://github.com/Surfline/applovin-mediation/releases/download/"
            f"{args.version}/{zip_path.name}"
        )
        blocks.append(
            f"""        .binaryTarget(
            name: "{target_name}",
            url: "{url}",
            checksum: "{checksum}"
        ),"""
        )

    deps = ", ".join(f'"{name}"' for name in MEDIATION_DEPS)
    content = f"""// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "AppLovinMediation",
    platforms: [.iOS(.v13)],
    products: [
        .library(name: "AppLovinMediation", targets: ["AppLovinMediation"]),
    ],
    targets: [
{chr(10).join(blocks)}
        .target(
            name: "AppLovinMediation",
            dependencies: [{deps}],
            resources: [.copy("Resources/PAGAdSDK.bundle")],
            linkerSettings: [.linkedLibrary("resolv")]
        ),
    ]
)
"""
    PACKAGE_SWIFT.write_text(content)
    print(f"Updated {PACKAGE_SWIFT} for release {args.version}")


if __name__ == "__main__":
    main()

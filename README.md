# AppLovinMediation

Swift package for AppLovin MAX mediation adapters and network SDK xcframeworks.

Binary artifacts are hosted on [GitHub Releases](https://github.com/Surfline/applovin-mediation/releases). This repo contains `Package.swift`, `versions.lock.json`, scripts, checksums, and `PAGAdSDK.bundle` only.

`surfline-ios` also depends on **AppLovinSDK**, **GoogleMobileAds**, and **VungleAdsSDK** via SPM separately.

## Runtime dependency audit

`OguryAds` links `@rpath/OMSDK_Ogury.framework/OMSDK_Ogury` at runtime. The package includes **four** Ogury binaries: `OgurySdk`, `OguryCore`, `OguryAds`, and `OMSDK_Ogury`.

Other vendored SDKs were checked for similar `@rpath` gaps; only Ogury required an extra framework.

## Consumption

```yaml
packages:
  AppLovinMediation:
    url: git@github.com:Surfline/applovin-mediation.git
    exactVersion: 1.0.3

dependencies:
  - package: AppLovinMediation
    product: AppLovinMediation
```

After bumping the version: Xcode → **File → Packages → Reset Package Caches**, then clean build.

## Recreate a release (e.g. 1.0.3)

From this repo root:

```bash
# 1) Download adapters + network SDKs into build/staging/
./scripts/download-artifacts.sh --force

# 2) Verify no missing @rpath frameworks (fails if Ogury OMSDK missing, etc.)
./scripts/audit-rpath-dependencies.sh

# 3) Zip staging → dist/, refresh Package.swift checksums + release URLs
./scripts/build-release-zips.sh --version 1.0.3 --write-checksums

# Or run all three:
./scripts/release.sh 1.0.3
```

**InMobi:** if `network_inmobi` download fails, copy `InMobiSDK.xcframework` into `build/staging/NetworkSDKs/` from the [InMobi portal](https://support.inmobi.com/monetize/download-sdk), then re-run `build-release-zips.sh`.

### Publish to GitHub

```bash
git add Package.swift VERSION versions.lock.json scripts/ Sources/AppLovinMediation/Resources/
git commit -m "release: AppLovinMediation 1.0.3 (Unity Ads 4.18.1)"
git tag 1.0.3
git push origin main
git push origin 1.0.3

gh release create 1.0.3 dist/*.zip \
  --title "1.0.3" \
  --notes "Updates Unity Ads SDK to 4.18.1 and AppLovin Unity adapter to 4.18.1.0. All binary URLs use release tag 1.0.3."
```

### Update surfline-ios

In `project.yml`:

```yaml
AppLovinMediation:
  url: git@github.com:Surfline/applovin-mediation.git
  exactVersion: 1.0.3
```

Then:

```bash
xcodegen generate
```

Reset SPM caches in Xcode if resolution is stale.

## Scripts

| Script | Purpose |
|--------|---------|
| `scripts/download-artifacts.sh` | Download from `versions.lock.json` → `build/staging/` |
| `scripts/audit-rpath-dependencies.sh` | Find `@rpath` links to frameworks not in staging |
| `scripts/build-release-zips.sh` | Create `dist/*.zip`, copy bundle, optional `--write-checksums` |
| `scripts/update-package-swift.py` | Regenerate `Package.swift` from `dist/` |
| `scripts/release.sh` | Download → audit → zip → update Package.swift |

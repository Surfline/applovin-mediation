# SurflineAppLovinMediation

Swift package distributing AppLovin MAX mediation adapters and network SDK xcframeworks for Surfline iOS. Large binaries are hosted on [GitHub Releases](https://github.com/Surfline/surfline-ios-applovin-mediation/releases); this repo contains `Package.swift` and checksums only.

surfline-ios also depends on **AppLovinSDK**, **GoogleMobileAds**, and **VungleAdsSDK** via SPM separately.

## Consumption

```yaml
packages:
  SurflineAppLovinMediation:
    url: git@github.com:Surfline/surfline-ios-applovin-mediation.git
    exactVersion: 1.0.0

dependencies:
  - package: SurflineAppLovinMediation
    product: SurflineAppLovinMediation
```

## Release

After pushing this repo, upload zips (do not commit `dist/`):

```bash
gh release create 1.0.0 dist/*.zip --title "1.0.0"
```

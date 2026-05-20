# AppLovinMediation

Swift package for AppLovin MAX mediation adapters and network SDK xcframeworks.

Binary artifacts are hosted on [GitHub Releases](https://github.com/Surfline/applovin-mediation/releases). This repo contains `Package.swift`, checksums, and `PAGAdSDK.bundle` only.

`surfline-ios` also depends on **AppLovinSDK**, **GoogleMobileAds**, and **VungleAdsSDK** via SPM separately.

## Consumption

```yaml
packages:
  AppLovinMediation:
    url: git@github.com:Surfline/applovin-mediation.git
    exactVersion: 1.0.1

dependencies:
  - package: AppLovinMediation
    product: AppLovinMediation
```

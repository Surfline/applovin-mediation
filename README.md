# AppLovinMediation

Swift package distributing AppLovin MAX mediation adapters and network SDK xcframeworks. Large binaries are hosted on [GitHub Releases](https://github.com/Surfline/applovin-mediation/releases); this repo contains `Package.swift` and checksums only.

## Consumption

```yaml
packages:
 AppLovinMediation:
    url: git@github.com:Surfline/applovin-mediation.git
    exactVersion: 1.0.0

dependencies:
  - package: AppLovinMediation
    product: AppLovinMediation
```

## Release

After pushing this repo, upload zips (do not commit `dist/`):

```bash
gh release create 1.0.0 dist/*.zip --title "1.0.0"
```

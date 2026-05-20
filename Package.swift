// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "AppLovinMediation",
    platforms: [.iOS(.v13)],
    products: [
        .library(name: "AppLovinMediation", targets: ["AppLovinMediation"]),
    ],
    targets: [
        .binaryTarget(
            name: "AppLovinMediationFyberAdapter",
            url: "https://github.com/Surfline/applovin-mediation/releases/download/1.0.0/AppLovinMediationFyberAdapter.xcframework.zip",
            checksum: "6da9bb4e8e8439480df894cc970e6bebc985f5e03c13715a5a9218db1fae1e7e"
        ),
        .binaryTarget(
            name: "AppLovinMediationGoogleAdManagerAdapter",
            url: "https://github.com/Surfline/applovin-mediation/releases/download/1.0.0/AppLovinMediationGoogleAdManagerAdapter.xcframework.zip",
            checksum: "3d95a5f62b8f48020fb8c896e7b52e23dc2fd8000f4487df9ae7972b64709a73"
        ),
        .binaryTarget(
            name: "AppLovinMediationGoogleAdapter",
            url: "https://github.com/Surfline/applovin-mediation/releases/download/1.0.0/AppLovinMediationGoogleAdapter.xcframework.zip",
            checksum: "b66b9c6c50da1d83ce77daa40d4f9884b28c056176eacb3f40df1c38d0a52a3d"
        ),
        .binaryTarget(
            name: "AppLovinMediationInMobiAdapter",
            url: "https://github.com/Surfline/applovin-mediation/releases/download/1.0.0/AppLovinMediationInMobiAdapter.xcframework.zip",
            checksum: "128cc8d1b38a688615cbcb476f416d17ae0b9737e0144e4b472686c0219476bc"
        ),
        .binaryTarget(
            name: "AppLovinMediationUnityAdsAdapter",
            url: "https://github.com/Surfline/applovin-mediation/releases/download/1.0.0/AppLovinMediationUnityAdsAdapter.xcframework.zip",
            checksum: "de46ee47f6186b2f358b3a48362736593bdeb203985a95beb6e9e86aab55d9cc"
        ),
        .binaryTarget(
            name: "AppLovinMediationVungleAdapter",
            url: "https://github.com/Surfline/applovin-mediation/releases/download/1.0.0/AppLovinMediationVungleAdapter.xcframework.zip",
            checksum: "c29a1905dc041e34eb62ada46616632ed1ce40803d6d90afca693a83150c3e90"
        ),
        .binaryTarget(
            name: "AppLovinMediationByteDanceAdapter",
            url: "https://github.com/Surfline/applovin-mediation/releases/download/1.0.0/AppLovinMediationByteDanceAdapter.xcframework.zip",
            checksum: "ee0a2a6b780e7947560b1b3a4786525b37230bea13fbda68c6dc4b4e84c81fda"
        ),
        .binaryTarget(
            name: "AppLovinMediationOguryPresageAdapter",
            url: "https://github.com/Surfline/applovin-mediation/releases/download/1.0.0/AppLovinMediationOguryPresageAdapter.xcframework.zip",
            checksum: "c795b6d1a65cb0f874186023223c16535f8330b42de1898efb3d0ce86f339aea"
        ),
        .binaryTarget(
            name: "IASDKCore",
            url: "https://github.com/Surfline/applovin-mediation/releases/download/1.0.0/IASDKCore.xcframework.zip",
            checksum: "5102a6f71e5707d69c6fe3efd0d8135539f2cf63ca222a184e5ad25d85cef928"
        ),
        .binaryTarget(
            name: "InMobiSDK",
            url: "https://github.com/Surfline/applovin-mediation/releases/download/1.0.0/InMobiSDK.xcframework.zip",
            checksum: "88f514fa8bcd9253e4a4a386c12c42d1f3cf2bc7ebc019491e4849eb5fe66985"
        ),
        .binaryTarget(
            name: "UnityAds",
            url: "https://github.com/Surfline/applovin-mediation/releases/download/1.0.0/UnityAds.xcframework.zip",
            checksum: "655160bb9ff13c74f7af9144f748d603e3d5d8afa0f301fe6c41d4df6a98652e"
        ),
        .binaryTarget(
            name: "PAGAdSDK",
            url: "https://github.com/Surfline/applovin-mediation/releases/download/1.0.0/PAGAdSDK.xcframework.zip",
            checksum: "59fed94d3c62d4ab9d2251b2a89adf760b50a0bea17e356826eb040c1f0f7ada"
        ),
        .binaryTarget(
            name: "TikTokBusinessSDK",
            url: "https://github.com/Surfline/applovin-mediation/releases/download/1.0.0/TikTokBusinessSDK.xcframework.zip",
            checksum: "faff48a346c47940edaac7d148d2e2a3d85118c5a9e3e5b9f70be52713c4769d"
        ),
        .binaryTarget(
            name: "OgurySdk",
            url: "https://github.com/Surfline/applovin-mediation/releases/download/1.0.0/OgurySdk.xcframework.zip",
            checksum: "4eef30ec23fb2a3189a748470c2ad18a060ebb5b57635ef7baffb8af2d42e01c"
        ),
        .binaryTarget(
            name: "OguryCore",
            url: "https://github.com/Surfline/applovin-mediation/releases/download/1.0.0/OguryCore.xcframework.zip",
            checksum: "b591df132e8dfd55b475a8b93cb92d44c635fb9db12fb52674da4b3b041d195b"
        ),
        .binaryTarget(
            name: "OguryAds",
            url: "https://github.com/Surfline/applovin-mediation/releases/download/1.0.0/OguryAds.xcframework.zip",
            checksum: "777b7ee40023a64546563647b49f01ae7404bfac0122dbb3fefbecc0393855b8"
        ),
        .target(
            name: "AppLovinMediation",
            dependencies: ["AppLovinMediationFyberAdapter", "AppLovinMediationGoogleAdManagerAdapter", "AppLovinMediationGoogleAdapter", "AppLovinMediationInMobiAdapter", "AppLovinMediationUnityAdsAdapter", "AppLovinMediationVungleAdapter", "AppLovinMediationByteDanceAdapter", "AppLovinMediationOguryPresageAdapter", "IASDKCore", "InMobiSDK", "UnityAds", "PAGAdSDK", "TikTokBusinessSDK", "OgurySdk", "OguryCore", "OguryAds"],
            resources: [.copy("Resources/PAGAdSDK.bundle")],
            linkerSettings: [.linkedLibrary("resolv")]
        ),
    ]
)

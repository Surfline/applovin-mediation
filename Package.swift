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
            checksum: "7d71969d08163f5c4532dc21eb237920dbfc47a09996ff36604cf59c4074f806"
        ),
        .binaryTarget(
            name: "AppLovinMediationGoogleAdManagerAdapter",
            url: "https://github.com/Surfline/applovin-mediation/releases/download/1.0.0/AppLovinMediationGoogleAdManagerAdapter.xcframework.zip",
            checksum: "36875e3f36ce24cd5d4f46f0dd0ae10392cb29914925780633f5800f125b8168"
        ),
        .binaryTarget(
            name: "AppLovinMediationGoogleAdapter",
            url: "https://github.com/Surfline/applovin-mediation/releases/download/1.0.0/AppLovinMediationGoogleAdapter.xcframework.zip",
            checksum: "615c70acfee2cc5b98f9634475c3788e6c86a031b9e7df7efee90216b069bb70"
        ),
        .binaryTarget(
            name: "AppLovinMediationInMobiAdapter",
            url: "https://github.com/Surfline/applovin-mediation/releases/download/1.0.0/AppLovinMediationInMobiAdapter.xcframework.zip",
            checksum: "e784e1511cd90a02a944dcf3bc1b571274cb82428bbdc7b399df8aba52771101"
        ),
        .binaryTarget(
            name: "AppLovinMediationUnityAdsAdapter",
            url: "https://github.com/Surfline/applovin-mediation/releases/download/1.0.0/AppLovinMediationUnityAdsAdapter.xcframework.zip",
            checksum: "3d0dccc3112a5fb9949b53bacd25d5004a0e99f2b73126b3faa34ed368cf192e"
        ),
        .binaryTarget(
            name: "AppLovinMediationVungleAdapter",
            url: "https://github.com/Surfline/applovin-mediation/releases/download/1.0.0/AppLovinMediationVungleAdapter.xcframework.zip",
            checksum: "9922a180d0bac21a1b4d6b29d234f4e57e46eea2c9068b63dfc63ca3e0300dd0"
        ),
        .binaryTarget(
            name: "AppLovinMediationByteDanceAdapter",
            url: "https://github.com/Surfline/applovin-mediation/releases/download/1.0.0/AppLovinMediationByteDanceAdapter.xcframework.zip",
            checksum: "5d2aeefb966fd6850fcb3ce1476156f2f6e0439fc82f091f42d18663effa4914"
        ),
        .binaryTarget(
            name: "AppLovinMediationOguryPresageAdapter",
            url: "https://github.com/Surfline/applovin-mediation/releases/download/1.0.0/AppLovinMediationOguryPresageAdapter.xcframework.zip",
            checksum: "053a6fb46a6dd56c54452b6e89112994964fd712c589c865d4ddfa3b4f725543"
        ),
        .binaryTarget(
            name: "IASDKCore",
            url: "https://github.com/Surfline/applovin-mediation/releases/download/1.0.0/IASDKCore.xcframework.zip",
            checksum: "da1e432c385e2886f0f68f86c9b3ef4b9254abfa47badf0d26a988a75585c283"
        ),
        .binaryTarget(
            name: "InMobiSDK",
            url: "https://github.com/Surfline/applovin-mediation/releases/download/1.0.0/InMobiSDK.xcframework.zip",
            checksum: "c58bac22886d53db70935f9527161d41844add54e74a5c6961a1d5addbda7af3"
        ),
        .binaryTarget(
            name: "UnityAds",
            url: "https://github.com/Surfline/applovin-mediation/releases/download/1.0.0/UnityAds.xcframework.zip",
            checksum: "b6c971f00b71fad47c4dbb3552d339ea9c3cdc6f113737690a46d0c11447b8d0"
        ),
        .binaryTarget(
            name: "PAGAdSDK",
            url: "https://github.com/Surfline/applovin-mediation/releases/download/1.0.0/PAGAdSDK.xcframework.zip",
            checksum: "00115ac4ab9ff7b1d199ecc4491d8eb4179a4b6d26be832395dddc3473cc4065"
        ),
        .binaryTarget(
            name: "TikTokBusinessSDK",
            url: "https://github.com/Surfline/applovin-mediation/releases/download/1.0.0/TikTokBusinessSDK.xcframework.zip",
            checksum: "5b2de62253745afd3970614b48c840caac0ef73c964db664d46e6b6fe93133d6"
        ),
        .binaryTarget(
            name: "OgurySdk",
            url: "https://github.com/Surfline/applovin-mediation/releases/download/1.0.0/OgurySdk.xcframework.zip",
            checksum: "8583394f7845913cb67057af42aa9ecaa215ddd48e7955c2158d564cf0cee172"
        ),
        .binaryTarget(
            name: "OguryCore",
            url: "https://github.com/Surfline/applovin-mediation/releases/download/1.0.0/OguryCore.xcframework.zip",
            checksum: "341423e365b411e071df5ca920b64dc4cac20e19a2f3fe2ef9a034b45468becb"
        ),
        .binaryTarget(
            name: "OguryAds",
            url: "https://github.com/Surfline/applovin-mediation/releases/download/1.0.0/OguryAds.xcframework.zip",
            checksum: "f3ca364977a79f82bf73e9e0baa9f92317af15585df506c83000f78b33bbe9de"
        ),
        .target(
            name: "AppLovinMediation",
            dependencies: ["AppLovinMediationFyberAdapter", "AppLovinMediationGoogleAdManagerAdapter", "AppLovinMediationGoogleAdapter", "AppLovinMediationInMobiAdapter", "AppLovinMediationUnityAdsAdapter", "AppLovinMediationVungleAdapter", "AppLovinMediationByteDanceAdapter", "AppLovinMediationOguryPresageAdapter", "IASDKCore", "InMobiSDK", "UnityAds", "PAGAdSDK", "TikTokBusinessSDK", "OgurySdk", "OguryCore", "OguryAds"],
            resources: [.copy("Resources/PAGAdSDK.bundle")],
            linkerSettings: [.linkedLibrary("resolv")]
        ),
    ]
)

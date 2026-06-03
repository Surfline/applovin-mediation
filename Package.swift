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
            name: "AppLovinMediationByteDanceAdapter",
            url: "https://github.com/Surfline/applovin-mediation/releases/download/1.0.3/AppLovinMediationByteDanceAdapter.xcframework.zip",
            checksum: "fbcf89f522dd85c0acbddc092650ac69d80458aa429c07bf2c41ad916afeb610"
        ),
        .binaryTarget(
            name: "AppLovinMediationFyberAdapter",
            url: "https://github.com/Surfline/applovin-mediation/releases/download/1.0.3/AppLovinMediationFyberAdapter.xcframework.zip",
            checksum: "6ac07e59c5fddf9f2e76e62034b9c6fba82782d5033306e6bf1b260a10840953"
        ),
        .binaryTarget(
            name: "AppLovinMediationGoogleAdManagerAdapter",
            url: "https://github.com/Surfline/applovin-mediation/releases/download/1.0.3/AppLovinMediationGoogleAdManagerAdapter.xcframework.zip",
            checksum: "c898d2e285c6f8451f4807fc2b4dc3130d8bf1f5ff46fbd9a5c1fba853734e45"
        ),
        .binaryTarget(
            name: "AppLovinMediationGoogleAdapter",
            url: "https://github.com/Surfline/applovin-mediation/releases/download/1.0.3/AppLovinMediationGoogleAdapter.xcframework.zip",
            checksum: "7ce6c189eb6e8d21481b9b928c3e3a805d30777f2d5e858d8daa90401567c5da"
        ),
        .binaryTarget(
            name: "AppLovinMediationInMobiAdapter",
            url: "https://github.com/Surfline/applovin-mediation/releases/download/1.0.3/AppLovinMediationInMobiAdapter.xcframework.zip",
            checksum: "8391620562c442f7929f3b22b4f4714ec8171f1e36d23603abe4571a44558f16"
        ),
        .binaryTarget(
            name: "AppLovinMediationOguryPresageAdapter",
            url: "https://github.com/Surfline/applovin-mediation/releases/download/1.0.3/AppLovinMediationOguryPresageAdapter.xcframework.zip",
            checksum: "83e69e2887bcea9c00b947f3b5e74dae435e07122566027a17f2ef5fdf94b305"
        ),
        .binaryTarget(
            name: "AppLovinMediationUnityAdsAdapter",
            url: "https://github.com/Surfline/applovin-mediation/releases/download/1.0.3/AppLovinMediationUnityAdsAdapter.xcframework.zip",
            checksum: "51267e30e682cfba982d61821cc5ff3bb07c4783531d924b5079d642f8720a4c"
        ),
        .binaryTarget(
            name: "AppLovinMediationVungleAdapter",
            url: "https://github.com/Surfline/applovin-mediation/releases/download/1.0.3/AppLovinMediationVungleAdapter.xcframework.zip",
            checksum: "0a4abd6cffd4aea9777df71e3423df57d508b22c871861750caf4d80de6b3cfe"
        ),
        .binaryTarget(
            name: "IASDKCore",
            url: "https://github.com/Surfline/applovin-mediation/releases/download/1.0.3/IASDKCore.xcframework.zip",
            checksum: "7f3f72bd888bd742bb8d00282581643ce1a4b0ef7935348913ebf68531b0f875"
        ),
        .binaryTarget(
            name: "InMobiSDK",
            url: "https://github.com/Surfline/applovin-mediation/releases/download/1.0.3/InMobiSDK.xcframework.zip",
            checksum: "3d42c5810b50c85451366ff2845720cfc9c741e6c564a2e5c39f5853bb5de518"
        ),
        .binaryTarget(
            name: "OMSDK_Ogury",
            url: "https://github.com/Surfline/applovin-mediation/releases/download/1.0.3/OMSDK_Ogury.xcframework.zip",
            checksum: "20adf50f2f6997df0cfbfc3938a9da2350a621c6f11bef94a32f11a841669b45"
        ),
        .binaryTarget(
            name: "OguryAds",
            url: "https://github.com/Surfline/applovin-mediation/releases/download/1.0.3/OguryAds.xcframework.zip",
            checksum: "3e71a091292c4683c7976258513985cb3d7c25a47e4acb307c7f9012941b77d5"
        ),
        .binaryTarget(
            name: "OguryCore",
            url: "https://github.com/Surfline/applovin-mediation/releases/download/1.0.3/OguryCore.xcframework.zip",
            checksum: "f018b8f5e949864a6576b8e79ba9f28b1fcfe2c9bf6ac070abdb27555092bb17"
        ),
        .binaryTarget(
            name: "OgurySdk",
            url: "https://github.com/Surfline/applovin-mediation/releases/download/1.0.3/OgurySdk.xcframework.zip",
            checksum: "cb4f7990837e7886f6a33ef6ef0f6cf9896488a0f9a7da88712b26561b27121d"
        ),
        .binaryTarget(
            name: "PAGAdSDK",
            url: "https://github.com/Surfline/applovin-mediation/releases/download/1.0.3/PAGAdSDK.xcframework.zip",
            checksum: "e8f2c7db6ab99391bc1a83df23453ba9a415983a40cc4577aa9a64439b19a7d1"
        ),
        .binaryTarget(
            name: "TikTokBusinessSDK",
            url: "https://github.com/Surfline/applovin-mediation/releases/download/1.0.3/TikTokBusinessSDK.xcframework.zip",
            checksum: "4c3c4ef196b8bbd87662212176c6f56ffb11369d57d7f39d4e13a9a301ceec97"
        ),
        .binaryTarget(
            name: "UnityAds",
            url: "https://github.com/Surfline/applovin-mediation/releases/download/1.0.3/UnityAds.xcframework.zip",
            checksum: "9917ed3ca208f9f0ca03bb613833daf2586b70e2d57ab32faf500af684df2c0c"
        ),
        .target(
            name: "AppLovinMediation",
            dependencies: ["AppLovinMediationFyberAdapter", "AppLovinMediationGoogleAdManagerAdapter", "AppLovinMediationGoogleAdapter", "AppLovinMediationInMobiAdapter", "AppLovinMediationUnityAdsAdapter", "AppLovinMediationVungleAdapter", "AppLovinMediationByteDanceAdapter", "AppLovinMediationOguryPresageAdapter", "IASDKCore", "InMobiSDK", "UnityAds", "PAGAdSDK", "TikTokBusinessSDK", "OgurySdk", "OguryCore", "OguryAds", "OMSDK_Ogury"],
            resources: [.copy("Resources/PAGAdSDK.bundle")],
            linkerSettings: [.linkedLibrary("resolv")]
        ),
    ]
)

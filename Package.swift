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
            url: "https://github.com/Surfline/applovin-mediation/releases/download/1.0.2/AppLovinMediationByteDanceAdapter.xcframework.zip",
            checksum: "255071ffaac1d2c1b8ea6f0a859593314512be0db713ed0a5ff5721249391e5f"
        ),
        .binaryTarget(
            name: "AppLovinMediationFyberAdapter",
            url: "https://github.com/Surfline/applovin-mediation/releases/download/1.0.2/AppLovinMediationFyberAdapter.xcframework.zip",
            checksum: "b42a67a00a089a63d05a134c08d2971eb87a211a18a95e86fdb196c2054afc5c"
        ),
        .binaryTarget(
            name: "AppLovinMediationGoogleAdManagerAdapter",
            url: "https://github.com/Surfline/applovin-mediation/releases/download/1.0.2/AppLovinMediationGoogleAdManagerAdapter.xcframework.zip",
            checksum: "676dd5676426bba963451ae19fc5e1a80c4f52ac2e342933cb8e6b2e3a65670b"
        ),
        .binaryTarget(
            name: "AppLovinMediationGoogleAdapter",
            url: "https://github.com/Surfline/applovin-mediation/releases/download/1.0.2/AppLovinMediationGoogleAdapter.xcframework.zip",
            checksum: "1d80bf84f55769488f4d0d9b8afcfd4687d924b89a035a5cc1d7f71f6e25be55"
        ),
        .binaryTarget(
            name: "AppLovinMediationInMobiAdapter",
            url: "https://github.com/Surfline/applovin-mediation/releases/download/1.0.2/AppLovinMediationInMobiAdapter.xcframework.zip",
            checksum: "120986657ea6c44d0b8f732325fbc756950cd4fc9dadb966564321a8af99bb6e"
        ),
        .binaryTarget(
            name: "AppLovinMediationOguryPresageAdapter",
            url: "https://github.com/Surfline/applovin-mediation/releases/download/1.0.2/AppLovinMediationOguryPresageAdapter.xcframework.zip",
            checksum: "8514c829703b36e159dbb5af4173192d84c7c7b26588ca9ca49729b2b6008cd6"
        ),
        .binaryTarget(
            name: "AppLovinMediationUnityAdsAdapter",
            url: "https://github.com/Surfline/applovin-mediation/releases/download/1.0.2/AppLovinMediationUnityAdsAdapter.xcframework.zip",
            checksum: "7b0017b5bb43bf442464bdd8124ae59bbaf8c2efad159a07a5689207b543ef45"
        ),
        .binaryTarget(
            name: "AppLovinMediationVungleAdapter",
            url: "https://github.com/Surfline/applovin-mediation/releases/download/1.0.2/AppLovinMediationVungleAdapter.xcframework.zip",
            checksum: "aaf4f9941dc66f8a92b4c559d7df5db82810cda22a2d70c75a2f5e796af00e0b"
        ),
        .binaryTarget(
            name: "IASDKCore",
            url: "https://github.com/Surfline/applovin-mediation/releases/download/1.0.2/IASDKCore.xcframework.zip",
            checksum: "1d37a2b84c4e9d813f3138266edeccfb74f18cd9e103dd2f7684e4d3563d3ad8"
        ),
        .binaryTarget(
            name: "InMobiSDK",
            url: "https://github.com/Surfline/applovin-mediation/releases/download/1.0.2/InMobiSDK.xcframework.zip",
            checksum: "4300049c973f987b44468691780cea99cf56174aca8b52831b67bb095754b988"
        ),
        .binaryTarget(
            name: "OMSDK_Ogury",
            url: "https://github.com/Surfline/applovin-mediation/releases/download/1.0.2/OMSDK_Ogury.xcframework.zip",
            checksum: "7b50b1aa34f88e5f9b81b0f3830116b68764b3456cc286c2b8411492e65ba63b"
        ),
        .binaryTarget(
            name: "OguryAds",
            url: "https://github.com/Surfline/applovin-mediation/releases/download/1.0.2/OguryAds.xcframework.zip",
            checksum: "d41bb0fe2172981cefa24e6a8e7904e68a113b83334cad1c569633407831f4df"
        ),
        .binaryTarget(
            name: "OguryCore",
            url: "https://github.com/Surfline/applovin-mediation/releases/download/1.0.2/OguryCore.xcframework.zip",
            checksum: "f098b89a537af601cf183bfab4694ecfb80b2a19232e24227e186b8d36b60fb1"
        ),
        .binaryTarget(
            name: "OgurySdk",
            url: "https://github.com/Surfline/applovin-mediation/releases/download/1.0.2/OgurySdk.xcframework.zip",
            checksum: "cdc1ef5e511b6adf7ccfcd3a8b4a98c8f77d335926a51a7e5fd4009c79b7735d"
        ),
        .binaryTarget(
            name: "PAGAdSDK",
            url: "https://github.com/Surfline/applovin-mediation/releases/download/1.0.2/PAGAdSDK.xcframework.zip",
            checksum: "90fccc956b976283677c6895c77f158c206eae83bc99d5d1009ccdf3cfe1e622"
        ),
        .binaryTarget(
            name: "TikTokBusinessSDK",
            url: "https://github.com/Surfline/applovin-mediation/releases/download/1.0.2/TikTokBusinessSDK.xcframework.zip",
            checksum: "b6f132a37732a09c872a143a3399a7999b4175b7c7192179bb0fbc8e57f370bf"
        ),
        .binaryTarget(
            name: "UnityAds",
            url: "https://github.com/Surfline/applovin-mediation/releases/download/1.0.2/UnityAds.xcframework.zip",
            checksum: "89f45166621d781f6731562dfa758bcbbc1c0374fd24f09dd5f49435bae1003d"
        ),
        .target(
            name: "AppLovinMediation",
            dependencies: ["AppLovinMediationFyberAdapter", "AppLovinMediationGoogleAdManagerAdapter", "AppLovinMediationGoogleAdapter", "AppLovinMediationInMobiAdapter", "AppLovinMediationUnityAdsAdapter", "AppLovinMediationVungleAdapter", "AppLovinMediationByteDanceAdapter", "AppLovinMediationOguryPresageAdapter", "IASDKCore", "InMobiSDK", "UnityAds", "PAGAdSDK", "TikTokBusinessSDK", "OgurySdk", "OguryCore", "OguryAds", "OMSDK_Ogury"],
            resources: [.copy("Resources/PAGAdSDK.bundle")],
            linkerSettings: [.linkedLibrary("resolv")]
        ),
    ]
)

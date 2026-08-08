// swift-tools-version: 6.1
import PackageDescription

let package = Package(
    name: "TivoxNemotronRuntime",
    platforms: [.macOS(.v14)],
    products: [
        .library(name: "NemotronStreamingASR", targets: ["NemotronStreamingASR"])
    ],
    dependencies: [
        .package(
            url: "https://github.com/huggingface/swift-transformers",
            exact: "1.3.3"
        )
    ],
    targets: [
        .target(
            name: "AudioCommon",
            dependencies: [
                .product(name: "Hub", package: "swift-transformers")
            ],
            path: "Sources/AudioCommon",
            exclude: [
                "AudioIO.swift", "AudioRingBuffer.swift", "CoreMLLoader.swift",
                "HindiEmotionTTSCatalog.swift", "ModelLoader.swift", "PipelineLLM.swift",
                "StreamingAudioPlayer.swift", "SystemAudioTap.swift", "Tokenizer.swift",
                "WAVWriter.swift"
            ],
            sources: [
                "AudioFileLoader.swift", "AudioModelError.swift", "CoreMLComputeUnits.swift",
                "HuggingFaceDownloader.swift", "Logging.swift", "Protocols.swift",
                "SentencePieceModel.swift"
            ]
        ),
        .target(
            name: "NemotronStreamingASR",
            dependencies: ["AudioCommon"],
            path: "Sources/NemotronStreamingASR",
            exclude: [
                "NemotronStreamingASR+Memory.swift",
                "NemotronStreamingASR+Protocols.swift"
            ],
            sources: [
                "Configuration.swift", "Languages.swift", "NemotronStreamingASR.swift",
                "RNNTGreedyDecoder.swift", "SentencePieceUnigramTokenizer.swift",
                "StreamingMelPreprocessor.swift", "StreamingSession.swift",
                "Vocabulary.swift", "WordBoosting.swift"
            ]
        )
    ],
    swiftLanguageModes: [.v5]
)

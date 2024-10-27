import ComposableArchitecture
import Domain
import Foundation
import MyLittlePlayer
import Testing
@testable import StationDetailsFeature

struct StationDetailsFeatureTests {
    @Test
    func test_play_ShouldSendPlayingState() async throws {
        let store = await TestStore(initialState: StationDetailsFeature.State(station: .sample,
                                                                              playState: .stopped)) {
            StationDetailsFeature()
        } withDependencies: {
            $0.myLittlePlayer.playingUrl = { nil }
            $0.myLittlePlayer.play = { @Sendable _ in
                AsyncStream<PlayerState> { continuation in
                    continuation.yield(.playing(URL(string: "https://radiofrance.fr/midfi.mp3")!))
                    continuation.finish()
                }
            }
        }

        await store.send(.togglePlayPause)

        await store.receive(\.updatePlayerState) {
            $0.playState = .playing
        }
    }

    @Test
    func test_alreadyPlaying_ShouldDoNothing() async throws {
        let store = await TestStore(initialState: StationDetailsFeature.State(station: .sample,
                                                                              playState: .stopped)) {
            StationDetailsFeature()
        } withDependencies: {
            $0.myLittlePlayer.playingUrl = { URL(string: "") }
            $0.myLittlePlayer.play = { @Sendable _ in
                .finished
            }
        }

        await store.send(.togglePlayPause)
    }

    @Test
    func test_Playing_ShouldStop() async throws {
        let store = await TestStore(initialState: StationDetailsFeature.State(station: .sample,
                                                                              playState: .playing)) {
            StationDetailsFeature()
        } withDependencies: {
            $0.myLittlePlayer.playingUrl = { nil }
            $0.myLittlePlayer.play = { @Sendable _ in
                AsyncStream<PlayerState> { continuation in
                    continuation.yield(.stopped)
                    continuation.finish()
                }
            }
        }

        await store.send(.togglePlayPause)

        await store.receive(\.updatePlayerState) {
            $0.playState = .stopped
        }
    }
}

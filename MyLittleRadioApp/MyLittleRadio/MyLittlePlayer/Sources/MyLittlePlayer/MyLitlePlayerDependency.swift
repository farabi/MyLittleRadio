//
//  MyLitlePlayerDependency.swift
//  MyLittleRadio
//
//  Created by Saad El Oulladi on 25/10/2024.
//

import ComposableArchitecture
import Dependencies
import Foundation

// MARK: - PlayerClient

@DependencyClient
public struct PlayerClient: Sendable {
    public var play: @Sendable (_ url: URL) async -> AsyncStream<PlayerState> = { _ in .finished }
    public var stop: @Sendable () async -> Void
    public var playingUrl: @Sendable () async -> URL? = { nil }
}

public extension DependencyValues {
    var myLittlePlayer: PlayerClient {
        get { self[PlayerClient.self] }
        set { self[PlayerClient.self] = newValue }
    }
}

// MARK: - PlayerClient + DependencyKey

extension PlayerClient: DependencyKey {
    public static let liveValue: Self = {
        let player = MyLittlePlayer()
        return Self(play: { url in
            player.play(url: url)
        }, stop: {
            player.stop()
        }, playingUrl: {
            player.playingUrl()
        })
    }()
}

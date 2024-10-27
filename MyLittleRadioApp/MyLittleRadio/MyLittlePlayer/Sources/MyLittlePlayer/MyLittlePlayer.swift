//
//  MyLittlePlayer.swift
//  MyLittleRadio
//
//  Created by Saad El Oulladi on 25/10/2024.
//

import AVFoundation
import Combine
import ComposableArchitecture

public final actor MyLittlePlayer: Sendable {
    // MARK: Lifecycle

    init() {}

    /// Releases the AVPlayer resources
    deinit {
        player?.pause()
        player = nil
    }

    // MARK: Internal

    func play(url: URL) -> AsyncStream<PlayerState> {
        let playerItem = AVPlayerItem(url: url)
        player = AVPlayer(playerItem: playerItem)
        player?.play()
        return playerStateStream(playerItem: playerItem, url: url)
    }

    /// Pauses the currently playing audio stream
    func pause() {
        player?.pause()
    }

    /// Stops the audio stream and resets the player to the beginning
    func stop() {
        player?.pause()
        player?.seek(to: .zero)
    }

    func playingUrl() -> URL? {
        currentUrl
    }

    // MARK: Private

    private var player: AVPlayer?
    private var subscriptions = Set<AnyCancellable>()

    private var currentUrl: URL?

    private func playerStateStream(playerItem: AVPlayerItem, url: URL) -> AsyncStream<PlayerState> {
        .init { continuation in
            continuation.yield(.loading)
            playerItem.publisher(for: \.status).sink { [weak self] status in
                continuation.yield(status.toPlayerState(for: url))
                Task { [weak self] in
                    await self?.updateCurrentUrl(status: status, url: url)
                }
            }.store(in: &subscriptions)
        }
    }

    private func updateCurrentUrl(status: AVPlayerItem.Status, url: URL) {
        if status == .readyToPlay {
            currentUrl = url
        } else {
            currentUrl = nil
        }
    }
}

//
//  AVPlayerItem.Status+toPlayerState.swift
//  MyLittleRadio
//
//  Created by Saad El Oulladi on 25/10/2024.
//

import AVFoundation

// MARK: - AVPlayerItem.Status

extension AVPlayerItem.Status {
    func toPlayerState(for url: URL) -> PlayerState {
        switch self {
        case .unknown:
            return .loading
        case .readyToPlay:
            return .playing(url)
        default:
            return .stopped
        }
    }
}

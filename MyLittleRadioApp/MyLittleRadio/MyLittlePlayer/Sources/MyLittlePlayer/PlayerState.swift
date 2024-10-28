//
//  PlayerState.swift
//  MyLittleRadio
//
//  Created by Saad El Oulladi on 25/10/2024.
//

import Foundation

// MARK: PlayerState

public enum PlayerState: Sendable, Equatable {
    case stopped
    case paused
    case playing(URL)
    case loading

    // MARK: Public

    public static func == (lhs: PlayerState, rhs: PlayerState) -> Bool {
        switch (lhs, rhs) {
        case (.stopped, .stopped):
            return true
        case (.paused, .paused):
            return true
        case let (.playing(left), .playing(right)):
            return left == right
        case (.loading, .loading):
            return true
        default:
            return false
        }
    }
}

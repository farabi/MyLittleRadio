//
//  StationDetailsFeature.State.swift
//  MyLittleRadio
//
//  Created by Saad El Oulladi on 27/10/2024.
//

import Foundation
import SwiftUI

public extension StationDetailsFeature.State {
    enum PlayerState {
        case stopped
        case playing
        case loading
    }

    struct StationState: Equatable, Identifiable {
        // MARK: Lifecycle

        public init(id: String, title: String, imageUrl: URL?, streamUrl: URL, color: Color) {
            self.id = id
            self.title = title
            self.imageUrl = imageUrl
            self.streamUrl = streamUrl
            self.color = color
        }

        // MARK: Public

        public let id: String

        // MARK: Internal

        let title: String
        let imageUrl: URL?
        let streamUrl: URL
        let color: Color
    }
}

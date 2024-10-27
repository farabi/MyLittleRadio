//
//  Samples.swift
//  Domain
//
//  Created by Saad El Oulladi on 27/10/2024.
//

import Domain
import Foundation
@testable import StationDetailsFeature

// MARK: - StationDetailsFeature.State.StationState

extension StationDetailsFeature.State.StationState {
    static var sample: Self {
        .init(id: "1",
              title: "France Inter",
              imageUrl: URL(string: "https://example.com/radiofrance.mp3"),
              streamUrl: URL(string: "https://icecast.radiofrance.fr/franceinter-midfi.mp3")!,
              color: .white)
    }
}

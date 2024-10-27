//
//  Samples.swift
//  Domain
//
//  Created by Saad El Oulladi on 27/10/2024.
//

import Domain
import Foundation
@testable import StationsListFeature

// MARK: - StationEntity Sample Data

extension StationEntity {
    static var sampleFull: StationEntity {
        StationEntity(
            id: "1",
            title: "France Inter",
            streamUrl: "https://icecast.radiofrance.fr/franceinter-midfi.mp3",
            primaryColor: "#FFFFFF",
            squareImageUrl: "https://example.com/image.png"
        )
    }

    static var sampleWithoutImage: StationEntity {
        StationEntity(
            id: "2",
            title: "Radio France",
            streamUrl: "https://example.com/radiofrance.mp3",
            primaryColor: "#000000",
            squareImageUrl: nil
        )
    }
}

extension StationsListFeature.State.StationItemState {
    static var sampleFull: Self {
        .init(
            id: "1",
            title: "France Inter",
            imageUrl: URL(string: "https://example.com/image.png"),
            streamUrl: URL(string: "https://icecast.radiofrance.fr/franceinter-midfi.mp3")!,
            color: .white
        )
    }

    static var sampleWithoutImage: Self {
        .init(
            id: "2",
            title: "Radio France",
            imageUrl: nil,
            streamUrl: URL(string: "https://example.com/radiofrance.mp3")!,
            color: .black
        )
    }
}

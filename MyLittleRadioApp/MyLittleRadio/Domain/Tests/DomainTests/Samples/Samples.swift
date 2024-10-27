//
//  Samples.swift
//  Domain
//
//  Created by Saad El Oulladi on 27/10/2024.
//

@testable import Domain

// MARK: - StationEntity Sample Data

extension StationEntity {
    static var sampleFull: StationEntity {
        StationEntity(
            id: "1",
            title: "France Inter",
            streamUrl: "https://icecast.radiofrance.fr/franceinter-midfi.mp3",
            primaryColor: "#e20134",
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

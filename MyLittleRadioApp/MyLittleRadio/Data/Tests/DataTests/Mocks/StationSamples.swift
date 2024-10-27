//
//  StationSamples.swift
//  Data
//
//  Created by Saad El Oulladi on 27/10/2024.
//

import Domain
import Foundation

// MARK: - Samples

enum Samples {
    static let validStationData: Data = {
        let stationDict: [String: Any] = [
            "id": "1",
            "brandId": "FRANCEINTER",
            "title": "France Inter",
            "hasTimeshift": true,
            "shortTitle": "Inter",
            "type": "on_air",
            "streamUrl": "https://icecast.radiofrance.fr/franceinter-midfi.mp3",
            "analytics": [
                "value": "france_inter",
                "stationAudienceId": 3
            ],
            "liveRule": "apprf_inter_player",
            "colors": [
                "primary": "#e20134"
            ],
            "assets": [
                "squareImageUrl": "https://example.com/image.png"
            ],
            "isMusical": false
        ]
        return try! JSONSerialization.data(withJSONObject: stationDict)
    }()

    static let minimalStationData: Data = {
        let minimalStationDict: [String: Any] = [
            "id": "2",
            "brandId": "RADIOFRANCE",
            "title": "Radio France",
            "hasTimeshift": false,
            "shortTitle": "Radio",
            "type": "on_air",
            "streamUrl": "https://example.com/radiofrance.mp3",
            "analytics": [
                "value": "radio_france",
                "stationAudienceId": 5
            ],
            "liveRule": "apprf_radio_player",
            "colors": [
                "primary": "#000000"
            ],
            "isMusical": true
        ]
        return try! JSONSerialization.data(withJSONObject: minimalStationDict)
    }()

    static let mockStationEntity = StationEntity(
        id: "1",
        title: "France Inter",
        streamUrl: "https://icecast.radiofrance.fr/franceinter-midfi.mp3",
        primaryColor: "#e20134",
        squareImageUrl: "https://example.com/image.png"
    )
}

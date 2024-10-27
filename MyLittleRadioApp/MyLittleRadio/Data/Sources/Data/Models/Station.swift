// Copyright © Radio France. All rights reserved.

import Foundation

// MARK: - StationsList

struct StationsList: Codable {
    let stations: [Station]
}

// MARK: - Station

struct Station: Codable, Equatable, Identifiable {
    struct Analytics: Codable {
        let value: String
        let stationAudienceId: Int
    }

    struct Colors: Codable {
        let primary: String
    }

    struct Assets: Codable {
        let squareImageUrl: String
    }

    let id: String
    let brandId: String
    let title: String
    let hasTimeshift: Bool
    let shortTitle: String
    let type: String
    let streamUrl: String
    let analytics: Analytics
    let liveRule: String
    let colors: Colors
    let assets: Assets?
    let isMusical: Bool

    static func == (lhs: Station, rhs: Station) -> Bool {
        lhs.id == rhs.id
    }
}

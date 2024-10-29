//
//  StationTests.swift
//  Data
//
//  Created by Saad El Oulladi on 27/10/2024.
//

import Domain
import Foundation
import Testing
@testable import Data

// MARK: - Custom Tags

extension Tag {
    @Tag static var stationConversion: Self
}

// MARK: - StationTests

enum StationTests {
    // MARK: - Station Decoding Tests

    struct DecodingTests {
        @Test(
            "decodes station from JSON data",
            .tags(.stationConversion)
        )
        func decodesStationFromJSON() throws {
            let decoder = JSONDecoder()
            let station = try decoder.decode(Station.self, from: Samples.validStationData)

            #expect(station.id == "1")
            #expect(station.title == "France Inter")
            #expect(station.streamUrl == "https://icecast.radiofrance.fr/franceinter-midfi.mp3")
            #expect(station.colors.primary == "#e20134")
            #expect(station.assets?.squareImageUrl == "https://example.com/image.png")
        }

        @Test(
            "decodes station without assets",
            .tags(.stationConversion)
        )
        func decodesStationWithoutAssets() throws {
            let decoder = JSONDecoder()
            let station = try decoder.decode(Station.self, from: Samples.minimalStationData)

            #expect(station.id == "2")
            #expect(station.title == "Radio France")
            #expect(station.streamUrl == "https://example.com/radiofrance.mp3")
            #expect(station.colors.primary == "#000000")
            #expect(station.assets?.squareImageUrl == nil)
        }
    }

    // MARK: - Station to Domain Tests

    struct ToDomainTests {
        @Test(
            "converts station to domain entity correctly",
            .tags(.stationConversion)
        )
        func convertsToDomainEntityCorrectly() throws {
            let decoder = JSONDecoder()
            let station = try decoder.decode(Station.self, from: Samples.validStationData)
            let domainEntity = station.toDomain

            #expect(domainEntity == Samples.mockStationEntity)
        }

        @Test(
            "converts to domain entity with default image URL",
            .tags(.stationConversion)
        )
        func convertsToDomainEntityWithDefaultImageURL() throws {
            let decoder = JSONDecoder()
            let station = try decoder.decode(Station.self, from: Samples.minimalStationData)
            let domainEntity = station.toDomain

            #expect(domainEntity.squareImageUrl == "")
        }
    }
}

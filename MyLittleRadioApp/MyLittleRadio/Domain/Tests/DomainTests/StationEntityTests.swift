//
//  StationEntityTests.swift
//  Domain
//
//  Created by Saad El Oulladi on 27/10/2024.
//

import Foundation
import Testing
@testable import Domain

// MARK: - Custom Tags

extension Tag {
    @Tag static var stationEntity: Self
}

// MARK: - StationEntityTests

enum StationEntityTests {
    // MARK: - Initialization Tests

    struct InitializationTests {
        // MARK: Test with all parameters

        @Test(
            "initializes correctly with all parameters",
            .tags(.stationEntity)
        )
        func initializesCorrectly_withAllParameters() {
            let entity = StationEntity.sampleFull

            #expect(entity.id == "1")
            #expect(entity.title == "France Inter")
            #expect(entity.streamUrl == "https://icecast.radiofrance.fr/franceinter-midfi.mp3")
            #expect(entity.primaryColor == "#e20134")
            #expect(entity.squareImageUrl == "https://example.com/image.png")
        }

        // MARK: Test with nil squareImageUrl

        @Test(
            "initializes correctly with nil squareImageUrl",
            .tags(.stationEntity)
        )
        func initializesCorrectly_withNilSquareImageUrl() {
            let entity = StationEntity.sampleWithoutImage

            #expect(entity.id == "2")
            #expect(entity.title == "Radio France")
            #expect(entity.streamUrl == "https://example.com/radiofrance.mp3")
            #expect(entity.primaryColor == "#000000")
            #expect(entity.squareImageUrl == nil)
        }
    }

    // MARK: - Equality Tests

    struct EqualityTests {
        // MARK: Test equality of identical entities

        @Test(
            "checks equality of identical StationEntities",
            .tags(.stationEntity)
        )
        func checksEqualityOfIdenticalEntities() {
            let entity1 = StationEntity.sampleFull
            let entity2 = StationEntity.sampleFull

            #expect(entity1 == entity2)
        }

        // MARK: Test inequality of different entities

        @Test(
            "checks inequality of different StationEntities",
            .tags(.stationEntity)
        )
        func checksInequalityOfDifferentEntities() {
            let entity1 = StationEntity.sampleFull
            let entity2 = StationEntity.sampleWithoutImage

            #expect(entity1 != entity2)
        }
    }
}

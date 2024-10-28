//
//  FetchStationsUseCase.swift
//  Domain
//
//  Created by Saad El Oulladi on 27/10/2024.
//

import ComposableArchitecture

// MARK: FetchStationsUseCase

public class FetchStationsUseCase {
    // MARK: Lifecycle

    public init(stationRepository: StationRepository) {
        self.stationRepository = stationRepository
    }

    // MARK: Public

    public func execute() async throws -> [StationEntity] {
        try await stationRepository.fetchStations()
    }

    // MARK: Private

    private let stationRepository: StationRepository
}

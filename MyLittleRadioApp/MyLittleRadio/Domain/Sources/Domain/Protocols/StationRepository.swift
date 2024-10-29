//
//  StationRepository.swift
//  Domain
//
//  Created by Saad El Oulladi on 27/10/2024.
//

// MARK: - StationRepository

public protocol StationRepository {
    func fetchStations() async throws -> [StationEntity]
}

//
//  FetchStationsUseCase+Dependency.swift
//  Domain
//
//  Created by Saad El Oulladi on 29/10/2024.
//

import Dependencies
import DependenciesMacros

// MARK: - fetchStationsUseCase

public extension DependencyValues {
    var fetchStationsUseCase: FetchStations {
        get { self[FetchStations.self] }
        set { self[FetchStations.self] = newValue }
    }
}

// MARK: - FetchStations + TestDependencyKey

extension FetchStations: TestDependencyKey {
    public static let previewValue = Self()
    public static let testValue = Self()
}

// MARK: - FetchStations

@DependencyClient
public struct FetchStations: Sendable {
    // MARK: Lifecycle

    public init(_ execute: @Sendable @escaping () async throws -> [StationEntity]) {
        self.execute = execute
    }

    // MARK: Public

    public var execute: @Sendable () async throws -> [StationEntity] = { [] }
}

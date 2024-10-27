//
//  Assembly.swift
//  MyLittleRadio
//
//  Created by Saad El Oulladi on 27/10/2024.
//

import Data
import Dependencies
import DependenciesMacros
import Domain

extension FetchStations: @retroactive DependencyKey {
    public static let liveValue: Self = .init(
        {
            try await FetchStationsUseCase(stationRepository: APIManager()).execute()
        }
    )
}

// Copyright © Radio France. All rights reserved.

import ComposableArchitecture
import Domain
import Foundation
import StationDetailsFeature
import SwiftUI

// MARK: StationsListFeature

@Reducer
public struct StationsListFeature {
    // MARK: Lifecycle

    public init() {}

    // MARK: Public

    @ObservableState
    public struct State: Equatable {
        // MARK: Lifecycle

        public init() {}

        // MARK: Internal

        var stations: [StationItemState] = []
        var path = StackState<StationDetailsFeature.State>()
        var loadingState: LoadingState = .none
    }

    public enum Action {
        case fetchStations
        case stationsFetched([StationEntity])
        case path(StackAction<StationDetailsFeature.State, StationDetailsFeature.Action>)
        case fetchFailure(Error)
    }

    // MARK: - Dependencies

    public var body: some ReducerOf<Self> {
        Reduce<State, Action> { state, action in
            switch action {
            case .fetchStations:
                guard state.loadingState != .fetched else {
                    return .none
                }
                state.loadingState = .loading
                return .run { send in
                    let stations = try await fetchStationsUseCase.execute()
                    await send(.stationsFetched(stations))
                } catch: { error, send in
                    await send(.fetchFailure(error))
                }

            case let .stationsFetched(stations):
                state.loadingState = .fetched
                state.stations = stations.compactMap(\.toState)
                return .none
            case .path:
                return .none
            case .fetchFailure:
                state.loadingState = .error
                return .none
            }
        }
        .forEach(\.path, action: \.path) {
            StationDetailsFeature()
        }
    }

    // MARK: Private

    // MARK: - Dependencies

    @Dependency(\.fetchStationsUseCase)
    private var fetchStationsUseCase
}

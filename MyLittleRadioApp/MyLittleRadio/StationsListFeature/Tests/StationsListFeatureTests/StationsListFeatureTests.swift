import ComposableArchitecture
import Domain
import Foundation
import MyLittlePlayer
import Testing
@testable import StationsListFeature

enum StationsListFeatureTests {
    @Suite
    struct FetchSuccess {
        @Test
        func test_fetchStations_success() async {
            let store = await TestStore(initialState: StationsListFeature.State()) {
                StationsListFeature()
            } withDependencies: {
                $0.fetchStationsUseCase.execute = { [.sampleFull] }
            }

            await store.send(\.fetchStations) {
                $0.loadingState = .loading
            }

            await store.receive(\.stationsFetched) {
                $0.stations = [.sampleFull]
                $0.loadingState = .fetched
            }
        }

        @Test
        func test_fetchStations_success_emptyList() async {
            let store = await TestStore(initialState: StationsListFeature.State()) {
                StationsListFeature()
            } withDependencies: {
                $0.fetchStationsUseCase.execute = { [] }
            }

            await store.send(\.fetchStations) {
                $0.loadingState = .loading
            }

            await store.receive(\.stationsFetched) {
                $0.stations = []
                $0.loadingState = .fetched
            }
        }
    }

    @Suite
    struct FetchFailure {
        @Test
        func test_fetchStations_failure() async {
            let store = await TestStore(initialState: StationsListFeature.State()) {
                StationsListFeature()
            } withDependencies: {
                $0.fetchStationsUseCase.execute = { throw NSError(domain: "", code: 401, userInfo: [NSLocalizedDescriptionKey: "Invalid access token"]) }
            }
            await store.send(\.fetchStations) {
                $0.loadingState = .loading
            }

            await store.receive(\.fetchFailure) {
                $0.loadingState = .error
            }
        }
    }
}

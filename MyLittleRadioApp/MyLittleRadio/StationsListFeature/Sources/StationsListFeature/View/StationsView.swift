// Copyright © Radio France. All rights reserved.

import ComposableArchitecture
import MyLittleDesignSystem
import StationDetailsFeature
import SwiftUI

// MARK: StationsView

public struct StationsView: View {
    // MARK: Lifecycle

    public init(store: StoreOf<StationsListFeature>) {
        self.store = store
    }

    // MARK: Public

    public var body: some View {
        WithPerceptionTracking {
            ZStack {
                switch store.loadingState {
                case .fetched:
                    stationsList
                case .loading:
                    VStack {
                        FrequencyLoaderView()
                        RFDSImage(source: .image(.radio),
                                  size: Constants.imageSize)
                    }
                case .error:
                    errorView
                default:
                    EmptyView()
                }
            }
        }.task {
            store.send(.fetchStations)
        }
    }

    // MARK: Private

    private enum Constants {
        static let imageSize: CGFloat = 100
    }

    @Perception.Bindable private var store: StoreOf<StationsListFeature>

    @ViewBuilder
    private var stationsList: some View {
        NavigationStack(path: $store.scope(state: \.path, action: \.path)) {
            List(store.stations) { station in
                StationLiveCellView(station: station)
                    .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .navigationTitle("My Little Radio")
        } destination: { store in
            StationDetailsView(store: store)
        }
    }

    @ViewBuilder
    private var errorView: some View {
        VStack(spacing: Spacing.small()) {
            Label {
                RFDSText("Something went wrong")
                    .font(.headline)
                    .foregroundColor(.primary)
            } icon: {
                Image(systemName: "wifi.exclamationmark")
                    .font(.largeTitle)
                    .foregroundColor(.red)
            }
            .padding(.bottom, Spacing.tiny())

            Button(action: {
                store.send(.fetchStations)
            }) {
                RFDSText("Try Again")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(Radius.small())
            }
            .padding(.horizontal, Spacing.medium())
        }
    }
}

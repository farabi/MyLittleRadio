// Copyright © Radio France. All rights reserved.

import ComposableArchitecture
import MyLittleDesignSystem
import StationDetailsFeature
import SwiftUI

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
                NavigationLink(state: StationDetailsFeature.State(station: .init(id: station.id,
                                                                                 title: station.title,
                                                                                 imageUrl: station.imageUrl,
                                                                                 streamUrl: station.streamUrl,
                                                                                 color: station.color),
                                                                  playState: .stopped)) {
                    StationLiveCellView(station: station)
                }
                .buttonStyle(.borderless)
            }
            .listStyle(.inset)
            .navigationTitle("My Little Radio")
            .tint(.red)
        } destination: { store in
            StationDetailsView(store: store)
        }.toolbarBackground(.red, for: .navigationBar)
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

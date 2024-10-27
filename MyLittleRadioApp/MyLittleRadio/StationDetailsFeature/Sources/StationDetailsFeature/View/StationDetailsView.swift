//
//  StationDetailsView.swift
//  MyLittleRadio
//
//  Created by Saad El Oulladi on 25/10/2024.
//

import ComposableArchitecture
import MyLittleDesignSystem
import SwiftUI

// MARK: - StationDetailsView

public struct StationDetailsView: View {
    // MARK: Lifecycle

    public init(store: StoreOf<StationDetailsFeature>) {
        self.store = store
    }

    // MARK: Public

    public var body: some View {
        WithPerceptionTracking {
            VStack {
                RFDSText(store.station.title, color: .white)
                    .font(.largeTitle)
                    .bold()
                    .padding(.top, Spacing.huge())
                    .shadow(radius: Radius.small())
                ZStack {
                    stationImage
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .blur(radius: Radius.medium())
                        .opacity(Constants.bluredStationImageOpacity)
                    stationImage
                        .frame(width: Constants.stationImageSize,
                               height: Constants.stationImageSize)
                        .shadow(radius: Radius.medium())
                }
                .frame(maxHeight: Constants.imageMaxHeight)
                VStack {
                    PlayerButton(state: $buttonState,
                                 foregroundColor: store.station.color) {
                        store.send(.togglePlayPause)
                    }
                }
                .padding(.bottom, Spacing.medium())
            }
            .frame(maxHeight: .infinity)
            .background(
                AnimatedMeshGradient(baseColor: store.station.color,
                                     isAnimating: $animateBackground)
                    .ignoresSafeArea()
            )
            .onChange(of: store.playState) {
                buttonState = $0.toPlayerButtonState
                animateBackground = $0 == .playing
            }
            .onAppear {
                store.send(.observeInitialState)
            }
        }
    }

    // MARK: Private

    private enum Constants {
        static let bluredStationImageOpacity = 0.4
        static let stationImageSize: CGFloat = 250
        static let imageMaxHeight: CGFloat = 500
    }

    @Perception.Bindable private var store: StoreOf<StationDetailsFeature>

    @State private var buttonState: PlayerButton.ButtonState = .stopped
    @State private var animateBackground = false

    @ViewBuilder
    private var stationImage: some View {
        RFDSImage(source: .asyncImage(store.station.imageUrl,
                                      Image.placeholder),
                  foregroundColor: .white)
    }
}

private extension StationDetailsFeature.State.PlayerState {
    var toPlayerButtonState: PlayerButton.ButtonState {
        switch self {
        case .stopped:
            return .stopped
        case .playing:
            return .playing
        case .loading:
            return .loading
        }
    }
}

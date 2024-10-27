//
//  StationDetailsFeature.swift
//  MyLittleRadio
//
//  Created by Saad El Oulladi on 25/10/2024.
//

import Combine
import ComposableArchitecture
import MyLittlePlayer

@Reducer
public struct StationDetailsFeature {
    // MARK: Lifecycle

    public init() {}

    // MARK: Public

    @ObservableState
    public struct State: Equatable {
        // MARK: Lifecycle

        public init(station: StationState, playState: PlayerState) {
            self.station = station
            self.playState = playState
        }

        // MARK: Internal

        let station: StationState
        var playState: PlayerState
    }

    public enum Action {
        case observeInitialState
        case updatePlayerState(PlayerState)
        case togglePlayPause
    }

    public var body: some ReducerOf<Self> {
        Reduce<State, Action> { state, action in
            switch action {
            case .observeInitialState:
                return .run { [currentUrl = state.station.streamUrl] send in
                    if let url = await player.playingUrl(),
                       url == currentUrl {
                        await send(.updatePlayerState(.playing(url)))
                    }
                }
            case let .updatePlayerState(playerState):
                state.playState = playerState.toStationDetailsState
                return .none
            case .togglePlayPause:
                switch state.playState {
                case .stopped:
                    return .run { [url = state.station.streamUrl] send in
                        for await state in await player.play(url) {
                            await send(.updatePlayerState(state))
                        }
                    }
                case .playing:
                    return .run { send in
                        await player.stop()
                        await send(.updatePlayerState(.stopped))
                    }
                case .loading:
                    return .none
                }
            }
        }
    }

    // MARK: Private

    @Dependency(\.myLittlePlayer)
    private var player
}

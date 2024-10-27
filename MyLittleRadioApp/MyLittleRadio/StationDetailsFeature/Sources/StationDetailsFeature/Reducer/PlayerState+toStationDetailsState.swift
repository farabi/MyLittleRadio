//
//  PlayerState+toStationDetailsState.swift
//  MyLittleRadio
//
//  Created by Saad El Oulladi on 26/10/2024.
//

import MyLittlePlayer

extension PlayerState {
    var toStationDetailsState: StationDetailsFeature.State.PlayerState {
        switch self {
        case .playing:
            .playing
        case .paused,
             .stopped:
            .stopped
        case .loading:
            .loading
        }
    }
}

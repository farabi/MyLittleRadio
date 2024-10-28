//
//  StationsListFeature.State.swift
//  MyLittleRadio
//
//  Created by Saad El Oulladi on 27/10/2024.
//

import Foundation
import StationDetailsFeature
import SwiftUI

// MARK: StationsListFeature.State

extension StationsListFeature.State {
    // MARK: LoadingState

    enum LoadingState {
        case none
        case loading
        case fetched
        case error
    }

    // MARK: StationItemState

    struct StationItemState: Equatable, Identifiable {
        let id: String
        let title: String
        let imageUrl: URL?
        let streamUrl: URL
        let color: Color

        var toDetails: StationDetailsFeature.State.StationState {
            .init(id: id,
                  title: title,
                  imageUrl: imageUrl,
                  streamUrl: streamUrl,
                  color: color)
        }
    }
}

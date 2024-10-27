//
//  StationsListFeature.State.swift
//  MyLittleRadio
//
//  Created by Saad El Oulladi on 27/10/2024.
//

import Foundation
import SwiftUI

extension StationsListFeature.State {
    enum LoadingState {
        case none
        case loading
        case fetched
        case error
    }

    struct StationItemState: Equatable, Identifiable {
        let id: String
        let title: String
        let imageUrl: URL?
        let streamUrl: URL
        let color: Color
    }
}

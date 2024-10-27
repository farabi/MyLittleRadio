//
//  StationEntity+toState.swift
//  MyLittleRadio
//
//  Created by Saad El Oulladi on 27/10/2024.
//

import Domain
import Foundation

extension StationEntity {
    var toState: StationsListFeature.State.StationItemState? {
        guard let streamUrl = URL(string: streamUrl) else {
            return nil
        }
        var imageUrl: URL?
        if let squareImageUrl {
            imageUrl = URL(string: squareImageUrl)
        }
        return .init(
            id: id,
            title: title,
            imageUrl: imageUrl,
            streamUrl: streamUrl,
            color: primaryColor.hexColor
        )
    }
}

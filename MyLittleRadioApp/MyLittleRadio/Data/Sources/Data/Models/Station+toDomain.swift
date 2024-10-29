//
//  Station+toDomain.swift
//  MyLittleRadio
//
//  Created by Saad El Oulladi on 26/10/2024.
//

import Domain

// MARK: Station + toDomain

extension Station {
    var toDomain: StationEntity {
        .init(
            id: id,
            title: title,
            streamUrl: streamUrl,
            primaryColor: colors.primary,
            squareImageUrl: assets?.squareImageUrl ?? ""
        )
    }
}

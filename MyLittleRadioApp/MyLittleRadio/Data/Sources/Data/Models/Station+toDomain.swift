//
//  Station+toDomain.swift
//  MyLittleRadio
//
//  Created by Saad El Oulladi on 26/10/2024.
//

import Domain

extension Station {
    var toDomain: StationEntity {
        StationEntity(
            id: id,
            title: title,
            streamUrl: streamUrl,
            primaryColor: colors.primary,
            squareImageUrl: assets?.squareImageUrl ?? ""
        )
    }
}

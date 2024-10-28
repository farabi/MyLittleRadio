//
//  StationEntity.swift
//  MyLittleRadio
//
//  Created by Saad El Oulladi on 26/10/2024.
//

import Foundation

// MARK: StationEntity

public struct StationEntity: Equatable, Identifiable {
    // MARK: Lifecycle

    public init(id: String, title: String, streamUrl: String, primaryColor: String, squareImageUrl: String?) {
        self.id = id
        self.title = title
        self.streamUrl = streamUrl
        self.primaryColor = primaryColor
        self.squareImageUrl = squareImageUrl
    }

    // MARK: Public

    public let id: String
    public let title: String
    public let streamUrl: String
    public let primaryColor: String
    public let squareImageUrl: String?
}

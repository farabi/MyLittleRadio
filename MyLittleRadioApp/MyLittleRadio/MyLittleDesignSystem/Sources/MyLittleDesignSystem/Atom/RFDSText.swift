//
//  RFDSText.swift
//  MyLittleDesignSystem
//
//  Created by Saad El Oulladi on 27/10/2024.
//

import SwiftUI

public struct RFDSText: View {
    // MARK: Lifecycle

    public init(
        _ text: String,
        color: Color? = nil,
        lineLimit: Int? = nil
    ) {
        self.text = text
        self.color = color
        self.lineLimit = lineLimit
    }

    // MARK: Public

    public var body: some View {
        Text(text)
            .foregroundColor(color)
            .lineLimit(lineLimit)
    }

    // MARK: Internal

    var text: String
    var color: Color?
    var lineLimit: Int?
}

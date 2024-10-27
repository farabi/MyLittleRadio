//
//  StationLiveCellView.swift
//  MyLittleRadio
//
//  Created by Saad El Oulladi on 25/10/2024.
//

import MyLittleDesignSystem
import SwiftUI

struct StationLiveCellView: View {
    // MARK: Internal

    let station: StationsListFeature.State.StationItemState

    var body: some View {
        ZStack {
            HStack(spacing: Spacing.small()) {
                RFDSImage(source: .asyncImage(station.imageUrl,
                                              Image.placeholder),
                          size: Constants.imageSize,
                          foregroundColor: .white)
                RFDSText(station.title)
                Spacer()
            }
        }
    }

    // MARK: Private

    private enum Constants {
        static let imageSize: CGFloat = 40
    }
}

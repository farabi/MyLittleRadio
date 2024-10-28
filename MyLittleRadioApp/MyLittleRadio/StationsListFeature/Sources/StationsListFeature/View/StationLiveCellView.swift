//
//  StationLiveCellView.swift
//  MyLittleRadio
//
//  Created by Saad El Oulladi on 25/10/2024.
//

import MyLittleDesignSystem
import StationDetailsFeature
import SwiftUI

// MARK: StationLiveCellView

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
                    .padding(Spacing.tiny())
                RFDSText(station.title, color: .white)
                    .bold()
                Spacer()
            }
            .background(gradient)
            .cornerRadius(Radius.small())
        }
    }

    // MARK: Private

    private enum Constants {
        static let imageSize: CGFloat = 60
    }

    @ViewBuilder
    private var gradient: some View {
        LinearGradient(gradient: Gradient(colors: [station.color.opacity(0.7),
                                                   station.color]),
                       startPoint: .top,
                       endPoint: .bottom)
            .background(navigationLink.opacity(.zero))
    }

    @ViewBuilder
    private var navigationLink: some View {
        NavigationLink(state: StationDetailsFeature.State(station: station.toDetails,
                                                          playState: .stopped)) {}
    }
}

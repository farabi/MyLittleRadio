//
//  FrequencyLoaderView.swift
//  MyLittleRadio
//
//  Created by Saad El Oulladi on 26/10/2024.
//

import SwiftUI

// MARK: - FrequencyLoaderView

public struct FrequencyLoaderView: View {
    // MARK: Lifecycle

    public init() {}

    // MARK: Public

    public var body: some View {
        HStack(spacing: Spacing.tiny()) {
            ForEach(0 ..< 5) { index in
                FrequencyBar(animatableData: animate ? CGFloat.random(in: 0.3 ... 1.0) : 0.5)
                    .frame(width: Constants.Bar.width,
                           height: Constants.Bar.height)
                    .animation(
                        .easeInOut(duration: Constants.animationDuration)
                            .repeatForever(autoreverses: true)
                            .delay(Double(index) * 0.1), value: animate
                    )
            }
        }
        .onAppear {
            animate = true
        }
    }

    // MARK: Private

    // MARK: Constants

    private enum Constants {
        enum Bar {
            static let width: CGFloat = 10
            static let height: CGFloat = 50
        }

        static let animationDuration: TimeInterval = 0.4
    }

    // MARK: Properties

    @State private var animate = false
}

// MARK: - FrequencyBar

private struct FrequencyBar: Shape {
    var animatableData: CGFloat

    func path(in rect: CGRect) -> Path {
        var path = Path()
        let height = rect.height * animatableData
        let yOffset = rect.height - height
        path.addRect(CGRect(x: 0,
                            y: yOffset,
                            width: rect.width,
                            height: height))
        return path
    }
}

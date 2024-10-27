//
//  FrequencyLoaderView.swift
//  MyLittleRadio
//
//  Created by Saad El Oulladi on 26/10/2024.
//

import SwiftUI

// MARK: - FrequencyBar

private struct FrequencyBar: Shape {
    var animatableData: CGFloat

    func path(in rect: CGRect) -> Path {
        var path = Path()
        let height = rect.height * animatableData
        let yOffset = rect.height - height
        path.addRect(CGRect(x: 0, y: yOffset, width: rect.width, height: height))
        return path
    }
}

// MARK: - FrequencyLoaderView

public struct FrequencyLoaderView: View {
    // MARK: Lifecycle

    public init() {}

    // MARK: Public

    public var body: some View {
        HStack(spacing: 8) {
            ForEach(0 ..< 5) { index in
                FrequencyBar(animatableData: animate ? CGFloat.random(in: 0.3 ... 1.0) : 0.5)
                    .frame(width: 10, height: 50)
                    .animation(
                        .easeInOut(duration: 0.4)
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

    @State private var animate = false
}

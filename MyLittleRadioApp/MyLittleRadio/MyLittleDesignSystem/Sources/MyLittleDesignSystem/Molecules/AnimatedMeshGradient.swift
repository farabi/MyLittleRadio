//
//  AnimatedMeshGradient.swift
//  MyLittleRadio
//
//  Created by Saad El Oulladi on 26/10/2024.
//

import SwiftUI

// MARK: AnimatedMeshGradient

/// I wanted to use Meshgradient, but it's iOS 18 min 😭😭😭
/// So i improvised this using RadialGradient
public struct AnimatedMeshGradient: View {
    // MARK: Lifecycle

    public init(baseColor: Color, isAnimating: Binding<Bool>, animate: Bool = false) {
        self.baseColor = baseColor
        _isAnimating = isAnimating
        self.animate = animate
    }

    // MARK: Public

    public var body: some View {
        ZStack {
            radialHalo(.topLeading, .bottomTrailing)
            radialHalo(.bottomTrailing, .topLeading)
            angularGradient
        }
        .blur(radius: Radius.large())
        .foregroundColor(baseColor)
        .onChange(of: isAnimating) { newValue in
            if newValue {
                startAnimation()
            }
        }
        .onAppear {
            if isAnimating {
                startAnimation()
            }
        }
    }

    // MARK: Private

    // MARK: Properties

    private let baseColor: Color
    @Binding private var isAnimating: Bool
    @State private var animate = false

    @ViewBuilder
    private var angularGradient: some View {
        AngularGradient(
            gradient: Gradient(colors: [
                .white.opacity(0.2),
                baseColor.opacity(0.6),
                baseColor.opacity(0.7)
            ]),
            center: .center
        )
        .blur(radius: Radius.large())
        .blendMode(.softLight)
    }

    private func startAnimation() {
        withAnimation(
            .easeInOut(duration: 5)
                .repeatForever(autoreverses: true)
        ) {
            animate.toggle()
        }
    }

    // MARK: ViewBuilders

    @ViewBuilder
    private func radialHalo(_ from: UnitPoint, _ to: UnitPoint) -> some View {
        RadialGradient(
            gradient: Gradient(colors: [
                baseColor.opacity(0.5),
                .white.opacity(0.1),
                baseColor.opacity(0.7)
            ]),
            center: animate ? from : to,
            startRadius: animate ? 200 : 100,
            endRadius: animate ? 300 : 400
        )
        .blendMode(.overlay)
    }
}

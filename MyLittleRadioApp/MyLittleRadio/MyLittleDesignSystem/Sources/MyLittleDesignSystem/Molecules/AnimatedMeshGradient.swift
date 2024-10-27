//
//  AnimatedMeshGradient.swift
//  MyLittleRadio
//
//  Created by Saad El Oulladi on 26/10/2024.
//

import SwiftUI

/// I wanted to use Meshgradient, but it's iOS 18 min 😭😭😭 so i improvised this using RadialGradient
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
            RadialGradient(
                gradient: Gradient(colors: [
                    baseColor.opacity(0.8),
                    .white.opacity(0.3),
                    baseColor.opacity(0.7)
                ]),
                center: animate ? .topLeading : .bottomTrailing,
                startRadius: animate ? 100 : 200,
                endRadius: animate ? 400 : 300
            )

            RadialGradient(
                gradient: Gradient(colors: [
                    baseColor.opacity(0.5),
                    .white.opacity(0.1),
                    baseColor.opacity(0.7)
                ]),
                center: animate ? .bottomTrailing : .topLeading,
                startRadius: animate ? 200 : 100,
                endRadius: animate ? 300 : 400
            )
            .blendMode(.overlay)

            AngularGradient(
                gradient: Gradient(colors: [
                    .white.opacity(0.2),
                    baseColor.opacity(0.6),
                    baseColor.opacity(0.7)
                ]),
                center: .center
            )
            .blur(radius: 30)
            .blendMode(.softLight)
        }
        .blur(radius: 20)
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

    // MARK: Internal

    let baseColor: Color
    @Binding var isAnimating: Bool

    // MARK: Private

    @State private var animate = false

    private func startAnimation() {
        withAnimation(
            .easeInOut(duration: 5)
                .repeatForever(autoreverses: true)
        ) {
            animate.toggle()
        }
    }
}

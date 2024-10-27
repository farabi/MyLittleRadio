//
//  PlayerButton.swift
//  MyLittleRadio
//
//  Created by Saad El Oulladi on 26/10/2024.
//

import SwiftUI

public struct PlayerButton: View {
    // MARK: Lifecycle

    public init(state: Binding<ButtonState>,
                foregroundColor: Color,
                action: @escaping () -> Void) {
        _state = state
        self.foregroundColor = foregroundColor
        self.action = action
    }

    // MARK: Public

    public enum ButtonState {
        case stopped
        case playing
        case loading
    }

    public var body: some View {
        Button(action: {
            action()
            animateBounce()
        }) {
            content
                .foregroundColor(.white)
                .padding(Spacing.medium())
                .background(backgroundCircle)
                .scaleEffect(scale)
                .animation(.easeInOut(duration: 0.2), value: scale)
        }
        .buttonStyle(PlainButtonStyle())
    }

    // MARK: Internal

    @Binding var state: ButtonState
    var foregroundColor: Color
    var action: () -> Void

    // MARK: Private

    @State private var scale: CGFloat = 1.0

    @ViewBuilder
    private var content: some View {
        switch state {
        case .playing:
            Image(systemName: "pause.fill")
                .font(.system(size: 30))
                .transition(.scale(scale: 0.1, anchor: .center).combined(with: .opacity))
        case .loading:
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .white))
                .scaleEffect(1.2)
                .transition(.opacity.animation(.easeInOut(duration: 0.3)))
        case .stopped:
            Image(systemName: "play.fill")
                .font(.system(size: 30))
                .transition(.scale(scale: 1.5).combined(with: .opacity))
        }
    }

    private var backgroundCircle: some View {
        Circle()
            .fill(foregroundColor)
            .frame(width: 80, height: 80)
            .shadow(radius: 10)
            .transition(.scale(scale: 1.2).combined(with: .opacity))
    }

    private func animateBounce() {
        withAnimation(.spring(response: 0.2, dampingFraction: 0.5, blendDuration: 0)) {
            scale = 1.2
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            withAnimation {
                scale = 1.0
            }
        }
    }
}

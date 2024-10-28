// Copyright © Radio France. All rights reserved.

import ComposableArchitecture
import Dependencies
import StationsListFeature
import SwiftUI

// MARK: MyLittleRadioApp

@main
struct MyLittleRadioApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                StationsView(
                    store: Store(
                        initialState: .init()) {
                            StationsListFeature()
                        }
                )
            }
        }
    }
}

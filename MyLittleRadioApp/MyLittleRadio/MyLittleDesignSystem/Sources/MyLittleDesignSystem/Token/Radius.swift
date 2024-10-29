//
//  Radius.swift
//  MyLittleRadio
//
//  Created by Saad El Oulladi on 26/10/2024.
//

import Foundation

// MARK: Radius

public enum Radius: CGFloat, CaseIterable {
    /// No radius (0 pt)
    case none = 0
    /// Tiny radius (2 pts)
    case tiny = 2
    /// Semi-small radius (4 pts)
    case semismall = 4
    /// Small radius (8 pts)
    case small = 8
    /// Medium radius (16 pts)
    case medium = 16
    /// Large radius (32 pts)
    case large = 32
    /// xLarge radius (48 pts)
    case xLarge = 48
    /// Full radius (100 pts)
    case full = 100

    // MARK: Public

    public func callAsFunction() -> CGFloat {
        rawValue
    }
}

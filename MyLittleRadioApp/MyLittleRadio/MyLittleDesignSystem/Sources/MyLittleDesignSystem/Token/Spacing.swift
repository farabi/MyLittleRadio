//
//  Spacing.swift
//  MyLittleRadio
//
//  Created by Saad El Oulladi on 25/10/2024.
//

import Foundation

// MARK: Spacing

public enum Spacing: CGFloat, CaseIterable {
    /// No spacing (0 pt)
    case none = 0
    /// xtiny spacing (4 pts)
    case xtiny = 4
    /// Tiny spacing (8 pts)
    case tiny = 8
    /// Small spacing (16 pts)
    case small = 16
    /// Medium spacing (24 pts)
    case medium = 24
    /// Large spacing (32 pts)
    case large = 32
    /// Huge spacing (40 pts)
    case huge = 40
    /// xhuge spacing (48 pts)
    case xhuge = 48
    /// Massive spacing (64 pts)
    case massive = 64
    /// xmassive spacing (80 pts)
    case xmassive = 80

    // MARK: Public

    public func callAsFunction() -> CGFloat {
        rawValue
    }
}

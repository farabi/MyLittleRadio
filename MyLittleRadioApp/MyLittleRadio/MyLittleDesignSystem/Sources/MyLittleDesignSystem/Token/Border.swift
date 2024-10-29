//
//  Border.swift
//  MyLittleRadio
//
//  Created by Saad El Oulladi on 25/10/2024.
//

import Foundation

// MARK: CopiloteBorder

public enum CopiloteBorder: CGFloat, CaseIterable {
    /// No border (0 pt)
    case none = 0
    /// Tiny border (1 pt)
    case tiny = 1
    /// Small border (2 pts)
    case small = 2
    /// Medium border (3 pts)
    case medium = 3
    /// Large border (4 pts)
    case large = 4
    /// xLarge border (5 pts)
    case xLarge = 5
    /// xxLarge border (6 pts)
    case xxLarge = 6
    /// huge border (9 pts)
    case huge = 9

    // MARK: Public

    public func callAsFunction() -> CGFloat {
        rawValue
    }
}

//
//  String+hexColor.swift
//  MyLittleRadio
//
//  Created by Saad El Oulladi on 25/10/2024.
//

import SwiftUI

extension String {
    var hexColor: Color {
        var cString = trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if cString.hasPrefix("#") {
            cString.removeFirst()
        }
        if cString.count != 6 {
            return .white
        }
        var rgbValue: UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        return Color(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                     green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                     blue: CGFloat(rgbValue & 0x0000FF) / 255.0)
    }
}

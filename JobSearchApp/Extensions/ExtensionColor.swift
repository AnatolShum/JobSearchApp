//
//  ExtensionColor.swift
//  JobSearchApp
//
//  Created by Anatolii Shumov on 13.03.2024.
//

import Foundation
import SwiftUI

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: Int64 = 0
        
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: Int64
        
        switch hex.count {
        case 3:
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6:
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8:
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        
        self.init(
            .sRGB,
            red: Double(r) / 255.0,
            green: Double(g) / 255.0,
            blue: Double(b) / 255.0,
            opacity: Double(a) / 255.0
        )
    }
    
    static let grey1 = Color(hex: "#222325")
    static let grey2 = Color(hex: "#313234")
    static let grey3 = Color(hex: "#858688")
    static let grey4 = Color(hex: "#9F9F9F")
    static let specialDarkBlue = Color(hex: "#00427D")
    static let specialGreen = Color(hex: "#4CB24E")
}

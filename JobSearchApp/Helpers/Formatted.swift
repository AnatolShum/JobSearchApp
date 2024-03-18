//
//  Helpers.swift
//  JobSearchApp
//
//  Created by Anatolii Shumov on 18.03.2024.
//

import Foundation

class Formatted {
    static let shared = Formatted()
    
    func formattedPeople(_ lookingNumber: Int) -> String {
        switch lookingNumber % 10 {
        case 2, 3, 4:
            return "человека"
        default:
            return "человек"
        }
    }
}

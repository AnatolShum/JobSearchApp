//
//  Response.swift
//  JobSearchApp
//
//  Created by Anatolii Shumov on 13.03.2024.
//

import Foundation
import SwiftData

extension Network {
    enum Response {
        struct Offers: Codable {
            let offers: [Offer]
        }
        
        struct Vacancies: Codable {
            let vacancies: [Vacancy]
        }
    }
}

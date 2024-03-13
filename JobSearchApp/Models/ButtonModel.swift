//
//  ButtonModel.swift
//  JobSearchApp
//
//  Created by Anatolii Shumov on 13.03.2024.
//

import Foundation

struct ButtonModel: Codable {
    let title: String
    
    enum CodingKeys: String, CodingKey {
        case title = "text"
    }
}

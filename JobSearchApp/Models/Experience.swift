//
//  Experience.swift
//  JobSearchApp
//
//  Created by Anatolii Shumov on 13.03.2024.
//

import Foundation

struct Experience: Codable {
    let preview: String
    let filter: String
    
    enum CodingKeys: String, CodingKey {
        case preview = "previewText"
        case filter = "text"
    }
    
}

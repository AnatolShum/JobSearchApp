//
//  Experience.swift
//  JobSearchApp
//
//  Created by Anatolii Shumov on 13.03.2024.
//

import Foundation

struct Experience: Codable {
    var previewText: String
    var text: String
    
    init(previewText: String, text: String) {
        self.previewText = previewText
        self.text = text
    }
    
    enum CodingKeys: CodingKey {
        case previewText
        case text
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.previewText = try container.decode(String.self, forKey: .previewText)
        self.text = try container.decode(String.self, forKey: .text)
    }
}

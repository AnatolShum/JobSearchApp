//
//  Salary.swift
//  JobSearchApp
//
//  Created by Anatolii Shumov on 13.03.2024.
//

import Foundation

struct Salary: Codable {
    var short: String?
    var full: String
    
    init(short: String? = nil, full: String) {
        self.short = short
        self.full = full
    }
    
    enum CodingKeys: CodingKey {
        case short
        case full
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.short = try container.decodeIfPresent(String.self, forKey: .short)
        self.full = try container.decode(String.self, forKey: .full)
    }
}

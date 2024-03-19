//
//  Address.swift
//  JobSearchApp
//
//  Created by Anatolii Shumov on 13.03.2024.
//

import Foundation

struct Address: Codable {
    var town: String
    var street: String
    var house: String
    
    init(town: String, street: String, house: String) {
        self.town = town
        self.street = street
        self.house = house
    }
    
    enum CodingKeys: CodingKey {
        case town
        case street
        case house
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.town = try container.decode(String.self, forKey: .town)
        self.street = try container.decode(String.self, forKey: .street)
        self.house = try container.decode(String.self, forKey: .house)
    }
}

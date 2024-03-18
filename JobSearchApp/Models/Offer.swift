//
//  Offer.swift
//  JobSearchApp
//
//  Created by Anatolii Shumov on 13.03.2024.
//

import Foundation

struct Offer: Codable {
    let id: String?
    let title: String
    let button: ButtonModel?
    let link: String
}

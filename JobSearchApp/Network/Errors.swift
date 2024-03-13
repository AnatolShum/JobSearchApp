//
//  Errors.swift
//  JobSearchApp
//
//  Created by Anatolii Shumov on 13.03.2024.
//

import Foundation

extension Network {
    enum NetworkErrors: Error, LocalizedError {
        case urlNotFound
        case responseError
        case couldNotDecodeData
        case couldNotFetchData
        case dataTaskError
    }
}

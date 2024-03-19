//
//  EnterData.swift
//  JobSearchApp
//
//  Created by Anatolii Shumov on 14.03.2024.
//

import Foundation

enum CurrentView {
    case firstEntry
    case secondEntry(String)
    case tabView
    
    var email: String? {
        if case .secondEntry(let email) = self {
            return email
        } else {
            return nil
        }
    }
}

class EnterData: ObservableObject {
    @Published var currentView: CurrentView = .firstEntry
    @Published var isLoggedIn: Bool = false
}

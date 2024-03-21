//
//  TabViewViewModel.swift
//  JobSearchApp
//
//  Created by Anatolii Shumov on 21.03.2024.
//

import Foundation
import Combine

class TabViewViewModel: ObservableObject {
    @Published var badge: Int = 0
    
    var formattedBadge: String? {
        if badge > 99 {
            return "99+"
        } else if badge == 0 {
            return nil
        } else {
            return badge.description
        }
    }
    
    private var cancellable = Set<AnyCancellable>()
    
    init() {
        badgePublisher
            .receive(on: DispatchQueue.main)
            .assign(to: \.badge, on: self)
            .store(in: &cancellable)
    }
}

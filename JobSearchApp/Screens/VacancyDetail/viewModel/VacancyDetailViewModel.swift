//
//  VacancyDetailViewModel.swift
//  JobSearchApp
//
//  Created by Anatolii Shumov on 18.03.2024.
//

import Foundation

class VacancyDetailViewModel: ObservableObject {
    @Published var isFavourite: Bool = false
    
    func toggleFavourite() {
        isFavourite.toggle()
    }
    
    func formattedSchedules(_ schedules: [String]) -> String {
        guard !schedules.isEmpty else { return "" }
        let string = schedules.joined(separator: ", ")
        return string.prefix(1).uppercased() + string.dropFirst()
    }
    
    func formattedPeople(_ lookingNumber: Int) -> String {
        Formatted.shared.formattedPeople(lookingNumber)
    }
    
    func formattedAddress(_ address: Address) -> String {
        return "\(address.town), \(address.street), \(address.house)"
    }
}

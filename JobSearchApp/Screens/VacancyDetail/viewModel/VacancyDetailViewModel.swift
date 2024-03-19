//
//  VacancyDetailViewModel.swift
//  JobSearchApp
//
//  Created by Anatolii Shumov on 18.03.2024.
//

import Foundation

class VacancyDetailViewModel: ObservableObject {
    @Published var isFavourite: Bool = false
    private let vacancy: Vacancy
    private var favouriteManager: FavouriteManager
    
    init(vacancy: Vacancy) {
        self.vacancy = vacancy
        self.favouriteManager = FavouriteManager(vacancy: vacancy)
        self.favouriteManager.checkFavourite()
        self.isFavourite = favouriteManager.isFavourite
    }
    
    func toggleFavourite() {
        isFavourite.toggle()
        favouriteManager.toggleFavourite(newValue: isFavourite)
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

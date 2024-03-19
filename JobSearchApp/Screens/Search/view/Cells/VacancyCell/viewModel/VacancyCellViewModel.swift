//
//  VacancyCellViewModel.swift
//  JobSearchApp
//
//  Created by Anatolii Shumov on 18.03.2024.
//

import Foundation
import SwiftUI
import SwiftData

class VacancyCellViewModel: ObservableObject {
    private let vacancy: Vacancy
    private var favouriteManager: FavouriteManager
    @Published var isFavourite: Bool = false
    
    var heartColor: Color {
        return isFavourite ? Color.specialBlue : Color.grey4
    }
    var imageName: String {
        return isFavourite ? "heart.fill" : "heart"
    }
    
    init(vacancy: Vacancy) {
        self.vacancy = vacancy
        self.favouriteManager = FavouriteManager(vacancy: vacancy)
        self.favouriteManager.checkFavourite()
        self.isFavourite = favouriteManager.isFavourite
    }
    
    func formattedPeople(_ lookingNumber: Int) -> String {
        Formatted.shared.formattedPeople(lookingNumber)
    }
    
    func formattedDate(_ publishedDate: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        guard let publishedDate = dateFormatter.date(from: publishedDate) else { return "N/A" }
        let day = Calendar.current.component(.day, from: publishedDate)
        let month = Calendar.current.component(.month, from: publishedDate)
        let monthName: String
        switch month {
        case 1:
            monthName = "января"
        case 2:
            monthName = "февраля"
        case 3:
            monthName = "марта"
        case 4:
            monthName = "апреля"
        case 5:
            monthName = "мая"
        case 6:
            monthName = "июня"
        case 7:
            monthName = "июля"
        case 8:
            monthName = "августа"
        case 9:
            monthName = "сентября"
        case 10:
            monthName = "октября"
        case 11:
            monthName = "ноября"
        case 12:
            monthName = "декабря"
        default:
            monthName = "N/A"
        }
        
        return "\(day) \(monthName)"
    }
    
    func toggleFavourite() {
        isFavourite.toggle()
        favouriteManager.toggleFavourite(newValue: isFavourite)
    }
}

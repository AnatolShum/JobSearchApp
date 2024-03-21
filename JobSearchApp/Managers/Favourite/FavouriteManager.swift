//
//  FavouriteManager.swift
//  JobSearchApp
//
//  Created by Anatolii Shumov on 19.03.2024.
//

import Foundation
import SwiftData
import Combine

class FavouriteManager: ObservableObject {
    let vacancy: Vacancy
    @Published var isFavourite: Bool = false
    
    init(vacancy: Vacancy) {
        self.vacancy = vacancy
    }
    
    func checkFavourite() {
        let predicate = #Predicate<Vacancy> { $0.id == vacancy.id }
        let descriptor = FetchDescriptor<Vacancy>(predicate: predicate)
        DataManager.shared.fetchVacancies(descriptor: descriptor, completion: { [weak self] result in
            switch result {
            case .success(let vacancies):
                guard let vacancies else {
                    self?.isFavourite = false
                    return }
                if let exist = vacancies.first {
                    self?.isFavourite = exist.isFavorite
                } else {
                    self?.isFavourite = false
                }
            case .failure(let error):
                print(error)
                self?.isFavourite = false
            }
        })
    }
    
    func toggleFavourite(newValue: Bool) {
        isFavourite = newValue
        DataManager.shared.updateFavourite(vacancy, newValue: newValue)
        favouritePublisher.send()
    }
}

//
//  FavouriteManager.swift
//  JobSearchApp
//
//  Created by Anatolii Shumov on 19.03.2024.
//

import Foundation
import SwiftData

class FavouriteManager: ObservableObject {
    let vacancy: Vacancy
    @Published var isFavourite: Bool = false
    private var dataManager: DataManager?
    
    init(vacancy: Vacancy) {
        self.vacancy = vacancy
    }
    
    func checkFavourite() {
        dataManager = DataManager()
        let predicate = #Predicate<Vacancy> { $0.id == vacancy.id }
        let descriptor = FetchDescriptor<Vacancy>(predicate: predicate)
        dataManager?.fetchVacancies(vacancy, descriptor: descriptor, completion: { [weak self] result in
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
        dataManager = DataManager()
        isFavourite = newValue
        dataManager?.updateFavourite(vacancy, newValue: newValue)
    }
}

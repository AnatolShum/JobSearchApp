//
//  SearchViewModel.swift
//  JobSearchApp
//
//  Created by Anatolii Shumov on 13.03.2024.
//

import Foundation
import Combine
import SwiftData

class SearchViewModel: ObservableObject {
    @Published var offers: [Offer] = []
    @Published var showAlert: Bool = false
    @Published var errorMessage: String = ""
    
    private var cancellable = Set<AnyCancellable>()
    
    init() {
        fetchOffers()
        fetchVacancies()
        
        favouritePublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                    self?.checkFavourite()
                }
            }
            .store(in: &cancellable)
    }
    
    func formatVacancy(_ vacancies: [Vacancy]) -> String {
        Formatted.shared.formatVacancy(vacancies)
    }
    
    func fetchOffers() {
        Network.shared.fetch()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] result in
                switch result {
                case .finished:
                    break
                case .failure(let error):
                    self?.errorMessage = "Could not fetch offers \(error.localizedDescription)"
                    self?.showAlert = true
                }
            }, receiveValue: { [weak self] (data: Network.Response.Offers) in
                let offers = data.offers.compactMap { (offer: Offer) -> Offer? in
                    return offer.id != nil ? offer : nil
                }
                self?.offers = offers
            })
            .store(in: &cancellable)
    }
    
    func fetchVacancies() {
        Network.shared.fetch()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] result in
                switch result {
                case .finished:
                    break
                case .failure(let error):
                    self?.errorMessage = "Could not fetch vacancies \(error)"
                    self?.showAlert = true
                }
            }, receiveValue: { (data: Network.Response.Vacancies) in
                DataManager.shared.insertModel(models: data.vacancies)
            })
            .store(in: &cancellable)
    }
    
    func checkFavourite() {
        let predicate = #Predicate<Vacancy> { $0.isFavorite == true }
        let descriptor = FetchDescriptor<Vacancy>(predicate: predicate)
        DataManager.shared.fetchVacancies(descriptor: descriptor, completion: { result in
            switch result {
            case .success(let vacancies):
                badgePublisher.send(vacancies?.count ?? 0)
            case .failure(let error):
                print("Could not fetch data \(error)")
            }
        })
    }
}

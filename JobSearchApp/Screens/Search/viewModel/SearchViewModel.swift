//
//  SearchViewModel.swift
//  JobSearchApp
//
//  Created by Anatolii Shumov on 13.03.2024.
//

import Foundation
import Combine

class SearchViewModel: ObservableObject {
    @Published var offers: [Offer] = []
    @Published var vacancies: [Vacancy] = []
    @Published var showAlert: Bool = false
    @Published var errorMessage: String = ""
    
    private var cancellable = Set<AnyCancellable>()
    
    init() {
        fetchOffers()
        fetchVacancies()
    }
    
    func formatVacancy() -> String {
        switch vacancies.count % 10 {
        case 1:
            return "вакансия"
        case 2, 3, 4:
            return "вакансии"
        default:
            return "вакансий"
        }
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
                    self?.errorMessage = "Could not fetch vacancies \(error.localizedDescription)"
                    self?.showAlert = true
                }
            }, receiveValue: { [weak self] (data: Network.Response.Vacancies) in
                self?.vacancies = Array(data.vacancies.prefix(3))
            })
            .store(in: &cancellable)
    }
}

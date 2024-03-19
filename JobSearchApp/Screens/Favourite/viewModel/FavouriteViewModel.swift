//
//  FavouriteViewModel.swift
//  JobSearchApp
//
//  Created by Anatolii Shumov on 13.03.2024.
//

import Foundation

class FavouriteViewModel: ObservableObject {
   
    func formatVacancy(_ vacancies: [Vacancy]) -> String {
        Formatted.shared.formatVacancy(vacancies)
    }
}

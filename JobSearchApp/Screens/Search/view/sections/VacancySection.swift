//
//  VacancySection.swift
//  JobSearchApp
//
//  Created by Anatolii Shumov on 18.03.2024.
//

import SwiftUI

struct VacancySection: View {
    let columns: [GridItem]
    let moreButtonTitle: String
    @Binding var vacancies: [Vacancy]
    
    var body: some View {
        Section {
            ScrollView(.vertical) {
                LazyVGrid(columns: columns) {
                    ForEach(vacancies, id: \.id) { vacancy in
                        NavigationLink {
                            VacancyDetailView(vacancy: vacancy)
                        } label: {
                            VacancyCellView(vacancy: vacancy)
                        }
                    }
                    
                    ButtonCorner(title: moreButtonTitle, color: .specialBlue, cornerRadius: 8, font: .specialButtonText1) {
                        print("More vacancies")
                    }
                    .frame(height: 48)
                }
            }
            .scrollIndicators(.never)
        }
    }
}

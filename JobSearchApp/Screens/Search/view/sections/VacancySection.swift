//
//  VacancySection.swift
//  JobSearchApp
//
//  Created by Anatolii Shumov on 18.03.2024.
//

import SwiftUI
import SwiftData

struct VacancySection: View {
    let columns: [GridItem]
    let moreButtonTitle: String
    static var descriptor: FetchDescriptor<Vacancy> {
        var descriptor = FetchDescriptor<Vacancy>(sortBy: [SortDescriptor(\Vacancy.publishedDate, order: .reverse)])
        descriptor.fetchLimit = 3
        return descriptor
    }

    @Query(descriptor) private var vacancies: [Vacancy]
    
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

//
//  SearchView.swift
//  JobSearchApp
//
//  Created by Anatolii Shumov on 13.03.2024.
//

import SwiftUI
import SwiftData

struct SearchView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Vacancy.publishedDate, order: .reverse) private var vacancies: [Vacancy]
    @StateObject private var viewModel = SearchViewModel()
    
    private let rows = [GridItem(.fixed(120), spacing: 8, alignment: .topLeading)]
    private let columns = [GridItem(.flexible(), spacing: 8, alignment: .top)]
    
    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundColorView()
                
                VStack {
                    SearchSection()
                        .padding(.bottom, 16)
                    
                    ScrollView {
                        OfferSection(rows: rows, offers: $viewModel.offers)
                            .frame(height: 120)
                            .padding(EdgeInsets(top: 0, leading: 9, bottom: 32, trailing: 0))
                        
                        HStack {
                            Text("Вакансии для вас")
                                .font(Font.system(size: 20, weight: .semibold))
                                .foregroundStyle(.white)
                            Spacer()
                        }
                        .padding(.horizontal, 16)
                        .padding(.bottom, 16)
                        
                        VacancySection(
                            columns: columns,
                            moreButtonTitle: "Еще \(vacancies.count) \(viewModel.formatVacancy(vacancies))")
                        .padding(.horizontal, 16)
                    }
                }
            }
        }
        .onAppear {
            viewModel.checkFavourite()
        }
        .onChange(of: vacancies, {
            viewModel.checkFavourite()
        })
        .alert(viewModel.errorMessage, isPresented: $viewModel.showAlert) {
            Button("OK", role: .cancel) {
                viewModel.showAlert = false
                viewModel.errorMessage = ""
            }
        }
    }
}

#Preview {
    SearchView()
}

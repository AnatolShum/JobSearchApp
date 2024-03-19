//
//  FavouriteView.swift
//  JobSearchApp
//
//  Created by Anatolii Shumov on 13.03.2024.
//

import SwiftUI
import SwiftData

struct FavouriteView: View {
    @ObservedObject private var viewModel = FavouriteViewModel()
    @Query(filter: #Predicate<Vacancy> { $0.isFavorite == true }) private var favourites: [Vacancy]
    private let columns = [GridItem(.flexible(), spacing: 8, alignment: .top)]
    
    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundColorView()
                
                VStack(alignment: .leading, spacing: 16) {
                    Text("Избранное")
                        .font(.specialTitle2)
                        .padding(.bottom, 8)
                    
                    Text("\(favourites.count) \(viewModel.formatVacancy(favourites))")
                        .font(.specialText1)
                        .foregroundStyle(Color.grey3)
                    
                    ScrollView {
                        LazyVGrid(columns: columns) {
                            ForEach(favourites) { vacancy in
                                NavigationLink {
                                    VacancyDetailView(vacancy: vacancy)
                                } label: {
                                    VacancyCellView(vacancy: vacancy)
                                }
                            }
                        }
                    }
                    .scrollIndicators(.never)
                }
                .foregroundStyle(Color.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 16)
            }
        }
    }
}

#Preview {
    FavouriteView()
}

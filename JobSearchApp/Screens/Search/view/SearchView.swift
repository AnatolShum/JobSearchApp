//
//  SearchView.swift
//  JobSearchApp
//
//  Created by Anatolii Shumov on 13.03.2024.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject private var viewModel = SearchViewModel()
    private let rows = [GridItem(.fixed(120), spacing: 8, alignment: .topLeading)]
    
    let str = [1, 2, 3]
    
    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundColorView()
                
                VStack {
                    SearchSection()
                        .padding(.bottom, 16)
                    
                    Section {
                        ScrollView(.horizontal) {
                            LazyHGrid(rows: rows, content: {
                                ForEach(str, id: \.self) { _ in
//                                    OfferCellView()
//                                        .frame(width: 132)
                                }
                            })
                        }
                    }
                    .background(Color.gray)
                    .padding(.bottom, 32)
                    
                    HStack {
                        Text("Вакансии для вас")
                            .font(Font.system(size: 20, weight: .semibold))
                            .foregroundStyle(.white)
                        Spacer()
                    }
                    
                    Spacer()
                }
               
            }
        }
    }
}

#Preview {
    SearchView()
}

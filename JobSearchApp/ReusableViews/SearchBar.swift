//
//  SearchBar.swift
//  JobSearchApp
//
//  Created by Anatolii Shumov on 14.03.2024.
//

import SwiftUI

struct SearchBar: View {
    @State var searchQuery: String = ""
    @State private var isEditing: Bool = false
    
    var body: some View {
        HStack(spacing: 7) {
            ZStack {
                HStack {
                    Image("searchIcon")
                        .renderingMode(.template)
                        .frame(width: 24, height: 24)
                    
                    TextField("", text: $searchQuery,
                              prompt: Text("Должность, ключевые слова")
                        .font(.specialText1)
                        .foregroundStyle(Color.grey4)
                        
                    )
                }
                .foregroundStyle(Color.grey4)
                .frame(height: 40)
                .padding(.horizontal, 8)
                
            }
            .background(Color.grey2)
            .clipShape(.rect(cornerRadius: 8))
        
            Button(action: {
                print("filter")
            }, label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundStyle(Color.grey2)
                        .frame(width: 40, height: 40)
                    
                    Image("union")
                        .renderingMode(.template)
                        .frame(width: 24, height: 24)
                        .foregroundStyle(.white)
                }
            })
        }
    }
}

#Preview {
    SearchBar()
}

//
//  FavouriteButtonView.swift
//  JobSearchApp
//
//  Created by Anatolii Shumov on 18.03.2024.
//

import SwiftUI

struct FavouriteButtonView: View {
    let action: () -> Void
    let color: Color
    let colorFill: Color
    @Binding var isFavourite: Bool
    
    private var name: String {
        return isFavourite ? "heart.fill" : "heart"
    }
    
    private var favouriteColor: Color {
        return isFavourite ? colorFill : color
    }
    
    var body: some View {
        Button(action: {
            action()
        }, label: {
            Image(systemName: name)
                .resizable()
                .renderingMode(.template)
                .foregroundStyle(favouriteColor)
                .scaledToFill()
                .frame(width: 20, height: 18)
        })
    }
}

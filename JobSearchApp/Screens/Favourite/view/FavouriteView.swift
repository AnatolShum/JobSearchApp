//
//  FavouriteView.swift
//  JobSearchApp
//
//  Created by Anatolii Shumov on 13.03.2024.
//

import SwiftUI

struct FavouriteView: View {
    @ObservedObject private var viewModel = FavouriteViewModel()
    
    var body: some View {
        Text("Favourite view")
    }
}

#Preview {
    FavouriteView()
}

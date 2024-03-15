//
//  SearchSection.swift
//  JobSearchApp
//
//  Created by Anatolii Shumov on 15.03.2024.
//

import SwiftUI

struct SearchSection: View {
    var body: some View {
        Section {
            SearchBar()
        }
        .padding(.horizontal, 17)
    }
}

#Preview {
    SearchSection()
}

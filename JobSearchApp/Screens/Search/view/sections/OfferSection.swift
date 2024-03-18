//
//  OfferSection.swift
//  JobSearchApp
//
//  Created by Anatolii Shumov on 18.03.2024.
//

import SwiftUI

struct OfferSection: View {
    let rows: [GridItem]
    @Binding var offers: [Offer]
    
    var body: some View {
        Section {
            ScrollView(.horizontal) {
                LazyHGrid(rows: rows) {
                    ForEach(offers, id: \.id) { offer in
                        OfferCellView(offer: offer)
                        .frame(width: 132)
                    }
                }
            }
            .scrollIndicators(.hidden)
        }
    }
}


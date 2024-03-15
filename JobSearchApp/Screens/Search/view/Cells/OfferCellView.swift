//
//  OfferCellView.swift
//  JobSearchApp
//
//  Created by Anatolii Shumov on 15.03.2024.
//

import SwiftUI

enum OfferImages: String, CaseIterable {
    case person = "vacPerson"
    case star = "vacStar"
    case list = "vacList"
    
    var name: String {
        return rawValue
    }
}

struct OfferCellView: View {
    /*@Binding */var image: OfferImages = .person
    let offer: Offer
    
    var body: some View {
        ZStack {
            Color.grey1
            
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    ZStack(alignment: alignment) {
                        Circle()
                            .frame(width: 32, height: 32)
                            .foregroundStyle(outsideColor)
                        
                        Image(image.name)
                            .renderingMode(.template)
                            .foregroundStyle(insideColor)
                            .frame(width: 24, height: 24)
                    }
                    .padding(.top, 10)
                    
                    Spacer()
                }
                
                VStack(alignment: .leading) {
                    Text(offer.title)
                        .lineLimit(lineLimit)
                        .multilineTextAlignment(.leading)
                        .font(Font.system(size: 14, weight: .medium))
                        .foregroundStyle(Color.white)
                    
                    if let title = offer.button?.title {
                        Button(action: {
                            print("Tapped")
                        }, label: {
                            Text(title)
                                .font(Font.system(size: 14, weight: .regular))
                                .foregroundStyle(insideColor)
                        })
                    }
                }
                
            }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .padding(.leading, 8)
        }
        .clipShape(.rect(cornerRadius: 8))
        .frame(width: 132, height: 120)
    }
    
    private var insideColor: Color {
        switch image {
        case .person:
                .specialBlue
        default:
                .specialGreen
        }
    }
    
    private var outsideColor: Color {
        switch image {
        case .person:
                .specialDarkBlue
        default:
                .specialDarkGreen
        }
    }
    
    private var alignment: Alignment {
        switch image {
        case .person:
                .bottom
        default:
                .center
        }
    }
    
    private var lineLimit: Int {
        return offer.button != nil ? 2 : 3
    }
}

#Preview {
    OfferCellView(offer: Offer(
        id: "level_up_resume",
        title: "Поднять резюме в поиске",
        button: ButtonModel(title: "Поднять"),
        link: "https://hh.ru/"))
}

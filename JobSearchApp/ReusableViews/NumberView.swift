//
//  NumberView.swift
//  JobSearchApp
//
//  Created by Anatolii Shumov on 18.03.2024.
//

import SwiftUI

struct NumberView: View {
    let title: String
    let iconName: String
    let iconWidth: CGFloat
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .foregroundStyle(Color.specialDarkGreen)
            
            HStack {
                Text(title)
                    .font(.specialText1)
                
                Spacer()
                
                ZStack {
                    Circle()
                        .foregroundStyle(Color.specialGreen)
                        .frame(width: 16, height: 16)
                    
                    Image(iconName)
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: iconWidth, height: 8)
                }
            }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .foregroundStyle(Color.white)
            .padding(.all, 8)
        }
        .frame(height: 50, alignment: .top)
    }
}

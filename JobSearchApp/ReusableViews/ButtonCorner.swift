//
//  ButtonCorner.swift
//  JobSearchApp
//
//  Created by Anatolii Shumov on 18.03.2024.
//

import SwiftUI

struct ButtonCorner: View {
    let title: String
    let color: Color
    let cornerRadius: CGFloat
    let font: Font
    var action: (() -> Void)
    
    var body: some View {
        Button(action: {
            action()
        }, label: {
            ZStack {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .foregroundStyle(color)
                
                Text(title)
                    .font(font)
                    .tint(.white)
            }
        })
    }
}

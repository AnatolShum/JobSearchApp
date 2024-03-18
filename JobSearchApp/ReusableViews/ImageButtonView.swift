//
//  ImageButtonView.swift
//  JobSearchApp
//
//  Created by Anatolii Shumov on 18.03.2024.
//

import SwiftUI

struct ImageButtonView: View {
    let imageName: String
    let action: () -> Void
    
    init(_ imageName: String, action: @escaping () -> Void) {
        self.imageName = imageName
        self.action = action
    }
    
    var body: some View {
        Button(action: {
            action()
        }, label: {
            Image(imageName)
                .resizable()
                .renderingMode(.template)
                .frame(width: 24, height: 24)
        })
        .foregroundStyle(Color.white)
    }
}

//
//  TabItem.swift
//  JobSearchApp
//
//  Created by Anatolii Shumov on 13.03.2024.
//

import SwiftUI

struct TabItem: View {
    let imageName: String
    let title: String
    
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .renderingMode(.template)
                .frame(width: 24, height: 24)
            Text(title)
                .font(.tabText)
        }
    }
}

#Preview {
    TabItem(imageName: "", title: "")
}

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
                .renderingMode(.template)
            Text(title)
        }
    }
}

#Preview {
    TabItem(imageName: "", title: "")
}

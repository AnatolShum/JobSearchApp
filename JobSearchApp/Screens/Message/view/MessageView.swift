//
//  MessageView.swift
//  JobSearchApp
//
//  Created by Anatolii Shumov on 13.03.2024.
//

import SwiftUI

struct MessageView: View {
    @ObservedObject private var viewModel = MessageViewModel()
    
    var body: some View {
        Text("Message view")
    }
}

#Preview {
    MessageView()
}

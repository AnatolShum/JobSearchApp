//
//  ResponseView.swift
//  JobSearchApp
//
//  Created by Anatolii Shumov on 13.03.2024.
//

import SwiftUI

struct ResponseView: View {
    @StateObject private var viewModel = ResponseViewModel()
    
    var body: some View {
        Text("Response view")
    }
}

#Preview {
    ResponseView()
}

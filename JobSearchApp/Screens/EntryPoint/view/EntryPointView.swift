//
//  EntryPointView.swift
//  JobSearchApp
//
//  Created by Anatolii Shumov on 13.03.2024.
//

import SwiftUI

struct EntryPointView: View {
    @ObservedObject private var viewModel = EntryPointViewModel()
    
    var body: some View {
        CustomTabView()
    }
   
}

#Preview {
    EntryPointView()
}

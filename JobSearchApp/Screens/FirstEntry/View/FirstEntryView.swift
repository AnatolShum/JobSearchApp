//
//  FirstEntryView.swift
//  JobSearchApp
//
//  Created by Anatolii Shumov on 13.03.2024.
//

import SwiftUI

struct FirstEntryView: View {
    @StateObject private var viewModel = FirstEntryViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundColorView()
                
                VStack(alignment: .center) {
                    HStack {
                        Text("Вход в личный кабинет")
                            .font(.specialTitle2)
                            .foregroundStyle(.white)
                        Spacer()
                    }
                    
                    Spacer()
                    
                    EmployeeLoginView()
                    
                    EmployerLoginView()
                    
                    Spacer()
                }
                .padding(.horizontal, 16)
            }
        }
    }
}

#Preview {
    FirstEntryView()
}

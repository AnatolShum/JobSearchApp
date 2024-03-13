//
//  FirstEntryView.swift
//  JobSearchApp
//
//  Created by Anatolii Shumov on 13.03.2024.
//

import SwiftUI

struct FirstEntryView: View {
    @ObservedObject private var viewModel = FirstEntryViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundColorView()
                
                VStack(alignment: .center) {
                    HStack {
                        Text("Вход в личный кабинет")
                            .font(Font.system(size: 20))
                            .bold()
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

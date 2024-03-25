//
//  SecondEntryView.swift
//  JobSearchApp
//
//  Created by Anatolii Shumov on 13.03.2024.
//

import SwiftUI
import Combine

enum FocusedField: CaseIterable {
    case first
    case second
    case third
    case fourth
}

struct SecondEntryView: View {
    @EnvironmentObject var enterData: EnterData
    @StateObject private var viewModel = SecondEntryViewModel()
    @FocusState private var focusedField: FocusedField?
    
    let email: String
    
    init(email: String) {
        self.email = email
    }
    
    var body: some View {
        ZStack {
            BackgroundColorView()
            
            VStack(alignment: .center, spacing: 16) {
                HStack {
                    Text("Отправили код на \(email)")
                        .font(.specialTitle2)
                    Spacer()
                }
                .foregroundStyle(.white)
                
                HStack {
                    Text("Напишите его, чтобы подтвердить, что это вы, а не кто-то другой входит в личный кабинет")
                        .font(.specialTitle3)
                    Spacer()
                }
                .foregroundStyle(.white)
                
                HStack {
                    ForEach(0..<viewModel.secureLength, id: \.self) { index in
                        SecureCell(query: $viewModel.queries[index],
                                   focusedField: _focusedField,
                                   index: index)
                    }
                    Spacer()
                }
                .onAppear {
                    focusedField = FocusedField.allCases[viewModel.focusedIndex]
                }
                .onChange(of: viewModel.focusedIndex) {
                    guard viewModel.focusedIndex < viewModel.secureLength else { return }
                    focusedField = FocusedField.allCases[viewModel.focusedIndex]
                }
                
                Button(action: {
                    enterData.currentView = .tabView
                    enterData.isLoggedIn = true
                }, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .foregroundStyle(Color.specialDarkBlue)
                        
                        Text("Продолжить")
                            .font(.specialButtonText1)
                            .tint(.grey4)
                    }
                })
                .frame(height: 48)
                .buttonStyle(DisabledButton())
                .disabled(viewModel.isButtonDisable)
                
            }
        }
    }
}

#Preview {
    SecondEntryView(email: "example@example.example")
}

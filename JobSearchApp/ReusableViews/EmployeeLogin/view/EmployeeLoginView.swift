//
//  EmployeeLoginView.swift
//  JobSearchApp
//
//  Created by Anatolii Shumov on 13.03.2024.
//

import SwiftUI

struct EmployeeLoginView: View {
    @ObservedObject private var viewModel = EmployeeLoginViewModel()
    
    var body: some View {
        ZStack {
            VStack(spacing: 16) {
                HStack {
                    Text("Поиск работы")
                        .font(Font.system(size: 16, weight: .medium))
                        .foregroundStyle(.white.opacity(0.8))
                    Spacer()
                }
                
                
                ZStack {
                    HStack {
                        Image("responseIcon").renderingMode(.template)
                            .padding(.leading, 8)
                        
                        TextField("",
                                  text: $viewModel.email,
                                  prompt:
                                    Text("Электронная почта или телефон")
                            .font(Font.system(size: 14))
                            .foregroundStyle(Color.grey4)
                        )
                        .frame(height: 40)
                        
                        if !viewModel.email.isEmpty {
                            Button(action: {
                                viewModel.email = ""
                            }, label: {
                                Image("xIcon")
                            })
                            .padding(.trailing, 8)
                        }
                    }
                    .foregroundStyle(Color.grey4)
                    .background(Color.grey2)
                    .clipShape(.rect(cornerRadius: 8))
                    .shadow(color: .black, radius: 1, x: 0, y: viewModel.shadowY)
                    .padding(.all, viewModel.redPadding)
                }
                .background(Color.red)
                .clipShape(.rect(cornerRadius: 8))
                
                if viewModel.isIncorrectEmail {
                    HStack {
                        Text("Вы ввели неверный e-mail")
                            .font(Font.system(size: 14))
                            .foregroundStyle(Color.red)
                        Spacer()
                    }
                }
                
                HStack(spacing: 24) {
                    Button(action: {
                        guard viewModel.validateEmail() else {
                            viewModel.isIncorrectEmail = true
                            return }
                       
                            print("Go to the second view")
                    }, label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 8)
                                .foregroundStyle(Color.specialDarkBlue)
                            
                            Text("Продолжить")
                                .font(Font.system(size: 14))
                                .tint(.grey4)
                        }
                    })
                    .buttonStyle(DisabledButton())
                    .disabled(viewModel.isButtonDisable)
                    
                    Button(action: {
                        print("Войти с паролем")
                    }, label: {
                        Text("Войти с паролем")
                            .font(Font.system(size: 14))
                            .tint(.blue)
                    })
                }
                .frame(height: 40)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 24)
        }
        .background(Color.grey1)
        .clipShape(.rect(cornerRadius: 8))
        
        .onChange(of: viewModel.email) { _, _ in
            viewModel.isIncorrectEmail = false
        }
    }
}

#Preview {
    EmployeeLoginView()
}

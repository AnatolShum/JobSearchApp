//
//  EmployerLoginView.swift
//  JobSearchApp
//
//  Created by Anatolii Shumov on 13.03.2024.
//

import SwiftUI

struct EmployerLoginView: View {
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 16) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Поиск сотрудников")
                        .font(Font.system(size: 16, weight: .medium))
                    
                    Text("Размещение вакансий и доступ к базе резюме")
                        .font(Font.system(size: 14))
                }
                .foregroundStyle(.white.opacity(0.8))
                
                
                
                HStack(spacing: 24) {
                    Button(action: {
                        print("Я ищу сотрудников")
                    }, label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 50)
                                .foregroundStyle(Color.specialGreen)
                            
                            Text("Я ищу сотрудников")
                                .font(Font.system(size: 14))
                                .tint(.white)
                        }
                    })
                }
                .frame(height: 32)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 24)
        }
        .background(Color.grey1)
        .clipShape(.rect(cornerRadius: 8))
    }
}

#Preview {
    EmployerLoginView()
}

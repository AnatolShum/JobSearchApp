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
                        .font(.specialTitle3)
                    
                    Text("Размещение вакансий и доступ к базе резюме")
                        .font(.specialText1)
                }
                .foregroundStyle(.white.opacity(0.8))
                
                ButtonCorner(title: "Я ищу сотрудников", color: Color.specialGreen, cornerRadius: 50, font: .specialButtonText2, action: {
                    print("Я ищу сотрудников")
                })
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

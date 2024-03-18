//
//  VacancyCellView.swift
//  JobSearchApp
//
//  Created by Anatolii Shumov on 18.03.2024.
//

import SwiftUI

struct VacancyCellView: View {
    let vacancy: Vacancy
    @ObservedObject private var viewModel = VacancyCellViewModel()
    
    var body: some View {
        ZStack {
            Color.grey1
            
            VStack {
                HStack(alignment: .top, spacing: 64) {
                    VStack(alignment: .leading, spacing: 10) {
                        if let lookingNumber = vacancy.lookingNumber {
                            Text("Сейчас просматривает \(lookingNumber) \(viewModel.formattedPeople(lookingNumber))")
                                .font(.specialText1)
                                .foregroundStyle(Color.specialGreen)
                        }
                        
                        Text(vacancy.title)
                            .multilineTextAlignment(.leading)
                            .font(.specialTitle3)
                        
                        if let salary = vacancy.salary.short {
                            Text(salary)
                                .font(.specialTitle2)
                        }
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(vacancy.address.town)
                            
                            HStack(spacing: 8) {
                                Text(vacancy.company)
                                
                                Image("companyIcon")
                                    .resizable()
                                    .renderingMode(.template)
                                    .frame(width: 16, height: 16)
                                    .foregroundStyle(Color.grey3)
                            }
                        }
                        .font(.specialText1)
                        
                        HStack(spacing: 8) {
                            Image("experience")
                                .resizable()
                                .renderingMode(.template)
                                .frame(width: 16, height: 16)
                            
                            Text(vacancy.experience.preview)
                                .font(.specialText1)
                        }
                        
                        Text("Опубликовано \(viewModel.formattedDate(vacancy.publishedDate))")
                        
                    }.frame(maxWidth: .infinity, alignment: .topLeading)
                        .foregroundStyle(Color.white)
                    
                    FavouriteButtonView(action: {
                        viewModel.toggleFavourite()
                    }, color: Color.grey4, colorFill: Color.specialBlue, isFavourite: $viewModel.isFavourite)
                }
                
                ButtonCorner(title: "Откликнуться", color: Color.specialGreen, cornerRadius: 50, font: .specialButtonText2, action:{
                    print("Откликнуться")
                })
                .frame(height: 32)
            }.frame(alignment: .top)
                .padding(.all, 16)
        }
        .clipShape(.rect(cornerRadius: 8))
    }
}

#Preview {
    VacancyCellView(vacancy: Vacancy(
        id: "cbf0c984-7c6c-4ada-82da-e29dc698bb50",
        lookingNumber: 2,
        title: "UI/UX-дизайнер / Web-дизайнер / Дизайнер интерфейсов",
        address: Address(town: "Минск", street: "улица Бирюзова", house: "4/5"),
        company: "Мобирикс",
        experience: Experience(preview: "Опыт от 1 до 3 лет", filter: "1–3 года"),
        publishedDate: "2024-02-20",
        isFavorite: false,
        salary: Salary(short: "20 000 до 50 000 ₽", full: "Уровень дохода не указан"),
        schedules: ["полная занятость", "полный день"],
        appliedNumber: 147,
        description: "Мы ищем специалиста на позицию UX/UI Designer, который вместе с коллегами будет заниматься проектированием пользовательских интерфейсов внутренних и внешних продуктов компании.",
        responsibilities: "- проектирование пользовательских сценариев и создание прототипов;\n- разработка интерфейсов для продуктов компании (Web+App);\n- работа над созданием и улучшением Дизайн-системы;\n- взаимодействие с командами frontend-разработки;\n- контроль качества внедрения дизайна;\n- ситуативно: создание презентаций и других материалов на основе фирменного стиля компании",
        questions: [
            "Где располагается место работы?",
            "Какой график работы?",
            "Вакансия открыта?",
            "Какая оплата труда?"
        ]))
}

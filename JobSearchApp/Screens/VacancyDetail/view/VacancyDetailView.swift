//
//  VacancyDetailView.swift
//  JobSearchApp
//
//  Created by Anatolii Shumov on 18.03.2024.
//

import SwiftUI

struct VacancyDetailView: View {
    let vacancy: Vacancy
    @StateObject private var viewModel: VacancyDetailViewModel
    @Environment(\.dismiss) private var dismiss
    
    init(vacancy: Vacancy) {
        self.vacancy = vacancy
        self._viewModel = StateObject(
            wrappedValue: VacancyDetailViewModel(vacancy: vacancy))
    }
    
    var body: some View {
        ZStack {
            BackgroundColorView()
            
            ScrollView {
                VStack {
                    VStack(alignment: .leading, spacing: 16) {
                        Text(vacancy.title)
                            .font(.specialTitle1)
                        
                        Text(vacancy.salary.full)
                            .font(.specialText1)
                        
                        VStack(alignment: .leading, spacing: 6) {
                            Text("Требуемый опыт: \(vacancy.experience.text)")
                            Text(viewModel.formattedSchedules(vacancy.schedules))
                        }
                        .font(.specialText1)
                    }.frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundStyle(Color.white)
                        .padding(.bottom, 29)
                    
                    HStack(alignment: .top, spacing: 8) {
                        if let appliedNumber = vacancy.appliedNumber {
                            NumberView(title: "\(appliedNumber) \(viewModel.formattedPeople(appliedNumber)) уже откликнулось", iconName: "profileIcon", iconWidth: 8)
                        }
                        if let lookingNumber = vacancy.lookingNumber {
                            NumberView(title: "\(lookingNumber) \(viewModel.formattedPeople(lookingNumber)) сейчас смотрят", iconName: "eyeIcon", iconWidth: 12)
                        }
                    }
                    .padding(.horizontal, -2)
                    .padding(.bottom, 19)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        HStack(spacing: 8) {
                            Text(vacancy.company)
                                .font(.specialTitle3)
                            
                            Image("companyIcon")
                                .resizable()
                                .renderingMode(.template)
                                .frame(width: 16, height: 16)
                                .foregroundStyle(Color.grey3)
                        }
                        
                        Image("map")
                            .resizable()
                            .scaledToFit()
                        
                        Text(viewModel.formattedAddress(vacancy.address))
                            .font(.specialText1)
                        
                    }.frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundStyle(Color.white)
                        .padding(.bottom, 16)
                    
                    if let description = vacancy.specification {
                        Text(description)
                            .font(.specialText1)
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .topLeading)
                            .padding(.horizontal, -1)
                            .padding(.bottom, 16)
                    }
                    
                    Text("Ваши задачи")
                        .font(.specialTitle2)
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                        .padding(.bottom, 8)
                    
                    Text(vacancy.responsibilities)
                        .font(.specialText1)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                        .padding(.bottom, 32)
                    
                    
                    Text("Задайте вопрос работодателю")
                        .font(.specialTitle4)
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                        .padding(.bottom, 8)
                    
                    Text("Он получит его с откликом на вакансию")
                        .font(.specialTitle4)
                        .foregroundStyle(Color.grey3)
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                        .padding(.horizontal, 1)
                        .padding(.bottom, 16)
                    
                    
                    VStack(alignment: .leading, spacing: 8) {
                        ForEach(vacancy.questions, id: \.self) { question in
                            HStack {
                                ZStack {
                                    ButtonCorner(title: question, color: .clear, cornerRadius: 50, font: .specialButtonText2) {
                                        print(question)
                                    }
                                    .fontWeight(.medium)
                                    .fixedSize(horizontal: true, vertical: true)
                                    .padding(EdgeInsets(top: 8, leading: 12, bottom: 8, trailing: 12))
                                }
                                .background(Color.grey2)
                                .clipShape(.rect(cornerRadius: 50))
                            }
                            .frame(height: 33)
                        }
                    }.frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 16)
                    
                    ButtonCorner(title: "Откликнуться", color: .specialGreen, cornerRadius: 8, font: .specialButtonText1) {
                        print("Откликнуться")
                    }
                    .frame(height: 48)
                    
                }
                .foregroundStyle(Color.white)
                .padding(.horizontal, 16)
            }
        }
        .toolbarBackground(.black, for: .navigationBar)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                ImageButtonView("backIcon") {
                    dismiss()
                }
            }
            ToolbarItemGroup(placement: .primaryAction) {
                ImageButtonView("eyeIcon") {
                    print("Eye button tapped")
                }
                
                ImageButtonView("shareIcon") {
                    print("Share button tapped")
                }
                
                FavouriteButtonView(action: {
                    viewModel.toggleFavourite()
                }, color: Color.white, colorFill: Color.specialBlue, isFavourite: $viewModel.isFavourite)
            }
        }
    }
}

#Preview {
    VacancyDetailView(vacancy: Vacancy(
        id: "cbf0c984-7c6c-4ada-82da-e29dc698bb50",
        lookingNumber: 2,
        title: "UI/UX-дизайнер / Web-дизайнер / Дизайнер интерфейсов",
        address: Address(town: "Минск", street: "улица Бирюзова", house: "4/5"),
        company: "Мобирикс",
        experience: Experience(previewText: "Опыт от 1 до 3 лет", text: "1–3 года"),
        publishedDate: "2024-02-20",
        isFavorite: false,
        salary: Salary(short: "20 000 до 50 000 ₽", full: "Уровень дохода не указан"),
        schedules: ["полная занятость", "полный день"],
        appliedNumber: 147,
        specification: "Мы ищем специалиста на позицию UX/UI Designer, который вместе с коллегами будет заниматься проектированием пользовательских интерфейсов внутренних и внешних продуктов компании.",
        responsibilities: "- проектирование пользовательских сценариев и создание прототипов;\n- разработка интерфейсов для продуктов компании (Web+App);\n- работа над созданием и улучшением Дизайн-системы;\n- взаимодействие с командами frontend-разработки;\n- контроль качества внедрения дизайна;\n- ситуативно: создание презентаций и других материалов на основе фирменного стиля компании",
        questions: [
            "Где располагается место работы?",
            "Какой график работы?",
            "Вакансия открыта?",
            "Какая оплата труда?"
        ]))
}

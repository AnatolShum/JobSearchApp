//
//  EmployeeLoginViewModel.swift
//  JobSearchApp
//
//  Created by Anatolii Shumov on 13.03.2024.
//

import Foundation
import Combine
import SwiftUI

class EmployeeLoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var message: String? = nil
    @Published var isValidEmail: Bool? = nil
    @Published var shadowY: CGFloat = 3
    @Published var redPadding: CGFloat = 0
    @Published var validColor: Color = .clear
    @Published var isButtonDisable: Bool = true
    @Published var showButton: Bool = false
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        $email
            .map { _ in
                return nil }
            .assign(to: \.isValidEmail, on: self)
            .store(in: &cancellables)
        
        $email
            .map { $0.isEmpty }
            .assign(to: \.isButtonDisable, on: self)
            .store(in: &cancellables)
        
        $email
            .map { !$0.isEmpty }
            .assign(to: \.showButton, on: self)
            .store(in: &cancellables)
        
        $isValidEmail
            .map { isValid -> CGFloat in
                return isValid ?? true ? 3 : 0
            }
            .assign(to: \.shadowY, on: self)
            .store(in: &cancellables)
        
        $isValidEmail
            .map { isValid -> CGFloat in
                return isValid ?? true ? 0 : 2
            }
            .assign(to: \.redPadding, on: self)
            .store(in: &cancellables)
        
        $isValidEmail
            .map { isValid -> Color in
                return isValid ?? true ? .clear : .red
            }
            .assign(to: \.validColor, on: self)
            .store(in: &cancellables)
        
        $isValidEmail
            .map { $0 ?? true ? nil : "Вы ввели неверный e-mail" }
            .assign(to: \.message, on: self)
            .store(in: &cancellables)
    }

    func validateEmail() {
        guard email.contains("@") && email.contains(".") && email.count > 5 else {
            isValidEmail = false
            return }
        
        isValidEmail = true
    }
}

//
//  EmployeeLoginViewModel.swift
//  JobSearchApp
//
//  Created by Anatolii Shumov on 13.03.2024.
//

import Foundation

class EmployeeLoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var isIncorrectEmail: Bool = false
    var shadowY: CGFloat {
        return isIncorrectEmail ? 0 : 3
    }
    var redPadding: CGFloat {
        return isIncorrectEmail ? 2 : 0
    }
    var isButtonDisable: Bool {
        return email.isEmpty
    }
   
    func validateEmail() -> Bool {
        guard email.contains("@") else { return false }
        guard email.contains(".") else { return false }
        guard email.count > 5 else { return false }
        
        return true
    }
}

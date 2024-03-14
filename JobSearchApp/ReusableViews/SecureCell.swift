//
//  SecureCell.swift
//  JobSearchApp
//
//  Created by Anatolii Shumov on 14.03.2024.
//

import SwiftUI

struct SecureCell: View {
    @Binding var query: String
    @FocusState var focusedField: FocusedField?
    let index: Int
    
    var body: some View {
        ZStack(alignment: .center) {
            Image("secureIcon").renderingMode(.template)
                .frame(width: 18, height: 13)
                .foregroundStyle(Color.grey3)
            
            
            SecureField("", text: $query)
                .focused($focusedField, equals: FocusedField.allCases[index])
                .foregroundStyle(.clear)
                .keyboardType(.numberPad)
                .multilineTextAlignment(.center)
                .tint(Color.white)
        }
        .frame(width: 48, height: 48)
        .background(Color.grey2)
        .clipShape(.rect(cornerRadius: 8))
    }
}


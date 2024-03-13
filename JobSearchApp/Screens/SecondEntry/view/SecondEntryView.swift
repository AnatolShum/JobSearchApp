//
//  SecondEntryView.swift
//  JobSearchApp
//
//  Created by Anatolii Shumov on 13.03.2024.
//

import SwiftUI

struct SecondEntryView: View {
    @ObservedObject private var viewModel = SecondEntryViewModel()
    @State var secureNumber: String = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundColorView()
                
                VStack(alignment: .center, spacing: 16) {
                    
                    HStack {
                        Text("Placeholder")
                        Spacer()
                    }
                    .foregroundStyle(.white)
                    
                    HStack {
                        Text("Placeholder")
                        Spacer()
                    }
                    .foregroundStyle(.white)
                    
                    
                    HStack {
                        TextField("",
                                  text: $secureNumber,
                                  prompt:
                                    Text("*")
                            .font(Font.system(size: 14))
                            .foregroundStyle(Color.grey4)
                        )
                        .frame(width: 30, height: 40)
                    }
                    
                    
                    Button(action: {
                            print("Go to the third view")
                    }, label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 8)
                                .foregroundStyle(Color.specialDarkBlue)
                            
                            Text("Продолжить")
                                .font(Font.system(size: 14))
                                .tint(.grey4)
                        }
                    })
                    .frame(height: 40)
                    .buttonStyle(DisabledButton())
//                    .disabled(viewModel.isButtonDisable)
                    
                }
            }
        }
    }
}

#Preview {
    SecondEntryView()
}

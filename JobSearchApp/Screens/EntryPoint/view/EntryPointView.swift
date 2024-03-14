//
//  EntryPointView.swift
//  JobSearchApp
//
//  Created by Anatolii Shumov on 13.03.2024.
//

import SwiftUI

struct EntryPointView: View {
    @EnvironmentObject var enterData: EnterData
    
    var body: some View {
        switch enterData.currentView {
        case .firstEntry:
            CustomTabView()
                .environmentObject(enterData)
        case .secondEntry:
            SecondEntryView(email: enterData.currentView.email ?? "N/A")
                .environmentObject(enterData)
        case .tabView:
            CustomTabView()
                .environmentObject(enterData)
        }
    }
}

#Preview {
    EntryPointView()
}

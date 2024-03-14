//
//  JobSearchAppApp.swift
//  JobSearchApp
//
//  Created by Anatolii Shumov on 13.03.2024.
//

import SwiftUI

@main
struct JobSearchAppApp: App {
    private var enterData = EnterData()
    var body: some Scene {
        WindowGroup {
            EntryPointView()
                .environmentObject(enterData)
        }
    }
}

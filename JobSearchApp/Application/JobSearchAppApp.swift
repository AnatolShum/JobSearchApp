//
//  JobSearchAppApp.swift
//  JobSearchApp
//
//  Created by Anatolii Shumov on 13.03.2024.
//

import SwiftUI
import SwiftData

@main
struct JobSearchAppApp: App {
    private var enterData = EnterData()
    var container: ModelContainer
    
    init() {
        do {
            let storeUrl = URL.documentsDirectory.appending(path: "database.sqlite")
            let configuration = ModelConfiguration(url: storeUrl)
            container = try ModelContainer(for: Vacancy.self, configurations: configuration)
        } catch {
            fatalError("Failed to configure SwiftData container.")
        }
    }
    
    var body: some Scene {
        WindowGroup {
            EntryPointView()
                .environmentObject(enterData)
        }
        .modelContainer(container)
    }
}

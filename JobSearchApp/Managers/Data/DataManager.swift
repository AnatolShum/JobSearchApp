//
//  DataManager.swift
//  JobSearchApp
//
//  Created by Anatolii Shumov on 18.03.2024.
//

import Foundation
import SwiftData
import SwiftUI

class DataManager {
    private var container: ModelContainer?
    private var modelContext: ModelContext?
    
    init() {
        do {
            let storeUrl = URL.documentsDirectory.appending(path: "database.sqlite")
            let configuration = ModelConfiguration(url: storeUrl)
            container = try ModelContainer(for: Vacancy.self, configurations: configuration)
        } catch {
            print("Could not create container \(error.localizedDescription)")
        }
    }
    
    enum DataErrors: Error {
        case couldNotFetchModel
        case couldNotCreateContainer
    }
    
    func insertModel<Model: PersistentModel>(models: [Model]) {
        models.forEach { (model: Model) in
            guard let container else { return }
            modelContext = ModelContext(container)
            modelContext?.insert(model)
        }
    }
    
    func fetchVacancies<Model: PersistentModel>(_ model: Model, descriptor: FetchDescriptor<Model>, completion: @escaping (Result<[Model]?, DataErrors>) -> Void) {
        guard let container else {
            completion(.failure(.couldNotCreateContainer))
            return }
        modelContext = ModelContext(container)
        
        do {
            let models = try modelContext?.fetch(descriptor)
            completion(.success(models))
        } catch {
            print("Could not fetch model \(error.localizedDescription)")
            completion(.failure(.couldNotFetchModel))
        }
    }
    
    func updateFavourite(_ model: Vacancy, newValue: Bool) {
        model.isFavorite = newValue
    }
    
}

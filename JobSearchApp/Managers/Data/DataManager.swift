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
            if let exist = isModelExist(model: model, modelContext: modelContext) {
                if let vacancy = exist as? Vacancy {
                    updateVacancy(old: vacancy, new: model as! Vacancy)
                } else {
                    modelContext?.insert(model)
                }
            } else {
                modelContext?.insert(model)
            }
            
        }
    }
    
    func isModelExist<Model: PersistentModel>(model: Model, modelContext: ModelContext?) -> Model? {
        do {
            let models = try modelContext?.fetch(FetchDescriptor<Model>())
            return models?.first { $0 == model }
        } catch {
            print("Could not fetch model \(error.localizedDescription)")
            return nil
        }
    }
    
    func fetchVacancies<Model: PersistentModel>(descriptor: FetchDescriptor<Model>, completion: @escaping (Result<[Model]?, DataErrors>) -> Void) {
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
    
    func updateVacancy(old: Vacancy, new: Vacancy) {
        old.lookingNumber = new.lookingNumber
        old.title = new.title
        old.appliedNumber = new.appliedNumber
        old.address = new.address
        old.company = new.company
        old.experience = new.experience
        old.salary = new.salary
        old.publishedDate = new.publishedDate
        old.responsibilities = new.responsibilities
        old.questions = new.questions
        old.schedules = new.schedules
        old.specification = new.specification
    }
    
}

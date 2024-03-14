//
//  SecondEntryViewModel.swift
//  JobSearchApp
//
//  Created by Anatolii Shumov on 13.03.2024.
//

import Foundation
import Combine

class SecondEntryViewModel: ObservableObject {
    let secureLength = 4
    @Published var queries: [String] = Array(repeating: "", count: 4)
    @Published var focusedIndex: Int = 0
    @Published var isButtonDisable: Bool = true
    
    private var cancellables = Set<AnyCancellable>()
   
    init() {
        $queries
            .map { queries -> Int in
                let indexes = queries.enumerated().compactMap { (index, element) in
                    if element.count == 1 {
                        return index
                    } else {
                        return nil
                    }
                }
                
                guard let index = indexes.last else { return 0 }
                
                return index + 1
            }
            .assign(to: \.focusedIndex, on: self)
            .store(in: &cancellables)
        
        $focusedIndex
            .map { number -> Bool in
                return number != self.secureLength
            }
            .assign(to: \.isButtonDisable, on: self)
            .store(in: &cancellables)
    }
    
}

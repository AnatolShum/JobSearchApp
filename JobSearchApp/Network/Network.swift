//
//  Network.swift
//  JobSearchApp
//
//  Created by Anatolii Shumov on 13.03.2024.
//

import Foundation
import Combine

class Network {
    static let shared = Network()
    
    private let urlString = "https://run.mocky.io/v3/ed41d10e-0c1f-4439-94fa-9702c9d95c14"
    private let jsonDecoder = JSONDecoder()
    
    func fetch<Model: Codable> () -> Future<Model, NetworkErrors> {
        return Future() { promise in
            guard let url = URL(string: self.urlString) else {
                promise(.failure(.urlNotFound))
                return }
            
            let urlRequest = URLRequest(url: url)
            
            URLSession.shared.dataTask(with: urlRequest) { data, response, error in
                guard error == nil else {
                    promise(.failure(.dataTaskError))
                    return }
                
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    promise(.failure(.responseError))
                    return }
                
                guard let data else {
                    promise(.failure(.couldNotFetchData))
                    return }
                        
                do {
                    let result = try self.jsonDecoder.decode(Model.self, from: data)
                    promise(.success(result))
                } catch {
                    promise(.failure(.couldNotDecodeData))
                }
                
            }
            .resume()
        }
    }
    
}

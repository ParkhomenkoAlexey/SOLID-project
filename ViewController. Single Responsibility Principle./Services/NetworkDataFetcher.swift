//
//  NetworkDataFetcher.swift
//  ViewController. Single Responsibility Principle.
//
//  Created by Алексей Пархоменко on 13.06.2019.
//  Copyright © 2019 Алексей Пархоменко. All rights reserved.
//

import Foundation

class NetworkDataFetcher {
    
    var networkService = NetworkService()
    
    init(networkService: NetworkService = NetworkService()) {
        self.networkService = networkService
    }
    
    func fetchExpensive(urlString: String, completion: @escaping (AppGroup?) -> Void) {
        networkService.request(urlString: urlString) { (data, error) in
            let decoder = JSONDecoder()
            guard let data = data else { return }
            let response = try? decoder.decode(AppGroup.self, from: data)
            completion(response)
        }
    }
    
    func fetchFree(urlString: String, completion: @escaping (AppGroup?) -> Void) {
        networkService.request(urlString: urlString) { (data, error) in
            let decoder = JSONDecoder()
            guard let data = data else { return }
            let response = try? decoder.decode(AppGroup.self, from: data)
            completion(response)
        }
    }
    
    func fetchGames(urlString: String, completion: @escaping (AppGroup?) -> Void) {
        networkService.request(urlString: urlString) { (data, error) in
            let decoder = JSONDecoder()
            guard let data = data else { return }
            let response = try? decoder.decode(AppGroup.self, from: data)
            completion(response)
        }
    }
    
    // декодируем полученные JSON данные в конкретную модель данных
    func fetchCountry(urlString: String, completion: @escaping ([Country]?) -> Void) {
        networkService.request(urlString: urlString) { (data, error) in
            let decoder = JSONDecoder()
            guard let data = data else { return }
            let response = try? decoder.decode([Country].self, from: data)
            completion(response)
        }
    }
}

//
//  DataStore.swift
//  ViewController. Single Responsibility Principle.
//
//  Created by Алексей Пархоменко on 31/05/2019.
//  Copyright © 2019 Алексей Пархоменко. All rights reserved.
//

import Foundation

class DataStore {
    
    // Сохранение данных в кеш/базу данных
    func savenameInCache(name: String) {
        print("Your name: \(name) is saved")
    }
    
    // Получать данные из кеша/базы данных
    func getNameFromCache() -> String {
        return "some name"
    }
}

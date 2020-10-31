//
//  Memento.swift
//  WhoWantToBeAMillionaire
//
//  Created by Андрей Щекатунов on 30.10.2020.
//  Copyright © 2020 Andrey Shchekatunov. All rights reserved.
//

import Foundation

class Memento {
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    private let key = "key"
    
    func saveRecords(records: [GameResults]) {
        do {
            let data = try encoder.encode(records)
            UserDefaults.standard.setValue(data, forKey: key)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func loadRecords() -> [GameResults]? {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return nil
        }
        
        do {
            return try decoder.decode([GameResults].self, from: data)
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}

//
//  RecordsCaretaker.swift
//  BrainStorm
//
//  Created by Alex Larin on 09.06.2020.
//  Copyright © 2020 Alex Larin. All rights reserved.
//

import Foundation

final class RecordsCaretaker {
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    private let key = "record"
    // кодирование в формат Data и сохранение сессии в базу данных:
    func save(records: [GameSession]) {
        do {
            let data = try self.encoder.encode(records)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error)
        }
    }
    // выгрузка сессии из базы данных и декодирование:
    func retrieveRecords() -> [GameSession] {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return []
        }
        do {
            return try self.decoder.decode([GameSession].self, from: data)
        } catch {
            print(error)
            return []
        }
    }
}

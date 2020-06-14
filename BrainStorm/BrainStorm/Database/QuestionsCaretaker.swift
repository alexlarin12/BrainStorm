//
//  QuestionsCaretaker.swift
//  BrainStorm
//
//  Created by Alex Larin on 13.06.2020.
//  Copyright © 2020 Alex Larin. All rights reserved.
//

import Foundation
final class QuestionsCaretaker {
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    private let key = "AllQuestions"
    // кодирование в формат Data и сохранение вопроса в базу данных:
    func save(records: [Ask]) {
        do {
            let data = try self.encoder.encode(records)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error)
        }
    }
    // выгрузка вопрса из базы данных и декодирование:
    func retrieveQuestionss() -> [Ask] {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return []
        }
        do {
            return try self.decoder.decode([Ask].self, from: data)
        } catch {
            print(error)
            return []
        }
    }
}

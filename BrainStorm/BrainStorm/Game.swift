//
//  Game.swift
//  BrainStorm
//
//  Created by Alex Larin on 05.06.2020.
//  Copyright © 2020 Alex Larin. All rights reserved.
//

import Foundation

final class Game {
    var gameSession: GameSession?
    static let shared = Game()
    
    private(set) var records: [GameSession] {
        didSet {
            recordsCaretaker.save(records: self.records)
        }
        
    }
    private let recordsCaretaker = RecordsCaretaker()
    private init() {
        self.records = self.recordsCaretaker.retrieveRecords()
        
    }
    
    func addRecord(_ record: GameSession) {
        self.records.append(record)
    }
    
    func clearRecords() {
        self.records = []
    }
}

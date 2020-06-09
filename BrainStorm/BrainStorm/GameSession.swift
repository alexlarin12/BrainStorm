//
//  GameSession.swift
//  BrainStorm
//
//  Created by Alex Larin on 09.06.2020.
//  Copyright © 2020 Alex Larin. All rights reserved.
//

import Foundation

class GameSession: Codable {
    
    var countRightAnswers: Int // количество правильных ответов
    var score: Int // выигрыш
    var date: Date
    
    init(countRightAnswers: Int, score: Int, date: Date) {
        self.countRightAnswers = countRightAnswers
        self.score = score
        self.date = date
    }
}

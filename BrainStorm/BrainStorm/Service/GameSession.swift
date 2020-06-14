//
//  GameSession.swift
//  BrainStorm
//
//  Created by Alex Larin on 09.06.2020.
//  Copyright © 2020 Alex Larin. All rights reserved.
//

import Foundation

class GameSession: Codable {
    var countQuestions: Int // количество вопросов в игре
    var countRightAnswers: Int // количество правильных ответов
    var success: Float // процент правильных ответов от общего числа
    var score: Int // выигрыш
    var date: Date // дата игры
    
    init(countQuestions: Int,countRightAnswers: Int,success: Float, score: Int, date: Date) {
        self.countQuestions = countQuestions
        self.countRightAnswers = countRightAnswers
        self.success = success
        self.score = score
        self.date = date
    }
}

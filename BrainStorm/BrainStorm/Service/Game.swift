//
//  Game.swift
//  BrainStorm
//
//  Created by Alex Larin on 05.06.2020.
//  Copyright © 2020 Alex Larin. All rights reserved.
//

import Foundation

final class Game {
    let dataBase = DataBase()
    var modeQuestion: Difficulty = .serial
    var gameSession: GameSession?
    static let shared = Game()
    
    private(set) var records: [GameSession] {
        didSet {
            recordsCaretaker.save(records: self.records)
        }
    }
     private(set) var questions: [Ask] {
           didSet {
            questionCaretaker.save(records: questions)
           }
       }
    
    // стратегия по умолчанию:
    var questionManager: QuestionManager = SerialQuestionManager()
    
    private let questionCaretaker = QuestionsCaretaker()
   
        

    private let recordsCaretaker = RecordsCaretaker()
    private init() {
        self.records = self.recordsCaretaker.retrieveRecords()
        self.questions = self.questionCaretaker.retrieveQuestionss()
        if ( self.questions.count == 0 ) {
                   generateDefaultQuestions()
        }
    }
    // добавить рекорд:
    func addRecord(_ record: GameSession) {
        self.records.append(record)
    }
    // стереть все рекорды:
    func clearRecords() {
        self.records = []
    }
    // сохранить тип сложности:
    func saveModeQuestion(value: Difficulty) {
        switch value {
        case .random:
            questionManager = RandomQuestionManager()
        default:
            questionManager = SerialQuestionManager()
        }
    }
    // метод генерации вопросов в синглтон и последующий кэш пользователя:
     private func generateDefaultQuestions () {
        questions = dataBase.ask
       }
    
    
    // добавить новый вопрос:
     public func appendNewQuestion ( question: Ask ) {
           questions.append(question)
       }
    
}

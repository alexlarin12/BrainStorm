//
//  serialQuestionManager.swift
//  BrainStorm
//
//  Created by Alex Larin on 10.06.2020.
//  Copyright © 2020 Alex Larin. All rights reserved.
//

import UIKit
final class SerialQuestionManager: QuestionManager{
    var question: [Ask] = []
    
    func nextQuestion() -> [Ask]? {
        self.question = Game.shared.questions
        return question
    }
}

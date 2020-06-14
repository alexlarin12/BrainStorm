//
//  RandomQuestionManager.swift
//  BrainStorm
//
//  Created by Alex Larin on 10.06.2020.
//  Copyright © 2020 Alex Larin. All rights reserved.
//

import Foundation
final class RandomQuestionManager:QuestionManager{
    
    var question: [Ask] = []
    func nextQuestion() -> [Ask]? {
        let array:[Ask] = Game.shared.questions 
        var array2:[Ask] = []
        var num2:[Int] = []
        // наполняем новый массив перемешивая наш:
        while array2.count < array.count{
            let num = Int(arc4random_uniform(UInt32(array.count)))
            if num2.contains(num) == false{
                num2.append(num)
                array2.append(array[num])
            }
        }
        self.question = array2
        return self.question
    }
}

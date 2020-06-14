//
//  CreateQuestionStrategy.swift
//  BrainStorm
//
//  Created by Alex Larin on 10.06.2020.
//  Copyright © 2020 Alex Larin. All rights reserved.
//

import UIKit
protocol QuestionManager {
    func nextQuestion() -> [Ask]? 
}

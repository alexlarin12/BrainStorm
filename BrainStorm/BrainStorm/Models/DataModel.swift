//
//  DataModel.swift
//  BrainStorm
//
//  Created by Alex Larin on 04.06.2020.
//  Copyright © 2020 Alex Larin. All rights reserved.
//

import Foundation
struct Ask {
    let question: String
    let coast: Int
    let answers:[Answers]
}
struct Answers {
    let answer: String
    let correctAnswer: Bool
}
struct Record: Codable {
    let date: Date
    let score: Int

}


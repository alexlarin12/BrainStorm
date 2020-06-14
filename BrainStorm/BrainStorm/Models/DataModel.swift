//
//  DataModel.swift
//  BrainStorm
//
//  Created by Alex Larin on 04.06.2020.
//  Copyright © 2020 Alex Larin. All rights reserved.
//

import Foundation
struct Ask:Codable {
    let question: String
    let coast: Int
    var answers:[Answers]
}
struct Answers:Codable {
    var answer: String
    var correctAnswer: Bool
}
struct Record: Codable {
    let date: Date
    let score: Int

}


//
//  dataBase.swift
//  BrainStorm
//
//  Created by Alex Larin on 04.06.2020.
//  Copyright © 2020 Alex Larin. All rights reserved.
//

import Foundation
class DataBase {
    var ask:[Ask] = [
        Ask(question: "Какое украшение для елки можно купить в аптеке?", coast: 1000, answers: [Answers(answer: "вату", correctAnswer: true),Answers(answer: "шары", correctAnswer: false), Answers(answer: "дождик", correctAnswer: false), Answers(answer: "бусы", correctAnswer: false)]),
        Ask(question: "Как называется детский юмористический киножурнал?", coast: 2000, answers: [Answers(answer: "путаница", correctAnswer: false),Answers(answer: "бумбараш", correctAnswer: false), Answers(answer: "ералаш", correctAnswer: true), Answers(answer: "кавардак", correctAnswer: false)]),
        Ask(question: "Какое дорожное кольцо существует в Москве?", coast: 3000, answers: [Answers(answer: "парковое", correctAnswer: false),Answers(answer: "садовое", correctAnswer: true), Answers(answer: "огородное", correctAnswer: false), Answers(answer: "скверное", correctAnswer: false)]),
        Ask(question: "Что,согласно русской пословице,должен сделать тот,кто сказал а ?", coast: 4000, answers: [Answers(answer: "нарисовать д", correctAnswer: false),Answers(answer: "сказать б", correctAnswer: true), Answers(answer: "крикнуть у", correctAnswer: false), Answers(answer: "промолчать", correctAnswer: false)]),
        Ask(question: "Как называется каменный выступ вдоль асфальтированной дороги?", coast: 5000, answers: [Answers(answer: "цоколь", correctAnswer: false),Answers(answer: "ограда", correctAnswer: false), Answers(answer: "перапет", correctAnswer: false), Answers(answer: "бардюр", correctAnswer: true)]),
        Ask(question: "Какой станет непроявленная фотопленка под действием солнечных лучей?", coast: 6000, answers: [Answers(answer: "прожженной", correctAnswer: false),Answers(answer: "лучезарной", correctAnswer: false), Answers(answer: "засвеченной", correctAnswer: true), Answers(answer: "загорелой", correctAnswer: false)]),
        Ask(question: "Как по_другому называют застежку_молнию?", coast: 7000, answers: [Answers(answer: "удавчик", correctAnswer: false),Answers(answer: "дракончик", correctAnswer: false), Answers(answer: "змейка", correctAnswer: true), Answers(answer: "крокодильчик", correctAnswer: false)]),
        Ask(question: "Какое озеро самое глубокое в мире?", coast: 8000, answers: [Answers(answer: "Мичиган", correctAnswer: false),Answers(answer: "Байкал", correctAnswer: true), Answers(answer: "Виктория", correctAnswer: false), Answers(answer: "Арал", correctAnswer: false)]),
        Ask(question: "Где растут подсолнухи?", coast: 10000, answers: [Answers(answer: "на небе", correctAnswer: false),Answers(answer: "на солнце", correctAnswer: false), Answers(answer: "на деревьях", correctAnswer: false), Answers(answer: "на земле", correctAnswer: true)]),
        Ask(question: "Что итальянцы называют Цокколо?", coast: 20000, answers: [Answers(answer: "валенки", correctAnswer: false),Answers(answer: "чешки", correctAnswer: false), Answers(answer: "галоши", correctAnswer: false), Answers(answer: "сабо", correctAnswer: true)])
    ]
         
}

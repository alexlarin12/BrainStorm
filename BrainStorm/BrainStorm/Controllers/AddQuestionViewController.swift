//
//  AddQuestionViewController.swift
//  BrainStorm
//
//  Created by Alex Larin on 11.06.2020.
//  Copyright © 2020 Alex Larin. All rights reserved.
//

import UIKit

class AddQuestionViewController: UIViewController {
    private let questionsCaretacker: QuestionsCaretaker = .init()
    
    private var questions: [Ask] = []
//    var question = Ask(question: "", coast: 1000, answers: <#T##[Answers]#>)
    private var answers: [Answers] = []
    private var alertText: String = ""
    
    @IBOutlet weak var EnterQuestionTextField: UITextField!
    
    @IBOutlet weak var Answer1TextField: UITextField!
    @IBOutlet weak var Answer1Switch: UISwitch!
    @IBOutlet weak var Answer2TextField: UITextField!
    @IBOutlet weak var Answer2Switch: UISwitch!
    @IBOutlet weak var Answer3TextField: UITextField!
    @IBOutlet weak var Answer3Switch: UISwitch!
    @IBOutlet weak var Answer4TextField: UITextField!
    @IBOutlet weak var Answer4Switch: UISwitch!
    @IBOutlet weak var AddQuestionButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Answer1Switch.setOn(true, animated: true)
        Answer2Switch.setOn(false, animated: true)
        Answer3Switch.setOn(false, animated: true)
        Answer4Switch.setOn(false, animated: true)
    }
    
    @IBAction func Switch1Action(_ sender: Any) {
        if ( Answer1Switch.isOn ) {
            setSwitchesOff ( exclude: 1 )
        }
        
    }
    
    @IBAction func Swith2Action(_ sender: Any) {
        if ( Answer2Switch.isOn ) {
            setSwitchesOff ( exclude: 2 )
        }    }
    
    @IBAction func Switch3Action(_ sender: Any) {
        if ( Answer3Switch.isOn ) {
            setSwitchesOff ( exclude: 3 )
        }
    }
    
    @IBAction func Switch4Action(_ sender: Any) {
        if ( Answer1Switch.isOn ) {
            setSwitchesOff ( exclude: 4)
        }
    }
    
    @IBAction func AddQuestionButtonTap(_ sender: Any) {
        let question = EnterQuestionTextField.text ?? ""
        let answer1 = Answer1TextField.text ?? ""
        let answer2 = Answer2TextField.text ?? ""
        let answer3 = Answer3TextField.text ?? ""
        let answer4 = Answer4TextField.text ?? ""
        var correctAnswer1 = false
        var correctAnswer2 = false
        var correctAnswer3 = false
        var correctAnswer4 = false
        
        if ( Answer1Switch.isOn ) {
            correctAnswer1 = true
        } else if ( Answer2Switch.isOn ) {
            correctAnswer2 = true
        } else if ( Answer3Switch.isOn ) {
            correctAnswer3 = true
        } else if ( Answer4Switch.isOn ) {
            correctAnswer4 = true
        }
        
        if (question.isEmpty || answer1.isEmpty || answer2.isEmpty || answer3.isEmpty || answer4.isEmpty) {
            let alert = UIAlertController ( title: "Важно!", message: "Заполните все поля!", preferredStyle: .alert )
            alert.addAction(UIAlertAction(title: "Продолжить", style: .cancel, handler: nil))
            present(alert, animated: true)
        } else {
            Game.shared.appendNewQuestion(question:
                Ask(question: question, coast: 1000, answers: [
                    Answers(answer: answer1, correctAnswer: correctAnswer1),
                    Answers(answer: answer2, correctAnswer: correctAnswer2),
                    Answers(answer: answer3, correctAnswer: correctAnswer3),
                    Answers(answer: answer4, correctAnswer: correctAnswer4)
                ]))
              dismiss(animated: true, completion: nil)
        }
    }
    private func setSwitchesOff ( exclude: Int ) {
        if ( exclude != 1 ) {
            Answer1Switch.setOn(false, animated: true)
        }
        if ( exclude != 2 ) {
            Answer2Switch.setOn(false, animated: true)
        }
        if ( exclude != 3 ) {
            Answer3Switch.setOn(false, animated: true)
        }
        if ( exclude != 4 ) {
            Answer4Switch.setOn(false, animated: true)
        }
    }
}

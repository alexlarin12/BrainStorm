//
//  GameTableViewController.swift
//  BrainStorm
//
//  Created by Alex Larin on 04.06.2020.
//  Copyright © 2020 Alex Larin. All rights reserved.
//

import UIKit
protocol GameViewControllerDelegate: class {
    func didEndGame(withResult result: Int)
}

class GameTableViewController: UITableViewController {
    let dataBase = DataBase()
    var questions:[Ask] = []
    var numberAsk = 0
    var questionNumber = Observable<Int>(0)
    var success = Observable<Float>(0)
    var result = 0
    var questionManager: QuestionManager = SerialQuestionManager()
    
    @IBOutlet weak var QuestionNumber: UILabel!
    
    @IBOutlet weak var SuccessLabel: UILabel!
    
    @IBAction func ClearRecordsAction(_ sender: Any) {
        let alert = UIAlertController(title: "Are you sure?", message: "Delete All Records", preferredStyle: .alert)
        let action = UIAlertAction(title: "Delete", style: .default) { _ in
            Game.shared.clearRecords()
            
        }
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    // свойство для хранения ссылки
    weak var gameDelegate: GameViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionManager = Game.shared.questionManager
        questions = questionManager.nextQuestion() ?? []
        // наблюдатель за изменением номера вопроса:
        self.questionNumber.addObserver(self, options: [.new, .initial],closure: {questionNumber, change in
            self.QuestionNumber.text = "\(questionNumber + 1)"
        })
        self.success.addObserver(self, options: [.new, .initial],closure: {success, change in
            // переводим в Int чтобы убрать лишнии цифры после запятой:
            let intSuccess = Int(success)
            self.SuccessLabel.text = "\(intSuccess)%"
        })
    }
    // метод выполняемый при правильном ответе:
    func ifRightAnswer(result: Int, countRightAnswers: Int){
        var finishResult = 0
        let alert = UIAlertController(title: "Success!", message: "Correct answer", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default) { _ in
            self.questionNumber.value = self.numberAsk
            if self.numberAsk == self.questions.count {
                self.numberAsk -= 1
                self.questionNumber.value = self.numberAsk
                self.success.value = Float(countRightAnswers)/Float(self.questions.count)*100
                let record = GameSession(countQuestions: self.questions.count,countRightAnswers: countRightAnswers, success: self.success.value, score: self.result, date: Date())
                Game.shared.addRecord(record)
                
                // оповещаем делегат что игра закончена:
                self.gameDelegate?.didEndGame(withResult: result)
            }
            self.success.value = Float(countRightAnswers)/Float(self.questions.count)*100
            self.tableView.reloadData()
        }
        
        finishResult += result
        
        alert.addAction(action)
        present(alert, animated: true)
        
        numberAsk = numberAsk + 1
        
    }
    // метод выполняемый при неправильном ответе:
    func ifWrondAnswer(result: Int){
        let alert = UIAlertController(title: "Error", message: "Incorrect answer", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default) { _ in
            // оповещаем делегат что игра закончена:
            self.gameDelegate?.didEndGame(withResult: result)
        }
        
        alert.addAction(action)
        present(alert, animated: true)
    }
    // метод выполняемый при победе в игре
    func ifAnswerAllQuestion(){
        
    }
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        // return dataBase.ask[numberAsk].answers.count
        return questions[numberAsk].answers.count
    }
    // метод установки высоты header
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 150
    }
    // метод установки header в секции
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        
        view.backgroundColor = #colorLiteral(red: 0.3459618092, green: 0.3377969265, blue: 0.8411403298, alpha: 1)
        let label = UILabel()
        let titleLable = UILabel()
        titleLable.text = "Вопрос на \(questions[numberAsk].coast) рублей:"
        titleLable.textAlignment = .center
        label.text = questions[numberAsk].question
        label.textAlignment = .center
        let width = tableView.frame.width - 20
        label.frame = CGRect(x: 10, y: 0, width: width, height: 150)
        titleLable.frame = CGRect(x: 10, y: 0, width: width, height: 40)
        label.numberOfLines = 0
        label.textColor = UIColor.white
        titleLable.textColor = UIColor.white
        label.backgroundColor = #colorLiteral(red: 0.3459618092, green: 0.3377969265, blue: 0.8411403298, alpha: 1)
        view.addSubview(label)
        view.addSubview(titleLable)
        return view
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GameCell", for: indexPath) as! GameCell
        let titleCharArray = ["A:","B:","C:","D:"]
        let titleChar = titleCharArray[indexPath.row]
        cell.TitleCharLabel.text = titleChar
        let answer = questions[numberAsk].answers[indexPath.row].answer
        cell.answerLabel.text = answer
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let result1 = questions[self.numberAsk].coast
        if questions[numberAsk].answers[indexPath.row].correctAnswer == false {
            self.result = self.result + 0
            self.success.value = Float(Double(numberAsk)/Double(self.questions.count)*100)
            let record = GameSession(countQuestions: self.questions.count,countRightAnswers: numberAsk,success: success.value, score: self.result, date: Date())
            Game.shared.addRecord(record)
            ifWrondAnswer(result: result)
        }else{
            self.result = self.result + result1
            
            ifRightAnswer(result: result, countRightAnswers: numberAsk + 1)
        }
    }
}

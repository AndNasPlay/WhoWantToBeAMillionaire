//
//  GameViewController.swift
//  WhoWantToBeAMillionaire
//
//  Created by Андрей Щекатунов on 28.10.2020.
//  Copyright © 2020 Andrey Shchekatunov. All rights reserved.
//

import UIKit
import RealmSwift

class GameViewController: UIViewController {
    
    @IBOutlet weak var NameGamerLable: UILabel!
    
    @IBOutlet weak var NumberOfQ: UILabel!
    
    @IBOutlet weak var QuestionLable: UILabel!
    
    @IBOutlet weak var Cash: UILabel!
    
    @IBOutlet weak var Balance: UILabel!
    
    
    @IBOutlet weak var Answer1Title: UIButton!
    
    @IBOutlet weak var Answer2Title: UIButton!
    
    @IBOutlet weak var Answer3Title: UIButton!
    
    @IBOutlet weak var Answer4Title: UIButton!
    
    
    @IBOutlet weak var PromptCallLable: UIButton!
    
    @IBOutlet weak var Prompt50Lable: UIButton!
    
    @IBOutlet weak var PromptHelpLable: UIButton!
    
    
    @IBAction func Answer1(_ sender: UIButton) {
        if checkAnswer(Answer: QuestionAnswerArrRealm![questionStart.value].answer[0], AnswerPosition: Answer1Title) == true {
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: {
                self.addQuestion(numberOfQuestion: self.questionStart.value)
            })
        }
    }
    
    @IBAction func Answer2(_ sender: UIButton) {
        if checkAnswer(Answer: QuestionAnswerArrRealm![questionStart.value].answer[1], AnswerPosition: Answer2Title) == true {
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: {
                self.addQuestion(numberOfQuestion: self.questionStart.value)
            })
        }
    }
    
    @IBAction func Answer3(_ sender: UIButton) {
        if checkAnswer(Answer: QuestionAnswerArrRealm![questionStart.value].answer[2], AnswerPosition: Answer3Title) == true {
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: {
                self.addQuestion(numberOfQuestion: self.questionStart.value)
            })
        }
    }
    
    @IBAction func Answer4(_ sender: UIButton) {
        if checkAnswer(Answer: QuestionAnswerArrRealm![questionStart.value].answer[3], AnswerPosition: Answer4Title) == true {
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: {
                self.addQuestion(numberOfQuestion: self.questionStart.value)
            })
        }
    }
    
    
    @IBAction func PromptCall(_ sender: UIButton) {
        if promptCallInt == 1 {
            PromptCallFriend(QuestionAnswerStruct: (QuestionAnswerArrRealm![questionStart.value]))
            PromptCallLable.setBackgroundImage(UIImage(named: "friendUse"), for: .normal)
            promptCallInt -= 1
        } else { return }
        
    }
    
    @IBAction func Prompt50(_ sender: UIButton) {
        if prompt50Int == 1 {
            Prompt50T50(QuestionAnswerStruct: (QuestionAnswerArrRealm![questionStart.value]))
            Prompt50Lable.setBackgroundImage(UIImage(named: "50use"), for: .normal)
            prompt50Int -= 1
        } else { return }
        
    }
    
    @IBAction func PromptHelp(_ sender: UIButton) {
        if promptHelpInt == 1 {
            PromptHelpPeople(QuestionAnswerStruct: (QuestionAnswerArrRealm![questionStart.value]))
            PromptHelpLable.setBackgroundImage(UIImage(named: "zalUse"), for: .normal)
            promptHelpInt -= 1
        } else { return }
    }
    
    var QuestionAnswerArr = [
        QuestionAnswerStruct(
            questionId: 1,
            question: "На каком инструменте, как считается, играл древнерусский певец и сказитель Боян?",
            answer:[
                Answer(answer: "На гуслях", answerBool: 1, answerCost: 500),
                Answer(answer: "На виолончели", answerBool: 0, answerCost: 0),
                Answer(answer: "На баяне", answerBool: 0, answerCost: 0),
                Answer(answer: "На гитаре", answerBool: 0, answerCost: 0)],
            questionCost: 500),
        QuestionAnswerStruct(
            questionId: 2,
            question: "В какой из этих стран один из официальных языков - французский?",
            answer:[
                Answer(answer: "Республика Гаити", answerBool: 1, answerCost: 1000),
                Answer(answer: "Кения", answerBool: 0, answerCost: 0),
                Answer(answer: "Эквадор", answerBool: 0, answerCost: 0),
                Answer(answer: "Венесуэла", answerBool: 0, answerCost: 0)],
            questionCost: 1000),
        QuestionAnswerStruct(
            questionId: 3,
            question: "В каком из этих фильмов не снимался Александр Абдулов?",
            answer:[
                Answer(answer: "Карнавал", answerBool: 0, answerCost: 0),
                Answer(answer: "Московские каникулы", answerBool: 1, answerCost: 2000),
                Answer(answer: "Чародеи", answerBool: 0, answerCost: 0),
                Answer(answer: "Убить дракона", answerBool: 0, answerCost: 0)],
            questionCost: 2000),
        QuestionAnswerStruct(
            questionId: 4,
            question: "В каком году произошла Куликовская битва?",
            answer:[
                Answer(answer: "1380", answerBool: 1, answerCost: 5000),
                Answer(answer: "1569", answerBool: 0, answerCost: 0),
                Answer(answer: "1616", answerBool: 0, answerCost: 0),
                Answer(answer: "1773", answerBool: 0, answerCost: 0)],
            questionCost: 5000),
        QuestionAnswerStruct(
            questionId: 5,
            question: "Кто автор музыки к детской песенке Чунга-Чанга?",
            answer:[
                Answer(answer: "Шаинский", answerBool: 1, answerCost: 10000),
                Answer(answer: "Зацепин", answerBool: 0, answerCost: 0),
                Answer(answer: "Дербенёв", answerBool: 0, answerCost: 0),
                Answer(answer: "Шпиц", answerBool: 0, answerCost: 0)],
            questionCost: 10000)
    ]
    
    var QuestionAnswerArrRealm: [QuestionAnswerRealm]?
    
    private var QuestionAnswerArrRealmNo: Results<QuestionAnswerRealm>? {
        let QuestionAnswerArrRealm: Results<QuestionAnswerRealm>? = realmManager?.getObjects()
        return QuestionAnswerArrRealm?.sorted(byKeyPath: "questionId", ascending: true)
    }
    
    
    var questionStart = Observable<Int>(0)
    var moneyBalance: Int = 0
    var promptCallInt: Int = 1
    var prompt50Int: Int = 1
    var promptHelpInt: Int = 1
    var onGameEnd: ((Int) -> Void)?
    var difficulty: Difficulty = Singleton.shared.gameDifficulty
    private let realmManager = RealmManager.shared
    
    public func addRealmBase() {
        
        var questionTest = QuestionAnswerRealm()
        let answerTest = List<AnswerRealm>()
        
        let realm = try! Realm()
        
        for n in 0...4 {
            questionTest = addQuestionRealm(questionNumerb: n)
            
            for i in 0...3 {
                answerTest.append(addAnswer(answerNumber: i, questionNumerb: n))
            }
            
            questionTest.answer.append(objectsIn: answerTest)
            answerTest.removeAll()
            try! realm.write {
                realm.add(questionTest)
            }
        }
    }
    
    func addQuestionRealm(questionNumerb: Int) -> QuestionAnswerRealm {
        let questionRealm = QuestionAnswerRealm()
        questionRealm.questionId = QuestionAnswerArr[questionNumerb].questionId
        questionRealm.question = QuestionAnswerArr[questionNumerb].question
        questionRealm.questionCost = QuestionAnswerArr[questionNumerb].questionCost
        
        return questionRealm
    }
    
    func addAnswer(answerNumber: Int, questionNumerb: Int) -> AnswerRealm {
        let answerOneTest1 = AnswerRealm()
        
        answerOneTest1.answerCost = QuestionAnswerArr[questionNumerb].answer[answerNumber].answerCost
        answerOneTest1.answerBool = QuestionAnswerArr[questionNumerb].answer[answerNumber].answerBool
        answerOneTest1.answer = QuestionAnswerArr[questionNumerb].answer[answerNumber].answer
        
        return answerOneTest1
    }
    
    func addQuestion(numberOfQuestion: Int) {
        if numberOfQuestion < QuestionAnswerArrRealm!.count  {
            NumberOfQ.text = "Вопрос № \(questionStart.value + 1)"
            QuestionLable.text = QuestionAnswerArrRealm![numberOfQuestion].question
            Cash.text = "\(QuestionAnswerArrRealm![numberOfQuestion].questionCost) USD"
            Balance.text = String("\(moneyBalance) USD")
            
            AnswerLableStateText(lable: Answer1Title, numberOfQuestion: numberOfQuestion, numberOfAnswer: 0)
            AnswerLableStateText(lable: Answer2Title, numberOfQuestion: numberOfQuestion, numberOfAnswer: 1)
            AnswerLableStateText(lable: Answer3Title, numberOfQuestion: numberOfQuestion, numberOfAnswer: 2)
            AnswerLableStateText(lable: Answer4Title, numberOfQuestion: numberOfQuestion, numberOfAnswer: 3)
        } else {
            let alert = UIAlertController(title: "Игра окончена", message: "Поздравляю! \(Singleton.shared.name) Вы стали миллионером!", preferredStyle: UIAlertController.Style.alert)
            
            let score = GameResults(cash: moneyBalance, questionsRight: questionStart.value, allQuestions: QuestionAnswerArrRealm!.count, playerName: NameGamerLable.text ?? "Эдгар")
            print(score.allQuestions)
            print(score.procentOfWin)
            Singleton.shared.addResult(result: score)
            self.onGameEnd!(moneyBalance)
            self.present(alert, animated: true, completion: nil)
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: {
                self.back()
                self.back()
            })
        }
    }
    
    func back() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func AnswerLableStateText(lable: UIButton, numberOfQuestion: Int, numberOfAnswer: Int ) {
        lable.setTitle("\(QuestionAnswerArrRealm![numberOfQuestion].answer[numberOfAnswer].answer)", for: .normal)
        lable.setBackgroundImage(UIImage(named: "windowAns"), for: .normal)
        lable.isHidden = false
        lable.setTitleColor(.white, for: .normal)
    }
    
    func checkAnswer(Answer: AnswerRealm, AnswerPosition: UIButton) -> Bool {
        guard AnswerPosition.title(for: .normal) == Answer.answer  else { return false }
        if Answer.answerBool == 0 {
            print("ошибка")
            AnswerPosition.setBackgroundImage(UIImage(named: "incorrect"), for: .normal)
            let alert = UIAlertController(title: "Игра окончена", message: "\(Singleton.shared.name) Вы выйграли \(self.moneyBalance) USD", preferredStyle: UIAlertController.Style.alert)
            //alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: {
                self.back()
                self.back()
            })
            let score = GameResults(cash: moneyBalance, questionsRight: questionStart.value, allQuestions: QuestionAnswerArrRealm!.count, playerName: NameGamerLable.text ?? "Эдгар")
            Singleton.shared.addResult(result: score)
            self.onGameEnd!(moneyBalance)
            return false
            
        } else {
            print("победа")
            AnswerPosition.setBackgroundImage(UIImage(named: "correct"), for: .normal)
            questionStart.value += 1
            moneyBalance = moneyBalance + Answer.answerCost
            Singleton.shared.numberOfQuestion = questionStart.value
            Singleton.shared.score = moneyBalance
            
            return true
        }
    }
    
    func PromptHelpPeople(QuestionAnswerStruct: QuestionAnswerRealm) {
        if QuestionAnswerStruct.answer[0].answerBool == 1 {
            Answer1Title.setTitleColor(.green, for: .normal)
        } else if QuestionAnswerStruct.answer[1].answerBool == 1 {
            Answer2Title.setTitleColor(.green, for: .normal)
        } else if QuestionAnswerStruct.answer[2].answerBool == 1 {
            Answer3Title.setTitleColor(.green, for: .normal)
        } else if QuestionAnswerStruct.answer[3].answerBool == 1 {
            Answer4Title.setTitleColor(.green, for: .normal)
        }
    }
    
    func Prompt50T50(QuestionAnswerStruct: QuestionAnswerRealm) {
        var i = 0
        while i < 2 {
            if QuestionAnswerStruct.answer[0].answerBool == 0 {
                Answer1Title.isHidden = true
                i+=1
            } else if QuestionAnswerStruct.answer[1].answerBool == 0 {
                Answer2Title.isHidden = true
                i+=1
            }
            if QuestionAnswerStruct.answer[2].answerBool == 0 {
                Answer3Title.isHidden = true
                i+=1
            } else if QuestionAnswerStruct.answer[3].answerBool == 0 {
                Answer4Title.isHidden = true
                i+=1
            }
        }
    }
    
    func PromptCallFriend(QuestionAnswerStruct: QuestionAnswerRealm) {
        if QuestionAnswerStruct.answer[0].answerBool == 0 && Answer1Title.isHidden != true {
            Answer1Title.setTitleColor(.brown, for: .normal)
        } else if QuestionAnswerStruct.answer[1].answerBool == 0 && Answer2Title.isHidden != true {
            Answer2Title.setTitleColor(.brown, for: .normal)
        } else if QuestionAnswerStruct.answer[2].answerBool == 0 && Answer3Title.isHidden != true {
            Answer3Title.setTitleColor(.brown, for: .normal)
        } else if QuestionAnswerStruct.answer[3].answerBool == 0 && Answer4Title.isHidden != true {
            Answer4Title.setTitleColor(.brown, for: .normal)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if QuestionAnswerArrRealmNo!.isEmpty{
            addRealmBase()
        }
        if difficulty == .hard {
            QuestionAnswerArrRealm = QuestionAnswerArrRealmNo?.toArray(type: QuestionAnswerRealm.self).shuffled()
            
        } else if difficulty == .easy {
            QuestionAnswerArrRealm = QuestionAnswerArrRealmNo?.toArray(type: QuestionAnswerRealm.self)
            Singleton.shared.allQuestionId = QuestionAnswerArrRealm!.last!.questionId
        }
        
        NameGamerLable.text = Singleton.shared.name
        addQuestion(numberOfQuestion: questionStart.value)
    }
    
}
extension Results {
    func toArray<T>(type: T.Type) -> [T] {
        return compactMap { $0 as? T }
    }
}

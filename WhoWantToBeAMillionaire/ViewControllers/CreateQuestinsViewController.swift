//
//  CreateQuestinsViewController.swift
//  WhoWantToBeAMillionaire
//
//  Created by Андрей Щекатунов on 01.11.2020.
//  Copyright © 2020 Andrey Shchekatunov. All rights reserved.
//

import UIKit
import RealmSwift

class CreateQuestinsViewController: UIViewController {
    
    @IBOutlet weak var CreateQuestinsTableView: UITableView!
    
    @IBAction func addQuestionNewButton(_ sender: UIButton) {
        
        let indexAll = CreateQuestinsTableView.indexPathsForVisibleRows

        for i in 0...indexAll!.count - 1 {
            let cell = CreateQuestinsTableView.cellForRow(at: indexAll![i])
            addRealmBase(cell: cell as! CreateQuestinsTableViewCell)
        }

        testArr.removeAll()
        CreateQuestinsTableView.reloadData()
        
    }
    var testArr: [Int] = [0]
    
    private let realmManager = RealmManager.shared
    
    @IBAction func Back(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func addCell(_ sender: UIButton) {
        testArr.append(1)
        CreateQuestinsTableView.reloadData()
    }
    
    
    func addRealmBase(cell: CreateQuestinsTableViewCell) {
        
        var questionTest = QuestionAnswerRealm()
        let answerTest = List<AnswerRealm>()
        
        questionTest = addQuestionRealm(cell: cell)
        
        for i in 0...3 {
            answerTest.append(addAnswer(cell: cell, number: i))
        }
        questionTest.answer.append(objectsIn: answerTest)
        //answerTest.removeAll()
        try! realmManager?.add(object: questionTest)
        Singleton.shared.allQuestionId += 1
        
    }
    
    func addQuestionRealm(cell: CreateQuestinsTableViewCell) -> QuestionAnswerRealm {
        let questionRealm = QuestionAnswerRealm()
        questionRealm.questionId = Singleton.shared.allQuestionId + 1
        questionRealm.question = cell.QuestText.text
        questionRealm.questionCost = 1000
        print(questionRealm.question)
        return questionRealm
    }
    
    func addAnswer(cell: CreateQuestinsTableViewCell, number: Int) -> AnswerRealm {
        let answerALL = AnswerRealm()
        
        switch number {
        case 0:
            answerALL.answer = cell.Answer1.text ?? "ответ №1"
        case 1:
            answerALL.answer = cell.Answer2.text ?? "ответ №2"
        case 2:
            answerALL.answer = cell.Answer3.text ?? "ответ №3"
        case 3:
            answerALL.answer = cell.Answer4.text ?? "ответ №4"
        default:
            answerALL.answer = "ошибка"
        }
        
        if cell.SelectedAnswer.selectedSegmentIndex == number {
            answerALL.answerBool = 1
            answerALL.answerCost = 1000
        } else {
            answerALL.answerBool = 0
            answerALL.answerCost = 0
        }
        return answerALL
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CreateQuestinsTableView.delegate = self
        CreateQuestinsTableView.dataSource = self
    }
    
}

extension CreateQuestinsViewController: UITableViewDelegate {
    
}

extension CreateQuestinsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testArr.count
        
    }
    
        func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == UITableViewCell.EditingStyle.delete {
                testArr.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
            }
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "AddQuestion", for: indexPath) as? CreateQuestinsTableViewCell {
            let test = testArr[indexPath.row]
            cell.Answer1.text = nil
            cell.Answer2.text = nil
            cell.Answer3.text = nil
            cell.Answer4.text = nil
            cell.Answer1.placeholder = "ответ №1"
            cell.Answer2.placeholder = "ответ №2"
            cell.Answer3.placeholder = "ответ №3"
            cell.Answer4.placeholder = "ответ №4"
            cell.QuestText.text = nil
            
            cell.Answer1.tag = indexPath.item
            cell.Answer1.addTarget(self, action: #selector(addQuestionNewButton), for: .touchUpInside)
                        
            return cell
            
        } else {
            return UITableViewCell()
        }
    }
}




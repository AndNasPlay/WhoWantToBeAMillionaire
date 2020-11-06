//
//  QuestionsClass.swift
//  WhoWantToBeAMillionaire
//
//  Created by Андрей Щекатунов on 04.11.2020.
//  Copyright © 2020 Andrey Shchekatunov. All rights reserved.
//

import Foundation
import RealmSwift
 

class QuestionAnswerRealm: Object {
    @objc dynamic var questionId: Int = 0
    @objc dynamic var question: String = ""
    @objc dynamic var questionCost: Int = 0
    let answer = List<AnswerRealm>()
    
    override static func primaryKey() -> String? {
        return "questionId"
    }
}



class AnswerRealm: Object  {
    @objc dynamic var answer: String = ""
    @objc dynamic var answerBool: Int = 0
    @objc dynamic var answerCost: Int = 0
}



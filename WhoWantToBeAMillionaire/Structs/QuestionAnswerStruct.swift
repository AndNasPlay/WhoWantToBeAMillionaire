//
//  QuestionAnswerStruct.swift
//  WhoWantToBeAMillionaire
//
//  Created by Андрей Щекатунов on 28.10.2020.
//  Copyright © 2020 Andrey Shchekatunov. All rights reserved.
//

import Foundation


 struct QuestionAnswerStruct {
    let questionId: Int
    let question: String
    let answer: [Answer]
    let questionCost: Int
}

struct Answer {
    let answer: String
    let answerBool: Int
    let answerCost: Int
}

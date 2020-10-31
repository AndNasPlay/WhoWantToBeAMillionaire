//
//  GameSession.swift
//  WhoWantToBeAMillionaire
//
//  Created by Андрей Щекатунов on 30.10.2020.
//  Copyright © 2020 Andrey Shchekatunov. All rights reserved.
//

import Foundation

class  GameSession {
    var cash: Int = 0
    var questionsRight: Int = 0
    var allQuestions: Int = 0
    var playerName: String = ""
}

struct GameResults: Codable {
    var cash: Int = 0
    var questionsRight: Int = 0
    var allQuestions: Int = 0
    var playerName: String = ""
    var procentOfWin: Int {
        return Int((Double(questionsRight)/Double(allQuestions))*100)
    }
    
}

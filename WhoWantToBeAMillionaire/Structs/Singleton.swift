//
//  Singleton.swift
//  WhoWantToBeAMillionaire
//
//  Created by Андрей Щекатунов on 29.10.2020.
//  Copyright © 2020 Andrey Shchekatunov. All rights reserved.
//

import Foundation

class Singleton {
    static let shared = Singleton()
    var name: String = ""
    var score: Int = 0
    var numberOfQuestion: Int = 0
    var procentOfwin: Float = 0.0
    var gameDifficulty: Difficulty = .easy
    var allQuestionId: Int = 5
    var gameDifficultySegment: Int {
        switch gameDifficulty {
        case .easy:
            return 0
        case .hard:
            return 1
        }
    }
    
        
    private let recordsCaretaker = Memento()
    
    private(set) var allGameSession: [GameResults] {
        didSet {
            recordsCaretaker.saveRecords(records: allGameSession)
        }
    }

    func addResult(result: GameResults) {
        allGameSession.append(result)
    }
        
    func clearRecords() {
        allGameSession.removeAll()
    }
    
    private init() {
        allGameSession = recordsCaretaker.loadRecords() ?? []
    }
    
}


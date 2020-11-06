//
//  SettingsViewController.swift
//  WhoWantToBeAMillionaire
//
//  Created by Андрей Щекатунов on 01.11.2020.
//  Copyright © 2020 Andrey Shchekatunov. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var DifficultyControl: UISegmentedControl!
    
    
    private var selectedDifficultyLvl: Difficulty {
        switch DifficultyControl.selectedSegmentIndex {
        case 0:
            return .easy
        case 1:
            return .hard
        default:
            return .easy
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        DifficultyControl.selectedSegmentIndex = Singleton.shared.gameDifficultySegment
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        Singleton.shared.gameDifficulty = selectedDifficultyLvl
        print("\(Singleton.shared.gameDifficulty)")
        
    }
    
    @IBAction func GoBack(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func GoToCreateQuestions(_ sender: UIButton) {
        
        performSegue(withIdentifier: "CreateQuestinsSegue", sender: self)
    }
    
    
    
    
    
}

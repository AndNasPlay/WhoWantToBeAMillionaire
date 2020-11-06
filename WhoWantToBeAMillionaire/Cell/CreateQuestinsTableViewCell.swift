//
//  CreateQuestinsTableViewCell.swift
//  WhoWantToBeAMillionaire
//
//  Created by Андрей Щекатунов on 01.11.2020.
//  Copyright © 2020 Andrey Shchekatunov. All rights reserved.
//

import UIKit

class CreateQuestinsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var QuestText: UITextView!
    
    @IBOutlet weak var Answer1: UITextField!
    @IBOutlet weak var Answer2: UITextField!
    @IBOutlet weak var Answer3: UITextField!
    @IBOutlet weak var Answer4: UITextField!
    
    @IBOutlet weak var addQuestionButton: UIButton!
    
    @IBOutlet weak var SelectedAnswer: UISegmentedControl!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}

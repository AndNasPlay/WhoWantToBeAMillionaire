//
//  ScoreCellTableViewCell.swift
//  WhoWantToBeAMillionaire
//
//  Created by Андрей Щекатунов on 28.10.2020.
//  Copyright © 2020 Andrey Shchekatunov. All rights reserved.
//

import UIKit
import Foundation

class ScoreCellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var NameLable: UILabel!
    
    @IBOutlet weak var ScoreLable: UILabel!
    
    @IBOutlet weak var ProcentOfWin: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

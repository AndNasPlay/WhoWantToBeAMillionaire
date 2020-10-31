//
//  ResultViewController.swift
//  WhoWantToBeAMillionaire
//
//  Created by Андрей Щекатунов on 28.10.2020.
//  Copyright © 2020 Andrey Shchekatunov. All rights reserved.
//

import UIKit
import Foundation

class ResultViewController: UIViewController {
    
    @IBOutlet weak var ScoreTableView: UITableView!
    
    @IBAction func Back(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ScoreTableView.delegate = self
        ScoreTableView.dataSource = self
        
    }
    
}

extension ResultViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let record = Singleton.shared.allGameSession[indexPath.row]
    }
    
}

extension ResultViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Singleton.shared.allGameSession.count ?? 1
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ResultTableViewCell", for: indexPath) as? ScoreCellTableViewCell {
            
            let record = Singleton.shared.allGameSession[indexPath.row]
            
            cell.ScoreLable.text = "\(record.cash) USD"
            cell.NameLable.text =  record.playerName
            cell.ProcentOfWin.text = "\(record.procentOfWin)%"
            
            return cell
            
        } else {
            return UITableViewCell()
        }
    }
}



//
//  ViewController.swift
//  WhoWantToBeAMillionaire
//
//  Created by Андрей Щекатунов on 28.10.2020.
//  Copyright © 2020 Andrey Shchekatunov. All rights reserved.
//


import UIKit


class MainViewController: UIViewController {
    
    @IBOutlet weak var NameTextField: UITextField!
    @IBOutlet weak var LastResult: UILabel!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "GameVc":
            if let destination = segue.destination as? GameViewController {
                destination.onGameEnd = { [weak self] (result) in
                    guard let self = self else { return }
                    self.LastResult.text = "Your last result is: \(result) USD"
                }
            }  
        default:
            break
        }
    }
    
    @IBAction func NewGameButton(_ sender: UIButton) {
        Singleton.shared.name = self.NameTextField.text ?? "Валера"
        
        performSegue(withIdentifier: "GameVc", sender: self)
    }
    
    @IBAction func ResultButton(_ sender: UIButton) {
        performSegue(withIdentifier: "ResultVC", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


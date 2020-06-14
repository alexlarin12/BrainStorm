//
//  StartViewController.swift
//  BrainStorm
//
//  Created by Alex Larin on 03.06.2020.
//  Copyright © 2020 Alex Larin. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {
    var difficulty: Difficulty = .serial
    
    @IBOutlet weak var BrainStormLabel: UILabel!
    @IBOutlet weak var LastResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LastResult.text = "no results"
    }
    // приготовления для передачи
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "toGame":
            guard let destination = segue.destination as? GameTableViewController else { return }
            destination.gameDelegate = self
        default:
            break
        }
    }
}

// по окончании иры в GameTableViewController закрываем экран и прокидываем result в StartViewController:
extension StartViewController: GameViewControllerDelegate{
    func didEndGame(withResult result: Int) {
        self.dismiss(animated: true, completion: nil)
        LastResult.text = "You win: \(result)"
      
    }
    
}

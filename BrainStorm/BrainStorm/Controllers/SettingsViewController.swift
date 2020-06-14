//
//  SettingsViewController.swift
//  BrainStorm
//
//  Created by Alex Larin on 10.06.2020.
//  Copyright © 2020 Alex Larin. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var DifficultyControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        switch self.DifficultyControl.selectedSegmentIndex {
        case 0:
            return Game.shared.saveModeQuestion(value: .serial)
        case 1:
            return Game.shared.saveModeQuestion(value: .random)
        default:
            return Game.shared.saveModeQuestion(value: .serial)
        }
    }
    
}

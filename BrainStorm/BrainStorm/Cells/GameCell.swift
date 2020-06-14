//
//  GameCell.swift
//  BrainStorm
//
//  Created by Alex Larin on 04.06.2020.
//  Copyright © 2020 Alex Larin. All rights reserved.
//

import UIKit

class GameCell: UITableViewCell {

    @IBOutlet weak var answerLabel: UILabel!
    
    @IBOutlet weak var TitleCharLabel: UILabel!
 
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}

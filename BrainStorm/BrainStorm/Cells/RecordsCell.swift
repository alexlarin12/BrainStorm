//
//  RecordsCell.swift
//  BrainStorm
//
//  Created by Alex Larin on 07.06.2020.
//  Copyright © 2020 Alex Larin. All rights reserved.
//

import UIKit

class RecordsCell: UITableViewCell {

    @IBOutlet weak var DateRecordLabel: UILabel!
    
    @IBOutlet weak var RecordLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

      
    }

}

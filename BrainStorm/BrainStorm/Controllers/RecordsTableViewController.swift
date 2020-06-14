//
//  RecordsTableViewController.swift
//  BrainStorm
//
//  Created by Alex Larin on 06.06.2020.
//  Copyright © 2020 Alex Larin. All rights reserved.
//

import UIKit

class RecordsTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return Game.shared.records.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecordCell", for: indexPath) as! RecordsCell
        let record = Game.shared.records[indexPath.row]
        let dateFormatter = DateTimeHelper()
        cell.RecordLabel.text = "\(record.score)"
        cell.DateRecordLabel.text = dateFormatter.getFormattedDate(indexPath: indexPath, from: record.date)
        return cell
    }
    
}

//
//  TableViewCell.swift
//  homework Detail
//
//  Created by Admin on 22.01.2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!

    func initCell(quote: [Quote]?, indexPath: IndexPath) {
        if let quote = quote {
            mainLabel.text = quote[indexPath.row].text
            authorLabel.text = quote[indexPath.row].author
        }
        
    }

}

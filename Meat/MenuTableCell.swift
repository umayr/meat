//
//  MenuTableCell.swift
//  Meat
//
//  Created by Umayr Shahid on 26/07/2015.
//  Copyright (c) 2015 Umayr Shahid. All rights reserved.
//

import UIKit

class MenuTableCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
//
//  BankContactCell.swift
//  Canvas
//
//  Created by urmila reddy on 25/09/20.
//  Copyright © 2020 urmila reddy. All rights reserved.
//

import UIKit

class BankContactCell: UITableViewCell {
    
    @IBOutlet weak var nameField: UILabel!
    
    @IBOutlet weak var phneField: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

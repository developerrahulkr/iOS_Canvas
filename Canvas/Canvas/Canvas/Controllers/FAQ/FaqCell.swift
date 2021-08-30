//
//  FaqCell.swift
//  Canvas
//
//  Created by urmila reddy on 26/08/20.
//  Copyright © 2020 urmila reddy. All rights reserved.
//

import UIKit

class FaqCell: UITableViewCell {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var subTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

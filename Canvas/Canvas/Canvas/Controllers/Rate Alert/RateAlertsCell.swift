//
//  RateAlertsCell.swift
//  Canvas
//
//  Created by urmila reddy on 12/10/20.
//  Copyright © 2020 urmila reddy. All rights reserved.
//

import UIKit

class RateAlertsCell: UITableViewCell {
    
    @IBOutlet weak var curencyLbl: UILabel!
    
    @IBOutlet weak var thresholdLbl: UILabel!
    
    @IBOutlet weak var deleteBtnOtlt: PassableUIButton!
    
    
    @IBOutlet weak var editBtnOtlt: PassableUIButton!
    
    var rateAlertId = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

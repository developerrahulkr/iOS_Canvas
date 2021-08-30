//
//  TransctnByPeriodCell.swift
//  Canvas
//
//  Created by urmila reddy on 02/11/20.
//  Copyright © 2020 urmila reddy. All rights reserved.
//

import UIKit

class TransctnByPeriodCell: UITableViewCell {
    
    @IBOutlet weak var accountNumbrLbl: UILabel!
    
    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var dateLbl: UILabel!
    
    @IBOutlet weak var curencyLbl: UILabel!
    
    @IBOutlet weak var amntLbl: UILabel!
    
    
    var benfId:Int!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

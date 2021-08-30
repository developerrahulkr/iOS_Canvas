//
//  BranchLocatorCell.swift
//  Canvas
//
//  Created by urmila reddy on 07/11/20.
//  Copyright © 2020 urmila reddy. All rights reserved.
//

import UIKit

class BranchLocatorCell: UITableViewCell {

    @IBOutlet weak var headerLbl: UILabel!
    
    @IBOutlet weak var adressLbl: UILabel!
    
    @IBOutlet weak var phoneNumberLbl: UILabel!
    
    @IBOutlet weak var viewOnMapBtnOtlt: PassableUIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        viewOnMapBtnOtlt.setTitle(Global.shared.viewOnGoogleMapTxt, for: .normal)
        // Configure the view for the selected state
    }

}

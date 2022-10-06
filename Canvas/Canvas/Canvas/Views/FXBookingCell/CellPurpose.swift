//
//  CellPurpose.swift
//  Al_MuzainiDummy
//
//  Created by apple on 06/10/22.
//

import UIKit

class CellPurpose: UITableViewCell {

    
    
    @IBOutlet weak var lblPurposeTrnf: UILabel!
    
    @IBOutlet weak var lblRemark: UILabel!
    @IBOutlet weak var lblDateTime: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblDeliveryType: UILabel!
    
    @IBOutlet weak var viewBackground: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        viewBackground.layer.borderWidth = 1
        viewBackground.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        viewBackground.layer.cornerRadius = 10
        
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

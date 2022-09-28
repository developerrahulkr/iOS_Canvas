//
//  CellAddNewAddress.swift
//  Al_MuzainiDummy
//
//  Created by apple on 27/09/22.
//

import UIKit

class CellAddNewAddress: UITableViewCell {

    @IBOutlet weak var viewAddNewAddress: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        viewAddNewAddress.layer.cornerRadius = 10
        viewAddNewAddress.layer.borderColor = #colorLiteral(red: 0.6666666667, green: 0.6666666667, blue: 0.6666666667, alpha: 1)
        viewAddNewAddress.layer.borderWidth = 1
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

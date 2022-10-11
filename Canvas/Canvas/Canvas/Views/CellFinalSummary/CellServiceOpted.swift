//
//  CellServiceOpted.swift
//  Al_MuzainiDummy
//
//  Created by apple on 07/10/22.
//

import UIKit

class CellServiceOpted: UITableViewCell {

    
    @IBOutlet weak var lblDateTime: UILabel!
    @IBOutlet weak var lblDeliveryType: UILabel!
    @IBOutlet weak var lblVoucherNumber: UILabel!
    @IBOutlet weak var lblName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

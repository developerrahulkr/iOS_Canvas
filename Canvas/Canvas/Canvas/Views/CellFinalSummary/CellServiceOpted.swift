//
//  CellServiceOpted.swift
//  Al_MuzainiDummy
//
//  Created by apple on 07/10/22.
//

import UIKit

class CellServiceOpted: UITableViewCell {

    //MARK: - ******************************************** OUTLETS *************************************************
    @IBOutlet weak var lblDateTime: UILabel!
    @IBOutlet weak var lblDeliveryType: UILabel!
    @IBOutlet weak var lblVoucherNumber: UILabel!
    @IBOutlet weak var lblName: UILabel!
    //MARK: - ****************************************** END OF OUTLETS ********************************************

    
    
    //MARK: - **************************************** LIFECYCLE METHODS *******************************************
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    //MARK: - **********************************END OF LIFECYCLE METHODS ********************************************

    
}

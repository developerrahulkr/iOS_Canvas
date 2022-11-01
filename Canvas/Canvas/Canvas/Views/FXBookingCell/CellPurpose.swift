//
//  CellPurpose.swift
//  Al_MuzainiDummy
//
//  Created by apple on 06/10/22.
//

import UIKit

class CellPurpose: UITableViewCell {
    //MARK: - ******************************************** OUTLETS *************************************************




    
    @IBOutlet weak var lblPurpose: UILabel!
    @IBOutlet weak var lblDelivery: UILabel!
    @IBOutlet weak var lblAddressLang: UILabel!
    @IBOutlet weak var lblDateAndTime: UILabel!
    @IBOutlet weak var lblRemarks: UILabel!
    @IBOutlet weak var lblPurposeTrnf: UILabel!
    @IBOutlet weak var lblRemark: UILabel!
    @IBOutlet weak var lblDateTime: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblDeliveryType: UILabel!
    @IBOutlet weak var viewBackground: UIView!
    //MARK: - ****************************************** END OF OUTLETS ********************************************

    //MARK: - **************************************** LIFECYCLE METHODS *******************************************
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
    //MARK: - **********************************END OF LIFECYCLE METHODS ********************************************

}

//
//  CellCurrencyData.swift
//  Al_MuzainiDummy
//
//  Created by apple on 05/10/22.
//

import UIKit

class CellCurrencyData: UITableViewCell {
    //MARK: - ******************************************** OUTLETS *************************************************




    @IBOutlet weak var viewCurrencyCode: UIView!
    @IBOutlet weak var viewActualFCAmount: UIView!
    @IBOutlet weak var viewActualRate: UIView!
    @IBOutlet weak var viewActualLCAmount: UIView!
    @IBOutlet weak var lblFCAmount: UILabel!
    @IBOutlet weak var lblCurrencyCode: UILabel!
    @IBOutlet weak var lblFinalTxt: UILabel!
    @IBOutlet weak var imgFlag: UIImageView!
    @IBOutlet weak var lblLCAmount: UILabel!
    //MARK: - ****************************************** END OF OUTLETS ********************************************

    
    //MARK: - **************************************** LIFECYCLE METHODS *******************************************

    override func awakeFromNib() {
        super.awakeFromNib()
 
        viewCurrencyCode.layer.borderColor = #colorLiteral(red: 0.6666666667, green: 0.6666666667, blue: 0.6666666667, alpha: 1)
        viewCurrencyCode.layer.borderWidth = 1
        
        viewActualFCAmount.layer.borderColor = #colorLiteral(red: 0.6666666667, green: 0.6666666667, blue: 0.6666666667, alpha: 1)
        viewActualFCAmount.layer.borderWidth = 1
        
        viewActualRate.layer.borderColor = #colorLiteral(red: 0.6666666667, green: 0.6666666667, blue: 0.6666666667, alpha: 1)
        viewActualRate.layer.borderWidth = 1
        
        viewActualLCAmount.layer.borderColor = #colorLiteral(red: 0.6666666667, green: 0.6666666667, blue: 0.6666666667, alpha: 1)
        viewActualLCAmount.layer.borderWidth = 1




    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    //MARK: - **********************************END OF LIFECYCLE METHODS ********************************************

    
}

//
//  CellStatus.swift
//  Al_MuzainiDummy
//
//  Created by apple on 07/10/22.
//

import UIKit

class CellStatus: UITableViewCell {
    
    
    
    @IBOutlet weak var viewDownload: UIView!
    
    
    @IBOutlet weak var viewSuccessFailure: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        viewSuccessFailure.layer.borderWidth = 1
        viewSuccessFailure.layer.borderColor = #colorLiteral(red: 0.2100656629, green: 0.4206894636, blue: 0.4265737534, alpha: 1)
        viewSuccessFailure.layer.cornerRadius = 10
        
        
        
        viewDownload.layer.borderWidth = 1
        viewDownload.layer.borderColor = #colorLiteral(red: 0.6666666667, green: 0.6666666667, blue: 0.6666666667, alpha: 1)
        viewDownload.layer.cornerRadius = 10
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

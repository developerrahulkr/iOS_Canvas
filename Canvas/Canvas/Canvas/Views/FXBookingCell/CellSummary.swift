//
//  CellSummary.swift
//  Al_MuzainiDummy
//
//  Created by apple on 06/10/22.
//

import UIKit

class CellSummary: UITableViewCell {

    @IBOutlet weak var viewBackground: UIView!
    @IBOutlet weak var lblRight: UILabel!
    @IBOutlet weak var lblLeft: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        viewBackground.layer.borderWidth = 1
        viewBackground.layer.borderColor = #colorLiteral(red: 0.6666666667, green: 0.6666666667, blue: 0.6666666667, alpha: 1)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

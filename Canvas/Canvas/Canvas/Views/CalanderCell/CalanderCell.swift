//
//  CalanderCell.swift
//  Canvas
//
//  Created by Akshay_mac on 29/09/22.
//  Copyright © 2022 urmila reddy. All rights reserved.
//

import UIKit

class CalanderCell: UITableViewCell {

    //MARK: - ******************************************** OUTLETS **********************************************
    @IBOutlet weak var lblCalander: UILabel!
    //MARK: - ****************************************** END OF OUTLETS *****************************************
    

    //MARK: - **************************************** LIFECYCLE METHODS ****************************************
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    //MARK: - **********************************END OF LIFECYCLE METHODS ****************************************

}

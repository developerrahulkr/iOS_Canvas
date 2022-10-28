//
//  HomeLatestNewCell.swift
//  Canvas
//
//  Created by Akshay_mac on 28/10/22.
//  Copyright © 2022 urmila reddy. All rights reserved.
//

import UIKit

class HomeLatestNewCell: UITableViewCell {

    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDesc: UILabel!
    @IBOutlet weak var img: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

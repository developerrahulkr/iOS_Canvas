//
//  HomeNewsFeedCell.swift
//  Canvas
//
//  Created by urmila reddy on 03/11/20.
//  Copyright © 2020 urmila reddy. All rights reserved.
//

import UIKit

class HomeNewsFeedCell: UITableViewCell {
    
    @IBOutlet weak var imgePic: UIImageView!
    
    @IBOutlet weak var dateLbl: UILabel!
    
    @IBOutlet weak var titleLbl: UILabel!
    
    @IBOutlet weak var subTitleLbl: UILabel!
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

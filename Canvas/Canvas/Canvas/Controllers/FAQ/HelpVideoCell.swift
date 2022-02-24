//
//  HelpVideoCell.swift
//  Canvas
//
//  Created by RAC on 20/10/21.
//  Copyright © 2021 urmila reddy. All rights reserved.
//

import UIKit

class HelpVideoCell: UITableViewCell {

    @IBOutlet weak var img_arrow: UIImageView!
    @IBOutlet weak var btn_more: UIButton!
    @IBOutlet weak var helpDescriptionLbl: UILabel!
    @IBOutlet weak var helpTitleLbl: UILabel!
    @IBOutlet weak var helpThumbImg: UIImageView!
    @IBOutlet weak var helpView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

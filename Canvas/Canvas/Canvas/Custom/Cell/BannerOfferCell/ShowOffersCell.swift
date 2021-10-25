//
//  ShowOffersCell.swift
//  Canvas
//
//  Created by RAC on 04/09/21.
//  Copyright © 2021 urmila reddy. All rights reserved.
//

import UIKit

class ShowOffersCell: UITableViewCell {

    @IBOutlet weak var btn_more: UIButton!
    
    @IBOutlet weak var img_widthConstraint: NSLayoutConstraint!
    @IBOutlet weak var img_heightConstraint: NSLayoutConstraint!
    @IBOutlet weak var lbl_offerDescription: UILabel!
    @IBOutlet weak var lbl_offerHeader: UILabel!
    @IBOutlet weak var img_thumbnail: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override func prepareForReuse() {
       super.prepareForReuse()
       self.img_thumbnail.image = nil
       // Set cell to initial state here, reset or set values
   }

}

//
//  CellDeliveryOption.swift
//  Canvas
//
//  Created by apple on 22/09/22.
//  Copyright © 2022 urmila reddy. All rights reserved.
//

import UIKit
protocol protocolDeleteAddress : AnyObject{
    func deleteAddress(tag: Int)
}
class CellDeliveryOption: UICollectionViewCell {

//    @IBOutlet weak var deleteBtn: UIButton!
    @IBOutlet weak var imgStar: UIImageView!
//    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var lblFirstName: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var viewCellDelivery: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        imgStar.isHidden = true
        self.viewCellDelivery.layer.borderWidth = 1
        self.viewCellDelivery.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        // Initialization code
    }
    
    
//    @IBAction func onTapDelete(_ sender: UIButton) {
//        delegate?.deleteAddress(tag : sender.tag)
//        
//    }
    //MARK: ******************** ALL VARIABLES ********************
    
    weak var delegate : protocolDeleteAddress?

    //MARK: ********************END OF ALL VARIABLES ********************
}




// Flat florr building, gara, street, block, areaCity, postalCode

//
//  CellCountry.swift
//  Canvas
//
//  Created by apple on 22/09/22.
//  Copyright © 2022 urmila reddy. All rights reserved.
//

import UIKit

class CellCountry: UITableViewCell {
    
    
    @IBOutlet weak var viewCellBackground: UIView!
    @IBOutlet weak var lblConverter: UILabel!
    @IBOutlet weak var viewConverter: UIView!
    @IBOutlet weak var lblCurrencyCode: UILabel!
    @IBOutlet weak var imgCountry: UIImageView!
    @IBOutlet weak var tfTargetField: UITextField!
    @IBOutlet weak var tfSourceField: UITextField!
    @IBOutlet weak var deleteBtn: UIButton!
    
    var delegate: Delete?
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        viewConverter.borderWidth = 1
        viewConverter.borderColor = #colorLiteral(red: 0.6666666667, green: 0.6666666667, blue: 0.6666666667, alpha: 1)
        viewConverter.cornerRadius = 20
        
        viewCellBackground.cornerRadius = 5
        viewCellBackground.borderColor = #colorLiteral(red: 0.6666666667, green: 0.6666666667, blue: 0.6666666667, alpha: 1)
        viewCellBackground.borderWidth = 1
        
        // Initialization code
    }

    @IBAction func OnTapDeleteRow(_ sender: UIButton) {
        self.delegate?.deleteRow(index: sender.tag)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

protocol Delete{
    func deleteRow(index:Int)
}

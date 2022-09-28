//
//  CellCountry.swift
//  Canvas
//
//  Created by apple on 22/09/22.
//  Copyright © 2022 urmila reddy. All rights reserved.
//

import UIKit

class CellCountry: UITableViewCell {
    
    
    @IBOutlet weak var lblCurrencyCode: UILabel!
    @IBOutlet weak var imgCountry: UIImageView!
    @IBOutlet weak var tfTargetField: UITextField!
    @IBOutlet weak var tfSourceField: UITextField!
    @IBOutlet weak var viewFC: UIView!
    @IBOutlet weak var viewLC: UIView!
    @IBOutlet weak var deleteBtn: UIButton!
    
    var delegate: Delete?
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        viewLC.layer.cornerRadius = 5
        viewFC.layer.cornerRadius = 5
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

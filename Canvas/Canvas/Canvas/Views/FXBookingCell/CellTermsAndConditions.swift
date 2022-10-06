//
//  CellTermAndConditions.swift
//  Al_MuzainiDummy
//
//  Created by apple on 06/10/22.
//

import UIKit
protocol TransectionActionDelegate{
    func onClickPayDelagate()
    
    
}

class CellTermsAndConditions: UITableViewCell {

    var delegate : TransectionActionDelegate?
    
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var btnPay: UIButton!
    @IBOutlet weak var viewCheckBox: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        viewCheckBox.layer.cornerRadius = 5
        viewCheckBox.layer.borderWidth = 1
        viewCheckBox.layer.borderColor = #colorLiteral(red: 0.6666666667, green: 0.6666666667, blue: 0.6666666667, alpha: 1)
        
        btnBack.layer.cornerRadius = 3
        btnPay.layer.cornerRadius = 3
        
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func onClickBack(_ sender: UIButton) {
        
        
    }
    
    @IBAction func onClickPay(_ sender: UIButton) {
        delegate?.onClickPayDelagate()
    }
    
    
}

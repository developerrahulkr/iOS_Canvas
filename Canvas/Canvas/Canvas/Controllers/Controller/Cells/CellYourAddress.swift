//
//  CellYourAddress.swift
//  Al_MuzainiDummy
//
//  Created by apple on 27/09/22.
//

import UIKit

protocol YourAddressDelegate {
    func updateAddress (tag : Int) -> Void
    func deleteAddress(indexPath : Int) -> Void
}

class CellYourAddress: UITableViewCell {
//MARK: - OUTLET
    
    @IBOutlet weak var lblFullName: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var btnEdit: UIButton!
    @IBOutlet weak var btnDelete: UIButton!
    @IBOutlet weak var ViewCellYourAddress: UIView!
    @IBOutlet weak var lblLocation: UILabel!
    
    var delegate : YourAddressDelegate?
    //MARK: - VARIABLES
    override func awakeFromNib() {
        super.awakeFromNib()
        //MARK: - LYFICYCLE METHHODS
        
        ViewCellYourAddress.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        ViewCellYourAddress.layer.borderWidth = 1
        ViewCellYourAddress.layer.cornerRadius = 10
        
        btnEdit.layer.cornerRadius = 5
        btnDelete.layer.cornerRadius = 5
        
        // Initialization code
    }

    //MARK: - ACTIONS
    
    @IBAction func onClickedDeleteBtnq(_ sender: UIButton) {
        delegate?.deleteAddress(indexPath: sender.tag)
    }
    
    @IBAction func onClickedUpdateBtn(_ sender: UIButton) {
        delegate?.updateAddress(tag: sender.tag)
    }
    
    
    //MARK: - FUNCTIONS
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
}

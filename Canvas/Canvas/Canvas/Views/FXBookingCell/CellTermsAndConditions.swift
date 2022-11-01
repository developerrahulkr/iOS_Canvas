//
//  CellTermAndConditions.swift
//  Al_MuzainiDummy
//
//  Created by apple on 06/10/22.
//

import UIKit

protocol protocolTermAndCondition : AnyObject{
    func funcTermsAndContions(btnTerm : Int)
        
    
}
protocol TransectionActionDelegate{
    func onClickPayDelagate()
    func onClickbackDelagate()

    
}

class CellTermsAndConditions: UITableViewCell {
    //MARK: - ******************************************** VARIABLE ********************************************

    var delegate : TransectionActionDelegate?
    //MARK: - *****************************************END OF VARIABLE *****************************************

    
    
    //MARK: - ******************************************** OUTLETS *********************************************




    @IBOutlet weak var lblPromoTitle: UILabel!
    @IBOutlet weak var lblTermAndConditions: UIButton!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var btnPay: UIButton!
    @IBOutlet weak var viewCheckBox: UIView!
    @IBOutlet weak var btncheck: UIButton!
    //MARK: - ****************************************** END OF OUTLETS *****************************************

    
    weak var varDelegate : protocolTermAndCondition?
    //MARK: - **************************************** LIFECYCLE METHODS ****************************************

    override func awakeFromNib() {
        super.awakeFromNib()
        
        viewCheckBox.layer.cornerRadius = 5
        viewCheckBox.layer.borderWidth = 1
        viewCheckBox.layer.borderColor = #colorLiteral(red: 0.6666666667, green: 0.6666666667, blue: 0.6666666667, alpha: 1)
        
        btnBack.layer.cornerRadius = 3
        btnPay.layer.cornerRadius = 3
        
        btncheck.setImage(UIImage(named : "checkboxNormal"), for: .normal)
        btncheck.setImage(UIImage(named : "checkboxActive"), for: .selected)
        btncheck.isSelected = false
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    //MARK: - **********************************END OF LIFECYCLE METHODS ****************************************

    
    //MARK: - ****************************************** ALL ACTIONS ********************************************

    @IBAction func onClickBack(_ sender: UIButton) {
        
        delegate?.onClickbackDelagate()

    }
    
    @IBAction func onclickcheck(_ sender: UIButton)
    {
        sender.isSelected = !sender.isSelected
    }

    
    @IBAction func onClickPay(_ sender: UIButton) {
        delegate?.onClickPayDelagate()
    }
    
    
    
    @IBAction func onTapTermAndConditions(_ sender: Any) {
        
        varDelegate?.funcTermsAndContions(btnTerm: 1)
        
    }
    //MARK: - **************************************** END OF ALL ACTIONS *****************************************

    
    
    
}


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

    var delegate : TransectionActionDelegate?
    
    
    
    @IBOutlet weak var lblPromoTitle: UILabel!
    @IBOutlet weak var lblTermAndConditions: UIButton!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var btnPay: UIButton!
    @IBOutlet weak var viewCheckBox: UIView!
    @IBOutlet weak var btncheck: UIButton!
    
    weak var varDelegate : protocolTermAndCondition?

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
    
    
    
}


// Mark: For downloading terms and conditions
//func downloadTermsConditions() {
//
//    let paramaterPasing: [String:Any] = ["languageCode":LocalizationSystem.sharedInstance.getLanguage(), "type": 600]
//
//
//    let headers: HTTPHeaders = [
//        "Content-Type": "application/json"
//    ]
//
//    NetWorkDataManager.sharedInstance.termsConditionsImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
//
//        if errorString == nil
//        {
//
//            print(resonseTal!)
//            if let termsAndConditions = resonseTal?.value(forKey: "termsAndConditions") as? NSArray {
//                print(termsAndConditions)
//             /*   let newObj = Global.shared.convertToAryDictionary(text: termsAndConditions)
//                self.termsConditionsResponse = newObj!*/
//
//                let newv =  termsAndConditions[0] as! NSDictionary
//                print(newv)
//
//                let dataStr = newv["termsAndsConditions"] as? String
//                let newObj = Global.shared.convertToAryDictionary(text: dataStr ?? "")
//
//                self.termsConditionsResponse = newObj!
//
//           // self.termsConditionsResponse = termsAndConditions as! [Any]
//            }
//
//            self.termsConditionTbleView.reloadData()
//        }
//
//        else
//        {
//            print(errorString!)
//            self.removeSpinner()
//            let finalError = errorString?.components(separatedBy: ":")
//            let alert = ViewControllerManager.displayAlert(message: finalError?[1] ?? "", title:APPLICATIONNAME)
//            self.present(alert, animated: true, completion: nil)
//        }
//    }
//}

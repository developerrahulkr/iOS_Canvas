//
//  BeneficiarySecndTabCell.swift
//  Canvas
//
//  Created by urmila reddy on 27/08/20.
//  Copyright © 2020 urmila reddy. All rights reserved.
//

import UIKit
import Alamofire

class BeneficiarySecndTabCell: UITableViewCell {
    
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLbl: UILabel!
    
    @IBOutlet weak var bankNameLbl: UILabel!
    
    @IBOutlet weak var starBtnOtlt: UIButton!
    
    
    @IBOutlet weak var iconNameLbl: UILabel!
    
    
    @IBOutlet weak var profileImg: UIImageView!
    
    var beneficiaryId = 0
    var isFav = false
    
    var firstName = ""
       var lastName = ""
       var middleName = ""
       var address1 = ""
       var address2 = ""
       var city = ""
       var state = ""
       var postCode = ""
       var country = ""
       var currency = ""
       var mobile = ""
       var accountNumber = ""
       var bankCode = ""
       var bankName = ""
       var branchCode = ""
       var branchName = ""
       var ifscCode = ""
       var swiftCode = ""
       var ibanCode = ""
       var cnicno = ""
    
    var abaRouteCode = ""
    var agentID = ""
    var agentName = ""
    var benID = ""
    var beneficiaryType = 0
    var branchAddress1 = ""
    var branchAddress2 = ""
    var branchCity = ""
    var branchState = ""
    var defaultPurposeCode = ""
    var defaultPurposeName = ""
    var disbursalMode = ""
    var disbursalModeName = ""
    var fcMaxAmount = ""
    var fcMinAmount = ""
    var nationality = ""
    var referenceId = ""
    var remID = ""
    var remarks = ""
    var sourceOfIncome = ""
    var telePhone = ""
    var txnRef = ""
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
        
        self.profileImg.layer.cornerRadius = self.profileImg.frame.size.width / 2;
                      self.profileImg.clipsToBounds = true
               
               
              self.iconNameLbl.layer.cornerRadius = self.iconNameLbl.frame.size.width / 2;
               self.iconNameLbl.clipsToBounds = true
    }
    
    
    @IBAction func starBtnActn(_ sender: Any) {
    /*  if self.starBtnOtlt.currentImage == Images.star {
        self.starBtnOtlt.setImage(Images.starFill, for: .normal)
            self.starBtnOtlt.tintColor = .red
            isFav = true
            changeToFavourite()
        }
        else {
        self.starBtnOtlt.setImage(Images.star, for: .normal)
            self.starBtnOtlt.tintColor = .darkGray
            isFav = false
            changeToFavourite()
        }*/
    }
    
    func changeToFavourite() {
        
        let paramaterPasing: [String:Any] =
            [
                "registrationId": Global.shared.afterLoginRegistrtnId ?? "",
                "beneficiaryId": beneficiaryId,
                "isFavourite": isFav
        ]
        
        
     /*   let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]*/
        
        let headers: HTTPHeaders = [.authorization(bearerToken: UserDefaults.standard.string(forKey: "token")!)]
        
        NetWorkDataManager.sharedInstance.benefFavouriteImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            
            if errorString == nil
            {
               // print(resonseTal)
               
                
            }
            else
            {
                print(errorString!)
                
            }
        }
        
    }
    
    
    @IBAction func editBtnActn(_ sender: Any) {
        
        BeneficiaryDetails.shared.abaRouteCode = self.abaRouteCode
        BeneficiaryDetails.shared.accountNumber = self.accountNumber
        BeneficiaryDetails.shared.address1 = self.address1
        BeneficiaryDetails.shared.address2 = self.address2
        BeneficiaryDetails.shared.agentID = self.agentID
        BeneficiaryDetails.shared.agentName = self.agentName
        BeneficiaryDetails.shared.bankCode = self.bankCode
        BeneficiaryDetails.shared.bankName = self.bankName
        BeneficiaryDetails.shared.benID = self.benID
        BeneficiaryDetails.shared.beneficiaryId = self.beneficiaryId
        BeneficiaryDetails.shared.beneficiaryType = self.beneficiaryType
        BeneficiaryDetails.shared.branchAddress1 = self.branchAddress1
        BeneficiaryDetails.shared.branchAddress2 = self.branchAddress2
        BeneficiaryDetails.shared.branchCity = self.branchCity
        BeneficiaryDetails.shared.branchCode = self.branchCode
        BeneficiaryDetails.shared.branchName = self.branchName
        BeneficiaryDetails.shared.branchState = self.branchState
        BeneficiaryDetails.shared.city = self.city
        BeneficiaryDetails.shared.cnicno = self.cnicno
        BeneficiaryDetails.shared.country = self.country
        BeneficiaryDetails.shared.currency = self.currency
        BeneficiaryDetails.shared.defaultPurposeCode = self.defaultPurposeCode
        BeneficiaryDetails.shared.defaultPurposeName = self.defaultPurposeName
        BeneficiaryDetails.shared.disbursalMode = self.disbursalMode
        BeneficiaryDetails.shared.disbursalModeName = self.disbursalModeName
        BeneficiaryDetails.shared.fcMaxAmount = self.fcMaxAmount
        BeneficiaryDetails.shared.fcMinAmount = self.fcMinAmount
        BeneficiaryDetails.shared.firstName = self.firstName
        BeneficiaryDetails.shared.ibanCode = self.ibanCode
        BeneficiaryDetails.shared.ifscCode = self.ifscCode
        BeneficiaryDetails.shared.lastName = self.lastName
        BeneficiaryDetails.shared.middleName = self.middleName
        BeneficiaryDetails.shared.mobile = self.mobile
        BeneficiaryDetails.shared.nationality = self.nationality
        BeneficiaryDetails.shared.postCode = self.postCode
        BeneficiaryDetails.shared.referenceId = self.referenceId
        BeneficiaryDetails.shared.remID = self.remID
        BeneficiaryDetails.shared.remarks = self.remarks
        BeneficiaryDetails.shared.sourceOfIncome = self.sourceOfIncome
        BeneficiaryDetails.shared.state = self.state
        BeneficiaryDetails.shared.swiftCode = self.swiftCode
        BeneficiaryDetails.shared.telePhone = self.telePhone
        BeneficiaryDetails.shared.txnRef = self.txnRef
        
    }
    
}

//
//  BenefSecndTabCollectnCell.swift
//  Canvas
//
//  Created by urmila reddy on 28/10/20.
//  Copyright © 2020 urmila reddy. All rights reserved.
//

import UIKit

class BenefSecndTabCollectnCell: UICollectionViewCell {
    @IBOutlet weak var imgBenef: UIImageView!
    
    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var bankLbl: UILabel!
    
    @IBOutlet weak var currencyLbl: UILabel!
    
    @IBOutlet weak var imgNameLbl: UILabel!
    @IBOutlet weak var starBtnOtlt: PassableUIButton!
       
       @IBOutlet weak var editBtnOtlt: PassableUIButton!
    
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
    
}

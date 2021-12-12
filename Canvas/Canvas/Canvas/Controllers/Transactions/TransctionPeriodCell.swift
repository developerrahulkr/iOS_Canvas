//
//  TransctionPeriodCell.swift
//  Canvas
//
//  Created by Varun Peddi on 11/12/20.
//  Copyright © 2020 urmila reddy. All rights reserved.
//

import UIKit

class TransctionPeriodCell: UITableViewCell {

  static let identifier = "TransctionPeriodCell"
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var currencyLabel: UILabel!
  @IBOutlet weak var refId: UILabel!
  @IBOutlet weak var dateLabel: UILabel!
  @IBOutlet weak var bankLabel: UILabel!

    @IBOutlet weak var imgSucesFail: UIImageView!
    
    @IBOutlet weak var webIosAndroidImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
  func setupData(_ json: NSDictionary?) {
    guard let obj = json else {return}
    let firstName = obj.value(forKey: "beneficiaryFirstName") as? String ?? ""
    let middlename = obj.value(forKey: "beneficiaryMiddleName") as? String ?? ""
    let lastName = obj.value(forKey: "beneficiaryLastName") as? String ?? ""
    
    let bankName = obj.value(forKey: "beneficiaryTypeName") as? String ?? ""
    
    let createDate = obj.value(forKey: "createdDate") as? String ?? ""
    if LocalizationSystem.sharedInstance.getLanguage() == "ar" {
        dateLabel.textAlignment = .right
    }
    
    
    
    let refIdValue = obj.value(forKey: "txnRefNo") as? String ?? ""
    let currencyCode = obj.value(forKey: "sourceCurrenyCode") as? String ?? ""

    var newCurencyData = ""
    if let value = obj["totalLCAmount"] as? Int {
      newCurencyData = String(value)
    }else if let value = obj["totalLCAmount"] as? String {
      newCurencyData = value
    }
    else if let value = obj["totalLCAmount"] as? Double {
      newCurencyData = String(value)
    }
    let fullname = firstName + " \(middlename)" + " \(lastName)"
    nameLabel.text = fullname
    bankLabel.text = bankName
    if createDate.contains(".") {
   //  BeneficiaryDetails.shared.createdDatee = Date.getMonthDayYearString(createDate)
        dateLabel.text = Date.getMonthDayYearString(createDate)
    }
    else {
      //  BeneficiaryDetails.shared.createdDatee = Date.getMonthDayYearWithoutSecndsString(createDate)
        dateLabel.text = Date.getMonthDayYearWithoutSecndsString(createDate)
    }
  //  dateLabel.text = Date.getMonthDayYearString(createDate)
    refId.text = refIdValue
    currencyLabel.text = "\(newCurencyData) " + currencyCode
    
    let isRetail = obj.value(forKey: "isRetail") as? Bool ?? false
    
    let transctnLoginSource = obj.value(forKey: "loginSource") as? Int ?? 1
   
    
    if isRetail == true {
        self.webIosAndroidImg.image = UIImage(named: "retail")
    }
    
    //android
  else if transctnLoginSource == 2 {
        self.webIosAndroidImg.image = UIImage(named: "androidM")
    }
    //ios
    else if transctnLoginSource == 3{
        self.webIosAndroidImg.image = UIImage(named: "iosM")
    }
    //web
    else  {
        self.webIosAndroidImg.image = UIImage(named: "webM")
    }
    
  
    
    let status = obj.value(forKey: "status") as? Int ?? 0
    
  /*  if isRetail == false {
        self.imgSucesFail.image = UIImage(named: "retail")
    }*/
      if status == 0 {
        
        self.imgSucesFail.image = UIImage(named: "pending-transaction")
        
    }
        
        //sucess
    
    else if status == 1 {
        self.imgSucesFail.image = UIImage(named: "success-transaction")
       

    }
  /*  else if status == 1  {
        self.imgSucesFail.image = UIImage(named: "retail")
       

    }*/
        
        //failed
    else if status == 2 {
        self.imgSucesFail.image = UIImage(named: "failed-transaction")
       

    }
    //cancelled
    else if status == 3 {
        self.imgSucesFail.image = UIImage(named: "failed-transaction")
       

    }
    else {
        print("nothing")
    }
    
    
 //   imgSucesFail.image
    
  }
    
}

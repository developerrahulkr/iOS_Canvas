//
//  BenefWuNewTrnsferVc.swift
//  Canvas
//
//  Created by urmila reddy on 29/10/20.
//  Copyright © 2020 urmila reddy. All rights reserved.
//

import UIKit
import Alamofire

class BenefWuNewTrnsferVc: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var cityLbl: UILabel!
    
    @IBOutlet weak var cityField: UILabel!
    
    
    @IBOutlet weak var stateLbl: UILabel!
    
    @IBOutlet weak var stateField: UILabel!
    
    @IBOutlet weak var countryLbl: UILabel!
    
    @IBOutlet weak var countryField: UILabel!
    
    
    @IBOutlet weak var curncyLbl: UILabel!
    
    @IBOutlet weak var curncyField: UILabel!
    
    
    
    
    
    @IBOutlet weak var navHederLbl: UILabel!
      
       @IBOutlet weak var currencyLbl: UILabel! // country name
        @IBOutlet weak var kuwaitDinarLbl: UILabel!
       @IBOutlet weak var inrOrOtherCurencyLbl: UILabel! // indian rupees
       
        @IBOutlet weak var secndHideLbl: UILabel! // you pay only
    @IBOutlet weak var sendNowBtnOtlt: UIButton!
        
    @IBOutlet weak var nameLbl: UILabel!
   
    @IBOutlet weak var curencyValueLbl: UILabel!
    
    
    
    @IBOutlet weak var sourceCurencyCodeLbl: UILabel!
    @IBOutlet weak var targetCurencyCodeLbl: UILabel!
    
    
    @IBOutlet weak var youSendLbl: UILabel!
    
    @IBOutlet weak var theyReceiveLbl: UILabel!
    
    
    @IBOutlet weak var sourceField: UITextField!
    
    @IBOutlet weak var targetField: UITextField!
    
    
    @IBOutlet weak var feeChargesLbl: UILabel!
    
    
    @IBOutlet weak var youPayFinalAmntLbl: UILabel!
    
    
    
    
    @IBOutlet weak var sourceReqLbl: UILabel!
    
    @IBOutlet weak var targetReqLbl: UILabel!
    
    
    var calcType = ""
    var fcAmnt = 0
    var lcAmnt = 0
    
    
    
    @IBOutlet weak var purposeView: UIView!
    
    @IBOutlet weak var purposeLbl: UILabel!
    
    @IBOutlet weak var purposeField: UITextField!
    
    @IBOutlet weak var purposeReqLbl: UILabel!
    
    
    @IBOutlet weak var rateCalculationLbl: UILabel!
    
    
    @IBOutlet weak var firstHideView: UIView!
   
    @IBOutlet weak var thirdHideView: UIView!
    
    @IBOutlet weak var iHaveReadAgreeTxt: UILabel!
    
    @IBOutlet weak var termsConditionBtnOtlt: UIButton!
    
    @IBOutlet weak var checkBtnOtlt: UIButton!
    
    
    //240 // 95
    @IBOutlet weak var heightConstrt: NSLayoutConstraint!
    
    
    @IBOutlet weak var targetCurncyImg: UIImageView!
    @IBOutlet weak var rateChargesLbl: UILabel!
    
    weak var sourceTimer: Timer?
    weak var targetTimer: Timer?
    
    
    
    var checkMarkClicked:String!
      var checkIconClick = true
    
    
    var purposeNameData = [String]()
    var purposeValueData = [String]()
    var pickerResponseData = [[String: String]]()
  var purposeList: [BeneficiaryPurposeData] = []
    var purposeCode = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
       // Global.shared.countrysChangeAccordingly = "WU"
        
        navHederLbl.text = Global.shared.addWesternUnion
        secndHideLbl.text = Global.shared.youPauOnlyyTxt
        
        kuwaitDinarLbl.text = "KUWAITI DINAR"
       // inrOrOtherCurencyLbl.text = "INDIAN RUPEES"
        
        sendNowBtnOtlt.setTitle(" " + Global.shared.sendNowTxt, for: .normal)
        
        sourceField.maxLength = Global.shared.sendLimit
               targetField.maxLength = Global.shared.receiveLimit
        
        iHaveReadAgreeTxt.text = Global.shared.iHaveReadAgreeTxt
        termsConditionBtnOtlt.setTitle(Global.shared.termsConditionBtnTxt, for: .normal)
        if LocalizationSystem.sharedInstance.getLanguage() == "ar" {
            //    if textAlignment == .natural {
            termsConditionBtnOtlt.semanticContentAttribute = .forceRightToLeft
            termsConditionBtnOtlt.contentHorizontalAlignment = .right

            
        }
        
        sourceReqLbl.font = Global.shared.fontReqLbl
        sourceReqLbl.textColor = ColorCodes.newAppRed
        
        targetReqLbl.font = Global.shared.fontReqLbl
        targetReqLbl.textColor = ColorCodes.newAppRed
        
        purposeReqLbl.font = Global.shared.fontReqLbl
        purposeReqLbl.textColor = ColorCodes.newAppRed
        
        self.showSpinner(onView: self.view)
        // Do any additional setup after loading the view.
        
        rateCalculationLbl.layer.cornerRadius = 15
        rateCalculationLbl.layer.masksToBounds = true
        rateCalculationLbl.layer.backgroundColor = UIColor.clear.cgColor
        
        
        sourceField.delegate = self
        targetField.delegate = self
        
        downloadBeneficiary()
      //  downloadBeneficiaryPurpose()
        
     /*   let popOverVC = self.storyboard?.instantiateViewController(withIdentifier: "WuFirstTermsConditions") as! WuFirstTermsConditions
              self.addChild(popOverVC)
              popOverVC.view.frame = self.view.frame
              self.view.addSubview(popOverVC.view)
              popOverVC.didMove(toParent: self)*/
        
        // handle the editingChanged event by calling (textFieldDidEditingChanged(-:))
        self.sourceField.addTarget(self, action: #selector(sourceTextFieldDidEditingChanged(_:)), for: UIControl.Event.editingChanged)
        self.targetField.addTarget(self, action: #selector(targetTextFieldDidEditingChanged(_:)), for: UIControl.Event.editingChanged)
        
    }
    
    // reset the searchTimer whenever the textField is editingChanged
    @objc func sourceTextFieldDidEditingChanged(_ textField: UITextField) {

          // if a timer is already active, prevent it from firing
          if sourceTimer != nil {
            sourceTimer?.invalidate()
            sourceTimer = nil
          }

        sourceTimer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(sourceSearchForKeyword(_:)), userInfo: textField.text!, repeats: false)
       
      }

    @objc func sourceSearchForKeyword(_ timer: Timer) {

          // retrieve the keyword from user info
          let keyword = timer.userInfo!

          print("Searching for keyword \(keyword)")
        self.view.endEditing(true)
    
        self.rateSourceCalculator()
      }
    
    // reset the searchTimer whenever the textField is editingChanged
    @objc func targetTextFieldDidEditingChanged(_ textField: UITextField) {

          // if a timer is already active, prevent it from firing
          if targetTimer != nil {
            targetTimer?.invalidate()
            targetTimer = nil
          }

        targetTimer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(targetSearchForKeyword(_:)), userInfo: textField.text!, repeats: false)
       
      }

    @objc func targetSearchForKeyword(_ timer: Timer) {

          // retrieve the keyword from user info
          let keyword = timer.userInfo!

          print("Searching for keyword \(keyword)")
        
        self.view.endEditing(true)
    
        self.rateTargetCalculator()
        
      }

    
    func assigningLabels() {
        
        self.removeSpinner()
        
         
        purposeLbl.text = Global.shared.remitPurposeTransferTxt + "*"
        
        let firstName = BeneficiaryDetails.shared.firstName +  " " + BeneficiaryDetails.shared.middleName
        let lastName = BeneficiaryDetails.shared.lastName ?? ""
        nameLbl.text = firstName + " " + lastName
    //    nameLbl.text = BeneficiaryDetails.shared.firstName ?? "" + BeneficiaryDetails.shared.lastName
     
      //  branchLbl.text = "Disbursal mode"
        
     //   currencyLbl.text = Global.shared.currencyb ?? ""
         currencyLbl.text = "Country"
       // acntLbl.text = Global.shared.accountNumberb ?? ""
        
        
       // acntLbl.text = "Source of income"
        countryLbl.text = Global.shared.countryb
        curncyLbl.text = Global.shared.currencyb
        
      //  branchValue.text = "MONEY IN MINUTES"
      //  acntValue.text = "SALARY"
        countryField.text = BeneficiaryDetails.shared.countryName
        curncyField.text = BeneficiaryDetails.shared.currency
        
        
        youSendLbl.text = Global.shared.youSendTxt + "*"
        theyReceiveLbl.text = Global.shared.theyReceiveTxt + "*"
        
        sourceReqLbl.text = Global.shared.errorTxtRequired
        targetReqLbl.text = Global.shared.errorTxtRequired
        purposeReqLbl.text = Global.shared.errorTxtRequired
        
        targetCurencyCodeLbl.text = BeneficiaryDetails.shared.currency
        
        stateLbl.isHidden = true
        stateField.isHidden = true
        
        cityLbl.isHidden = true
        cityField.isHidden = true
        
        if BeneficiaryDetails.shared.currency == "USD" {
            stateLbl.isHidden = false
            stateField.isHidden = false
            stateLbl.text = Global.shared.stateb
            stateField.text = BeneficiaryDetails.shared.state
            
        }
        
        if BeneficiaryDetails.shared.currency == "MXN"{
            stateLbl.isHidden = false
            stateField.isHidden = false
            stateLbl.text = Global.shared.stateb
            stateField.text = BeneficiaryDetails.shared.state
            cityLbl.isHidden = false
            cityField.isHidden = false
            cityLbl.text = Global.shared.cityb
            cityField.text = BeneficiaryDetails.shared.city
            
        }
        
        
        //   benefIdLbl.text = "\(BeneficiaryDetails.shared.beneficiaryId ?? 0)"
        //    bankValue.text = BeneficiaryDetails.shared.bankName
        //   curencyValueLbl.text = BeneficiaryDetails.shared.currency
        
        curencyValueLbl.text = BeneficiaryDetails.shared.country ?? ""
        // acntValue.text = BeneficiaryDetails.shared.accountNumber
       
        
        //   branchValue.text = BeneficiaryDetails.shared.branchName
      
        
        //   sendNowBtnOtlt.setTitle(Global.shared.sendMoneyTxt, for: .normal)
      /*  Global.shared.fraudPopUpDirectWu = "Normal"
        
        let popOverVC = self.storyboard?.instantiateViewController(withIdentifier: "WuFirstTermsConditions") as! WuFirstTermsConditions
                     self.addChild(popOverVC)
                     popOverVC.view.frame = self.view.frame
                     self.view.addSubview(popOverVC.view)
                     popOverVC.didMove(toParent: self)*/
        
    }
    
    func downloadBeneficiary() {
        
        let paramaterPasing: [String:Any] = ["registrationId": Global.shared.afterLoginRegistrtnId ?? "",
                                             "status": 0, "beneficiaryId": BeneficiaryDetails.shared.beneficiaryId ?? 0, "disbursalMode": ""]
        
        
        /*   let headers: HTTPHeaders = [
         "Content-Type": "application/json"
         ]*/
        
        let headers: HTTPHeaders = [.authorization(bearerToken: UserDefaults.standard.string(forKey: "token")!)]
        
        NetWorkDataManager.sharedInstance.benefGetListImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            
            if errorString == nil
            {
                
                print(resonseTal!)
                if let benList = resonseTal?.value(forKey: "beneficiariesResponseList") as? NSArray {
                    print(benList)
                    
                    if benList.count != 0
                    {
                    
                    if let  purposeListJSON = (benList[0] as AnyObject).value(forKey: "purposeList") as? [[String: Any]] {
                      self.purposeList = BeneficiaryPurposeData.getPickerData(purposeListJSON)

                    }
                    
                    
                    BeneficiaryDetails.shared.countryName = (benList[0] as AnyObject).value(forKey: "countryName") as? String ?? ""
                    
                    let indexG = Global.shared.countryNameData.firstIndex(of: BeneficiaryDetails.shared.countryName)

                                     let countryCodeD = Global.shared.countryCodesData[indexG ?? 0]
                                               //  self.placeOfBirthImg.image = UIImage(named: dropDisplay)
                    self.targetCurncyImg.image = UIImage(named:  countryCodeD.lowercased())
                    BeneficiaryDetails.shared.currency  = (benList[0] as AnyObject).value(forKey: "currency") as? String ?? ""
                    let indexF = Global.shared.currencyCodesDataWU.firstIndex(of: BeneficiaryDetails.shared.currency)

                    let curencyFulNamM = Global.shared.currencyNameDataWU[indexF ?? 0]
                                               //  self.placeOfBirthImg.image = UIImage(named: dropDisplay)
                    self.inrOrOtherCurencyLbl.text = curencyFulNamM
                    
                    
                 //   self.targetCurncyImg.image = UIImage(named: BeneficiaryDetails.shared.countryName)
                    
                    
                    
                    BeneficiaryDetails.shared.abaRouteCode = (benList[0] as AnyObject).value(forKey: "abaRouteCode") as? String ?? ""
                    BeneficiaryDetails.shared.accountNumber = (benList[0] as AnyObject).value(forKey: "accountNumber") as? String ?? ""
                    BeneficiaryDetails.shared.address1 = (benList[0] as AnyObject).value(forKey: "address1") as? String ?? ""
                    BeneficiaryDetails.shared.address2 = (benList[0] as AnyObject).value(forKey: "address2") as? String ?? ""
                    BeneficiaryDetails.shared.agentID = (benList[0] as AnyObject).value(forKey: "agentID") as? String ?? ""
                    BeneficiaryDetails.shared.agentName = (benList[0] as AnyObject).value(forKey: "agentName") as? String ?? ""
                    BeneficiaryDetails.shared.bankCode = (benList[0] as AnyObject).value(forKey: "bankCode") as? String ?? ""
                    BeneficiaryDetails.shared.bankName = (benList[0] as AnyObject).value(forKey: "bankName") as? String ?? ""
                    BeneficiaryDetails.shared.benID = (benList[0] as AnyObject).value(forKey: "benID") as? String ?? ""
                    BeneficiaryDetails.shared.beneficiaryId = (benList[0] as AnyObject).value(forKey: "beneficiaryId") as? Int ?? 0
                    BeneficiaryDetails.shared.beneficiaryType = (benList[0] as AnyObject).value(forKey: "beneficiaryType") as? Int ?? 0
                    BeneficiaryDetails.shared.branchAddress1 = (benList[0] as AnyObject).value(forKey: "branchAddress1") as? String ?? ""
                    BeneficiaryDetails.shared.branchAddress2 = (benList[0] as AnyObject).value(forKey: "branchAddress2") as? String ?? ""
                    BeneficiaryDetails.shared.branchCity = (benList[0] as AnyObject).value(forKey: "branchCity") as? String ?? ""
                    BeneficiaryDetails.shared.branchCode = (benList[0] as AnyObject).value(forKey: "branchCode") as? String ?? ""
                    BeneficiaryDetails.shared.branchName = (benList[0] as AnyObject).value(forKey: "branchName") as? String ?? ""
                    BeneficiaryDetails.shared.branchState = (benList[0] as AnyObject).value(forKey: "branchState") as? String ?? ""
                    BeneficiaryDetails.shared.city = (benList[0] as AnyObject).value(forKey: "city") as? String ?? ""
                    BeneficiaryDetails.shared.cnicno = (benList[0] as AnyObject).value(forKey: "cnicno") as? String ?? ""
                    BeneficiaryDetails.shared.country = (benList[0] as AnyObject).value(forKey: "country") as? String ?? ""
                    BeneficiaryDetails.shared.currency = (benList[0] as AnyObject).value(forKey: "currency") as? String ?? ""
                    BeneficiaryDetails.shared.defaultPurposeCode = (benList[0] as AnyObject).value(forKey: "defaultPurposeCode") as? String ?? ""
                    BeneficiaryDetails.shared.defaultPurposeName = (benList[0] as AnyObject).value(forKey: "defaultPurposeName") as? String ?? ""
                    BeneficiaryDetails.shared.disbursalMode = (benList[0] as AnyObject).value(forKey: "disbursalMode") as? String ?? ""
                    BeneficiaryDetails.shared.disbursalModeName = (benList[0] as AnyObject).value(forKey: "disbursalModeName") as? String ?? ""
                    BeneficiaryDetails.shared.fcMaxAmount = (benList[0] as AnyObject).value(forKey: "fcMaxAmount") as? String ?? ""
                    BeneficiaryDetails.shared.fcMinAmount = (benList[0] as AnyObject).value(forKey: "fcMinAmount") as? String ?? ""
                    BeneficiaryDetails.shared.firstName = (benList[0] as AnyObject).value(forKey: "firstName") as? String ?? ""
                    BeneficiaryDetails.shared.ibanCode = (benList[0] as AnyObject).value(forKey: "ibanCode") as? String ?? ""
                    BeneficiaryDetails.shared.ifscCode = (benList[0] as AnyObject).value(forKey: "ifscCode") as? String ?? ""
                    BeneficiaryDetails.shared.lastName = (benList[0] as AnyObject).value(forKey: "lastName") as? String ?? ""
                    BeneficiaryDetails.shared.middleName = (benList[0] as AnyObject).value(forKey: "middleName") as? String ?? ""
                    BeneficiaryDetails.shared.mobile = (benList[0] as AnyObject).value(forKey: "mobile") as? String ?? ""
                    BeneficiaryDetails.shared.nationality = (benList[0] as AnyObject).value(forKey: "nationality") as? String ?? ""
                    BeneficiaryDetails.shared.postCode = (benList[0] as AnyObject).value(forKey: "postCode") as? String ?? ""
                    BeneficiaryDetails.shared.referenceId = (benList[0] as AnyObject).value(forKey: "referenceId") as? String ?? ""
                    BeneficiaryDetails.shared.remID = (benList[0] as AnyObject).value(forKey: "remID")  as? String ?? ""
                    BeneficiaryDetails.shared.remarks = (benList[0] as AnyObject).value(forKey: "remarks") as? String ?? ""
                    BeneficiaryDetails.shared.sourceOfIncome = (benList[0] as AnyObject).value(forKey: "sourceOfIncome") as? String ?? ""
                    BeneficiaryDetails.shared.state = (benList[0] as AnyObject).value(forKey: "state") as? String ?? ""
                    BeneficiaryDetails.shared.swiftCode = (benList[0] as AnyObject).value(forKey: "swiftCode") as? String ?? ""
                    BeneficiaryDetails.shared.telePhone = (benList[0] as AnyObject).value(forKey: "telePhone") as? String ?? ""
                    BeneficiaryDetails.shared.txnRef = (benList[0] as AnyObject).value(forKey: "txnRef") as? String ?? ""
                    self.purposeCode = (benList[0] as AnyObject).value(forKey: "defaultPurposeCode") as? String ?? ""
                    self.purposeField.text = (benList[0] as AnyObject).value(forKey: "defaultPurposeName") as? String ?? ""
                    
                    self.assigningLabels()
                    
                    if  BeneficiaryDetails.shared.quickSend == "Quick" {
                        self.purposeCode = (benList[0] as AnyObject).value(forKey: "defaultPurposeCode") as? String ?? ""
                        self.purposeField.text = (benList[0] as AnyObject).value(forKey: "defaultPurposeName") as? String ?? ""
                        
                        self.sourceField.text = String(BeneficiaryDetails.shared.lcAmntQuickSend)
                        self.removeSpinner()
                        self.rateSourceCalculator()
                        
                    }
                  
                  }
                                
                }
                
                let statusMsg = resonseTal?.value(forKey: "statusMessage") as? String
                let statusCode = resonseTal?.value(forKey: "statusCodes") as? Int
                let mesageCode = resonseTal?.value(forKey: "messageCode") as? String ?? statusMsg

                if statusCode ==  400 {
                    if mesageCode == "E110042"
                    {
                        self.showAlert(withTitle: "", withMessage: resonseTal?["statusMessage"] as? String ?? "")

                    }
                    else if mesageCode == "R111"
                     {
                        let alert = ViewControllerManager.displayAlert(message: Global.shared.messageCodeType(text: "R115"), title:APPLICATIONNAME)
                        self.present(alert, animated: true, completion: nil)
                     }
                    else{
                    
                    let alert = ViewControllerManager.displayAlert(message: statusMsg ?? "", title:APPLICATIONNAME)
                    self.present(alert, animated: true, completion: nil)
                    }
                }
                
            }
                
            else
            {
                            print(errorString!)
                           
                            self.removeSpinner()
                         
                            if errorString == "Response could not be serialized, input data was nil or zero length." {
                                Global.shared.timeoUtOrNot = "no"
                                self.showAlertForTimer(titulo: "", mensagem: Global.shared.sessionTimedOutTxt, vc: self)
//                                let refreshAlert = UIAlertController(title: "", message: Global.shared.sessionTimedOutTxt, preferredStyle: UIAlertController.Style.alert)
//                                refreshAlert.view.tintColor = ColorCodes.newAppRed
//                                refreshAlert.addAction(UIAlertAction(title: Global.shared.okTxt, style: .default, handler: { (action: UIAlertAction!) in
//                                   self.pushViewController(controller: LoginVc.initiateController())
//                                }))
//
//                                self.present(refreshAlert, animated: true, completion: nil)
                            }
                            
                            else {
                                let alert = ViewControllerManager.displayAlert(message: errorString ?? "", title:APPLICATIONNAME)
                                self.present(alert, animated: true, completion: nil)
                            }
                           
                            
                        }

        }
    }
    
    
    @IBAction func langugeChangeActn(_ sender: Any) {
        Global.shared.languageChangeActn()
    }
    
    @IBAction func logoutActn(_ sender: Any) {
        logout()
//        let refreshAlert = UIAlertController(title: Global.shared.logoutHeaderTxt, message: Global.shared.logoutTxt, preferredStyle: UIAlertController.Style.alert)
//        refreshAlert.view.tintColor = ColorCodes.newAppRed
//        refreshAlert.addAction(UIAlertAction(title: Global.shared.yesTxt, style: .default, handler: { (action: UIAlertAction!) in
//           self.pushViewController(controller: LoginVc.initiateController())
//        }))
//
//        refreshAlert.addAction(UIAlertAction(title: Global.shared.noTxt, style: .default, handler: { (action: UIAlertAction!) in
//            print("Handle Cancel Logic here")
//              refreshAlert.dismiss(animated: true, completion: nil)
//
//        }))
//
//        present(refreshAlert, animated: true, completion: nil)
    }
    
    @IBAction func menuBtnActn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func sendNowBtnActn(_ sender: Any) {
        self.showSpinner(onView: self.view)
        if sourceField.text == "" {
            sourceReqLbl.isHidden = false
            self.removeSpinner()
        }
        else  if targetField.text == "" {
            targetReqLbl.isHidden = false
            self.removeSpinner()
        }
        else if purposeCode == "" {
            purposeReqLbl.isHidden = false
            self.removeSpinner()
        }
            else  if checkMarkClicked == nil  || checkMarkClicked == "unchecked"{
            self.removeSpinner()
               let alert = ViewControllerManager.displayAlert(message: Global.shared.proceedTermsCondtnAlertTxt, title:APPLICATIONNAME)
                         self.present(alert, animated: true, completion: nil)
            }
        else {
            BeneficiaryDetails.shared.calcType = calcType
            BeneficiaryDetails.shared.directTransferWu = "Indirect"
            /* let vc = self.storyboard?.instantiateViewController(identifier: "BenefWuTransctnDetailsVc") as! BenefWuTransctnDetailsVc
             self.navigationController?.pushViewController(vc, animated: true)*/
            DispatchQueue.main.async {
                self.postTransctn()
            }
        }
    }
    
    
    func rateSourceCalculator() {
        let amntDecimal = NSDecimalNumber(string: self.sourceField.text?.replacingOccurrences(of: ",", with: "", options: .literal, range: nil) ?? "0.0")
               //    if Int(truncating: amntDecimal) > 0 {
        
        if Double(truncating: amntDecimal) >= 0.01 {
        self.targetField.text = ""
        if  BeneficiaryDetails.shared.quickSend == "Quick" {
            self.removeSpinner()
        }
        else {
            self.showSpinner(onView: self.view)
        }
        
        //   self.showSpinner(onView: self.view)
        calcType = "LC"
        
        let paramaterPasing: [String:Any] = [
            "sendAmount": amntDecimal,
            "conversionType": calcType,
            "receiverCountryCode": BeneficiaryDetails.shared.country!,
            "receiverCurrencyCode": targetCurencyCodeLbl.text!,
            "promoCode": ""]
        
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
                    
                    print(paramaterPasing)
        
        /*   let headers: HTTPHeaders = [.authorization(bearerToken: UserDefaults.standard.string(forKey: "token")!)]*/
        
        NetWorkDataManager.sharedInstance.benefWuRateCalculatorImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            
            if errorString == nil
            {
                self.removeSpinner()
                print(resonseTal!)
               // let mesageCode = resonseTal?.value(forKey: "messageCode") as? String
                let statusMsg = resonseTal?.value(forKey: "statusMessage") as? String
                if let statusCode = resonseTal?.value(forKey: "statusCodes") as? Int {
                    
                    print(statusCode)
                    if(statusCode == 200) {
                        
                        
                        
                        self.targetField.text = resonseTal?["destinationPrincipalAmount"] as? String ?? ""
                        
                        let receiveAmnt = resonseTal?["destinationPrincipalAmount"] as? String ?? ""
                        self.receiveAmountP =  receiveAmnt.replacingOccurrences(of: ",", with: "", options: .literal, range: nil)
                        
                        let rateeDwn = Double(resonseTal?["conversionRate"] as? String ?? "")
                     //   let newRateCalcltnDwn = 1/rateeDwn!
                        let finalRateCalculatedDwn = rateeDwn?.rounded(toPlaces: 3)
                        self.rateChargesLbl.text = Global.shared.benefListRate + ": " + String(finalRateCalculatedDwn ?? 0.0)
                     /*   let receivee = Double(self.targetField.text?.replacingOccurrences(of: ",", with: "", options: .literal, range: nil) ?? "0")
                        let sendd = Double(self.sourceField.text?.replacingOccurrences(of: ",", with: "", options: .literal, range: nil) ?? "0")
                        
                        let rateCalcltn = receivee!/sendd!
                         let finalRateCalculated = rateCalcltn.rounded(toPlaces: 3)*/
                        
                        let ratee = Double(resonseTal?["conversionRate"] as? String ?? "")
                        let finalRateCalculated = ratee!.rounded(toPlaces: 3)
                        
                        
                        
                        
                        let finalTxt = "1 KWD = " + String(finalRateCalculated) + " " + self.targetCurencyCodeLbl.text!
                        self.rateCalculationLbl.text = finalTxt
                        self.rateCalculationLbl.isHidden = false
                        
                        
                        BeneficiaryDetails.shared.conversionRate = resonseTal?.value(forKey: "conversionRate") as? String
                        BeneficiaryDetails.shared.destinationPrincipalAmount = resonseTal?.value(forKey: "destinationPrincipalAmount") as? String
                        BeneficiaryDetails.shared.grossTotalAmount = resonseTal?.value(forKey: "grossTotalAmount") as? String
                        BeneficiaryDetails.shared.originatorsPrincipalAmount = resonseTal?.value(forKey: "originatorsPrincipalAmount") as? String
                        
                        let sendAmnt = resonseTal?["originatorsPrincipalAmount"] as? String ?? ""
                        self.sendAmountP =  sendAmnt.replacingOccurrences(of: ",", with: "", options: .literal, range: nil)
                        
                        
                        BeneficiaryDetails.shared.senderFee = resonseTal?.value(forKey: "senderFee") as? String
                        
                        
                        self.targetField.text = resonseTal?.value(forKey: "destinationPrincipalAmount") as? String
                        //     BeneficiaryDetails.shared.sendAmount = resonseTal?.value(forKey: "destinationPrincipalAmount") as? String
                        BeneficiaryDetails.shared.sourceCurrenyCode = self.sourceCurencyCodeLbl.text!
                        BeneficiaryDetails.shared.targetCurencyCode = self.targetCurencyCodeLbl.text!
                        
                        
                        self.feeChargesLbl.text = Global.shared.benefListCommission  +  ": " + BeneficiaryDetails.shared.senderFee + " KWD"
                        self.youPayFinalAmntLbl.text =  BeneficiaryDetails.shared.grossTotalAmount + " KWD"
                        
                        self.firstHideView.isHidden = false
                        self.secndHideLbl.isHidden = false
                        self.thirdHideView.isHidden = false
                        
                        self.heightConstrt.constant = 240
                        
                        
                    }
                    else {
                        let alert = ViewControllerManager.displayAlert(message: statusMsg ?? "", title:APPLICATIONNAME)
                        self.present(alert, animated: true, completion: nil)
                        
                        self.firstHideView.isHidden = true
                        self.secndHideLbl.isHidden = true
                        self.thirdHideView.isHidden = true
                        
                        self.heightConstrt.constant = 95
                    }
                }
                
            }
                
            else
            {
                print(errorString!)
                self.removeSpinner()
                let finalError = errorString?.components(separatedBy: ":")
                let alert = ViewControllerManager.displayAlert(message: finalError?[1] ?? "", title:APPLICATIONNAME)
                self.present(alert, animated: true, completion: nil)
                
            }
        }
        
    }
    }
    
    // Mark: Calculating rate when entered on target field
    func rateTargetCalculator(){
        let amntDecimal = NSDecimalNumber(string: self.targetField.text?.replacingOccurrences(of: ",", with: "", options: .literal, range: nil) ?? "0.0")
                   
                //   if Int(truncating: amntDecimal) > 0 {
        if Double(truncating: amntDecimal) >= 0.01 {
        self.sourceField.text = ""
        self.showSpinner(onView: self.view)
        calcType = "FC"
        
        let paramaterPasing: [String:Any] = ["sendAmount": amntDecimal,
                                             "conversionType": calcType,
                                             "receiverCountryCode": BeneficiaryDetails.shared.country!,
                                             "receiverCurrencyCode": targetCurencyCodeLbl.text!,
                                             "promoCode": ""]
        
        print(paramaterPasing)
        /*  let headers: HTTPHeaders = [
         "Content-Type": "application/json"
         ]*/
        
        let headers: HTTPHeaders = [.authorization(bearerToken: UserDefaults.standard.string(forKey: "token")!)]
        
        NetWorkDataManager.sharedInstance.benefWuRateCalculatorImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            
            if errorString == nil
            {
                self.removeSpinner()
              //  print(resonseTal!)
               // let mesageCode = resonseTal?.value(forKey: "messageCode") as? String
                let statusMsg = resonseTal?.value(forKey: "statusMessage") as? String
                if let statusCode = resonseTal?.value(forKey: "statusCodes") as? Int {
                    
                    print(statusCode)
                    if(statusCode == 200) {
                        
                        self.sourceField.text = resonseTal?["originatorsPrincipalAmount"] as? String ?? ""
                        
                        let receiveAmnt = resonseTal?["originatorsPrincipalAmount"] as? String ?? ""
                        self.receiveAmountP =  receiveAmnt.replacingOccurrences(of: ",", with: "", options: .literal, range: nil)
                        
                        
                        let rateeDwn = Double(resonseTal?["conversionRate"] as? String ?? "")
                      /*  let newRateCalcltnDwn = 1/rateeDwn!
                        let finalRateCalculatedDwn = newRateCalcltnDwn.rounded(toPlaces: 3)
                        self.rateChargesLbl.text = "Rate: " +  String(finalRateCalculatedDwn)*/
                        let finalRateCalculatedDwn = rateeDwn?.rounded(toPlaces: 3)
                        self.rateChargesLbl.text =  Global.shared.benefListRate + ": " + String(finalRateCalculatedDwn ?? 0.0)
                        
                        
                     /*   let receivee = Double(self.targetField.text?.replacingOccurrences(of: ",", with: "", options: .literal, range: nil) ?? "0")
                        let sendd = Double(self.sourceField.text?.replacingOccurrences(of: ",", with: "", options: .literal, range: nil) ?? "0")
                        
                        let rateCalcltn = receivee!/sendd!
                        
                         let finalRateCalculated = rateCalcltn.rounded(toPlaces: 3)*/
                        
                        let ratee = Double(resonseTal?["conversionRate"] as? String ?? "")
                        let finalRateCalculated = ratee!.rounded(toPlaces: 3)
                        
                        let finalTxt = "1 KWD = " + String(finalRateCalculated) + " " + self.targetCurencyCodeLbl.text!
                        self.rateCalculationLbl.text = finalTxt
                        self.rateCalculationLbl.isHidden = false
                        
                        
                        BeneficiaryDetails.shared.conversionRate = resonseTal?.value(forKey: "conversionRate") as? String
                        BeneficiaryDetails.shared.destinationPrincipalAmount = resonseTal?.value(forKey: "destinationPrincipalAmount") as? String
                        
                        let sendAmnt = resonseTal?["destinationPrincipalAmount"] as? String ?? ""
                        self.sendAmountP =  sendAmnt.replacingOccurrences(of: ",", with: "", options: .literal, range: nil)
                        
                        
                        BeneficiaryDetails.shared.grossTotalAmount = resonseTal?.value(forKey: "grossTotalAmount") as? String
                        BeneficiaryDetails.shared.originatorsPrincipalAmount = resonseTal?.value(forKey: "originatorsPrincipalAmount") as? String
                        BeneficiaryDetails.shared.senderFee = resonseTal?.value(forKey: "senderFee") as? String
                        
                        
                        self.sourceField.text = resonseTal?.value(forKey: "originatorsPrincipalAmount") as? String
                        //           BeneficiaryDetails.shared.sendAmount = resonseTal?.value(forKey: "originatorsPrincipalAmount") as? String
                        //  BeneficiaryDetails.shared.targetCurencyCode = self.targetField.text!
                        BeneficiaryDetails.shared.sourceCurrenyCode = self.sourceCurencyCodeLbl.text!
                        BeneficiaryDetails.shared.targetCurencyCode = self.targetCurencyCodeLbl.text!
                        
                        self.feeChargesLbl.text = Global.shared.benefListCommission + ": " +  BeneficiaryDetails.shared.senderFee + " KWD"
                        self.youPayFinalAmntLbl.text =  BeneficiaryDetails.shared.grossTotalAmount + " KWD"
                        
                        self.firstHideView.isHidden = false
                        self.secndHideLbl.isHidden = false
                        self.thirdHideView.isHidden = false
                        
                        self.heightConstrt.constant = 240
                        
                    }
                    else {
                        let alert = ViewControllerManager.displayAlert(message: statusMsg ?? "", title:APPLICATIONNAME)
                        self.present(alert, animated: true, completion: nil)
                        self.firstHideView.isHidden = true
                        self.secndHideLbl.isHidden = true
                        self.thirdHideView.isHidden = true
                        
                        self.heightConstrt.constant = 95
                    }
                }
                
            }
                
            else
            {
                print(errorString!)
                self.removeSpinner()
                let finalError = errorString?.components(separatedBy: ":")
                let alert = ViewControllerManager.displayAlert(message: finalError?[1] ?? "", title:APPLICATIONNAME)
                self.present(alert, animated: true, completion: nil)
                
                self.firstHideView.isHidden = true
                self.secndHideLbl.isHidden = true
                self.thirdHideView.isHidden = true
                
                self.heightConstrt.constant = 95
            }
        }
        
    }
    }
    
  /*  func textFieldDidEndEditing(_ textField: UITextField) {
        
        //doneAction()
        if textField == sourceField{
            if sourceField.text!.count ==  0 {
                sourceReqLbl.isHidden = false
            }
            else {
                rateSourceCalculator()
                sourceReqLbl.isHidden = true
            }
        } else  if textField == targetField{
            if targetField.text!.count ==  0 {
                targetReqLbl.isHidden = false
            }
            else {
                rateTargetCalculator()
                targetReqLbl.isHidden = true
            }
        }
        
    }*/
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField == sourceField {
            if (sourceField.text?.contains("."))! && string == "." {
                return false
            }
            if (sourceField.text?.contains("."))! {
                           if sourceField.text?.components(separatedBy: ".")[1].count == Global.shared.digitsAfterDecimal {
                               
                               if string == "." || string == "1" || string ==  "2" || string ==  "3" || string ==  "4" || string ==  "5" ||  string == "6" ||  string == "7" || string ==  "8" || string ==  "9" || string ==  "0" {
                                   return false
                                   
                               }
                               else {
                                   return true
                               }
                              // return true
                           }
                       }
            if sourceField.text!.count <= -1 {
                sourceReqLbl.isHidden = false
            }
            else {
                //  rateSourceCalculator()
                sourceReqLbl.isHidden = true
            }
        } else  if textField == targetField {
            if (targetField.text?.contains("."))! && string == "." {
                return false
            }
            if (targetField.text?.contains("."))! {
                           if targetField.text?.components(separatedBy: ".")[1].count == Global.shared.digitsAfterDecimal {
                               
                               if string == "." || string == "1" || string ==  "2" || string ==  "3" || string ==  "4" || string ==  "5" ||  string == "6" ||  string == "7" || string ==  "8" || string ==  "9" || string ==  "0" {
                                   return false
                                   
                               }
                               else {
                                   return true
                               }
                             //  return true
                           }
                       }
            if targetField.text!.count <= -1 {
                targetReqLbl.isHidden = false
            }
            else {
                // rateTargetCalculator()
                targetReqLbl.isHidden = true
            }
        }
        
        
        return true
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
      //  Global.shared.countrysChangeAccordingly = "WU"
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        Global.shared.timeoUtOrNot = "yes"
        observeTimeout()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @IBAction func purposeDrpActn(_ sender: Any) {
        guard self.purposeList.count > 0 else {return}
      let popupVc = PopupViewController.showPopup(parentVC: self, data: self.purposeList)
        popupVc?.setListData(with: .purposeScreen, data: self.purposeList)
       popupVc?.delegate = self
     
//        PickerDialog().show(title: "", options: pickerData , selected: "") {
//            (value) -> Void in
//
//            let indexS = self.purposeNameData.firstIndex(of: "\(value)")
//            self.purposeCode = self.purposeValueData[indexS ?? 0]
//            self.purposeField.text = value
//
//        }
    }
    
    func downloadBeneficiaryPurpose() {
        
        let paramaterPasing: [String:Any] = ["registrationId": Global.shared.afterLoginRegistrtnId ?? "",
                                             "status": 0, "beneficiaryId": BeneficiaryDetails.shared.beneficiaryId ?? 0, "disbursalMode": ""]
        
        
        /*    let headers: HTTPHeaders = [
         "Content-Type": "application/json"
         ]*/
        
        let headers: HTTPHeaders = [.authorization(bearerToken: UserDefaults.standard.string(forKey: "token")!)]
        
        NetWorkDataManager.sharedInstance.benefGetListImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            
            if errorString == nil
            {
                
                print(resonseTal!)
                if let benList = resonseTal?.value(forKey: "beneficiariesResponseList") as? NSArray {
                    print(benList)
                  if let  purposeListJSON = (benList[0] as AnyObject).value(forKey: "purposeList") as? [[String: Any]] {
                    self.purposeList = BeneficiaryPurposeData.getPickerData(purposeListJSON)

                  }
                  
//                    if let countryName = purposeList?.value(forKey: "name") as? [String] {
//                        self.purposeNameData = countryName
//                    }
//                    if let countryCode = purposeList?.value(forKey: "value") as? [String] {
//                        self.purposeValueData = countryCode
//                    }
//
                }
//
//                for i in 0..<self.purposeNameData.count {
//                    self.pickerResponseData.append(["value": self.purposeNameData[i], "display": self.purposeNameData[i]])
//                }
                
                //   self.removeSpinner()
                let statusMsg = resonseTal?.value(forKey: "statusMessage") as? String
                let statusCode = resonseTal?.value(forKey: "statusCodes") as? Int
                let mesageCode = resonseTal?.value(forKey: "messageCode") as? String ?? statusMsg

                if statusCode ==  400 {
                    if mesageCode == "E110042"
                    {
                        self.showAlert(withTitle: "", withMessage: resonseTal?["statusMessage"] as? String ?? "")

                    }
                    else{
                    
                    let alert = ViewControllerManager.displayAlert(message: statusMsg ?? "", title:APPLICATIONNAME)
                    self.present(alert, animated: true, completion: nil)
                    }
                }
            }
                
            else
            {
                            print(errorString!)
                           
                            self.removeSpinner()
                         
                            if errorString == "Response could not be serialized, input data was nil or zero length." {
                                Global.shared.timeoUtOrNot = "no"
                                self.showAlertForTimer(titulo: "", mensagem: Global.shared.sessionTimedOutTxt, vc: self)
//                                let refreshAlert = UIAlertController(title: "", message: Global.shared.sessionTimedOutTxt, preferredStyle: UIAlertController.Style.alert)
//                                refreshAlert.view.tintColor = ColorCodes.newAppRed
//                                refreshAlert.addAction(UIAlertAction(title: Global.shared.okTxt, style: .default, handler: { (action: UIAlertAction!) in
//                                   self.pushViewController(controller: LoginVc.initiateController())
//                                }))
//
//                                self.present(refreshAlert, animated: true, completion: nil)
                            }
                            
                            else {
                                let alert = ViewControllerManager.displayAlert(message: errorString ?? "", title:APPLICATIONNAME)
                                self.present(alert, animated: true, completion: nil)
                            }
                           
                            
                        }

        }
    }
    
    
    var sendAmountP:String!
    var receiveAmountP:String!
    
    func postTransctn() {
      //   sendAmountP = BeneficiaryDetails.shared.originatorsPrincipalAmount!.replacingOccurrences(of: ",", with: "", options: .literal, range: nil)
        let conversionRateP = BeneficiaryDetails.shared.conversionRate!.replacingOccurrences(of: ",", with: "", options: .literal, range: nil)
      //   receiveAmountP = BeneficiaryDetails.shared.destinationPrincipalAmount!.replacingOccurrences(of: ",", with: "", options: .literal, range: nil)
        let senderFeeP = BeneficiaryDetails.shared.senderFee!.replacingOccurrences(of: ",", with: "", options: .literal, range: nil)
        let grossTotalAmountP = BeneficiaryDetails.shared.grossTotalAmount!.replacingOccurrences(of: ",", with: "", options: .literal, range: nil)
        
        let ipAddress = try? String(contentsOf: URL(string: "https://api.ipify.org")!, encoding: .utf8)
                     // print(ipAddress)
               let newIpAdress = ipAddress ?? ""
        
        
        let paramaterPasing: [String:Any] = [
            
            "registrationId": UserDefaults.standard.string(forKey: "registrationId")!,
            "beneficiaryId": BeneficiaryDetails.shared.beneficiaryId!,
            "beneficiaryType": BeneficiaryDetails.shared.beneficiaryType!,
            "remID": BeneficiaryDetails.shared.remID!,
            "oldTnxRef": BeneficiaryDetails.shared.txnRef!,
            "remitterId": "",
            "remitterCard": "",
            "remitterIdType": "",
            "sendAmount":  Double(sendAmountP) ?? 0.0,
            "conversionRate": Double(conversionRateP) ?? 0.0,
            "receiveAmount": Double(receiveAmountP) ?? 0.0,
            "senderFee": Double(senderFeeP) ?? 0.0,
            "grossTotalAmount": Double(grossTotalAmountP) ?? 0.0,
            "receiverCountryCode": BeneficiaryDetails.shared.country!,
            "receiverState": BeneficiaryDetails.shared.state!,
            "receiverStateCode": BeneficiaryDetails.shared.state!,
            "receiverCity": BeneficiaryDetails.shared.city!,
            "receiverCurrency_code": BeneficiaryDetails.shared.currency!,
            "receiverFirstName": BeneficiaryDetails.shared.firstName!,
            "receiverMiddleName": BeneficiaryDetails.shared.middleName!,
            "receiverLastName": BeneficiaryDetails.shared.lastName!,
            "purposeOfTransfer": purposeCode,
            "conversionType": BeneficiaryDetails.shared.calcType!,
            "sourceOfIncome": BeneficiaryDetails.shared.sourceOfIncome!,
            "occupation": "",
            "promoCode": "",
            "postTransactionType": 2,
            "isNewBeneficiary": false,
            "potName": purposeField.text!,
            "loginSource": 3, "IPAddress": newIpAdress
        ]
        
        
        print(paramaterPasing)
        /*  let headers: HTTPHeaders = [
         "Content-Type": "application/json"
         ]*/
        
        let headers: HTTPHeaders = [.authorization(bearerToken: UserDefaults.standard.string(forKey: "token")!)]
        
        NetWorkDataManager.sharedInstance.benefWuPostTransctnImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            
            if errorString == nil
            {
                
              //  print(resonseTal!)
                
                self.removeSpinner()
              //  let mesageCode = resonseTal?.value(forKey: "messageCode") as? String
                let statusMsg = resonseTal?.value(forKey: "statusMessage") as? String
                let mesageCode = resonseTal?.value(forKey: "messageCode") as? String ?? statusMsg
                if let statusCode = resonseTal?.value(forKey: "statusCodes") as? Int {
                    
                    print(statusCode)
                    if(statusCode == 200) {
                        // self.navigationController?.popViewController(animated: true)
                        Global.shared.navTxtForPayment = self.navHederLbl.text
                        
                        BeneficiaryDetails.shared.txnRefNo = resonseTal?.value(forKey: "newTnxRef") as? String
                        
                      self.pushViewController(controller: BenefPaymentWebViewVc.initiateController())

                        
                    }
                    
                    else if statusCode ==  400 {
                        if mesageCode == "E110042"
                        {
                            self.showAlert(withTitle: "", withMessage: resonseTal?["statusMessage"] as? String ?? "")

                        }
                        else{
                        let alert = ViewControllerManager.displayAlert(message: statusMsg ?? "", title:APPLICATIONNAME)
                        self.present(alert, animated: true, completion: nil)
                        }
                    }
                    else {
                        let alert = ViewControllerManager.displayAlert(message: statusMsg ?? "", title:APPLICATIONNAME)
                        self.present(alert, animated: true, completion: nil)
                    }
                }
            }
                
            else
            {
                print(errorString!)
                self.removeSpinner()
                let finalError = errorString?.components(separatedBy: ":")
                let alert = ViewControllerManager.displayAlert(message: finalError?[1] ?? "", title:APPLICATIONNAME)
                self.present(alert, animated: true, completion: nil)
                
            }
        }
        
    }
    
    @IBAction func termsConditionActn(_ sender: Any) {
        let popOverVC = self.storyboard?.instantiateViewController(withIdentifier: "WuSecndTermsConditions") as! WuSecndTermsConditions
        self.addChild(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParent: self)
    }
    
    
    @IBAction func checkBtnActn(_ sender: Any) {
     
        if(checkIconClick == true) {
            checkMarkClicked = "checked"
            checkBtnOtlt.tintColor = .darkGray
            checkBtnOtlt.setBackgroundImage(UIImage(named: "checkboxActive"), for: .normal)
        } else {
            checkMarkClicked = "unchecked"
            checkBtnOtlt.tintColor = .darkGray
            checkBtnOtlt.setBackgroundImage(UIImage(named: "checkboxNormal"), for: .normal)
        }
        
        checkIconClick = !checkIconClick
    }
    
}
extension BenefWuNewTrnsferVc: PopupViewControllerDelegate {
  func didSelectItem<T>(item: T, vc: UIViewController?) {
    guard let item = item as? BeneficiaryPurposeData else {return}
    self.purposeCode = item.value ?? ""
    self.purposeField.text = item.name
    vc?.dismiss(animated: true, completion: nil)
  }
}

//
//  BenefBankCashNewTransferVc.swift
//  Canvas
//
//  Created by urmila reddy on 29/10/20.
//  Copyright © 2020 urmila reddy. All rights reserved.
//

import UIKit
import Alamofire
class BenefBankCashNewTransferVc: BaseViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var navHeaderLbl: UILabel!
    @IBOutlet weak var acntLbl: UILabel!
    
    @IBOutlet weak var bankLbl: UILabel!
    
    @IBOutlet weak var branchLbl: UILabel!
     @IBOutlet weak var currencyLbl: UILabel!
    
    @IBOutlet weak var kuwaitDinarLbl: UILabel!
      
      @IBOutlet weak var indianRupeesLbl: UILabel!
    @IBOutlet weak var youSendLbl: UILabel!
    
    @IBOutlet weak var theyReceiveLbl: UILabel!
    @IBOutlet weak var sourceCurencyCodeLbl: UILabel!
    @IBOutlet weak var targetCurencyCodeLbl: UILabel!
    @IBOutlet weak var sendNowBtnOtlt: UIButton!
    
    
    @IBOutlet weak var nameLbl: UILabel!
    
    
    
    
    @IBOutlet weak var acntValue: UILabel!
    
    
    @IBOutlet weak var bankValue: UILabel!
    
    @IBOutlet weak var branchValue: UILabel!
    
   
    
    @IBOutlet weak var curencyValueLbl: UILabel!
    
    
    
    
    
    
    
    
    
    @IBOutlet weak var sourceField: UITextField!
    
    @IBOutlet weak var targetField: UITextField!
    
    
    @IBOutlet weak var feeChargesLbl: UILabel!
    
    
    @IBOutlet weak var youPayFinalAmntLbl: UILabel!
    
    
    
    
    @IBOutlet weak var sourceReqLbl: UILabel!
    
    @IBOutlet weak var targetReqLbl: UILabel!
    
  
    
    @IBOutlet weak var purposeView: UIView!
    
    @IBOutlet weak var purposeLbl: UILabel!
    
    @IBOutlet weak var purposeField: UITextField!
    
    @IBOutlet weak var purposeReqLbl: UILabel!
    
    @IBOutlet weak var rateCalculationLbl: UILabel!
    
    @IBOutlet weak var firstHideView: UIView!
    
    @IBOutlet weak var youPayHideLbl: UILabel!
    
    
    @IBOutlet weak var thirdHideView: UIView!
    
    //180 // 25
    
    @IBOutlet weak var topConstrt: NSLayoutConstraint!
    
    
    @IBOutlet weak var targetImg: UIImageView!
    
    
    @IBOutlet weak var rateChargesLbl: UILabel!
    
    
    
    var calcType = ""
    var fcAmnt:NSDecimalNumber!
    var lcAmnt:NSDecimalNumber!
    
    
    var purposeNameData = [String]()
    var purposeValueData = [String]()
    var pickerResponseData = [[String: String]]()
    
    var purposeCode = ""
    
    
    var transactionType:Int!
    var typeNameData = [String]()
    var typeValueData = [String]()
    var purposeList: [BeneficiaryPurposeData] = []
    
    weak var sourceTimer: Timer?
    weak var targetTimer: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        if  BeneficiaryDetails.shared.beneficiaryType == 100 {
            Global.shared.countrysChangeAccordingly = "Bank"
            navHeaderLbl.text = Global.shared.addBank
        }
        else {
            Global.shared.countrysChangeAccordingly = "Bank"
            navHeaderLbl.text = Global.shared.addCash
        }
        youPayHideLbl.text = Global.shared.youPauOnlyyTxt
       
        
        kuwaitDinarLbl.text = "KUWAITI DINAR"
    //    indianRupeesLbl.text = "INDIAN RUPEES"
        
        sendNowBtnOtlt.setTitle(" " + Global.shared.sendNowTxt, for: .normal)
       sourceField.maxLength = Global.shared.sendLimit
               targetField.maxLength = Global.shared.receiveLimit
        
        sourceReqLbl.font = Global.shared.fontReqLbl
        sourceReqLbl.textColor = ColorCodes.newAppRed
        
        targetReqLbl.font = Global.shared.fontReqLbl
        targetReqLbl.textColor = ColorCodes.newAppRed
        
        purposeReqLbl.font = Global.shared.fontReqLbl
        purposeReqLbl.textColor = ColorCodes.newAppRed
        
       // self.showSpinner(onView: self.view)
        self.showLoader()
        
        
        // Do any additional setup after loading the view.
        sourceField.delegate = self
        targetField.delegate = self
        
        DispatchQueue.main.async {
           self.downloadBeneficiary()
        }
      //  downloadBeneficiaryPurpose()
        
      //  downloadBenefConfig()
        
        rateCalculationLbl.layer.cornerRadius = 15
        rateCalculationLbl.layer.masksToBounds = true
        rateCalculationLbl.layer.backgroundColor = UIColor.clear.cgColor
        
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
        
        
        purposeLbl.text = Global.shared.remitPurposeTransferTxt + "*"
        
       //  targetImg.image = UIImage(named: BeneficiaryDetails.shared.country)
        let fullName = BeneficiaryDetails.shared.firstName  + " " +  BeneficiaryDetails.shared.middleName + " "
        nameLbl.text = fullName + BeneficiaryDetails.shared.lastName
        bankLbl.text = Global.shared.bankNameb ?? ""
        branchLbl.text = Global.shared.benefListDetailsBranch ?? ""
        currencyLbl.text = Global.shared.currencyb ?? ""
     //   acntLbl.text = Global.shared.accountNumberb ?? ""
        acntLbl.text = Global.shared.benefListDetailsAcno
        youSendLbl.text = Global.shared.youSendTxt + "*"
        theyReceiveLbl.text = Global.shared.theyReceiveTxt + "*"
        
        sourceReqLbl.text = Global.shared.errorTxtRequired
        targetReqLbl.text = Global.shared.errorTxtRequired
        
        targetCurencyCodeLbl.text = BeneficiaryDetails.shared.currency
        
        
        //   benefIdLbl.text = "\(BeneficiaryDetails.shared.beneficiaryId ?? 0)"
        
        
        
        bankValue.text = BeneficiaryDetails.shared.bankName
        curencyValueLbl.text = BeneficiaryDetails.shared.currency
        acntValue.text = BeneficiaryDetails.shared.accountNumber
        branchValue.text = BeneficiaryDetails.shared.branchName
        
        //   sendNowBtnOtlt.setTitle(Global.shared.sendMoneyTxt, for: .normal)
        
        purposeReqLbl.text = Global.shared.errorTxtRequired
        
       // self.removeSpinner()
        if  BeneficiaryDetails.shared.quickSend == "Quick" {
       print("nothing")
        }
        else {
            self.removeLoader()
        }
    }
    
    // Mark: Getting beneficiary data
    func downloadBeneficiary() {
        
        let paramaterPasing: [String:Any] = ["registrationId": Global.shared.afterLoginRegistrtnId ?? "",
                                             "status": 0, "beneficiaryId": BeneficiaryDetails.shared.beneficiaryId ?? 0, "disbursalMode": ""]
        
        
        /*  let headers: HTTPHeaders = [
         "Content-Type": "application/json"
         ]*/
        
        let headers: HTTPHeaders = [.authorization(bearerToken: UserDefaults.standard.string(forKey: "token")!)]
        
        NetWorkDataManager.sharedInstance.benefGetListImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            
            if errorString == nil
            {
          //   print(resonseTal)
                if let benList = resonseTal?.value(forKey: "beneficiariesResponseList") as? NSArray {
                    
                    if benList.count != 0
                    {
                    
                    if let  purposeListJSON = (benList[0] as AnyObject).value(forKey: "purposeList") as? [[String: Any]] {
                        self.purposeList = BeneficiaryPurposeData.getPickerData(purposeListJSON)
                    }
                        
                    BeneficiaryDetails.shared.countryName = (benList[0] as AnyObject).value(forKey: "countryName") as? String ?? ""
                    
                    let indexG = Global.shared.countryNameData.firstIndex(of: BeneficiaryDetails.shared.countryName)

                   let countryCodeD = Global.shared.countryCodesData[indexG ?? 0]
                             //  self.placeOfBirthImg.image = UIImage(named: dropDisplay)
                    self.targetImg.image = UIImage(named:  countryCodeD.lowercased())
                    
                    BeneficiaryDetails.shared.currency  = (benList[0] as AnyObject).value(forKey: "currency") as? String ?? ""
                    
                    let indexF = Global.shared.currencyCodesDataBank.firstIndex(of: BeneficiaryDetails.shared.currency)

                    let curencyFulNamM = Global.shared.currencyNameDataBank[indexF ?? 0]
                                               //  self.placeOfBirthImg.image = UIImage(named: dropDisplay)
                    self.indianRupeesLbl.text = curencyFulNamM
                    
                 //   self.targetImg.image = UIImage(named: BeneficiaryDetails.shared.countryName)
                    
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
                        
                        self.sourceField.text = String(BeneficiaryDetails.shared.lcAmntQuickSend)
                        self.purposeCode = (benList[0] as AnyObject).value(forKey: "defaultPurposeCode") as? String ?? ""
                        self.purposeField.text = (benList[0] as AnyObject).value(forKey: "defaultPurposeName") as? String ?? ""
                     //   self.removeLoader()
                    //    self.removeSpinner()
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
        else {
            BeneficiaryDetails.shared.calcType = calcType
            //   let vc = self.storyboard?.instantiateViewController(identifier: "BenefTransctnDetailsVc") as! BenefTransctnDetailsVc
            //   self.navigationController?.pushViewController(vc, animated: true)
            DispatchQueue.main.async {
                self.postTransctn()
            }
            
        }
    }
    
    // Mark: calculating rating when entered on source field
    func rateSourceCalculator() {
        let amntDecimal = NSDecimalNumber(string: self.sourceField.text?.replacingOccurrences(of: ",", with: "", options: .literal, range: nil) ?? "0.0")
                       
            // if Int(truncating: amntDecimal) > 0 {
        if Double(truncating: amntDecimal) >= 0.01 {
        self.targetField.text = ""
        if  BeneficiaryDetails.shared.quickSend == "Quick" {
          //  self.removeSpinner()
            
        }
        else {
            self.showSpinner(onView: self.view)
        }
        
        
        calcType = "FC"
        fcAmnt = 0
        let fcConvertAmnt = amntDecimal
        lcAmnt = fcConvertAmnt
        
        let paramaterPasing: [String:Any] = ["sourceCurrenyCode": sourceCurencyCodeLbl.text!,
                                             "targetCurrenyCode": targetCurencyCodeLbl.text!,
                                             "oldTnxRef": String(BeneficiaryDetails.shared.txnRef),
                                             "fcAmount": fcAmnt!,
                                             "lcAmount": lcAmnt!,
                                             "calcType": calcType]
        
      
          let headers: HTTPHeaders = [
         "Content-Type": "application/json"
         ]
        
   //     let headers: HTTPHeaders = [.authorization(bearerToken: UserDefaults.standard.string(forKey: "token")!)]
        
        NetWorkDataManager.sharedInstance.benefRate2CalculatorImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            
            if errorString == nil
            {
                self.removeSpinner()
                self.removeLoader()
              
              //  let mesageCode = resonseTal?.value(forKey: "messageCode") as? String
                let statusMsg = resonseTal?.value(forKey: "statusMessage") as? String
                if let statusCode = resonseTal?.value(forKey: "statusCodes") as? Int {
                  
                    if(statusCode == 200) {
                        
                        self.targetField.text = resonseTal?["fc"] as? String ?? ""
                        
                       
                        
                    /*    let receivee = Double(self.targetField.text?.replacingOccurrences(of: ",", with: "", options: .literal, range: nil) ?? "0")
                        let sendd = Double(self.sourceField.text?.replacingOccurrences(of: ",", with: "", options: .literal, range: nil) ?? "0")
                        
                        let rateCalcltn = receivee!/sendd!
                        let finalRateCalculated = rateCalcltn.rounded(toPlaces: 3)*/
                        
                    /*    let ratee = Double(resonseTal?["rate"] as? String ?? "")
                        
                        let downRateTxt = resonseTal?["rate"] as? String ?? ""
                        self.rateChargesLbl.text = Global.shared.benefListRate +  ": " + downRateTxt
                        
                        let newRateCalcltn = 1/ratee!
                        let finalRateCalculated = newRateCalcltn.rounded(toPlaces: 3)

                        
                        let finalTxt = "1 KWD = " + String(finalRateCalculated) + " " + self.targetCurencyCodeLbl.text!
                        self.rateCalculationLbl.text = finalTxt
                        self.rateCalculationLbl.isHidden = false*/
                        
                        let ratee = resonseTal?["rate"] as? String ?? ""
                        let finalTxt = "1 " + self.targetCurencyCodeLbl.text! + " = " +  ratee + " " + "KWD"
                        self.rateCalculationLbl.text = finalTxt
                        self.rateCalculationLbl.isHidden = false
                        
                        let downRateTxt = resonseTal?["rate"] as? String ?? ""
                        self.rateChargesLbl.text = Global.shared.benefListRate +  ": " + downRateTxt
                        
                        
                        BeneficiaryDetails.shared.rate = resonseTal?.value(forKey: "rate") as? String
                        BeneficiaryDetails.shared.commisionAmnt = resonseTal?.value(forKey: "commAmount") as? String
                        BeneficiaryDetails.shared.netLcAmnt = resonseTal?.value(forKey: "netLCAmt") as? String
                        BeneficiaryDetails.shared.fc = resonseTal?.value(forKey: "fc") as? String
                        BeneficiaryDetails.shared.lc = resonseTal?.value(forKey: "lc") as? String
                        self.targetField.text = resonseTal?.value(forKey: "fc") as? String
                        
                        BeneficiaryDetails.shared.sourceCurrenyCode = self.sourceCurencyCodeLbl.text!
                        BeneficiaryDetails.shared.targetCurencyCode = self.targetCurencyCodeLbl.text!
                        
                        
                        self.feeChargesLbl.text = Global.shared.benefListCommission + ": " + BeneficiaryDetails.shared.commisionAmnt + " KWD"
                        self.youPayFinalAmntLbl.text =  BeneficiaryDetails.shared.netLcAmnt + " KWD"
                        
                        
                        self.firstHideView.isHidden = false
                        self.youPayHideLbl.isHidden = false
                        self.thirdHideView.isHidden = false
                        
                        self.topConstrt.constant = 195
                        
                    }
                    else {
                        let alert = ViewControllerManager.displayAlert(message: statusMsg ?? "", title:APPLICATIONNAME)
                        self.present(alert, animated: true, completion: nil)
                        
                        self.firstHideView.isHidden = true
                        self.youPayHideLbl.isHidden = true
                        self.thirdHideView.isHidden = true
                        
                        self.topConstrt.constant = 25
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
                self.youPayHideLbl.isHidden = true
                self.thirdHideView.isHidden = true
                
                self.topConstrt.constant = 25
                
            }
        }
        
    }
    }
    
    // Mark: Calculating rate when entered on target field
    
    func rateTargetCalculator() {
        
        let amntDecimal = NSDecimalNumber(string: self.targetField.text?.replacingOccurrences(of: ",", with: "", options: .literal, range: nil) ?? "0.0")
                    //    if Int(truncating: amntDecimal) > 0 {
        if Double(truncating: amntDecimal) >= 0.01 {
        self.sourceField.text = ""
        self.showSpinner(onView: self.view)
        calcType = "LC"
        lcAmnt = 0
        let fcConvertAmnt = amntDecimal
        fcAmnt = fcConvertAmnt 
        
        
        
        let paramaterPasing: [String:Any] = ["sourceCurrenyCode": targetCurencyCodeLbl.text!,
                                             "targetCurrenyCode": sourceCurencyCodeLbl.text!,
                                             "oldTnxRef": String(BeneficiaryDetails.shared.txnRef),
                                             "fcAmount": fcAmnt!,
                                             "lcAmount": lcAmnt!,
                                             "calcType": calcType]
        
       
        let headers: HTTPHeaders = [
         "Content-Type": "application/json"
         ]
        
      //  let headers: HTTPHeaders = [.authorization(bearerToken: UserDefaults.standard.string(forKey: "token")!)]
        
        NetWorkDataManager.sharedInstance.benefRate2CalculatorImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            
            if errorString == nil
            {
                self.removeSpinner()
              
              //  let mesageCode = resonseTal?.value(forKey: "messageCode") as? String
                let statusMsg = resonseTal?.value(forKey: "statusMessage") as? String
                if let statusCode = resonseTal?.value(forKey: "statusCodes") as? Int {
                    
                   
                    if(statusCode == 200) {
                        
                        self.sourceField.text = resonseTal?["lc"] as? String ?? ""
                        
                     /*   let receivee = Double(self.targetField.text?.replacingOccurrences(of: ",", with: "", options: .literal, range: nil) ?? "0")
                        let sendd = Double(self.sourceField.text?.replacingOccurrences(of: ",", with: "", options: .literal, range: nil) ?? "0")
                        
                        let rateCalcltn = receivee!/sendd!
                         let finalRateCalculated = rateCalcltn.rounded(toPlaces: 3)*/
                        
                    /*    let ratee = Double(resonseTal?["rate"] as? String ?? "")
                        
                        let downRateTxt = resonseTal?["rate"] as? String ?? ""
                        self.rateChargesLbl.text = Global.shared.benefListRate +  ": " + downRateTxt
                        
                        let newRateCalcltn = 1/ratee!
                        let finalRateCalculated = newRateCalcltn.rounded(toPlaces: 3)

                     //    self.rateChargesLbl.text = resonseTal?["rate"] as? String ?? ""
                        
                        let finalTxt = "1 KWD = " + String(finalRateCalculated) + " " + self.targetCurencyCodeLbl.text!
                         self.rateCalculationLbl.text = finalTxt
                         self.rateCalculationLbl.isHidden = false */
                        let ratee = resonseTal?["rate"] as? String ?? ""
                        let finalTxt = "1 " + self.targetCurencyCodeLbl.text! + " = " +  ratee + " " + "KWD"
                        self.rateCalculationLbl.text = finalTxt
                        self.rateCalculationLbl.isHidden = false
                        
                        let downRateTxt = resonseTal?["rate"] as? String ?? ""
                        self.rateChargesLbl.text = Global.shared.benefListRate +  ": " + downRateTxt
                        
                        
                        BeneficiaryDetails.shared.rate = resonseTal?.value(forKey: "rate") as? String
                        BeneficiaryDetails.shared.commisionAmnt = resonseTal?.value(forKey: "commAmount") as? String
                        BeneficiaryDetails.shared.netLcAmnt = resonseTal?.value(forKey: "netLCAmt") as? String
                        BeneficiaryDetails.shared.fc = resonseTal?.value(forKey: "fc") as? String
                        BeneficiaryDetails.shared.lc = resonseTal?.value(forKey: "lc") as? String
                        self.sourceField.text = resonseTal?.value(forKey: "lc") as? String
                        //  BeneficiaryDetails.shared.targetCurencyCode = self.targetField.text!
                        BeneficiaryDetails.shared.sourceCurrenyCode = self.sourceCurencyCodeLbl.text!
                        BeneficiaryDetails.shared.targetCurencyCode = self.targetCurencyCodeLbl.text!
                        
                        
                        self.feeChargesLbl.text = Global.shared.benefListCommission + ": " + BeneficiaryDetails.shared.commisionAmnt + " KWD"
                        self.youPayFinalAmntLbl.text =  BeneficiaryDetails.shared.netLcAmnt + " KWD"
                        
                        self.firstHideView.isHidden = false
                        self.youPayHideLbl.isHidden = false
                        self.thirdHideView.isHidden = false
                        
                        self.topConstrt.constant = 195
                        
                    }
                    else {
                        let alert = ViewControllerManager.displayAlert(message: statusMsg ?? "", title:APPLICATIONNAME)
                        self.present(alert, animated: true, completion: nil)
                        self.firstHideView.isHidden = true
                        self.youPayHideLbl.isHidden = true
                        self.thirdHideView.isHidden = true
                        
                        self.topConstrt.constant = 25
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
                self.youPayHideLbl.isHidden = true
                self.thirdHideView.isHidden = true
                
                self.topConstrt.constant = 25
                
            }
        }
        
    }
    }
    
    
   /* func textFieldDidEndEditing(_ textField: UITextField) {
        
        //doneAction()
        if textField == sourceField{
            if sourceField.text!.count ==  0 {
                sourceReqLbl.isHidden = false
            }
            else {
                rateSourceCalculator()
                //   sourceReqLbl.isHidden = true
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
                  //  return true
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
                   // return true
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
     
        Global.shared.countrysChangeAccordingly = "Bank"
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
//        let pickerData = pickerResponseData
         guard self.purposeList.count > 0 else {return}
      let popupVc = PopupViewController.showPopup(parentVC: self, data: self.purposeList)
      popupVc?.delegate = self
        
        self.purposeReqLbl.isHidden = true
        
//        PickerDialog().show(title: "", options: pickerData , selected: "") {
//            (value) -> Void in
//            
//            let indexS = self.purposeNameData.firstIndex(of: "\(value)")
//            self.purposeCode = self.purposeValueData[indexS ?? 0]
//            self.purposeField.text = value
//            
//        }
    }
    
    
    // Mark: Downloading beneficiary purpose based on beneficiary
    func downloadBeneficiaryPurpose() {
        
        let paramaterPasing: [String:Any] = ["registrationId": Global.shared.afterLoginRegistrtnId ?? "",
                                             "status": 0, "beneficiaryId": BeneficiaryDetails.shared.beneficiaryId ?? 0, "disbursalMode": ""]
        
        
        /*    let headers: HTTPHeaders = [
         "Content-Type": "application/json"
         ]*/
        
        let headers: HTTPHeaders = [.authorization(bearerToken: UserDefaults.standard.string(forKey: "token")!)]
        
        NetWorkDataManager.sharedInstance.benefGetListImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            //test
            if errorString == nil
            {
             //   print(resonseTal)
                
               
                if let benList = resonseTal?.value(forKey: "beneficiariesResponseList") as? NSArray {
                
                    
                  if let  purposeListJSON = (benList[0] as AnyObject).value(forKey: "purposeList") as? [[String: Any]] {
                                                self.purposeList = BeneficiaryPurposeData.getPickerData(purposeListJSON)

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
                    else{
                    
                    let alert = ViewControllerManager.displayAlert(message: statusMsg ?? "", title:APPLICATIONNAME)
                    self.present(alert, animated: true, completion: nil)
                    }
                }
             
                
//                for i in 0..<self.purposeNameData.count {
//                    self.pickerResponseData.append(["value": self.purposeNameData[i], "display": self.purposeNameData[i]])
//                }
                
            }
                
            else
            {
                            print(errorString!)
                           // self.removeLoader()
                            self.removeSpinner()
                          /*  let finalError = errorString?.components(separatedBy: ":")
                            let alert = ViewControllerManager.displayAlert(message: finalError?[1] ?? "", title:APPLICATIONNAME)
                            self.present(alert, animated: true, completion: nil)*/
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
    
    
    func postTransctn() {
        let benIDValueP = BeneficiaryDetails.shared.benID.replacingOccurrences(of: ",", with: "", options: .literal, range: nil)
        let fcAmntValueP = BeneficiaryDetails.shared.fc.replacingOccurrences(of: ",", with: "", options: .literal, range: nil)
        let lcAmntValueP = BeneficiaryDetails.shared.lc.replacingOccurrences(of: ",", with: "", options: .literal, range: nil)
        let totalLcAmntP = BeneficiaryDetails.shared.netLcAmnt.replacingOccurrences(of: ",", with: "", options: .literal, range: nil)
        let comisionP =  BeneficiaryDetails.shared.commisionAmnt.replacingOccurrences(of: ",", with: "", options: .literal, range: nil)
        let rateP =  BeneficiaryDetails.shared.rate.replacingOccurrences(of: ",", with: "", options: .literal, range: nil)
        
        let fcAmntDecimal = NSDecimalNumber(string: fcAmntValueP)
        let lcAmntDecimal = NSDecimalNumber(string: lcAmntValueP)
        let totalLcAmntDecimal = NSDecimalNumber(string: totalLcAmntP)
        let commisionDecimal = NSDecimalNumber(string: comisionP)
        
        let newRateDecimal = NSDecimalNumber(string: rateP)
        let ipAddress = try? String(contentsOf: URL(string: "https://api.ipify.org")!, encoding: .utf8)
                      // print(ipAddress)
                let newIpAdress = ipAddress ?? ""

        let paramaterPasing: [String:Any] = [
            "registrationId": UserDefaults.standard.string(forKey: "registrationId")!,
            "beneficiaryId": BeneficiaryDetails.shared.beneficiaryId!,
            "beneficiaryType": BeneficiaryDetails.shared.beneficiaryType!,
            "oldTnxRef": BeneficiaryDetails.shared.txnRef!,
            "remID": BeneficiaryDetails.shared.remID!,
            "benID": Int(benIDValueP)!,
            "fcAmount": fcAmntDecimal,
            "lcAmount": lcAmntDecimal,
            "totalLCAmount": totalLcAmntDecimal,
            "commission": commisionDecimal,
            "rate": newRateDecimal,
            "sourceCurrenyCode": BeneficiaryDetails.shared.sourceCurrenyCode ?? "KWD",
            "targetCurrenyCode": BeneficiaryDetails.shared.targetCurencyCode ?? "KWD",
            "distributorRef": "10000000000000000001",
            "getUserDetails": 1,
            "dump": "Y",
            "soi": BeneficiaryDetails.shared.sourceOfIncome!,
            "pot": purposeCode,
            "disbursalMode": BeneficiaryDetails.shared.disbursalMode!,
            "postTransactionType": 1,
            "calcType": BeneficiaryDetails.shared.calcType!,"accountNumber": BeneficiaryDetails.shared.accountNumber ?? "",
            "branchName": BeneficiaryDetails.shared.branchName ?? "",
            "potName": purposeField.text!,
            "loginSource": 3, "IPAddress": newIpAdress]
        
       
      /*    let headers: HTTPHeaders = [
         "Content-Type": "application/json"
         ]*/
        
        let headers: HTTPHeaders = [.authorization(bearerToken: UserDefaults.standard.string(forKey: "token")!)]
        
        NetWorkDataManager.sharedInstance.benefPostTransctnImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            
            if errorString == nil
            {
                self.removeSpinner()
              
               // let mesageCode = resonseTal?.value(forKey: "messageCode") as? String
                let statusMsg = resonseTal?.value(forKey: "statusMessage") as? String
                let mesageCode = resonseTal?.value(forKey: "messageCode") as? String ?? statusMsg
                if let statusCode = resonseTal?.value(forKey: "statusCodes") as? Int {
                 
                    if(statusCode == 200) {
                        
                        Global.shared.navTxtForPayment = self.navHeaderLbl.text
                        
                        BeneficiaryDetails.shared.txnRefNo = resonseTal?.value(forKey: "txnRefNo") as? String
                      let benefPaymentWebViewVc: BenefPaymentWebViewVc = .initiateController()
                      self.pushViewController(controller: benefPaymentWebViewVc)
                      
                        
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
    
    
  /*  func downloadBenefConfig() {
        
        let paramaterPasing: [String:Any] = ["languageCode":LocalizationSystem.sharedInstance.getLanguage()]
        
        
        /*   let headers: HTTPHeaders = [
         "Content-Type": "application/json"
         ]*/
        
        let headers: HTTPHeaders = [.authorization(bearerToken: UserDefaults.standard.string(forKey: "token")!)]
        
        NetWorkDataManager.sharedInstance.benefConfigsImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            
            if errorString == nil
            {
              
                if let identityTypes = resonseTal?.value(forKey: "postTransactionTypes") as? String {
                    let newObj = Global.shared.convertToAryDictionary(text: identityTypes)
                    for dataObj in newObj! {
                        if let name = dataObj["name"] as? String{
                            self.typeNameData.append(name)
                        }
                        if let type = dataObj["value"] as? String{
                            self.typeValueData.append(type)
                        }
                    }
                }
                
                self.transactionType = Int(self.typeValueData[1])
                //   self.removeSpinner()
            }
                
            else
            {
                            print(errorString!)
                           
                            self.removeSpinner()
                        
                            if errorString == "Response could not be serialized, input data was nil or zero length." {
                                let refreshAlert = UIAlertController(title: "", message: Global.shared.sessionTimedOutTxt, preferredStyle: UIAlertController.Style.alert)
                                refreshAlert.view.tintColor = ColorCodes.newAppRed
                                refreshAlert.addAction(UIAlertAction(title: Global.shared.okTxt, style: .default, handler: { (action: UIAlertAction!) in
                                   self.pushViewController(controller: LoginVc.initiateController())
                                }))
                                
                                self.present(refreshAlert, animated: true, completion: nil)
                            }
                            
                            else {
                                let alert = ViewControllerManager.displayAlert(message: errorString ?? "", title:APPLICATIONNAME)
                                self.present(alert, animated: true, completion: nil)
                            }
                           
                            
                        }
                    
        }
        
    }*/
}

extension BenefBankCashNewTransferVc: PopupViewControllerDelegate {
  func didSelectItem<T>(item: T, vc: UIViewController?) {
    guard let item = item as? BeneficiaryPurposeData else {return}
    self.purposeCode = item.value ?? ""
    self.purposeField.text = item.name
    vc?.dismiss(animated: true, completion: nil)
  }
}

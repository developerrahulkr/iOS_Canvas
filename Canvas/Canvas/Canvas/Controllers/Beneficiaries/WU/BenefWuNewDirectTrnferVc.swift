//
//  BenefWuNewDirectTrnferVc.swift
//  Canvas
//
//  Created by urmila reddy on 09/12/20.
//  Copyright © 2020 urmila reddy. All rights reserved.
//

import UIKit
import Alamofire

class BenefWuNewDirectTrnferVc: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var cityLbl: UILabel!
    
    @IBOutlet weak var cityField: UILabel!
    
    
    @IBOutlet weak var stateLbll: UILabel!
    
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
    
    
    //255 // 95
    @IBOutlet weak var heightConstrt: NSLayoutConstraint!
    
    
    @IBOutlet weak var targetCurncyImg: UIImageView!
    
    @IBOutlet weak var rateChargesLbl: UILabel!
    
    
    
    
    var checkMarkClicked:String!
      var checkIconClick = true
    
    
    var purposeNameData = [String]()
    var purposeValueData = [String]()
    var pickerResponseData = [[String: String]]()
  
    var purposeCode = ""
    
    weak var sourceTimer: Timer?
    weak var targetTimer: Timer?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        sendNowBtnOtlt.setTitle(" " + Global.shared.sendNowTxt, for: .normal)
     //   self.showSpinner(onView: self.view)
        secndHideLbl.text = Global.shared.youPauOnlyyTxt
        inrOrOtherCurencyLbl.text = BeneficiaryDetails.shared.targetCurncyFulName
        
        let indexG = Global.shared.countryNameData.firstIndex(of: BeneficiaryDetails.shared.country)

        let countryCodeD = Global.shared.countryCodesData[indexG ?? 0]
                                     //  self.placeOfBirthImg.image = UIImage(named: dropDisplay)
        self.targetCurncyImg.image = UIImage(named:  countryCodeD.lowercased())
   //     targetCurncyImg.image = UIImage(named: BeneficiaryDetails.shared.country)
       sourceField.maxLength = Global.shared.sendLimit
               targetField.maxLength = Global.shared.receiveLimit
        
        iHaveReadAgreeTxt.text = Global.shared.iHaveReadAgreeTxt
        termsConditionBtnOtlt.setTitle(Global.shared.termsConditionBtnTxt, for: .normal)
        
        sourceReqLbl.font = Global.shared.fontReqLbl
        sourceReqLbl.textColor = ColorCodes.newAppRed
        
        targetReqLbl.font = Global.shared.fontReqLbl
        targetReqLbl.textColor = ColorCodes.newAppRed
        
        purposeReqLbl.font = Global.shared.fontReqLbl
        purposeReqLbl.textColor = ColorCodes.newAppRed
        
        if LocalizationSystem.sharedInstance.getLanguage() == "ar" {
            //    if textAlignment == .natural {
            termsConditionBtnOtlt.semanticContentAttribute = .forceRightToLeft
            termsConditionBtnOtlt.contentHorizontalAlignment = .right

            
        }
        
     //   self.showSpinner(onView: self.view)
        // Do any additional setup after loading the view.
        
        rateCalculationLbl.layer.cornerRadius = 15
        rateCalculationLbl.layer.masksToBounds = true
        rateCalculationLbl.layer.backgroundColor = UIColor.clear.cgColor
        
        
        sourceField.delegate = self
        targetField.delegate = self
        
        // handle the editingChanged event by calling (textFieldDidEditingChanged(-:))
        self.sourceField.addTarget(self, action: #selector(sourceTextFieldDidEditingChanged(_:)), for: UIControl.Event.editingChanged)
        self.targetField.addTarget(self, action: #selector(targetTextFieldDidEditingChanged(_:)), for: UIControl.Event.editingChanged)
        
        assigningLabels()
        
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
        
        countryLbl.text = Global.shared.countryb
        curncyLbl.text = Global.shared.currencyb
        
      //  branchValue.text = "MONEY IN MINUTES"
      //  acntValue.text = "SALARY"
        countryField.text = BeneficiaryDetails.shared.countryName
        curncyField.text = BeneficiaryDetails.shared.currency
        
        
        
        purposeLbl.text = Global.shared.remitPurposeTransferTxt + "*"
        
        let firstName = BeneficiaryDetails.shared.firstName +  " " + BeneficiaryDetails.shared.middleName
        
        let lastName = BeneficiaryDetails.shared.lastName ?? ""
        nameLbl.text = firstName + " " + lastName
     //   bankLbl.text = Global.shared.bankNameb ?? ""
       // branchLbl.text = Global.shared.branchNameb ?? ""
      //  branchLbl.text = "Disbursal mode"
        
     //   currencyLbl.text = Global.shared.currencyb ?? ""
         currencyLbl.text = "Country"
       // acntLbl.text = Global.shared.accountNumberb ?? ""
     //   acntLbl.text = "Source of income"
        
        youSendLbl.text = Global.shared.youSendTxt + "*"
               theyReceiveLbl.text = Global.shared.theyReceiveTxt + "*"
        
        sourceReqLbl.text = Global.shared.errorTxtRequired
        targetReqLbl.text = Global.shared.errorTxtRequired
        purposeReqLbl.text = Global.shared.errorTxtRequired
        
        targetCurencyCodeLbl.text = BeneficiaryDetails.shared.currency
     
        countryField.text = BeneficiaryDetails.shared.country ?? ""
        curencyValueLbl.text = BeneficiaryDetails.shared.country ?? ""
        
        stateLbll.isHidden = true
        stateField.isHidden = true
        
        cityLbl.isHidden = true
        cityField.isHidden = true
        
        if BeneficiaryDetails.shared.currency == "USD" {
            stateLbll.isHidden = false
            stateField.isHidden = false
            stateLbll.text = Global.shared.stateb
            stateField.text = BeneficiaryDetails.shared.state
            
        }
        
        if BeneficiaryDetails.shared.currency == "MXN"{
            stateLbll.isHidden = false
            stateField.isHidden = false
            stateLbll.text = Global.shared.stateb
            stateField.text = BeneficiaryDetails.shared.state
            cityLbl.isHidden = false
            cityField.isHidden = false
            cityLbl.text = Global.shared.cityb
            cityField.text = BeneficiaryDetails.shared.city
            
        }
        
     //   acntValue.text = "SALARY"
    
      //  branchValue.text = "MONEY IN MINUTES"
       
      /*  let popOverVC = self.storyboard?.instantiateViewController(withIdentifier: "WuFirstTermsConditions") as! WuFirstTermsConditions
                     self.addChild(popOverVC)
                     popOverVC.view.frame = self.view.frame
                     self.view.addSubview(popOverVC.view)
                     popOverVC.didMove(toParent: self)*/
        
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
            
            postTransctn()
        }
    }
    
    
    func rateSourceCalculator() {
        let amntDecimal = NSDecimalNumber(string: self.sourceField.text?.replacingOccurrences(of: ",", with: "", options: .literal, range: nil) ?? "0.0")
                //   if Int(truncating: amntDecimal) > 0 {
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
            "receiverCountryCode": BeneficiaryDetails.shared.countryCode!,
            "receiverCurrencyCode": targetCurencyCodeLbl.text!,
            "promoCode": ""]
        
        print(paramaterPasing)
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
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
                        
                        let rateeDwn = Double(resonseTal?["conversionRate"] as? String ?? "")
                     /*  let newRateCalcltnDwn = 1/rateeDwn!
                
                        let finalRateCalculatedDwn = newRateCalcltnDwn.rounded(toPlaces: 3)
                        self.rateChargesLbl.text = "Rate: " + String(finalRateCalculatedDwn)*/
                        
                        let finalRateCalculatedDwn = rateeDwn?.rounded(toPlaces: 3)
                        self.rateChargesLbl.text =  Global.shared.benefListRate + ": " + String(finalRateCalculatedDwn ?? 0.0)
                        
                   /*     let receivee = Double(self.targetField.text?.replacingOccurrences(of: ",", with: "", options: .literal, range: nil) ?? "0")
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
                        BeneficiaryDetails.shared.senderFee = resonseTal?.value(forKey: "senderFee") as? String
                        
                        
                        self.targetField.text = resonseTal?.value(forKey: "destinationPrincipalAmount") as? String
                        //     BeneficiaryDetails.shared.sendAmount = resonseTal?.value(forKey: "destinationPrincipalAmount") as? String
                        BeneficiaryDetails.shared.sourceCurrenyCode = self.sourceCurencyCodeLbl.text!
                        BeneficiaryDetails.shared.targetCurencyCode = self.targetCurencyCodeLbl.text!
                        
                        
                        self.feeChargesLbl.text =  Global.shared.benefListCommission + ": " + BeneficiaryDetails.shared.senderFee + " KWD"
                        self.youPayFinalAmntLbl.text =  BeneficiaryDetails.shared.grossTotalAmount + " KWD"
                        
                        self.firstHideView.isHidden = false
                        self.secndHideLbl.isHidden = false
                        self.thirdHideView.isHidden = false
                        
                        self.heightConstrt.constant = 255
                        
                        
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
    
    func rateTargetCalculator(){
        
        let amntDecimal = NSDecimalNumber(string: self.targetField.text?.replacingOccurrences(of: ",", with: "", options: .literal, range: nil) ?? "0.0")
                  
                //  if Int(truncating: amntDecimal) > 0 {
        if Double(truncating: amntDecimal) >= 0.01 {
        self.sourceField.text = ""
        self.showSpinner(onView: self.view)
        calcType = "FC"
        
        let paramaterPasing: [String:Any] = ["sendAmount": amntDecimal,
                                             "conversionType": calcType,
                                             "receiverCountryCode": BeneficiaryDetails.shared.countryCode!,
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
                print(resonseTal!)
             //   let mesageCode = resonseTal?.value(forKey: "messageCode") as? String
                let statusMsg = resonseTal?.value(forKey: "statusMessage") as? String
                if let statusCode = resonseTal?.value(forKey: "statusCodes") as? Int {
                    
                    print(statusCode)
                    if(statusCode == 200) {
                        
                        self.sourceField.text = resonseTal?["originatorsPrincipalAmount"] as? String ?? ""
                        
                   /*     let rateeDwn = Double(resonseTal?["conversionRate"] as? String ?? "")
                        let newRateCalcltnDwn = 1/rateeDwn!
                        let finalRateCalculatedDwn = newRateCalcltnDwn.rounded(toPlaces: 3)
                        self.rateChargesLbl.text = String(finalRateCalculatedDwn)*/
                        
                        let rateeDwn = Double(resonseTal?["conversionRate"] as? String ?? "")
                     /*  let newRateCalcltnDwn = 1/rateeDwn!
                
                        let finalRateCalculatedDwn = newRateCalcltnDwn.rounded(toPlaces: 3)
                        self.rateChargesLbl.text = "Rate: " + String(finalRateCalculatedDwn)*/
                        
                        let finalRateCalculatedDwn = rateeDwn?.rounded(toPlaces: 3)
                        self.rateChargesLbl.text =  Global.shared.benefListRate + ": " + String(finalRateCalculatedDwn ?? 0.0)
                        
                        /*    let receivee = Double(self.targetField.text?.replacingOccurrences(of: ",", with: "", options: .literal, range: nil) ?? "0")
                         let sendd = Double(self.sourceField.text?.replacingOccurrences(of: ",", with: "", options: .literal, range: nil) ?? "0")
                         
                         let rateCalcltn = receivee!/sendd!
                         let finalRateCalculated = rateCalcltn.rounded(toPlaces: 3)*/
                        
                        let ratee = Double(resonseTal?["conversionRate"] as? String ?? "")
                        let finalRateCalculated = ratee!.rounded(toPlaces: 3)
                        
                        let finalTxt = "1 KWD = " + String(finalRateCalculated) + " " + self.targetCurencyCodeLbl.text!
                        self.rateCalculationLbl.text = finalTxt
                        self.rateCalculationLbl.isHidden = false
                        
                        
                        BeneficiaryDetails.shared.conversionRate = resonseTal?.value(forKey: "conversionRate") as? String
                        
                        
                    //    BeneficiaryDetails.shared.destinationPrincipalAmount = resonseTal?.value(forKey: "destinationPrincipalAmount") as? String
                        
                        BeneficiaryDetails.shared.originatorsPrincipalAmount = resonseTal?.value(forKey: "destinationPrincipalAmount") as? String
                        
                    //    BeneficiaryDetails.shared.originatorsPrincipalAmount = resonseTal?.value(forKey: "originatorsPrincipalAmount") as? String
                        
                        BeneficiaryDetails.shared.destinationPrincipalAmount = resonseTal?.value(forKey: "originatorsPrincipalAmount") as? String
                        
                        
                        BeneficiaryDetails.shared.grossTotalAmount = resonseTal?.value(forKey: "grossTotalAmount") as? String
                        
                       
                        BeneficiaryDetails.shared.senderFee = resonseTal?.value(forKey: "senderFee") as? String
                        
                        
                        self.sourceField.text = resonseTal?.value(forKey: "originatorsPrincipalAmount") as? String
                        //           BeneficiaryDetails.shared.sendAmount = resonseTal?.value(forKey: "originatorsPrincipalAmount") as? String
                        //  BeneficiaryDetails.shared.targetCurencyCode = self.targetField.text!
                        BeneficiaryDetails.shared.sourceCurrenyCode = self.sourceCurencyCodeLbl.text!
                        BeneficiaryDetails.shared.targetCurencyCode = self.targetCurencyCodeLbl.text!
                        
                        self.feeChargesLbl.text =  Global.shared.benefListCommission + ": " + BeneficiaryDetails.shared.senderFee + " KWD"
                        self.youPayFinalAmntLbl.text =  BeneficiaryDetails.shared.grossTotalAmount + " KWD"
                        
                        self.firstHideView.isHidden = false
                        self.secndHideLbl.isHidden = false
                        self.thirdHideView.isHidden = false
                        
                        self.heightConstrt.constant = 255
                        
                        
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
    
 /*   func textFieldDidEndEditing(_ textField: UITextField) {
        
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
                               //return true
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
        guard BeneficiaryDetails.shared.purposeList.count > 0 else {return}
      let popupVc = PopupViewController.showPopup(parentVC: self, data: BeneficiaryDetails.shared.purposeList)
        popupVc?.setListData(with: .purposeScreen, data: BeneficiaryDetails.shared.purposeList)
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
    
    // Mark: when hit on send button
    func postTransctn() {
        let sendAmountP = BeneficiaryDetails.shared.originatorsPrincipalAmount!.replacingOccurrences(of: ",", with: "", options: .literal, range: nil)
        let conversionRateP = BeneficiaryDetails.shared.conversionRate!.replacingOccurrences(of: ",", with: "", options: .literal, range: nil)
        let receiveAmountP = BeneficiaryDetails.shared.destinationPrincipalAmount!.replacingOccurrences(of: ",", with: "", options: .literal, range: nil)
        let senderFeeP = BeneficiaryDetails.shared.senderFee!.replacingOccurrences(of: ",", with: "", options: .literal, range: nil)
        let grossTotalAmountP = BeneficiaryDetails.shared.grossTotalAmount!.replacingOccurrences(of: ",", with: "", options: .literal, range: nil)
        
        let ipAddress = try? String(contentsOf: URL(string: "https://api.ipify.org")!, encoding: .utf8)
                     // print(ipAddress)
               let newIpAdress = ipAddress ?? ""
        
       let paramaterPasing: [String:Any] = [
            
            "registrationId": UserDefaults.standard.string(forKey: "registrationId")!,
            "beneficiaryId": 0,
            "beneficiaryType": 102,
            "remID":  "",
            "oldTnxRef":  "0",
            "remitterId": "",
            "remitterCard": "",
            "remitterIdType": "CI",
            "sendAmount":  Double(sendAmountP) ?? 0.0,
            "conversionRate": Double(conversionRateP) ?? 0.0,
            "receiveAmount": Double(receiveAmountP) ?? 0.0,
            "senderFee": Double(senderFeeP) ?? 0.0,
            "grossTotalAmount": Double(grossTotalAmountP) ?? 0.0,
            "receiverCountryCode": BeneficiaryDetails.shared.countryCode!,
            "receiverState": BeneficiaryDetails.shared.state!,
            "receiverStateCode": BeneficiaryDetails.shared.stateCode ?? "",
            "receiverCity": BeneficiaryDetails.shared.city!,
            "receiverCurrency_code": BeneficiaryDetails.shared.currency!,
            "receiverFirstName": BeneficiaryDetails.shared.firstName!,
            "receiverMiddleName": BeneficiaryDetails.shared.middleName!,
            "receiverLastName": BeneficiaryDetails.shared.lastName!,
            "purposeOfTransfer": purposeCode,
            "conversionType": BeneficiaryDetails.shared.calcType!,
            "sourceOfIncome": "SAL",
            "occupation": "",
            "promoCode": "",
            "postTransactionType": 2,
        "isNewBeneficiary": true,
        "loginSource": 3,
        "potName": purposeField.text!,
        "BeneficiaryImage": BeneficiaryDetails.shared.westernUnionProfileImg, "IPAddress": newIpAdress
        ]
        
        
        /*  let headers: HTTPHeaders = [
         "Content-Type": "application/json"
         ]*/
        
        let headers: HTTPHeaders = [.authorization(bearerToken: UserDefaults.standard.string(forKey: "token")!)]
        
        NetWorkDataManager.sharedInstance.benefWuPostTransctnImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            
            if errorString == nil
            {
                
                print(resonseTal!)
                
                self.removeSpinner()
                let statusMsg = resonseTal?.value(forKey: "statusMessage") as? String
                let mesageCode = resonseTal?.value(forKey: "messageCode") as? String
                if let statusCode = resonseTal?.value(forKey: "statusCodes") as? Int {
                    
                    print(statusCode)
                    if(statusCode == 200) {
                        // self.navigationController?.popViewController(animated: true)
                        
                        
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

extension BenefWuNewDirectTrnferVc: PopupViewControllerDelegate {
  func didSelectItem<T>(item: T, vc: UIViewController?) {
    guard let item = item as? BeneficiaryPurposeData else {return}
    self.purposeCode = item.value ?? ""
    self.purposeField.text = item.name
    vc?.dismiss(animated: true, completion: nil)
  }
}

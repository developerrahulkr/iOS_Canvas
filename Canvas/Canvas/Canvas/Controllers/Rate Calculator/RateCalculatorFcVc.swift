//
//  RateCalculatorFcVc.swift
//  Canvas
//
//  Created by urmila reddy on 04/01/21.
//  Copyright © 2021 urmila reddy. All rights reserved.
//

import UIKit
import Alamofire

class RateCalculatorFcVc: UIViewController, UITextFieldDelegate, UIDropDownCurrencyDelegateM  {
    
    @IBOutlet weak var indicativeRateLbl: UILabel!
    
    @IBOutlet weak var youSendLabel: UILabel!
    @IBOutlet weak var theyReceiveLbl: UILabel!
    
    @IBOutlet weak var sourceField: UITextField!
    @IBOutlet weak var targetField: UITextField!
    
    //
    @IBOutlet weak var sourceCurency: UILabel!
    @IBOutlet weak var targetCurency: UILabel!
    
    @IBOutlet weak var sourceCurncyImg: UIImageView!
    @IBOutlet weak var targetCurncyImg: UIImageView!
    
    
    //
    @IBOutlet weak var sourceCurncyNameLbl: UILabel!
    @IBOutlet weak var targetCurncyNameLbl: UILabel!
    
    @IBOutlet weak var sendReqLbl: UILabel!
    @IBOutlet weak var receiveReqLbl: UILabel!
    
    
    @IBOutlet weak var rateCalculationLbl: UILabel!
    
    weak var sourceTimer: Timer?
    weak var targetTimer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        // Do any additional setup after loading the view.
        indicativeRateLbl.text = "   " + Global.shared.indicativeRatesTxt
        
        sourceCurncyNameLbl.text = "KUWAITI DINAR"
        targetCurncyNameLbl.text = "INDIAN RUPEES"
        
        rateCalculationLbl.layer.cornerRadius = 15
        rateCalculationLbl.layer.masksToBounds = true
        rateCalculationLbl.layer.backgroundColor = UIColor.clear.cgColor
        
        sourceField.maxLength = Global.shared.sendLimit
        targetField.maxLength = Global.shared.receiveLimit
        
        youSendLabel.text =  Global.shared.localCurncyTxt
        theyReceiveLbl.text = Global.shared.foreignLcCurncyTxt
        
        sourceField.delegate = self
        targetField.delegate = self
        
        targetField.isUserInteractionEnabled = false
        
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
        rateCalculator()
        
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
        
        rateCalculatorThey()
        
    }
    @IBAction func targetCurncyDrpDwn(_ sender: Any) {
        Global.shared.fromWuBankCashRate = "Any"
        Global.shared.fcSourceOrTarget = "target"
        Global.shared.countris = Country.getCountries(Global.shared.countrisAllFc)
        let popOverVC = self.storyboard?.instantiateViewController(withIdentifier: "CurrencyDrpDwnSearch") as! CurrencyDrpDwnSearch
        self.addChild(popOverVC)
        popOverVC.delegate = self
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParent: self)
    }
    
    
    @IBAction func sourceCurncyDrpDwn(_ sender: Any) {
        Global.shared.fromWuBankCashRate = "Any"
        Global.shared.fcSourceOrTarget = "source"
        Global.shared.countris = Country.getCountries(Global.shared.countrisAllFc)
        let popOverVC = self.storyboard?.instantiateViewController(withIdentifier: "CurrencyDrpDwnSearch") as! CurrencyDrpDwnSearch
        self.addChild(popOverVC)
        popOverVC.delegate = self
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParent: self)
    }
    
    
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
        }
        
        
        return true
        
    }
    
    // Mark: Claculating the rate
    func rateCalculator() {
        
        let amntDecimal = NSDecimalNumber(string: self.sourceField.text?.replacingOccurrences(of: ",", with: "", options: .literal, range: nil) ?? "0.0")
        
        //  if Int(truncating: amntDecimal) > 0 {
        if Double(truncating: amntDecimal) >= 0.01 {
            self.showSpinner(onView: self.view)
            let paramaterPasing: [String:Any] = [
                "sourceCurrenyCode": sourceCurency.text ?? "",
                "targetCurrenyCode": targetCurency.text ?? "",
                "amount": amntDecimal,
                "branchCode": ""
            ]
            
            print(paramaterPasing)
            let headers: HTTPHeaders = [
                "Content-Type": "application/json"
            ]
            
            //       let headers: HTTPHeaders = [.authorization(bearerToken: UserDefaults.standard.string(forKey: "token")!)]
            
            NetWorkDataManager.sharedInstance.fcRateCalculatorImplementation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
                
                if errorString == nil
                {
                    
                    self.removeSpinner()
                    print(resonseTal!)
                    let statusMsg = resonseTal?.value(forKey: "statusMessage") as? String ?? ""
                    let mesageCode = resonseTal?.value(forKey: "messageCode") as? String ?? statusMsg
                    if let statusCode = resonseTal?.value(forKey: "statusCodes") as? Int {
                        if statusCode == 200 {
                            
                            self.targetField.text = resonseTal?["amount2"] as? String ?? ""
                            
                            let ratee = resonseTal?["rate"] as? String ?? ""
                            let finalTxt = "1 " + self.targetCurency.text! + " = " +  ratee + " " + self.sourceCurency.text!
                            self.rateCalculationLbl.text = finalTxt
                            self.rateCalculationLbl.isHidden = false
                            
                        }
                        else {
                            let alert = ViewControllerManager.displayAlert(message:Global.shared.messageCodeType(text: mesageCode), title:APPLICATIONNAME)
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
        
    }
    
    
    // Mark: Calculating the rate when entered in target field
    func rateCalculatorThey() {
        
        let amntDecimal = NSDecimalNumber(string: self.targetField.text?.replacingOccurrences(of: ",", with: "", options: .literal, range: nil) ?? "0.0")
        //  if Int(truncating: amntDecimal) > 0 {
        if Double(truncating: amntDecimal) >= 0.01 {
            self.showSpinner(onView: self.view)
            let paramaterPasing: [String:Any] = [
                
                "sourceCurrenyCode": targetCurency.text ?? "",
                "targetCurrenyCode": sourceCurency.text ?? "",
                "amount": amntDecimal,
                "branchCode": ""
            ]
            
            print(paramaterPasing)
            let headers: HTTPHeaders = [
                "Content-Type": "application/json"
            ]
            
            /*    let headers: HTTPHeaders = [.authorization(bearerToken: UserDefaults.standard.string(forKey: "token")!)]*/
            
            NetWorkDataManager.sharedInstance.fcRateCalculatorImplementation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
                
                if errorString == nil
                {
                    
                    self.removeSpinner()
                    
                    print(resonseTal!)
                    let statusMsg = resonseTal?.value(forKey: "statusMessage") as? String ?? ""
                    let mesageCode = resonseTal?.value(forKey: "messageCode") as? String ?? statusMsg
                    if let statusCode = resonseTal?.value(forKey: "statusCodes") as? Int {
                        if statusCode == 200 {
                            
                            self.sourceField.text = resonseTal?["amount2"] as? String ?? ""
                            let ratee = resonseTal?["rate"] as? String ?? ""
                            
                            let finalTxt = "1 " + self.targetCurency.text! + " = " +  ratee + " " + self.sourceCurency.text!
                            self.rateCalculationLbl.text = finalTxt
                            self.rateCalculationLbl.isHidden = false
                            
                        }
                        else {
                            let alert = ViewControllerManager.displayAlert(message:Global.shared.messageCodeType(text: mesageCode), title:APPLICATIONNAME)
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
    }
    
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        Global.shared.fromWuBankCashRate = "Any"
        Global.shared.countris = Country.getCountries(Global.shared.countrisAllFc)
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func didSelectedCountry(country: Country) {
        
        if   Global.shared.fcSourceOrTarget == "source" {
            self.sourceCurncyNameLbl.text = country.currencyFulName
            
            self.sourceCurncyImg.image = UIImage(named: country.countryCode?.lowercased() ?? "")
            self.sourceCurency.text = country.currencyCode
            //   self.targetCountryCode = country.countryCode
            
            if sourceField.text == "" && targetField.text == "" {
                print("no action")
            }
            
            else if sourceField.text == "" {
                rateCalculatorThey()
            }
            else if targetField.text == ""{
                rateCalculator()
            }
            else  if sourceField.text != nil {
                rateCalculator()
            }
            else {
                print("no action")
            }
        }
        
        else {
            self.targetCurncyNameLbl.text = country.currencyFulName
            
            self.targetCurncyImg.image = UIImage(named: country.countryCode?.lowercased() ?? "")
            self.targetCurency.text = country.currencyCode
            //   self.targetCountryCode = country.countryCode
            
            if sourceField.text == "" && targetField.text == "" {
                print("no action")
            }
            
            else if sourceField.text == "" {
                rateCalculatorThey()
            }
            else if targetField.text == ""{
                rateCalculator()
            }
            else  if sourceField.text != nil {
                rateCalculator()
            }
            else {
                print("no action")
            }
            
        }
        
    }
}

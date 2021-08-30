//
//  RateCalculatorVc.swift
//  Canvas
//
//  Created by urmila reddy on 26/08/20.
//  Copyright © 2020 urmila reddy. All rights reserved.
//

import UIKit
import Alamofire

class RateCalculatorVc: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
   // @IBOutlet weak var rateCalculatorHeader: UILabel!
    
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var redMainView: UIView!
    
    @IBOutlet weak var redSubView: UIView!
    
    @IBOutlet weak var youSendLbl: UILabel!
    
    @IBOutlet weak var youSendField: UITextField!
    @IBOutlet weak var theyReceiveLbl: UILabel!
    
    @IBOutlet weak var theyReceiveField: UITextField!
    
    @IBOutlet weak var kwdBtnOtlt: UIButton!
    
    @IBOutlet weak var currencyBtnOtlt: UIButton!
    
    @IBOutlet weak var convertBtnOtlt: UIButton!
    
    @IBOutlet weak var firstView: UIView!
    
    @IBOutlet weak var secndView: UIView!
    
    @IBOutlet weak var transctnSummaryLbl: UILabel!
    
    @IBOutlet weak var lcAmntField: UITextField!
    
    @IBOutlet weak var rateField: UITextField!
    
    @IBOutlet weak var fcAmntField: UITextField!
    
    
    var countryCodeSelected = ""
    
    var countryNameData = [String]()
    var currencyData = [String]()
    var pickerResponseData = [[String: String]]()
    
    var curencyCode = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redMainView.cornerRadius = 10
        redSubView.cornerRadius = 10
        
        firstView.cornerRadius = 5
        secndView.cornerRadius = 5
        convertBtnOtlt.cornerRadius = 5
        
        downloadAccountConfig()
        
        
        // Do any additional setup after loading the view.
        assigningLabels()
    }
    
    func assigningLabels() {
     //   rateCalculatorHeader.text = Global.shared.rateCalculatorHeader
        youSendLbl.text = Global.shared.youSendTxt
        theyReceiveLbl.text = Global.shared.theyReceiveTxt
        convertBtnOtlt.setTitle(Global.shared.convertTxt, for: .normal)
        transctnSummaryLbl.text = Global.shared.transctnSumary
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    
    @IBAction func backBtnActn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func convertBtnActn(_ sender: Any) {
        if currencyBtnOtlt.titleLabel?.text == "" || youSendField.text == "" {
            
        }
        else {
            rateCalculator()
        }
    }
    
    @IBAction func countryDrpDwnActn(_ sender: Any) {
        let pickerData = self.pickerResponseData
        PickerDialog().show(title: "", options: pickerData , selected: "") {
            (value) -> Void in
            //      self.civilIdAnswerLbl.text = "\(value)"
            //    self.identityTypeReqLbl.isHidden = true
            //   self.countryCodeSelected = "\(value)"
            let indexS = self.currencyData.firstIndex(of: "\(value)")
            self.theyReceiveField.text = self.countryNameData[indexS ?? 0]
            self.currencyBtnOtlt.setTitle("\(value)", for: .normal)
            self.curencyCode = "\(value)"
            
            //   self.countryReqLbl.isHidden = true
            //    self.currencyReqLbl.isHidden = true
            
        }
    }
    
    func downloadAccountConfig() {
        
        let paramaterPasing: [String:Any] = ["languageCode":LocalizationSystem.sharedInstance.getLanguage()]
        
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        NetWorkDataManager.sharedInstance.accountConfigsImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            
            if errorString == nil
            {
                
                print(resonseTal!)
                if let countries = resonseTal?.value(forKey: "allCountries") as? NSArray {
                    print(countries)
                    if let countryName = countries.value(forKey: "countryName") as? [String] {
                        self.countryNameData = countryName
                    }
                    
                    if let currency = countries.value(forKey: "countryCurrency") as? [String] {
                        print(currency)
                        self.currencyData = currency
                    }
                    
                    for i in 0..<self.countryNameData.count {
                        self.pickerResponseData.append(["value": self.currencyData[i], "display": self.countryNameData[i]])
                    }
                    
                    
                }
                print(self.pickerResponseData)
                
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
    
    func rateCalculator() {
        
        let paramaterPasing: [String:Any] = [
            "currenyCode": currencyBtnOtlt.titleLabel?.text ?? "",
            "amount": Int(youSendField.text ?? "0") ?? 0,
            "calcType": "FC",
            "branchCode": ""
        ]
        
        print(paramaterPasing)
      /*  let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]*/
        
        let headers: HTTPHeaders = [.authorization(bearerToken: UserDefaults.standard.string(forKey: "token")!)]
        
        NetWorkDataManager.sharedInstance.ttRateCalculatorImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            
            if errorString == nil
            {
                
                print(resonseTal!)
                let statusMsg = resonseTal?.value(forKey: "statusMessage") as? String ?? ""
            let mesageCode = resonseTal?.value(forKey: "messageCode") as? String ?? statusMsg
                if let statusCode = resonseTal?.value(forKey: "statusCodes") as? Int {
                    if statusCode == 200 {
                        
                        self.redMainView.isHidden = false
                        self.redSubView.isHidden = false
                        self.lcAmntField.text = (resonseTal?["lcAmount"] as? String ?? "") + " " + self.curencyCode
                        self.rateField.text = (resonseTal?["rate"] as? String ?? "") + " " + self.curencyCode
                        self.fcAmntField.text = (resonseTal?["fcAmount"] as? String ?? "") + " " + self.curencyCode
                        
                        
                        
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

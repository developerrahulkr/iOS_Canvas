//
//  RateAlertVc.swift
//  Canvas
//
//  Created by urmila reddy on 12/10/20.
//  Copyright © 2020 urmila reddy. All rights reserved.
//

import UIKit
import Alamofire

class RateAlertVc: UIViewController, UITableViewDataSource,
UITableViewDelegate, UIDropDownCurrencyDelegateM, UITextFieldDelegate {
   
    @IBOutlet weak var curncyTitleLbl: UILabel!
    
    @IBOutlet weak var thresholdTitleLbl: UILabel!
     @IBOutlet weak var headerLbl: UILabel!
    
    @IBOutlet weak var firstView: UIView!
    
    @IBOutlet weak var drpView: UIView!
    
    @IBOutlet weak var targetCurencyLbl: UILabel!
    
    @IBOutlet weak var targetCurncyField: UITextField!
    
    @IBOutlet weak var targetReqLbl: UILabel!
    
    @IBOutlet weak var thresholdView: UIView!
    
    @IBOutlet weak var thresholdLbl: UILabel!
    
    @IBOutlet weak var thresholdField: CustomTextField!
    
    @IBOutlet weak var thresholdReqLbl: UILabel!
    
    @IBOutlet weak var saveBtnOtlt: UIButton!
    
    @IBOutlet weak var rateTbleView: UITableView!
    
    @IBOutlet weak var cancelBtnOtlt: UIButton!
    
    
    var targetCurencyTxt = ""
    var thresholdResponse = [Any]()
    var rateAlertId = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        targetReqLbl.font = Global.shared.fontReqLbl
        targetReqLbl.textColor = ColorCodes.newAppRed
        
        thresholdReqLbl.font = Global.shared.fontReqLbl
        thresholdReqLbl.textColor = ColorCodes.newAppRed
        
        
        
        
        thresholdField.delegate = self
        rateTbleView.rowHeight = 51
        DispatchQueue.main.async {
            self.downloadThresholdData()
        }
        assigingLabels()
    }
    func assigingLabels() {
        headerLbl.text = Global.shared.menuRateAlert
        thresholdTitleLbl.text = Global.shared.onlyThresholdTxt
        curncyTitleLbl.text = Global.shared.currencyb
        saveBtnOtlt.setTitle(Global.shared.saveTxt, for: .normal)
        targetCurencyLbl.text = Global.shared.transactionsTargetCurrency
        thresholdLbl.text = Global.shared.thresholdValueTxt
        cancelBtnOtlt.setTitle(Global.shared.cancelTxt, for: .normal)
        
        targetReqLbl.text = Global.shared.transactionsTargetCurrency + " " + Global.shared.errorTxtRequired
        thresholdReqLbl.text = Global.shared.thresholdValueTxt + " " + Global.shared.errorTxtRequired
    }
    
    @IBAction func bckBtnActn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func drpBtnActn(_ sender: Any) {
      
      
        //below to enable while filtering currencies
        
     /*   let popOverVC = self.storyboard?.instantiateViewController(withIdentifier: "CurrencyDrpDwnSearch") as! CurrencyDrpDwnSearch
        popOverVC.popupViewControllerType = .currency
        self.addChild(popOverVC)
        popOverVC.delegate = self
       
        popOverVC.view.frame = self.view.frame
       
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParent: self)
        popOverVC.currencyHandler = { [weak self ]currency in
            guard let self = self else {return}
            self.targetCurncyField.text = currency
                    self.targetReqLbl.isHidden = true
            }*/
        Global.shared.countris = Country.getCountries(Global.shared.countrisAllRate)
        let popOverVC = self.storyboard?.instantiateViewController(withIdentifier: "CurrencyDrpDwnSearch") as! CurrencyDrpDwnSearch
                                    self.addChild(popOverVC)
                                    popOverVC.delegate = self
                                    popOverVC.view.frame = self.view.frame
                                    self.view.addSubview(popOverVC.view)
                                    popOverVC.didMove(toParent: self)
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == thresholdField {
            thresholdReqLbl.isHidden = true
            if (thresholdField.text?.contains("."))! && string == "." {
                
                return false
                
            }
            
            if (thresholdField.text?.contains("."))! {
                if thresholdField.text?.components(separatedBy: ".")[1].count == 3 {
                    
                    if string == "." || string == "1" || string ==  "2" || string ==  "3" || string ==  "4" || string ==  "5" ||  string == "6" ||  string == "7" || string ==  "8" || string ==  "9" || string ==  "0" {
                        return false
                        
                    }
                    else {
                        return true
                    }
                  //  return true
                }
            }
            
       
        }
        return true
    }
    
    func didSelectedCountry(country: Country) {
        let curncyCode = country.currencyCode ?? ""
        let curencyName = country.currencyFulName ?? ""
        let finalTxt = curncyCode + " - " + curencyName
        self.targetCurncyField.text = finalTxt
        self.targetCurencyTxt = country.currencyCode ?? ""
                self.targetReqLbl.isHidden = true
                
        }
    
    @IBAction func saveBtnActn(_ sender: Any) {
        if targetCurncyField.text == "" {
            targetReqLbl.isHidden = false
        }
        else if thresholdField.text == "" {
            thresholdReqLbl.isHidden = false
        }
        
      else  if drpView.isUserInteractionEnabled == false {
            saveThresholdEditData()
        }
        else {
            saveThresholdData()
        }
        
    }
    
    func saveThresholdData() {
        
        let paramaterPasing: [String:Any] = [
            "registrationId": UserDefaults.standard.string(forKey: "registrationId")!,"targetCurrenyCode": targetCurencyTxt,
            "amount": Double(thresholdField.text!) ?? 0
        ]
        
        print(paramaterPasing)
     /*   let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]*/
        
        let headers: HTTPHeaders = [.authorization(bearerToken: UserDefaults.standard.string(forKey: "token")!)]
        
        NetWorkDataManager.sharedInstance.addRateAlertImplementation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            
            if errorString == nil
            {
                
                print(resonseTal!)
                
                let statusMsg = resonseTal?.value(forKey: "statusMessage") as? String ?? ""
            let mesageCode = resonseTal?.value(forKey: "messageCode") as? String ?? statusMsg
                if let statusCode = resonseTal?.value(forKey: "statusCodes") as? Int {
                    
                    if(statusCode == 200) {
                        
                        let alert6 = UIAlertController(
                            title: "",
                            message: Global.shared.messageCodeType(text: mesageCode),
                            preferredStyle: UIAlertController.Style.alert)
                        
                        
                        
                        let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                            //   self.downloadThresholdData()
                            self.viewDidLoad()
                            self.thresholdField.text = ""
                            self.targetCurncyField.text = ""
                            self.targetCurencyTxt = ""
                        }
                        
                        alert6.addAction(OKAction)
                        self.present(alert6, animated: true, completion: nil)
                        
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
    
    // Mark: Saving threshold data
    func saveThresholdEditData() {
        
        let paramaterPasing: [String:Any] = [
            "registrationId": UserDefaults.standard.string(forKey: "registrationId")!,"targetCurrenyCode": targetCurencyTxt,
            "amount": Double(thresholdField.text!) ?? 0,"rateAlertId": self.rateAlertId
        ]
        
        print(paramaterPasing)
       /* let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]*/
        
        let headers: HTTPHeaders = [.authorization(bearerToken: UserDefaults.standard.string(forKey: "token")!)]
        
        NetWorkDataManager.sharedInstance.addRateAlertImplementation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            
            if errorString == nil
            {
                
                print(resonseTal!)
                
                let statusMsg = resonseTal?.value(forKey: "statusMessage") as? String ?? ""
            let mesageCode = resonseTal?.value(forKey: "messageCode") as? String ?? statusMsg
                if let statusCode = resonseTal?.value(forKey: "statusCodes") as? Int {
                    
                    if(statusCode == 200) {
                        
                        let alert6 = UIAlertController(
                            title: "",
                            message: Global.shared.messageCodeType(text: mesageCode),
                            preferredStyle: UIAlertController.Style.alert)
                        
                        
                        
                        let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                            //   self.downloadThresholdData()
                            self.viewDidLoad()
                             self.drpView.isUserInteractionEnabled = true
                            self.thresholdField.text = ""
                            self.targetCurncyField.text = ""
                            self.targetCurencyTxt = ""
                        }
                        
                        alert6.addAction(OKAction)
                        self.present(alert6, animated: true, completion: nil)
                        
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
    
    // Mark: getting threshold data
    func downloadThresholdData() {
        self.thresholdResponse.removeAll()
        let paramaterPasing: [String:Any] = [
            "registrationId": UserDefaults.standard.string(forKey: "registrationId")!
        ]
        
        
     /*   let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]*/
        
        let headers: HTTPHeaders = [.authorization(bearerToken: UserDefaults.standard.string(forKey: "token")!)]

        
        NetWorkDataManager.sharedInstance.getRateAlertsImplementation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            
            if errorString == nil
            {
                
                print(resonseTal!)
                if let rateAlertsList = resonseTal?.value(forKey: "rateAlertsList") as? NSArray {
                    print(rateAlertsList)
                    self.thresholdResponse = rateAlertsList as! [Any]
                }
                self.rateTbleView.reloadData()
                
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.thresholdResponse.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = rateTbleView.dequeueReusableCell(withIdentifier: "RateAlertsCell")! as! RateAlertsCell
        let eachObj = self.thresholdResponse[indexPath.row] as?NSDictionary
        
        cell.curencyLbl.text = eachObj?.value(forKey: "targetCurrenyCode") as? String ?? ""
        cell.thresholdLbl.text = "\(eachObj?.value(forKey: "amount") as? Double ?? 0.0)"
        
        cell.deleteBtnOtlt.addTarget(self, action: #selector(deleteActnn(sender:)), for: .touchUpInside)
        cell.editBtnOtlt.addTarget(self, action: #selector(editActnn(sender:)), for: .touchUpInside)
        
        cell.deleteBtnOtlt.params["rateAlertId"] = eachObj?.value(forKey: "rateAlertId") as? Int ?? 0
        
        cell.editBtnOtlt.params["targetCurrenyCode"] = eachObj?.value(forKey: "targetCurrenyCode") as? String ?? ""
        cell.editBtnOtlt.params["amount"] = eachObj?.value(forKey: "amount") as? Double ?? 0
        cell.editBtnOtlt.params["rateAlertId"] = eachObj?.value(forKey: "rateAlertId") as? Int ?? 0
        
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        
        return cell
    }
    
    // Mark: editing rate
    @objc func editActnn(sender: PassableUIButton){
         
        let dropDisplay = sender.params["targetCurrenyCode"] as? String ?? ""
        let indexS = Global.shared.currencyCodesData.firstIndex(of: dropDisplay)
      let curencyName = Global.shared.currencyNameData[indexS ?? 0]
        let finalTxt = dropDisplay + " - " + curencyName
        self.targetCurncyField.text = finalTxt
        
        
        self.targetCurencyTxt = sender.params["targetCurrenyCode"] as? String ?? ""
        let amnt = sender.params["amount"] as? Double
        self.thresholdField.text = "\(amnt ?? 0)"
        self.rateAlertId = sender.params["rateAlertId"] as? Int ?? 0
        self.drpView.isUserInteractionEnabled = false
        
        
    }
    
    // Mark: Deleting rate
    @objc func deleteActnn(sender: PassableUIButton){
        let refreshAlert = UIAlertController(title: "", message: "Are you sure want to delete", preferredStyle: UIAlertController.Style.alert)
        
        refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
            
            
            let rateAlertId = sender.params["rateAlertId"] ?? 0
                   print(rateAlertId)
                   
                   let paramaterPasing: [String:Any] = [
                       "registrationId": UserDefaults.standard.string(forKey: "registrationId")!,
                       "rateAlertId": rateAlertId
                   ]
                   
                   print(paramaterPasing)
                /*   let headers: HTTPHeaders = [
                       "Content-Type": "application/json"
                   ]*/
                   
                   let headers: HTTPHeaders = [.authorization(bearerToken: UserDefaults.standard.string(forKey: "token")!)]

                   
                   NetWorkDataManager.sharedInstance.deleteRateAlertImplementation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
                       
                       if errorString == nil
                       {
                           print(resonseTal!)
                        let statusMsg = resonseTal?.value(forKey: "statusMessage") as? String ?? ""
                    let mesageCode = resonseTal?.value(forKey: "messageCode") as? String ?? statusMsg
                           
                           if let statusCode = resonseTal?.value(forKey: "statusCodes") as? Int {
                               
                               print(statusCode)
                               if(statusCode == 200) {
                                let alert = ViewControllerManager.displayAlert(message: "Deleted Successfully", title:APPLICATIONNAME)
                                self.present(alert, animated: true, completion: nil)
                                   self.viewDidLoad()
                                   
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
            
           
        }))
        
        refreshAlert.addAction(UIAlertAction(title: Global.shared.cancelTxt, style: .cancel, handler: { (action: UIAlertAction!) in
            print("Handle Cancel Logic here")
            //   refreshAlert.dismiss(animated: true, completion: nil)
            
        }))
        
        present(refreshAlert, animated: true, completion: nil)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @IBAction func cancelBtnActn(_ sender: Any) {
        self.drpView.isUserInteractionEnabled = true
        self.thresholdField.text = ""
        self.targetCurncyField.text = ""
        self.targetCurencyTxt = ""
        viewDidLoad()
    }
    
    @IBAction func languageChangeActn(_ sender: Any) {
        Global.shared.languageChangeActn()
    }
    
}

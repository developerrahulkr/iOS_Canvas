//
//  FeedbackVc.swift
//  Canvas
//
//  Created by urmila reddy on 28/09/20.
//  Copyright © 2020 urmila reddy. All rights reserved.
//

import UIKit
import Alamofire

class FeedbackVc: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var headerLbl: UILabel!
    
    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var mobileLbl: UILabel!
    
    @IBOutlet weak var drpView: UIView!
    
    @IBOutlet weak var drpTxtLbl: UILabel!
    
    @IBOutlet weak var drpField: UITextField!
    
    @IBOutlet weak var feedBackView: UIView!
    
    @IBOutlet weak var feedbckLbl: UILabel!
    
    @IBOutlet weak var feedbackField: UITextView!
    
    
    @IBOutlet weak var clearBtnOtlt: UIButton!
    
    @IBOutlet weak var submitBtnOtlt: UIButton!
    
    @IBOutlet weak var drpErrorTxt: UILabel!
    
    @IBOutlet weak var ffedbckErrorTxt: UILabel!
    
    var feedbackNameData = [String]()
    var feedbackValueData = [String]()
    var pickerfeedbackTypes = [[String: String]]()
    
    var feedBckType = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        feedbackField.delegate = self
        nameLbl.layer.cornerRadius = 5
        mobileLbl.layer.cornerRadius = 5
        drpView.layer.cornerRadius = 5
        feedBackView.layer.cornerRadius = 5
        clearBtnOtlt.layer.cornerRadius = 5
        submitBtnOtlt.layer.cornerRadius = 5
        
        
        self.nameLbl.text = UserDefaults.standard.string(forKey: "displayName")!
        self.mobileLbl.text = UserDefaults.standard.string(forKey: "displayMobile")!
        downloadProfileConfig()
        assigningLabels()
    }
    
    func assigningLabels() {
        drpErrorTxt.text = Global.shared.errorTxtRequired
        ffedbckErrorTxt.text = Global.shared.errorTxtRequired
        
        
        headerLbl.text = Global.shared.feedBckHeader
        drpTxtLbl.text = Global.shared.feedbckQuery
        feedbckLbl.text = Global.shared.feedbckWriteYourFeedback
        clearBtnOtlt.setTitle(Global.shared.feedbckClear, for: .normal)
        submitBtnOtlt.setTitle(Global.shared.feedbckSubmit, for: .normal)
    }
    
    
    func downloadProfileConfig() {
        
        let paramaterPasing: [String:Any] = ["languageCode":LocalizationSystem.sharedInstance.getLanguage()]
        
        
     /*   let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]*/
 
 let headers: HTTPHeaders = [.authorization(bearerToken: UserDefaults.standard.string(forKey: "token")!)]
        
        NetWorkDataManager.sharedInstance.profileConfigsImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            
            if errorString == nil
            {
                print(resonseTal!)
                
                if let periodType = resonseTal?.value(forKey: "feedbackTypes") as? String {
                    let newObj = Global.shared.convertToAryDictionary(text: periodType)
                    for dataObj in newObj! {
                        
                        self.feedbackNameData.append(dataObj["name"] as? String ?? "")
                        
                        self.feedbackValueData.append(dataObj["value"] as? String ?? "")
                        
                    }
                }
                
                
                for i in 0..<self.feedbackNameData.count {
                    self.pickerfeedbackTypes.append(["value": self.feedbackValueData[i], "display": self.feedbackNameData[i]])
                }
                
                print(self.pickerfeedbackTypes)
                let indexS = self.feedbackValueData.firstIndex(of: "")
                print(indexS ?? 0)
                self.pickerfeedbackTypes.remove(at: indexS ?? 0)
                self.pickerfeedbackTypes.insert(["value": self.feedbackValueData[indexS ?? 0], "display": self.feedbackNameData[indexS ?? 0]], at: 0)
                
                print(self.pickerfeedbackTypes)
                
                self.feedBckType = self.feedbackValueData[indexS ?? 0]
                self.drpField.text = self.feedbackNameData[indexS ?? 0]
                
                self.feedbackValueData.remove(at: indexS ?? 0)
                self.feedbackValueData.insert(self.feedBckType, at: 0)
                
                self.feedbackNameData.remove(at: indexS ?? 0)
                self.feedbackNameData.insert(self.drpField.text ?? "", at: 0)
                
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
    
    
    
    
    
    
    @IBAction func clearActn(_ sender: Any) {
        self.feedbackField.text = ""
    }
    
    @IBAction func submitActn(_ sender: Any) {
        if drpField.text == ""  {
            drpErrorTxt.isHidden = false
            
        }
        else if feedbackField.text == ""  {
            ffedbckErrorTxt.isHidden = false
            
        }
        else if feedBckType == ""  {
            let alert = ViewControllerManager.displayAlert(message: "Please select different query type" , title:APPLICATIONNAME)
            self.present(alert, animated: true, completion: nil)
            
        }
        else {
            submitFeedBack()
        }
    }
    
    @IBAction func drpActn(_ sender: Any) {
        let pickerData = pickerfeedbackTypes
        PickerDialog().show(title: "", options: pickerData , selected: "") {
            (value) -> Void in
            self.feedBckType = "\(value)"
            let indexS = self.feedbackValueData.firstIndex(of: "\(value)")
            self.drpField.text = self.feedbackNameData[indexS ?? 0]
            self.drpErrorTxt.isHidden = true
            
        }
    }
    @IBAction func bckBtnActn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func submitFeedBack() {
        
        let paramaterPasing: [String:Any] = ["registrationId": UserDefaults.standard.string(forKey: "registrationId")!,
                                             "type": feedBckType,
                                             "feedback": feedbackField.text!]
        
        print(paramaterPasing)
      /*  let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        */
        
        let headers: HTTPHeaders = [.authorization(bearerToken: UserDefaults.standard.string(forKey: "token")!)]
        NetWorkDataManager.sharedInstance.profileFeedbackImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            
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
                            self.feedbackField.text = ""
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
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView == feedbackField{
            
            if feedbackField.text!.count == 0 {
                ffedbckErrorTxt.isHidden = false
            }
            else {
                
                ffedbckErrorTxt.isHidden = true
            }
            
        }
        
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if textView == feedbackField {
            
            if feedbackField.text!.count <= -1 {
                ffedbckErrorTxt.isHidden = false
            }
            else {
                
                ffedbckErrorTxt.isHidden = true
            }
            
            //  return idNumberField.verifyFields(shouldChangeCharactersIn: range, replacementString: string)
        }
        
        return true
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
}

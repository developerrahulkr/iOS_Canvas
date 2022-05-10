//
//  ForgotUsernamePopUp.swift
//  Canvas
//
//  Created by urmila reddy on 20/08/20.
//  Copyright © 2020 urmila reddy. All rights reserved.
//

import UIKit
import Alamofire

class ForgotUsernamePopUp: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var subHeaderLbl: UILabel!
    @IBOutlet weak var downContactUsLbl: UILabel!
    
    @IBOutlet weak var rateCalculatorLbl: UILabel!
    
    @IBOutlet weak var ourBranchesLbl: UILabel!
    
    @IBOutlet weak var faqLbl: UILabel!
    
    @IBOutlet weak var termsAndConditionsLbl: UILabel!
    
    
    
    
    @IBOutlet weak var headerLbl: UILabel!
    
     
    @IBOutlet weak var civilIdLbl: UILabel!
    
    @IBOutlet weak var civilIdField: UITextField!
    
    @IBOutlet weak var cancelBtnOtlt: UIButton!
    
    @IBOutlet weak var confirmBtnOtlt: UIButton!
    
    @IBOutlet weak var requiredLbl: UILabel!
   
   
    @IBOutlet weak var smsBtnOtlt: UIButton!
    @IBOutlet weak var smsLbl: UILabel!
    
    
    @IBOutlet weak var emailBtnOtlt: UIButton!
    @IBOutlet weak var emailLbl: UILabel!
    
    var civildIdReqTxt = Global.shared.civilIdTxt + " " + Global.shared.errorTxtRequired
    var invalidCivilIdReqTxt = Global.shared.invalidTxt + " " + Global.shared.civilIdTxt
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
      
        
        civilIdField.delegate = self
        civilIdField.maxLength = 12
        assignLabels()
        
        requiredLbl.font = Global.shared.fontReqLbl
        requiredLbl.textColor = ColorCodes.newAppRed
        requiredLbl.text = Global.shared.civilIdTxt + " " + Global.shared.errorTxtRequired
        
        emailBtnOtlt.setImage(UIImage(named: "circleUnchecked"), for: .normal)
        smsBtnOtlt.setImage(UIImage(named: "circleChecked"), for: .normal)
        
        smsLbl.text = Global.shared.smsTxt
        emailLbl.text = Global.shared.emailTxt
        
        
    }
    func assignLabels() {
        self.termsAndConditionsLbl.text =  Global.shared.termsConditionBtnTxt
     //   self.faqLbl.text = Global.shared.helpTxt
        self.faqLbl.text = Global.shared.faqTxt
        self.ourBranchesLbl.text = Global.shared.ourBranches
        self.rateCalculatorLbl.text = Global.shared.rateCalculatorHeader
        self.downContactUsLbl.text = Global.shared.menuContact
        
        
        headerLbl.text = Global.shared.forgotUserNameTxt
        civilIdLbl.text = Global.shared.civilIdTxt + "*"
        confirmBtnOtlt.setTitle(Global.shared.verifctnConfirmBtnTxt, for: .normal)
        requiredLbl.text = Global.shared.errorTxtRequired
        cancelBtnOtlt.setTitle(Global.shared.backBtnTxt, for: .normal)
        
        subHeaderLbl.text = Global.shared.confirmCivildIdTxt
        
        civilIdField.keyboardType = .asciiCapableNumberPad
        
        
    }
   
    @IBAction func cancelBtnActn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
       }
    
    @IBAction func confirmBtnActn(_ sender: Any) {
        if civilIdField.text == "" {
            requiredLbl.isHidden = false
        }
        else {
            self.showSpinner(onView: self.view)
            forgotUserName()
            
            //   let vc = self.storyboard?.instantiateViewController(identifier: "ExistingCustomerVc") as! ExistingCustomerVc
            //    self.navigationController?.pushViewController(vc, animated: true)
            
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        //doneAction()
        
        if textField == civilIdField{
            if civilIdField.text!.count ==  0 {
                requiredLbl.text = civildIdReqTxt
                requiredLbl.isHidden = false
            }
           else if civilIdField.text!.count <= 11 {
            requiredLbl.text = invalidCivilIdReqTxt
            requiredLbl.isHidden = false
            }
            else {
                requiredLbl.isHidden = true
            }
        }
        
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
     
        
        if textField == civilIdField {
            if civilIdField.text!.count <=  -1 {
                requiredLbl.text = civildIdReqTxt
                requiredLbl.isHidden = false
            }
         else if civilIdField.text!.count <= -13 {
            requiredLbl.text = invalidCivilIdReqTxt
            requiredLbl.isHidden = false
            }
            else {
                requiredLbl.isHidden = true
            }
            
        }
        
        return true
        
    }
    
    var smsEmailInt = 1
    
    // Mark: Forgot username
    func forgotUserName() {
        
        let paramaterPasing: [String:Any] = ["civilId": civilIdField.text ?? "", "deliveryType": smsEmailInt]
        
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        NetWorkDataManager.sharedInstance.forgotUsernameImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            
            self.removeSpinner()
            if errorString == nil
            {
                
             //      print(resonseTal)
                let statusMsg = resonseTal?.value(forKey: "statusMessage") as? String ?? ""
            let mesageCode = resonseTal?.value(forKey: "messageCode") as? String ?? statusMsg
                if let statusCode = resonseTal?.value(forKey: "statusCodes") as? Int {
                    
                    print(statusCode)
                    if(statusCode == 200) {
                        
                        let alert = ViewControllerManager.displayAlert(message:Global.shared.messageCodeType(text: mesageCode), title:APPLICATIONNAME)
                        self.present(alert, animated: true, completion: nil)
                      
                        
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
    
    @IBAction func contactUsActn(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ContactUsVc") as! ContactUsVc
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func rateCalculatorActn(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "RateTabsCalculatorVc") as! RateTabsCalculatorVc
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
       
    @IBAction func branchLocatorBtnActn(_ sender: Any) {
        //RateCalculatorVc
      self.pushViewController(controller: BranchLocatorFirstVc.initiateController(), animated: true)
    }
    
    @IBAction func termsCondtnBtnActn(_ sender: Any) {
          //TermsAndConditionsVc
      self.pushViewController(controller: TermsAndConditionsVc.initiateController(), animated: true)

          //  authenticationWithTouchID()
          // openGoogleMaps()
          //   ChartsVc
      }
      
      @IBAction func faqBtnActn(_ sender: Any) {
        self.pushViewController(controller: FaqVc.initiateController(), animated: true)

      }
       
       @IBAction func languageChangeActn(_ sender: Any) {
        Global.shared.languageChangeActn()
       }
    
    
    @IBAction func smsBtnActn(_ sender: Any) {
        smsEmailInt = 1
        emailBtnOtlt.setImage(UIImage(named: "circleUnchecked"), for: .normal)
        smsBtnOtlt.setImage(UIImage(named: "circleChecked"), for: .normal)
    }
    
    @IBAction func emailBtnActn(_ sender: Any) {
        smsEmailInt = 2
        emailBtnOtlt.setImage(UIImage(named: "circleChecked"), for: .normal)
        smsBtnOtlt.setImage(UIImage(named: "circleUnchecked"), for: .normal)
    }
  
}

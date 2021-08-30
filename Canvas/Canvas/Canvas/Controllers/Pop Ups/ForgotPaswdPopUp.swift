//
//  ForgotPaswdPopUp.swift
//  Canvas
//
//  Created by urmila reddy on 20/08/20.
//  Copyright © 2020 urmila reddy. All rights reserved.
//

import UIKit
import Alamofire

class ForgotPaswdPopUp: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var civilIdLbl: UILabel!
    
    @IBOutlet weak var civilIdField: UITextField!
    
    @IBOutlet weak var civilIdReqLbl: UILabel!
    
    @IBOutlet weak var subHeaderLbl: UILabel!
    @IBOutlet weak var downContactUsLbl: UILabel!
    
    @IBOutlet weak var rateCalculatorLbl: UILabel!
    
    @IBOutlet weak var ourBranchesLbl: UILabel!
    
    @IBOutlet weak var faqLbl: UILabel!
    
    @IBOutlet weak var termsAndConditionsLbl: UILabel!
    
    
    
    
    @IBOutlet weak var headerLbl: UILabel!
    
    @IBOutlet weak var confirmBtnOtlt: UIButton!
    
    @IBOutlet weak var cancelBtnOtlt: UIButton!
    
    @IBOutlet weak var userNameLbl: UILabel!
    
    @IBOutlet weak var userNameField: CustomTextField!
    
    
    @IBOutlet weak var requiredLbl: UILabel!
    
    @IBOutlet weak var smsBtnOtlt: UIButton!
    
    @IBOutlet weak var emailBtnOtlt: UIButton!
    
    @IBOutlet weak var smsLblTxt: UILabel!
    
    @IBOutlet weak var emailLblTxt: UILabel!
     
    var civildIdReqTxt = Global.shared.civilIdTxt + " " + Global.shared.errorTxtRequired
    var invalidCivilIdReqTxt = Global.shared.invalidTxt + " " + Global.shared.civilIdTxt
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        userNameField.delegate = self
        civilIdField.delegate = self
        civilIdField.maxLength = 12
        
        emailBtnOtlt.setImage(UIImage(named: "circleUnchecked"), for: .normal)
        smsBtnOtlt.setImage(UIImage(named: "circleChecked"), for: .normal)
        
      //  userNameField.maxLength = Global.shared.username_max_length
        userNameField.maxLength = 50
        // userTxtField.minLegth = Global.shared.username_min_length
      //  userNameField.valueType = Global.shared.getFieldType(text: Global.shared.username_field_accept)
        emailBtnOtlt.isHidden = true
        emailLblTxt.isHidden = true
        
        assignLabels()
    }
    func assignLabels() {
        
        smsLblTxt.text = Global.shared.smsTxt
        emailLblTxt.text = Global.shared.emailTxt
        
        civilIdReqLbl.font = Global.shared.fontReqLbl
        civilIdReqLbl.textColor = ColorCodes.newAppRed
        
        requiredLbl.font = Global.shared.fontReqLbl
        requiredLbl.textColor = ColorCodes.newAppRed
        
        self.termsAndConditionsLbl.text =  Global.shared.termsConditionBtnTxt
        self.faqLbl.text = Global.shared.faqTxt
        self.ourBranchesLbl.text = Global.shared.ourBranches
        self.rateCalculatorLbl.text = Global.shared.rateCalculatorHeader
        self.downContactUsLbl.text = Global.shared.menuContact
        
        subHeaderLbl.text = Global.shared.confrmUserToResetPaswd
        
        requiredLbl.font = Global.shared.fontReqLbl
        requiredLbl.textColor = ColorCodes.newAppRed
        
        
        headerLbl.text = Global.shared.forgotPswdTxt
        userNameLbl.text = Global.shared.userNameTxt + "*"
        civilIdLbl.text = Global.shared.civilIdTxt + "*"
        
        civilIdReqLbl.text = civildIdReqTxt
        
        confirmBtnOtlt.setTitle(Global.shared.verifctnConfirmBtnTxt, for: .normal)
        requiredLbl.text = Global.shared.userNameTxt + " " + Global.shared.errorTxtRequired
        cancelBtnOtlt.setTitle(Global.shared.backBtnTxt, for: .normal)
    }
   
    
    @IBAction func cancelBtnActn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func confirmBtnActn(_ sender: Any) {
        if userNameField.text == "" {
            requiredLbl.isHidden = false
        }
        if civilIdField.text == "" {
            civilIdReqLbl.isHidden = false
        }
        else {
            self.showSpinner(onView: self.view)
            forgotPassword()
            
            
            
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        //doneAction()
        if textField == userNameField{
            if userNameField.text!.count ==  0 {
                requiredLbl.isHidden = false
            }
            else {
                requiredLbl.isHidden = true
            }
        }
        if textField == civilIdField{
            if civilIdField.text!.count ==  0 {
                civilIdReqLbl.text = civildIdReqTxt
                civilIdReqLbl.isHidden = false
            }
           else if civilIdField.text!.count <= 11 {
            civilIdReqLbl.text = invalidCivilIdReqTxt
            civilIdReqLbl.isHidden = false
            }
            else {
                civilIdReqLbl.isHidden = true
            }
        }
        
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
     /*   if textField == userNameField {
            if userNameField.text!.count <= -1 {
                requiredLbl.isHidden = false
            }
            else {
                requiredLbl.isHidden = true
            }
        }*/
        if textField == userNameField {
            if userNameField.text!.count <= -1 {
                requiredLbl.isHidden = false
            }
            else {
                requiredLbl.isHidden = true
            }
        //    return userNameField.verifyFields(shouldChangeCharactersIn: range, replacementString: string)
            
        }
        
        if textField == civilIdField {
            if civilIdField.text!.count <=  -1 {
                civilIdReqLbl.text = civildIdReqTxt
                civilIdReqLbl.isHidden = false
            }
         else if civilIdField.text!.count <= -13 {
                civilIdReqLbl.text = invalidCivilIdReqTxt
                civilIdReqLbl.isHidden = false
            }
            else {
                civilIdReqLbl.isHidden = true
            }
            
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
    
    
    var smsEmailInt = 1
    
    // Mark: Forgot Password
    func forgotPassword() {
        
        let paramaterPasing: [String:Any] = ["username": userNameField.text ?? "",
                                             "civilId": civilIdField.text ?? "",
                                             "type": 0, "deliveryType": smsEmailInt]
        
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        NetWorkDataManager.sharedInstance.forgotPaswdTwoImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            self.removeSpinner()
            
            if errorString == nil
            {
                
                print(resonseTal!)
                let statusMsg = resonseTal?.value(forKey: "statusMessage") as? String ?? ""
            let mesageCode = resonseTal?.value(forKey: "messageCode") as? String ?? statusMsg
                
                Global.shared.forgotPswdUserName = self.userNameField.text ?? ""
                Global.shared.forgotPswdCivilId = self.civilIdField.text ?? ""
                
                Global.shared.otpType = resonseTal?["otpType"] as? Int ?? 0
                Global.shared.forgotPswdMobileNumber = resonseTal?["mobile"] as? String ?? ""
                if let statusCode = resonseTal?.value(forKey: "statusCodes") as? Int {
                    
                    print(statusCode)
                   
                    if(statusCode == 200) {
                        
                        Global.shared.forgotPswdRegstrtnId = resonseTal?["registrationId"] as? String ?? ""
                        
                        let popOverVC = self.storyboard?.instantiateViewController(withIdentifier: "VerificationPopUpVc") as! VerificationPopUpVc
                        self.addChild(popOverVC)
                        popOverVC.view.frame = self.view.frame
                        self.view.addSubview(popOverVC.view)
                        popOverVC.didMove(toParent: self)
                        
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

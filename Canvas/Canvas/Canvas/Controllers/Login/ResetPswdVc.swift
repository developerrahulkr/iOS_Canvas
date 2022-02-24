//
//  ResetPswdVc.swift
//  Canvas
//
//  Created by urmila reddy on 20/08/20.
//  Copyright © 2020 urmila reddy. All rights reserved.
//

import UIKit
import Alamofire

class ResetPswdVc: UIViewController, UITextFieldDelegate, EasyTipViewDelegate {
    
    @IBOutlet weak var civilIdLbl: UILabel!
    
    @IBOutlet weak var civilIdField: UITextField!
    
    
    @IBOutlet weak var headerLbl: UILabel!
    
    @IBOutlet weak var userNameLbl: UILabel!
    
    @IBOutlet weak var userNameField: UITextField!
    
    
    @IBOutlet weak var pswdNameLbl: UILabel!
    
    @IBOutlet weak var pswdField: CustomTextField!
    
    @IBOutlet weak var confirmPswdLbl: UILabel!
    
    @IBOutlet weak var confirmPswdField: CustomTextField!
    
    
    @IBOutlet weak var submitBtnOtlt: UIButton!
    
    @IBOutlet weak var firstView: UIView!
    
    
    @IBOutlet weak var secndView: UIView!
    
    @IBOutlet weak var thirdView: UIView!
    
    
    @IBOutlet weak var pswdEyeBtnOtlt: UIButton!
    
    @IBOutlet weak var confirmEyeBtnOtlt: UIButton!
    
    @IBOutlet weak var instructionHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var userNameReqLbl: UILabel!
    
 //   @IBOutlet weak var pswdReqlbl: UILabel!
    
    
    @IBOutlet weak var confirmReqLbl: UILabel!
    
    
    @IBOutlet weak var strengthView: UIView!
    
    
    @IBOutlet weak var strengthProgressView: UIProgressView!
    
    @IBOutlet weak var instructionLabel: UILabel!
    
    
    @IBOutlet weak var newPswdReqLbl: UILabel!
    
  
    let newPswdReqTxt = Global.shared.verifyPaswdTxt  + " " + Global.shared.errorTxtRequired.lowercased()
    let confrmPswdReqTxt = Global.shared.verifyConfirmPswdTxt  + " " + Global.shared.errorTxtRequired.lowercased()
    
    let newPswdMinLengthTxt = Global.shared.changeNewPassword  + " " + Global.shared.minLengthTxtt + " 8"
    
    let confrmPswdNewAndConfirmSameTxt = Global.shared.pswdConfrmSameTxt
    
    
    
    
     var isPasswordValid: Bool = false
    var pswdIconClick = true
    var confirmPswdIconClick = true
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
      //  strengthProgressView.isHidden = true
        
        pswdField.maxLength = 50
        confirmPswdField.maxLength = 20
        
        confirmReqLbl.font = Global.shared.fontReqLbl
        confirmReqLbl.textColor = ColorCodes.newAppRed
        
        newPswdReqLbl.font = Global.shared.fontReqLbl
        newPswdReqLbl.textColor = ColorCodes.newAppRed
        
        self.strengthProgressView.setProgress(0, animated: true)
               self.instructionLabel.textColor = UIColor.red
               self.instructionLabel.text = ""
               self.instructionLabel.isHidden = true
        
        civilIdLbl.text = Global.shared.civilIdTxt + "*"
        userNameField.delegate = self
         pswdField.delegate = self
        confirmPswdField.delegate = self
        
        pswdEyeBtnOtlt.setImage(Images.eyeOpen, for: .normal)
      confirmEyeBtnOtlt.setImage(Images.eyeOpen, for: .normal)
        firstView.layer.cornerRadius = 5
        secndView.layer.cornerRadius = 5
        thirdView.layer.cornerRadius = 5
        submitBtnOtlt.layer.cornerRadius = 5
        
      //  pswdField.valueType = .password_Validation
        confirmPswdField.valueType = .password_Validation
        
        
        assignLabels()
    }
 
    
    func assignLabels() {
        headerLbl.text = Global.shared.verifyOnlineHeaderTxt
        userNameLbl.text = Global.shared.verifyUsernameTxt + "*"
        pswdNameLbl.text = Global.shared.verifyPaswdTxt + "*"
        confirmPswdLbl.text = Global.shared.verifyConfirmPswdTxt + "*"
        submitBtnOtlt.setTitle(Global.shared.verifySubmitBtnTxt, for: .normal)
        
        
        userNameReqLbl.text =  Global.shared.verifyUsernameTxt + " " +  Global.shared.errorTxtRequired.lowercased()
      //  pswdReqlbl.text = Global.shared.errorTxtRequired
        confirmReqLbl.text = confrmPswdReqTxt
        newPswdReqLbl.text = newPswdReqTxt
        
        civilIdField.text =  Global.shared.forgotPswdCivilId
        userNameField.text = Global.shared.forgotPswdUserName
        
    }
    
    // Mark: Password Textfield editing Changed
      @IBAction func passwordEditingChanged(_ sender: UITextField) {
          
          if let password = pswdField.text, password.isNotEmpty {
              self.instructionLabel.isHidden = false
              self.instructionLabel.alpha = 0
            let validationId = PasswordStrengthManager.checkValidationWithUniqueCharacter(pass: password, rules: PasswordRules.passwordRule, minLength: PasswordRules.minPasswordLength, maxLength: PasswordRules.maxPasswordLength, isUniqueCharRequired: PasswordRules.isUniqueCharRequired)
              UIView.animate(withDuration: 0.5, delay: 0, options: [], animations: { [weak self] in
                  self?.instructionLabel.alpha = CGFloat(validationId.alpha)
//                  self?.instructionHeightConstraint.constant = CGFloat(validationId.constant)
//                  self?.instructionLabel.text  = validationId.text
              })
              
              let progressInfo = PasswordStrengthManager.setProgressView(strength: validationId.strength)
              self.isPasswordValid = progressInfo.shouldValid
              self.strengthProgressView.setProgress(progressInfo.percentage, animated: true)
            
            
            DispatchQueue.main.async {
                if self.pswdField.text!.count < 8 {
                    self.newPswdReqLbl.text = self.newPswdMinLengthTxt
                self.newPswdReqLbl.isHidden = false
            }
                else {
                    self.newPswdReqLbl.text = validationId.text
                self.newPswdReqLbl.isHidden = false
                }
              self.strengthProgressView.progressTintColor = UIColor.colorFrom(hexString: progressInfo.color)
              self.instructionLabel.text = progressInfo.strengthText
            }
              
          } else {
              self.instructionLabel.isHidden = false
              self.instructionLabel.alpha = 0
              self.strengthProgressView.setProgress(0, animated: true)
              UIView.animate(withDuration: 0.5, delay: 0, options: [], animations: { [weak self] in
                  self?.instructionLabel.alpha = 1
//                  self?.instructionHeightConstraint.constant = 25
                 // self?.instructionLabel.text = "Password cannot be empty."
              }) { (_) in
                  UIView.animate(withDuration: 0.8, delay: 0, options: [], animations: { [weak self] in
                      self?.instructionLabel.alpha = 1
//                      self?.instructionHeightConstraint.constant = 25
                      self?.instructionLabel.isHidden = true
                  })
              }
          }
    }
    
    // MARK: For checking password length
    
    func checkPaswrd() {
        if let password = pswdField.text, password.isNotEmpty {
                    self.instructionLabel.isHidden = false
                    self.instructionLabel.alpha = 0
            let validationId = PasswordStrengthManager.checkValidationWithUniqueCharacter(pass: password, rules: PasswordRules.passwordRule, minLength: PasswordRules.minPasswordLength, maxLength: PasswordRules.maxPasswordLength, isUniqueCharRequired: PasswordRules.isUniqueCharRequired)
                    UIView.animate(withDuration: 0.5, delay: 0, options: [], animations: { [weak self] in
                        self?.instructionLabel.alpha = CGFloat(validationId.alpha)
                        self?.instructionHeightConstraint.constant = CGFloat(validationId.constant)
//                        self?.instructionLabel.text  = validationId.text
                        print(validationId.text)
                        
                    })
                    
                    let progressInfo = PasswordStrengthManager.setProgressView(strength: validationId.strength)
                    self.isPasswordValid = progressInfo.shouldValid
                    self.strengthProgressView.setProgress(progressInfo.percentage, animated: true)
          
            
            self.strengthProgressView.progressTintColor = UIColor.colorFrom(hexString: progressInfo.color)
          self.instructionLabel.text = progressInfo.strengthText


                } else {
                    self.instructionLabel.isHidden = false
                    self.instructionLabel.alpha = 0
                    self.strengthProgressView.setProgress(0, animated: true)
                    UIView.animate(withDuration: 0.5, delay: 0, options: [], animations: { [weak self] in
                        self?.instructionLabel.alpha = 1
//                        self?.instructionHeightConstraint.constant = 25
//                        self?.instructionLabel.text = "Password cannot be empty."
                    }) { (_) in
                        UIView.animate(withDuration: 0.8, delay: 0, options: [], animations: { [weak self] in
                            self?.instructionLabel.alpha = 1
//                            self?.instructionHeightConstraint.constant = 25
                            self?.instructionLabel.isHidden = true
                        })
                    }
                }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        if self.easyTipView == nil {
                  print("nothing")
              }
              else {
              easyTipView.dismiss()
                   self.easyTipView = nil
              }
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @IBAction func submitBtnActn(_ sender: Any) {
        
        if self.easyTipView == nil {
            print("nothing")
        }
        else {
        easyTipView.dismiss()
             self.easyTipView = nil
        }
         if pswdField.text == "" {
            newPswdReqLbl.text = newPswdReqTxt
            newPswdReqLbl.isHidden = false
        }
        else  if confirmPswdField.text == "" {
            confirmReqLbl.text = confrmPswdReqTxt
            confirmReqLbl.isHidden = false
        }
        else  if pswdField.text != confirmPswdField.text {
            confirmReqLbl.text = confrmPswdNewAndConfirmSameTxt
            confirmReqLbl.isHidden = false
        }
        else {
            resetPassword()
        }
    }
    
 
  private func setImage(for button: UIButton, icon: UIImage) {}
    @IBAction func pswdEyeBtnActn(_ sender: Any) {
        if(pswdIconClick == true) {
            pswdField.isSecureTextEntry = false
            let currentText: String = self.pswdField.text!
               self.pswdField.text = "";
               self.pswdField.text = currentText
            pswdEyeBtnOtlt.setImage(Images.eyeClose, for: .normal)
        } else {
            pswdField.isSecureTextEntry = true
            pswdEyeBtnOtlt.setImage(Images.eyeOpen, for: .normal)
        }
        
        pswdIconClick = !pswdIconClick
    }
     
    
    @IBAction func confirmEyeBtnActn(_ sender: Any) {
        if(confirmPswdIconClick == true) {
            confirmPswdField.isSecureTextEntry = false
            let currentText: String = self.confirmPswdField.text!
               self.confirmPswdField.text = "";
               self.confirmPswdField.text = currentText
          confirmEyeBtnOtlt.setImage(Images.eyeClose, for: .normal)
        } else {
            confirmPswdField.isSecureTextEntry = true
          confirmEyeBtnOtlt.setImage(Images.eyeOpen, for: .normal)
        }
        
        confirmPswdIconClick = !confirmPswdIconClick
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        //doneAction()
        if textField == userNameField{
            if userNameField.text!.count ==  0 {
                userNameReqLbl.isHidden = false
            }
            else {
                userNameReqLbl.isHidden = true
            }
        }
        
        if textField == pswdField{
            strengthProgressView.isHidden = false
            if pswdField.text!.count ==  0 {
             //   pswdReqlbl.isHidden = false
            }
            else {
//                checkPaswrd()
              //  pswdReqlbl.isHidden = true
            }
        }
        if textField == confirmPswdField{
            if confirmPswdField.text!.count ==  0 {
                confirmReqLbl.text = confrmPswdReqTxt
                confirmReqLbl.isHidden = false
            }
        else  if confirmPswdField.text !=   pswdField.text {
                //   newPswdReqLbl.isHidden = false
            confirmReqLbl.text = confrmPswdNewAndConfirmSameTxt
            confirmReqLbl.isHidden = false
            }
           
            else {
                confirmReqLbl.isHidden = true
            }
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField == userNameField {
            if userNameField.text!.count <= -1 {
                userNameReqLbl.isHidden = false
            }
            else {
                userNameReqLbl.isHidden = true
            }
        }
        else if textField == pswdField {
            strengthProgressView.isHidden = false
            if pswdField.text!.count <= -1 {
                newPswdReqLbl.text = newPswdReqTxt
                newPswdReqLbl.isHidden = false
            }
            else if pswdField.text!.count <= 7 {
                newPswdReqLbl.text = newPswdMinLengthTxt
                newPswdReqLbl.isHidden = false
            }
            
            else {
                //    checkPaswrd()
                newPswdReqLbl.isHidden = true
            }
         //   return pswdField.verifyFields(shouldChangeCharactersIn: range, replacementString: string)
        }
        else if textField == confirmPswdField {
            if confirmPswdField.text!.count <= -1 {
                confirmReqLbl.text = confrmPswdReqTxt
                confirmReqLbl.isHidden = false
            }
            else {
                confirmReqLbl.isHidden = true
            }
            return confirmPswdField.verifyFields(shouldChangeCharactersIn: range, replacementString: string)
        }
        
        return true
        
    }
    
    // MARK: To Reset password
    func resetPassword() {
        
        // For VAPT
        let paramaterPasing: [String:Any] = ["username": userNameField.text ?? "",
                                             "password": pswdField.text ?? "",
                                             "confirmPassword": confirmPswdField.text ?? "","registrationId": Global.shared.forgotPswdRegstrtnId ?? "",
                                             "mobile": Global.shared.forgotPswdMobileNumber ?? "",
                                             "otp": Global.shared.otpStr,
                                             "otpType": Global.shared.otpType ?? 0]
        
        // For Normal
//        let paramaterPasing: [String:Any] = ["username": userNameField.text ?? "",
//                                             "password": pswdField.text ?? "",
//                                             "confirmPassword": confirmPswdField.text ?? "","registrationId": Global.shared.forgotPswdRegstrtnId ?? ""]
//        
//        
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
     //   print(paramaterPasing)
        
        NetWorkDataManager.sharedInstance.resetPaswdImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            
            if errorString == nil
            {
                
                  // print(resonseTal)
                let statusMsg = resonseTal?.value(forKey: "statusMessage") as? String ?? ""
                let mesageCode = resonseTal?.value(forKey: "messageCode") as? String ?? statusMsg
                if let statusCode = resonseTal?.value(forKey: "statusCodes") as? Int {
                    
                    print(statusCode)
                    if(statusCode == 200) {
                        Global.shared.otpStr = ""
                        
                        let alert6 = UIAlertController(
                            title: "",
                            message: Global.shared.messageCodeType(text: mesageCode),
                            preferredStyle: UIAlertController.Style.alert)
                        
                        let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                            self.navigationController?.popToRootViewController(animated: false)
                        //  self.pushViewController(controller: LoginVc.initiateController(), animated: false)

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
    
    @IBAction func bckBtnActn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func paswdHintActn(_ sender: Any) {
     /*   var preferences = EasyTipView.Preferences()
                                                preferences.drawing.font = UIFont(name: "Futura-Medium", size: 13)!
                                                preferences.drawing.foregroundColor = UIColor.white
                                         preferences.drawing.backgroundColor = UIColor.black.withAlphaComponent(0.8)
                                                preferences.drawing.arrowPosition = EasyTipView.ArrowPosition.top

                                                EasyTipView.globalPreferences = preferences
                                                
                                                EasyTipView.show(forView: sender as! UIView,
                                                withinSuperview: self.navigationController?.view,
                                                text: Global.shared.toolTipTxt,
                                                preferences: preferences,
                                                delegate: self)*/
        
        var preferences = EasyTipView.Preferences()
                                                       preferences.drawing.font = UIFont(name: "Futura-Medium", size: 13)!
                                                       preferences.drawing.foregroundColor = UIColor.white
                                                preferences.drawing.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        preferences.drawing.arrowPosition = EasyTipView.ArrowPosition.top

        EasyTipView.globalPreferences = preferences
        
       
        
        if self.easyTipView == nil
         {
           self.easyTipView = EasyTipView(text: Global.shared.toolTipTxt)
            self.easyTipView.show(animated: true, forView: sender as! UIView, withinSuperview: nil)
         }
         else
         {
           self.easyTipView.dismiss()
           self.easyTipView = nil
         }
       
    }
    
   
    
   
    
    
    func easyTipViewDidDismiss(_ tipView: EasyTipView) {
        
               tipView.dismiss()
           }
    var easyTipView : EasyTipView!
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // var touch: UITouch? = touches.first
       // var toolTip = EasyTipView()
        
        if self.easyTipView == nil {
            print("nothing")
        }
        else {
        easyTipView.dismiss()
             self.easyTipView = nil
        }
    }
    
   
    
    @IBAction func languageChangeActn(_ sender: Any) {
        Global.shared.languageChangeActn()
    }
   
}

class PassableUIButton: UIButton{
    var params: Dictionary<String, Any>
    override init(frame: CGRect) {
        self.params = [:]
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.params = [:]
        super.init(coder: aDecoder)
    }
}

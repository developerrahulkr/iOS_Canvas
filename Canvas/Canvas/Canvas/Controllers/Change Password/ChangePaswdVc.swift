//
//  ChangePaswdVc.swift
//  Canvas
//
//  Created by urmila reddy on 07/09/20.
//  Copyright © 2020 urmila reddy. All rights reserved.
//

import UIKit
import Alamofire

class ChangePaswdVc: UIViewController, UITextFieldDelegate, EasyTipViewDelegate {
    
    
    @IBOutlet weak var titleHeader: UILabel!
    
    @IBOutlet weak var firstView: UIView!
    
    @IBOutlet weak var curentPswdLbl: UILabel!
    
    @IBOutlet weak var curentPswdField: CustomTextField!
    
    @IBOutlet weak var curntPswdEyeBtnOtlt: UIButton!
    
    
    
    
    @IBOutlet weak var secndView: UIView!
    
    @IBOutlet weak var newPswdLbl: UILabel!
    
    @IBOutlet weak var newPswdField: CustomTextField!
    
    @IBOutlet weak var newPswdEyeBtnOtlt: UIButton!
    
    
    
    @IBOutlet weak var thirdView: UIView!
    
    
    
    
    
    @IBOutlet weak var curentPswdReqLbl: UILabel!
    
    //    @IBOutlet weak var newPswdReqLbl: UILabel!
    
    @IBOutlet weak var submitBtnOtlt: UIButton!
    
    
    @IBOutlet weak var confirmPswdLbl: UILabel!
    
    @IBOutlet weak var confirmPswdField: CustomTextField!
    
    @IBOutlet weak var confirmPswdEyeBtnOtlt: UIButton!
    
    @IBOutlet weak var confirmPswdReqLbl: UILabel!
    
    
    @IBOutlet weak var strengthView: UIView!
    
    @IBOutlet weak var strengthProgressView: UIProgressView!
    
    @IBOutlet weak var instructionLabel: UILabel!
    
    @IBOutlet weak var instructionHeightConstraint: NSLayoutConstraint!
    
    
    @IBOutlet weak var newPswdReqLbl: UILabel!
    
    
    var currentPswdClick = true
    var newPswdClick = true
    var confirmPswdClick = true
    
    var isPasswordValid: Bool = false
    
    let oldPswdReqTxt = Global.shared.changeOldPassword  + " " + Global.shared.errorTxtRequired.lowercased()
    let newPswdReqTxt = Global.shared.changeNewPassword  + " " + Global.shared.errorTxtRequired.lowercased()
    let confrmPswdReqTxt = Global.shared.verifyConfirmPswdTxt  + " " + Global.shared.errorTxtRequired.lowercased()
    
    let newPswdMinLengthTxt = Global.shared.changeNewPassword  + " " + Global.shared.minLengthTxtt + " 8"
    let confrmPswdNewAndConfirmSameTxt = Global.shared.newPswdConfrmSameTxt
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
      //  strengthProgressView.isHidden = true
        
        curentPswdField.maxLength = 50
        newPswdField.maxLength = 20
        confirmPswdField.maxLength = 20
        
        self.strengthProgressView.setProgress(0, animated: true)
        self.instructionLabel.textColor = UIColor.red
        self.instructionLabel.text = ""
        self.instructionLabel.isHidden = true
        
        confirmPswdReqLbl.font = Global.shared.fontReqLbl
        confirmPswdReqLbl.textColor = ColorCodes.newAppRed
        
        curentPswdReqLbl.font = Global.shared.fontReqLbl
        curentPswdReqLbl.textColor = ColorCodes.newAppRed
        
        newPswdReqLbl.font = Global.shared.fontReqLbl
        newPswdReqLbl.textColor = ColorCodes.newAppRed
        
        //  newPswdReqLbl.font = Global.shared.fontReqLbl
        //   newPswdReqLbl.textColor = ColorCodes.newAppRed
        
        confirmPswdField.delegate = self
        curentPswdField.delegate = self
        newPswdField.delegate = self
        
      curntPswdEyeBtnOtlt.setImage(Images.eyeClose, for: .normal)
      newPswdEyeBtnOtlt.setImage(Images.eyeClose, for: .normal)
      confirmPswdEyeBtnOtlt.setImage(Images.eyeClose, for: .normal)
        firstView.layer.cornerRadius = 5
        secndView.layer.cornerRadius = 5
        thirdView.layer.cornerRadius = 5
        submitBtnOtlt.layer.cornerRadius = 5
        
        
      //  curentPswdField.valueType = .password_Validation
        newPswdField.valueType = .password_Validation
        confirmPswdField.valueType = .password_Validation
        
        assignLabels()
    }
    
    func assignLabels() {
        titleHeader.text = "Change Password"
        titleHeader.isHidden =  true
        confirmPswdLbl.text = Global.shared.verifyConfirmPswdTxt + "*"
        curentPswdLbl.text = Global.shared.changeOldPassword + "*"
        newPswdLbl.text = Global.shared.changeNewPassword  + "*"
        submitBtnOtlt.setTitle(Global.shared.verifySubmitBtnTxt, for: .normal)
        
        curentPswdReqLbl.text = Global.shared.changeOldPassword  + " " + Global.shared.errorTxtRequired.lowercased()
        newPswdReqLbl.text = Global.shared.changeNewPassword  + " " + Global.shared.errorTxtRequired.lowercased()
        confirmPswdReqLbl.text = Global.shared.verifyConfirmPswdTxt  + " " + Global.shared.errorTxtRequired.lowercased()
        
        //  newPswdReqLbl.text = Global.shared.errorTxtRequired
        // userNameField.text = Global.shared.forgotPswdUserName
        
    }
    // Mark: Password Textfield editing Changed
    @IBAction func passwordEditingChanged(_ sender: UITextField) {
        
        if let password = newPswdField.text, password.isNotEmpty {
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
                if self.newPswdField.text!.count < 8 {
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
    

    
    
    
    
    @IBAction func bckBtnActn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
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
    
    
    @IBAction func curentPswdEyeBtnACtn(_ sender: Any) {
        if(currentPswdClick == true) {
            curentPswdField.isSecureTextEntry = false
            let currentText: String = self.curentPswdField.text!
               self.curentPswdField.text = "";
               self.curentPswdField.text = currentText
          curntPswdEyeBtnOtlt.setImage(Images.eyeClose, for: .normal)
        } else {
            curentPswdField.isSecureTextEntry = true
          curntPswdEyeBtnOtlt.setImage(Images.eyeOpen, for: .normal)
        }
        
        currentPswdClick = !currentPswdClick
    }
    
    @IBAction func newPswdEyeBtnActn(_ sender: Any) {
        
        if(newPswdClick == true) {
            newPswdField.isSecureTextEntry = false
            let currentText: String = self.newPswdField.text!
               self.newPswdField.text = "";
               self.newPswdField.text = currentText
          newPswdEyeBtnOtlt.setImage(Images.eyeClose, for: .normal)
        } else {
            newPswdField.isSecureTextEntry = true
          newPswdEyeBtnOtlt.setImage(Images.eyeOpen, for: .normal)
        }
        
        newPswdClick = !newPswdClick
    }
    
    
    @IBAction func confirmPswdEyeBtnActn(_ sender: Any) {
        if(confirmPswdClick == true) {
            confirmPswdField.isSecureTextEntry = false
          confirmPswdEyeBtnOtlt.setImage(Images.eyeOpen, for: .normal)
        } else {
            confirmPswdField.isSecureTextEntry = true
          confirmPswdEyeBtnOtlt.setImage(Images.eyeClose, for: .normal)
        }
        
        confirmPswdClick = !confirmPswdClick
    }
    
    
    @IBAction func submitBtnActn(_ sender: Any) {
        if self.easyTipView == nil {
            print("nothing")
        }
        else {
            easyTipView.dismiss()
            self.easyTipView = nil
        }
        if curentPswdField.text == "" {
           
            curentPswdReqLbl.text = oldPswdReqTxt
            curentPswdReqLbl.isHidden = false
        }
        else  if newPswdField.text == "" {
            newPswdReqLbl.text = newPswdReqTxt
            newPswdReqLbl.isHidden = false
        }
        else  if confirmPswdField.text == "" {
            
            confirmPswdReqLbl.text = confrmPswdReqTxt
            confirmPswdReqLbl.isHidden = false
        }
    
        else  if newPswdField.text != confirmPswdField.text {
            confirmPswdReqLbl.text = confrmPswdNewAndConfirmSameTxt
            confirmPswdReqLbl.isHidden = false
        }
            
        else {
            self.showSpinner(onView: self.view)
            changePassword()
        }
    }
    
    // Mark: For changing password
    
    func changePassword() {
        
        let paramaterPasing: [String:Any] = ["username": UserDefaults.standard.string(forKey: "username")!,
                                             "oldPassword": curentPswdField.text!,
                                             "newPassword": newPswdField.text!,
                                             "confirmPassword": confirmPswdField.text!,
                                             "registrationId": UserDefaults.standard.string(forKey: "registrationId")!]
        
        
        let headers: HTTPHeaders = [.authorization(bearerToken: UserDefaults.standard.string(forKey: "token")!)]
        
        NetWorkDataManager.sharedInstance.profileChangePaswdImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            
            if errorString == nil
            {
                
                self.removeSpinner()
                let statusMsg = resonseTal?.value(forKey: "statusMessage") as? String
                //   print(resonseTal)
                let mesageCode = resonseTal?.value(forKey: "messageCode") as? String
                if let statusCode = resonseTal?.value(forKey: "statusCodes") as? Int {
                   
                    print(statusCode)
                    if(statusCode == 200) {
                        
                        
                        let alert6 = UIAlertController(
                            title: "",
                            message: statusMsg,
                            preferredStyle: UIAlertController.Style.alert)
                        
                        let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                      //    self.pushViewController(controller: HomeVc.initiateController())
                            self.pushViewController(controller: LoginVc.initiateController())
                        }
                        alert6.addAction(OKAction)
                        self.present(alert6, animated: true, completion: nil)
                        
                        
                    }
                    else if statusCode == 400
                    {
                        if mesageCode == "E110042"
                        {
                            self.showAlert(withTitle: "", withMessage: resonseTal?["statusMessage"] as? String ?? "")
//                            Global.shared.timeoUtOrNot = "no"
//                            self.showAlertForTimer(titulo: "", mensagem: Global.shared.sessionTimedOutTxt, vc: self)
                        }
                        else{
                            
                        let alert = ViewControllerManager.displayAlert(message: statusMsg ?? "", title:APPLICATIONNAME)
                        self.present(alert, animated: true, completion: nil)
                        }
                    }

                    else {
                        let alert = ViewControllerManager.displayAlert(message: statusMsg ?? "Invalid input", title:APPLICATIONNAME)
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
    
    
    
    
    
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        //doneAction()
        
        
        if textField == curentPswdField{
            if curentPswdField.text!.count ==  0 {
                curentPswdReqLbl.isHidden = false
            }
            else {
                curentPswdReqLbl.isHidden = true
            }
        }
        else  if textField == newPswdField{
            strengthProgressView.isHidden = false
            if newPswdField.text!.count ==  0 {
                //   newPswdReqLbl.isHidden = false
            }
            else {
                //   newPswdReqLbl.isHidden = true
                //  checkPaswrd()
            }
        }
        else  if textField == confirmPswdField{
            if confirmPswdField.text!.count ==  0 {
                confirmPswdReqLbl.text = confrmPswdReqTxt
                confirmPswdReqLbl.isHidden = false
            }
        else  if confirmPswdField.text !=   newPswdField.text {
                //   newPswdReqLbl.isHidden = false
                confirmPswdReqLbl.text = confrmPswdNewAndConfirmSameTxt
                confirmPswdReqLbl.isHidden = false
            }
           
            else {
                confirmPswdReqLbl.isHidden = true
            }
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField == curentPswdField {
            if curentPswdField.text!.count <= -1 {
                curentPswdReqLbl.text = oldPswdReqTxt
                curentPswdReqLbl.isHidden = false
            }
            else {
                curentPswdReqLbl.isHidden = true
            }
            return curentPswdField.verifyFields(shouldChangeCharactersIn: range, replacementString: string)
        } else if textField == newPswdField {
            strengthProgressView.isHidden = false
            if newPswdField.text!.count <= -1 {
                newPswdReqLbl.text = newPswdReqTxt
                newPswdReqLbl.isHidden = false
            }
         else if newPswdField.text!.count <= 7 {
            newPswdReqLbl.text = newPswdMinLengthTxt
            newPswdReqLbl.isHidden = false
            }
            
            else {
                //    checkPaswrd()
                newPswdReqLbl.isHidden = true
            }
            return newPswdField.verifyFields(shouldChangeCharactersIn: range, replacementString: string)
        }
        else if textField == confirmPswdField {
            if confirmPswdField.text!.count <= -1 {
                confirmPswdReqLbl.text = confrmPswdReqTxt
                confirmPswdReqLbl.isHidden = false
            }
            else {
                confirmPswdReqLbl.isHidden = true
            }
            return confirmPswdField.verifyFields(shouldChangeCharactersIn: range, replacementString: string)
        }
        
        return true
        
    }
    
    
    
    
    
    @IBAction func newPswdBtnActn(_ sender: Any) {
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
    
    
    
    func easyTipViewDidDismiss(_ tipView: EasyTipView) {
        
        tipView.dismiss()
    }
}

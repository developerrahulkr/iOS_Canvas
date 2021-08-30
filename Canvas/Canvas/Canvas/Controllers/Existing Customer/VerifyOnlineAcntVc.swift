//
//  VerifyOnlineAcntVc.swift
//  Canvas
//
//  Created by urmila reddy on 10/08/20.
//  Copyright © 2020 urmila reddy. All rights reserved.
//

import UIKit
import Alamofire

class VerifyOnlineAcntVc: BaseViewController, UITextFieldDelegate, EasyTipViewDelegate  {
    
    @IBOutlet weak var headerLbl: UILabel!
    
    @IBOutlet weak var userNameLbl: UILabel!
    
    @IBOutlet weak var userNameField: CustomTextField!
    
    
    @IBOutlet weak var pswdNameLbl: UILabel!
    
    @IBOutlet weak var pswdField: CustomTextField!
    
    @IBOutlet weak var confirmPswdLbl: UILabel!
    
    @IBOutlet weak var confirmPswdField: CustomTextField!
    
    
    @IBOutlet weak var submitBtnOtlt: UIButton!
    
    @IBOutlet weak var firstView: UIView!
    
    
    @IBOutlet weak var secndView: UIView!
    
    @IBOutlet weak var thirdView: UIView!
    
    
    @IBOutlet weak var fourthView: UIView!
    
    
    @IBOutlet weak var checkBtnOtlt: UIButton!
    
    
    @IBOutlet weak var termCondtnOtlt: UIButton!
    
    
    @IBOutlet weak var ihaveReadLbl: UILabel!
    
    @IBOutlet weak var pswdEyeBtnOtlt: UIButton!
    
    @IBOutlet weak var confirmEyeBtnOtlt: UIButton!
    
    @IBOutlet weak var userNameReqLbl: UILabel!
    
    // @IBOutlet weak var pswdReqlbl: UILabel!
    
    
    @IBOutlet weak var confirmReqLbl: UILabel!
    
    
    @IBOutlet weak var userNameTickImg: UIImageView!
    
    
    @IBOutlet weak var strengthView: UIView!
    
    @IBOutlet weak var strengthProgressView: UIProgressView!
    
    @IBOutlet weak var instructionLabel: UILabel!
    @IBOutlet weak var instructionHeightConstraint: NSLayoutConstraint!
    
    
    @IBOutlet weak var pswdReqLbl: UILabel!
    
    
    var isPasswordValid: Bool = false
    var pswdIconClick = true
    var confirmPswdIconClick = true
    
    
    var checkIconClick = true
    
    var checkMarkClicked:String!
    
    var userSecurityQuestionsList = ""
    
    
    let newPswdReqTxt = Global.shared.verifyPaswdTxt  + " " + Global.shared.errorTxtRequired.lowercased()
    let confrmPswdReqTxt = Global.shared.verifyConfirmPswdTxt  + " " + Global.shared.errorTxtRequired.lowercased()
    
    let newPswdMinLengthTxt = Global.shared.verifyPaswdTxt  + " " + Global.shared.minLengthTxtt + " 8"
    
    let confrmPswdNewAndConfirmSameTxt = Global.shared.pswdConfrmSameTxt
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pswdField.maxLength = 20
        confirmPswdField.maxLength = 20
        
       
        
        self.strengthProgressView.setProgress(0, animated: true)
        self.instructionLabel.textColor = ColorCodes.newAppGray
        self.instructionLabel.text = ""
        self.instructionLabel.isHidden = true
        
        userNameReqLbl.font = Global.shared.fontReqLbl
        userNameReqLbl.textColor = ColorCodes.newAppRed
        
        
        
        pswdReqLbl.font = Global.shared.fontReqLbl
        pswdReqLbl.textColor = ColorCodes.newAppRed
        
        //   pswdReqlbl.font = Global.shared.fontReqLbl
        //   pswdReqlbl.textColor = ColorCodes.newAppRed
        
        confirmReqLbl.font = Global.shared.fontReqLbl
        confirmReqLbl.textColor = ColorCodes.newAppRed
        
        // Do any additional setup after loading the view.
        userNameField.delegate = self
        pswdField.delegate = self
        confirmPswdField.delegate = self
        
        userNameField.valueType = Global.shared.getFieldType(text: Global.shared.username_field_accept)
        
        userNameField.maxLength = 50
        
         pswdEyeBtnOtlt.setImage(Images.eyeOpen, for: .normal)
         confirmEyeBtnOtlt.setImage(Images.eyeOpen, for: .normal)
        firstView.layer.cornerRadius = 5
        secndView.layer.cornerRadius = 5
        thirdView.layer.cornerRadius = 5
        fourthView.layer.cornerRadius = 5
        submitBtnOtlt.layer.cornerRadius = 5
        
        if LocalizationSystem.sharedInstance.getLanguage() == "ar" {
            //    if textAlignment == .natural {
            termCondtnOtlt.semanticContentAttribute = .forceRightToLeft
            termCondtnOtlt.contentHorizontalAlignment = .right

            
        }
        
        assignLabels()
    }
    
    func assignLabels() {
        ihaveReadLbl.text = Global.shared.iHaveReadAgreeTxt
        termCondtnOtlt.setTitle(Global.shared.termsConditionBtnTxt, for: .normal)
      //  headerLbl.text = Global.shared.verifyOnlineHeaderTxt
        
        headerLbl.text = Global.shared.createUserNamePaswd
        userNameLbl.text = Global.shared.verifyUsernameTxt + "*"
        pswdNameLbl.text = Global.shared.verifyPaswdTxt + "*"
        confirmPswdLbl.text = Global.shared.verifyConfirmPswdTxt + "*"
        submitBtnOtlt.setTitle(Global.shared.verifySubmitBtnTxt, for: .normal)
        
        
        userNameReqLbl.text = Global.shared.verifyUsernameTxt + " " + Global.shared.errorTxtRequired.lowercased()
        //    pswdReqlbl.text = Global.shared.errorTxtRequired
     //   confirmReqLbl.text = Global.shared.verifyConfirmPswdTxt + " " + Global.shared.errorTxtRequired.lowercased()
        
        confirmReqLbl.text = confrmPswdReqTxt
        pswdReqLbl.text = newPswdReqTxt
        
        pswdField.valueType = .password_Validation
        confirmPswdField.valueType = .password_Validation
       
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    //testing
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
                    self.pswdReqLbl.text = self.newPswdMinLengthTxt
                self.pswdReqLbl.isHidden = false
            }
                else {
                    self.pswdReqLbl.text = validationId.text
                self.pswdReqLbl.isHidden = false
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
    
    
    
    
    
    @IBAction func submitBtnActn(_ sender: Any) {
        if self.easyTipView == nil {
            print("nothing")
        }
        else {
            easyTipView.dismiss()
            self.easyTipView = nil
        }
        
        if userNameField.text == "" || userNameReqLbl.isHidden == false {
            userNameReqLbl.isHidden = false
        }
        else if  userNameField.text!.count <  8 {
            self.userNameTickImg.isHidden = true
            let alertName = Global.shared.verifyUsernameTxt + " " + Global.shared.isInvalidTxt
           let alert = ViewControllerManager.displayAlert(message: alertName, title:APPLICATIONNAME)
                      self.present(alert, animated: true, completion: nil)
        }
            
        else  if pswdField.text == "" {
            pswdReqLbl.text = newPswdReqTxt
            pswdReqLbl.isHidden = false
        }
        else  if AlertsValidations.SharedInstanceOfSingleTon.validatePassword(value: pswdField.text!) == false
        {
            let alertName = Global.shared.verifyPaswdTxt + " " + Global.shared.isInvalidTxt
            let alert = ViewControllerManager.displayAlert(message: alertName, title:APPLICATIONNAME)
            self.present(alert, animated: true, completion: nil)
        }
        else  if confirmPswdField.text == "" {
            confirmReqLbl.text = confrmPswdReqTxt
            confirmReqLbl.isHidden = false
        }
        else  if confirmPswdField.text != pswdField.text {
            confirmReqLbl.text = confrmPswdNewAndConfirmSameTxt
            confirmReqLbl.isHidden = false
        }
        else  if checkMarkClicked == nil  || checkMarkClicked == "unchecked"{
           // checkBtnOtlt.tintColor = .red
            let alert = ViewControllerManager.displayAlert(message: Global.shared.acceptTermsCondtnsAlert, title:APPLICATIONNAME)
            self.present(alert, animated: true, completion: nil)
            
        }
        else if  Global.shared.fromNewExistUser == "Exist User" {
            
            
            createExistUser()
            
        }
        else if Global.shared.fromNewExistUser == "New User"{
            //  createNewUserMultipart()
            self.showSpinner(onView: self.view)
            Global.shared.newUserUserName = userNameField.text
            Global.shared.newUserPaswd = pswdField.text
            generateOTP()
            
        }
        
        
    }
    
    // MARK: Generate otp
    func generateOTP() {
        
        let paramaterPasing: [String:Any] =
            ["mobile": NewUser.shared.mobile ?? "",
             "email": NewUser.shared.email ?? ""]
        
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        NetWorkDataManager.sharedInstance.generateOtpImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            
            if errorString == nil
            {
                print(resonseTal!)
                self.removeSpinner()
                Global.shared.otpType = resonseTal?["otpType"] as? Int ?? 0
                let popOverVC = self.storyboard?.instantiateViewController(withIdentifier: "VerificationPopUpVc") as! VerificationPopUpVc
                self.addChild(popOverVC)
                popOverVC.view.frame = self.view.frame
                self.view.addSubview(popOverVC.view)
                popOverVC.didMove(toParent: self)
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
        
        
        /*    checkMarkClicked = "checked"
         checkBtnOtlt.tintColor = .darkGray
         checkBtnOtlt.setBackgroundImage(UIImage(systemName: "checkmark.square"), for: .normal)*/
        
    }
    func verifyUsernameExistingUser() {
        
        let paramaterPasing: [String:Any] = [
            "username": userNameField.text ?? "",
            "identityId": ExistingUser.shared.civildId ?? "",
            "mobile": ExistingUser.shared.mobileNumber ?? "",
            "firstName": ExistingUser.shared.firstName ?? "",
            "middleName": ExistingUser.shared.middleName ?? "",
            "lastName": ExistingUser.shared.lastName ?? ""
        ]
        
        print(paramaterPasing)
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        NetWorkDataManager.sharedInstance.verifyUsernameImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            
            if errorString == nil
            {
                
                print(resonseTal!)
                if let statusCode = resonseTal?.value(forKey: "statusCodes") as? Int {
                    
                    print(statusCode)
                    if(statusCode == 200) {
                        
                        self.userNameReqLbl.isHidden = true
                        if self.userNameField.text!.count >=  8 {
                            self.userNameTickImg.isHidden = false
                        }
                        else {
                            self.userNameTickImg.isHidden = true
                        }
                        
                        
                    }
                        
                    else {
                        self.userNameTickImg.isHidden = true
                        if self.userNameField.text!.count >=  8 {
                            let alertName = Global.shared.verifyUsernameTxt + " " + Global.shared.alreadyExistsTxt
                            self.userNameReqLbl.text = alertName
                            self.userNameReqLbl.isHidden = false
                        }
                        else {
                            let alertName = Global.shared.verifyUsernameTxt + " " + Global.shared.isInvalidTxt
                            self.userNameReqLbl.text = alertName
                            self.userNameReqLbl.isHidden = false
                        }
                        let alertNew = Global.shared.verifyUsernameTxt + " " + Global.shared.alreadyExistsTxt
                        let alert = ViewControllerManager.displayAlert(message: alertNew, title:APPLICATIONNAME)
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
    
    
    // MARK: Foe verifying username
    func verifyUsernameNewUser() {
        
        let paramaterPasing: [String:Any] = [
            "username": userNameField.text ?? "",
            "identityId": NewUser.shared.identityId ?? "",
            "mobile": NewUser.shared.mobile ?? "",
            "firstName": NewUser.shared.firstName ?? "",
            "middleName": NewUser.shared.middleName ?? "",
            "lastName": NewUser.shared.lastName ?? ""
        ]
        
        print(paramaterPasing)
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        NetWorkDataManager.sharedInstance.verifyUsernameImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            
            if errorString == nil
            {
                
                print(resonseTal!)
                if let statusCode = resonseTal?.value(forKey: "statusCodes") as? Int {
                    
                    print(statusCode)
                    if(statusCode == 200) {
                        
                        self.userNameReqLbl.isHidden = true
                        if self.userNameField.text!.count >=  8 {
                            self.userNameTickImg.isHidden = false
                        }
                        else {
                            self.userNameTickImg.isHidden = true
                        }
                        
                        
                    }
                        
                    else {
                        self.userNameTickImg.isHidden = true
                        if self.userNameField.text!.count >=  8 {
                            let alertNew = Global.shared.verifyUsernameTxt + " " + Global.shared.alreadyExistsTxt
                            self.userNameReqLbl.text = alertNew
                            self.userNameReqLbl.isHidden = false
                        }
                        else {
                            let alertName = Global.shared.verifyUsernameTxt + " " + Global.shared.isInvalidTxt
                            self.userNameReqLbl.text = alertName
                            self.userNameReqLbl.isHidden = false
                        }
                        
                        let alertExts = Global.shared.verifyUsernameTxt + " " + Global.shared.alreadyExistsTxt
                        let alert = ViewControllerManager.displayAlert(message: alertExts, title:APPLICATIONNAME)
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
    
    
    @IBAction func termConditionActn(_ sender: Any) {
      self.pushViewController(controller: TermsAndConditionsVc.initiateController())
    }
    
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
                self.userNameTickImg.isHidden = true
                userNameReqLbl.isHidden = false
            }
            else if  userNameField.text!.count >=  8 {
                userNameReqLbl.isHidden = true
                
                if  Global.shared.fromNewExistUser == "Exist User" {
                    
                    
                    verifyUsernameExistingUser()
                    
                }
                else {
                    verifyUsernameNewUser()
                }
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
           
        return userNameField.verifyFields(shouldChangeCharactersIn: range, replacementString: string)
                
        }
        else if textField == pswdField {
            strengthProgressView.isHidden = false
            if pswdField.text!.count <= -1 {
                pswdReqLbl.text = newPswdReqTxt
                pswdReqLbl.isHidden = false
            }
            else if pswdField.text!.count <= 7 {
                pswdReqLbl.text = newPswdMinLengthTxt
                pswdReqLbl.isHidden = false
            }
            
            else {
                //    checkPaswrd()
                pswdReqLbl.isHidden = true
            }
            return pswdField.verifyFields(shouldChangeCharactersIn: range, replacementString: string)
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
    
    // MARK: For creating existing user
    func createExistUser() {
        
      //  self.showSpinner(onView: self.view)
        self.showLoader()
        
        let apiUlr = CanvasUrls.baseUrl +  CanvasUrls.versionNumber + CanvasUrls.existUserFinalApi
        
      //  self.showSpinner(onView: self.view)
        let url = NSURL(string:  apiUlr)
        
       
            //    let AllQuetnAry:[[String:Any]] = [["securityQuestion": ExistingUser.shared.firstQuestn ?? "","answer": ExistingUser.shared.firstAnswer ?? ""],["securityQuestion": ExistingUser.shared.secndQuestn ?? "","answer": ExistingUser.shared.secndAnswer ?? ""]]
            let registrtnAry:[String:Any] = [ "username": userNameField.text!,
                                              "password": pswdField.text!,
                                              "email": ExistingUser.shared.emailId ?? ""]
     //   let strIPAddress : String = self.getIPAddress()
        let ipAddress = try? String(contentsOf: URL(string: "https://api.ipify.org")!, encoding: .utf8)
             //  print(ipAddress)
        let newIpAdress = ipAddress ?? ""
            let postParams:[String:Any] = ["civilID": ExistingUser.shared.civildId ?? "",
                                           "mobile": ExistingUser.shared.mobileNumber ?? "",
                                           "emailID": ExistingUser.shared.emailId ?? "",
                                           "firstName": ExistingUser.shared.firstName ?? "",
                                           "middleName": ExistingUser.shared.middleName ?? "",
                                           "lastName": ExistingUser.shared.lastName ?? "",
                                           "userSecurityQuestionsList": Global.shared.AllQuetnAry ?? [[:]],
                                           "securityImage": ExistingUser.shared.imgSelected ?? "",
                                           "registrModel": registrtnAry, "ipAddress": newIpAdress]
            
            print(postParams)
            
            // creating request
            var urlRequest = URLRequest(url: url! as URL)
        
        let hmacResult2: String = Global.shared.publicKeyStr.hmac(algorithm: HMACAlgorithm.SHA512, key: Global.shared.privateKeyStr)
          
          let headersHmac = ["x-publickey" : Global.shared.publicKeyStr, "x-client": hmacResult2, "x-hash" : ""]
        
        for (key, value) in headersHmac {
            urlRequest.addValue(value, forHTTPHeaderField: key)
         
        }
            
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.httpMethod = "POST"
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: postParams, options: .prettyPrinted)
            }
            catch let error
            {
                print(error.localizedDescription)
            }
            let session = URLSession.shared
            //create dataTask using the session object to send data to the server
            let task = session.dataTask(with: urlRequest, completionHandler: { data , response , error in
                guard error == nil else
                {
                    return
                }
                guard let data = data else
                {
                    return
                }
                do {
                    
                    //create json object from data
                    
                    if let jsonobj = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? NSDictionary {
                        
                        print(jsonobj)
                        DispatchQueue.main.async {
                            self.removeLoader()
                        }
                    //    self.removeSpinner()
                    //    let mesageCode = jsonobj.value(forKey: "messageCode") as? String
                        
                        //mesageCode ?? "I22000"
                        let statusMsgg = jsonobj.value(forKey: "statusMessage") as? String ?? ""
                        
                        if let statusCode = jsonobj.value(forKey: "statusCodes") as? Int {
                            
                            print(statusCode)
                            if(statusCode == 200) {
                             //   self.removeSpinner()
                                DispatchQueue.main.async {
                                    let alert6 = UIAlertController(
                                        title: "",
                                        message: statusMsgg,
                                        preferredStyle: UIAlertController.Style.alert)
                                    
                                    let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                                      self.pushViewController(controller: LoginVc.initiateController())
                               
                                    }
                                    
                                    alert6.addAction(OKAction)
                                    self.present(alert6, animated: true, completion: nil)
                                }
                                
                                
                            }
                                
                            else {
                               DispatchQueue.main.async {
                                    self.removeLoader()
                                let alert = ViewControllerManager.displayAlert(message: statusMsgg, title:APPLICATIONNAME)
                                self.present(alert, animated: true, completion: nil)
                               }
                              //  self.removeSpinner()
                             //   self.removeSpinner()
                               
                                  
                               
                                
                                
                            }
                            
                        }
                        
                    }
                } catch let error {
                    DispatchQueue.main.async {
                        self.removeLoader()
                    }
                   // self.removeSpinner()
                    print(error.localizedDescription)
                }
            })
            task.resume()
    //    self.removeSpinner()
       
        
    }
    
    /*  func uploadVideoToServer() {
     if let videoUrl = videoRecordedUrl
     
     
     {
     
     AF.upload(multipartFormData: { multipartFormData in
     multipartFormData.append(videoUrl as URL, withName:  "File")
     multipartFormData.append("urmilaGlobe".data(using: String.Encoding.utf8, allowLossyConversion: false)!, withName :"VideoName")
     
     //"http://amecwebwin.ap-south-1.elasticbeanstalk.com/api/1.0/amec/upload"
     }, to: CanvasUrls.baseUrl + CanvasUrls.versionNumber + CanvasUrls.videoUpload)
     .responseJSON { response in
     debugPrint(response)
     }
     
     }
     }*/
    
    
    @IBAction func bckBtnActn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func paswordHintActn(_ sender: Any) {
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
    
    
    
    @IBAction func userNameToolTipActn(_ sender: Any) {
        var preferences = EasyTipView.Preferences()
               preferences.drawing.font = UIFont(name: "Futura-Medium", size: 13)!
               preferences.drawing.foregroundColor = UIColor.white
               preferences.drawing.backgroundColor = UIColor.black.withAlphaComponent(0.8)
               preferences.drawing.arrowPosition = EasyTipView.ArrowPosition.top
               
               EasyTipView.globalPreferences = preferences
               
               
               
               if self.easyTipView == nil
               {
                   self.easyTipView = EasyTipView(text: Global.shared.username_toolTipTxt)
                   self.easyTipView.show(animated: true, forView: sender as! UIView, withinSuperview: nil)
               }
               else
               {
                   self.easyTipView.dismiss()
                   self.easyTipView = nil
               }
    }
    
  
}

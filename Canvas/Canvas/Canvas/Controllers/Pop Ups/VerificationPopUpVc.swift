//
//  VerificationPopUpVc.swift
//  Canvas
//
//  Created by urmila reddy on 10/08/20.
//  Copyright © 2020 urmila reddy. All rights reserved.
//

import UIKit
import Alamofire

class VerificationPopUpVc: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var popUpVieww: UIView!
    
    @IBOutlet weak var headerLbl: UILabel!
    
    @IBOutlet weak var subTitleLbl: UILabel!
    
    @IBOutlet weak var codeExpireInLbl: UILabel!
    
    @IBOutlet weak var confirmBtnOtlt: UIButton!
    
    
    @IBOutlet weak var otpStackk: UIStackView!
    @IBOutlet weak var otp1: UITextField!
    
    @IBOutlet weak var otp2: UITextField!
    
    @IBOutlet weak var otp3: UITextField!
    
    @IBOutlet weak var otp4: UITextField!
    
    @IBOutlet weak var resendCodeBtnOtlt: UIButton!
    
    @IBOutlet weak var countDwnLbl: UILabel!
    
    @IBOutlet weak var invalidOtpTxt: UILabel!
    
    
    var counter = 120
    
     var userSecurityQuestionsList = ""
    
    weak var gameTimer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      //  self.showSpinner(onView: self.view)
        otp1.delegate = self
        otp2.delegate = self
        otp3.delegate = self
        otp4.delegate = self
        
        if LocalizationSystem.sharedInstance.getLanguage() == "ar" {
            //    if textAlignment == .natural {
            otpStackk.semanticContentAttribute = .forceLeftToRight
         //   adresDetlsLbl.textAlignment = .right
            //   }
            
        }
        
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        
        popUpVieww.layer.cornerRadius = 5
        confirmBtnOtlt.layer.cornerRadius = 5
        
        otp1.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        otp2.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        otp3.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        otp4.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        
        otp1.textAlignment = .center
        otp2.textAlignment = .center
        otp3.textAlignment = .center
        otp4.textAlignment = .center
        
        

        resendCodeBtnOtlt.isEnabled = false
        resendCodeBtnOtlt.isHidden = true
        resendCodeBtnOtlt.tintColor = .darkGray
        
        gameTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        
        self.showAnimate()
        
        self.removeSpinner()
        assignLabels()
    }
    
    @objc func updateCounter() {
        //example functionality
        if counter > -1 {
            countDwnLbl.text = "\(counter)"
            counter -= 1
            
            
            
            if counter == 0 {
                countDwnLbl.text = "0"
                resendCodeBtnOtlt.isEnabled = true
                resendCodeBtnOtlt.isHidden = false
                resendCodeBtnOtlt.tintColor = .red
            }
        }
    }
    
    func assignLabels() {
        
        headerLbl.text = Global.shared.verificationHeaderTxt
        subTitleLbl.text = Global.shared.verfiCtnSubTitleTxt
        codeExpireInLbl.text = Global.shared.codeExpiresTxt + ":"
        confirmBtnOtlt.setTitle(Global.shared.verifctnConfirmBtnTxt, for: .normal)
        resendCodeBtnOtlt.setTitle("Resend OTP", for: .normal)
        
    }
    
    @IBAction func confirmBtnActn(_ sender: Any) {
        if otp1.text == "" || otp2.text == "" ||  otp3.text == "" || otp4.text == "" {
            let alert = ViewControllerManager.displayAlert(message: Global.shared.enterOtpTxt, title:APPLICATIONNAME)
            self.present(alert, animated: true, completion: nil)
        }
        
     else   if  Global.shared.fromNewExistUser == "Exist User" {
                //uncomment verify otp and comment verify account in real time build
        self.showSpinner(onView: self.view)
        self.confirmBtnOtlt.isEnabled = false
                 verifyOTP()
        
        //without otp validation
       /*     self.showSpinner(onView: self.view)
                 verifyAccount()*/
          
        }
        else if  Global.shared.fromNewExistUser == "New User" {
            self.confirmBtnOtlt.isEnabled = false
            verifyNewUserOTP()
         //   self.showSpinner(onView: self.view)
            
            //without otp validation
        //    createNewUserMultipart()
        
            
        }
        //Bank transfer
        else if  Global.shared.fromNewExistUser == "Benef1" || Global.shared.fromNewExistUser == "Benef1Edit" {
            confirmBtnOtlt.isEnabled = false
            verifyBeneficiaryOTP()
            
            
            //without otp validation
        /*    self.showSpinner(onView: self.view)
            submitBankTransfer()*/
            
          
            
            
        }
        //Cash pickup
        else if  Global.shared.fromNewExistUser == "Benef2" || Global.shared.fromNewExistUser == "Benef2Edit" {
            confirmBtnOtlt.isEnabled = false
            verifyBeneficiaryOTP()
            
            //without otp validation
        /*    self.showSpinner(onView: self.view)
            submitCashTransfer()*/
            
        }
        // Western union
        else if  Global.shared.fromNewExistUser == "Benef3" || Global.shared.fromNewExistUser == "Benef3Edit" {
            confirmBtnOtlt.isEnabled = false
            verifyBeneficiaryOTP()
            
            //without otp validation
         /*   self.showSpinner(onView: self.view)
            submitWesternUnionTransfer()*/
        }
        
        else if  Global.shared.fromNewExistUser == "BenefDirectTransfer" {
            confirmBtnOtlt.isEnabled = false
            verifyBeneficiaryOTP()
            
            //without otp validation
         /*   self.showSpinner(onView: self.view)
            submitWesternUnionTransfer()*/
        }
        else {
          self.confirmBtnOtlt.isEnabled = false
           verifyOTPForResetPaswd()
            
            //without otp validation
         /*   let vc = self.storyboard?.instantiateViewController(identifier: "ResetPswdVc") as! ResetPswdVc
            self.navigationController?.pushViewController(vc, animated: true)*/
        }
        
        
    }
    func showAnimate()
    {
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0;
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        });
    }
    
    func removeAnimate()
    {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0;
        }, completion:{(finished : Bool)  in
            if (finished)
            {
                self.view.removeFromSuperview()
            }
        });
    }
    
    @IBAction func closeBtnActn(_ sender: Any) {
        removeAnimate()
    }
    
    @IBAction func resendCodeBtnActn(_ sender: Any) {
        
        otp1.text = ""
        otp2.text = ""
        otp3.text = ""
        otp4.text = ""
        counter = 120
        gameTimer?.invalidate()
        gameTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        resendCodeBtnOtlt.isHidden = true
        resendCodeBtnOtlt.isEnabled = false
        resendCodeBtnOtlt.tintColor = .darkGray
        
        if  Global.shared.fromNewExistUser == "Benef1" || Global.shared.fromNewExistUser ==  "Benef1Edit" {
            beneficiaryBankGenerateOTP()
            
        }
        else if  Global.shared.fromNewExistUser == "Benef2" || Global.shared.fromNewExistUser ==  "Benef2Edit" {
            beneficiaryCashGenerateOTP()
            
        }
        else if  Global.shared.fromNewExistUser == "Benef3" || Global.shared.fromNewExistUser ==  "Benef1Edit"  {
            beneficiaryWesternUnionGenerateOTP()
            
        }
        else  if  Global.shared.fromNewExistUser == "Exist User" {
            mobileNumberToApi = ExistingUser.shared.mobileNumbExtCustApi ?? ""
            emailIDToApi = ExistingUser.shared.emailIdExtCustApi ?? ""
            generateOTP()
        }
        else if  Global.shared.fromNewExistUser == "New User" {
            mobileNumberToApi = NewUser.shared.mobile ?? ""
            emailIDToApi = NewUser.shared.email ?? ""
            generateOTP()
        }
        else {
            forgotPasswordOtpGenerationForResendOtp()
        }
    //
        
    }
    func forgotPasswordOtpGenerationForResendOtp() {
        
        let paramaterPasing: [String:Any] = ["username":  Global.shared.forgotPswdUserName ?? "",
                                             "civilId": Global.shared.forgotPswdCivilId ?? "",
                                             "type": 0]
        
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        NetWorkDataManager.sharedInstance.forgotPaswdTwoImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            self.removeSpinner()
            
            if errorString == nil
            {
                self.removeSpinner()
                  print(resonseTal)
              
                
                Global.shared.otpType = resonseTal?["otpType"] as? Int ?? 0
                Global.shared.forgotPswdMobileNumber = resonseTal?["mobile"] as? String ?? ""
                if let statusCode = resonseTal?.value(forKey: "statusCodes") as? Int {
                    
                    print(statusCode)
                    
                    let statusMsg = resonseTal?.value(forKey: "statusMessage") as? String ?? ""
                let mesageCode = resonseTal?.value(forKey: "messageCode") as? String ?? statusMsg
                    if(statusCode == 200) {
                        Global.shared.forgotPswdRegstrtnId = resonseTal?["registrationId"] as? String ?? ""
                        
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
    var mobileNumberToApi:String!
    var emailIDToApi:String!
    
    func generateOTP() {
        
        let paramaterPasing: [String:Any] =
            ["mobile":  mobileNumberToApi ?? "",
             "email":  emailIDToApi ?? ""]
        
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        NetWorkDataManager.sharedInstance.generateOtpImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            
            if errorString == nil
            {
                self.removeSpinner()
                print(resonseTal)
                
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
    
    func beneficiaryBankGenerateOTP() {
        
        let paramaterPasing: [String:Any] =
            ["registrationId": Global.shared.afterLoginRegistrtnId ?? "",
             "beneficiaryFirstName": BankTransfer.shared.firstName ?? "" ]
        
     /*
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]*/
        let headers: HTTPHeaders = [.authorization(bearerToken: UserDefaults.standard.string(forKey: "token")!)]
        
        NetWorkDataManager.sharedInstance.benefGenerateOtpImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            
            if errorString == nil
            {
                print(resonseTal!)
                
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
    
    func beneficiaryCashGenerateOTP() {
        
        let paramaterPasing: [String:Any] =
            ["registrationId": Global.shared.afterLoginRegistrtnId ?? "",
             "beneficiaryFirstName":  CashTransfer.shared.firstName ?? "" ]
        
        
      /*  let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]*/
        
        let headers: HTTPHeaders = [.authorization(bearerToken: UserDefaults.standard.string(forKey: "token")!)]
        
        NetWorkDataManager.sharedInstance.benefGenerateOtpImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            
            if errorString == nil
            {
                 print(resonseTal)
                
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
    
    func beneficiaryWesternUnionGenerateOTP() {
        
        let paramaterPasing: [String:Any] =
            ["registrationId": Global.shared.afterLoginRegistrtnId ?? "",
             "beneficiaryFirstName": WesternUnion.shared.firstName ?? "" ]
        
        
     /*   let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]*/
        
        let headers: HTTPHeaders = [.authorization(bearerToken: UserDefaults.standard.string(forKey: "token")!)]
        
        NetWorkDataManager.sharedInstance.benefGenerateOtpImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            
            if errorString == nil
            {
                   print(resonseTal)
                
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
    
    func verifyAccount() {
    
        let paramaterPasing: [String:Any] =
            ["civilID": ExistingUser.shared.civilidExtCustApi ?? "","mobile":  ExistingUser.shared.mobileNumbExtCustApi ?? "",
             "emailID":  ExistingUser.shared.emailIdExtCustApi ?? ""]
        print(paramaterPasing)
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        NetWorkDataManager.sharedInstance.verifyAccountImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { canvasResponse , errorString in
            
            if errorString == nil
            {
                
                self.removeSpinner()
                print(canvasResponse)
                ExistingUser.shared.civildId = canvasResponse?["civilID"] as? String ?? ""
                ExistingUser.shared.emailId = canvasResponse?["emailID"] as? String ?? ""
                ExistingUser.shared.firstName = canvasResponse?["firstName"] as? String ?? ""
                ExistingUser.shared.lastName = canvasResponse?["lastName"] as? String ?? ""
                ExistingUser.shared.middleName = canvasResponse?["middleName"] as? String ?? ""
                ExistingUser.shared.mobileNumber = canvasResponse?["mobile"] as? String ?? ""
                
                
                ExistingUser.shared.accountNo = canvasResponse?["accountNo"] as? String ?? ""
                ExistingUser.shared.address1 = canvasResponse?["address1"] as? String ?? ""
                ExistingUser.shared.address2 = canvasResponse?["address2"] as? String ?? ""
                ExistingUser.shared.averageYearIncome = canvasResponse?["averageYearIncome"] as? String ?? ""
                ExistingUser.shared.bankName = canvasResponse?["bankName"] as? String ?? ""
                ExistingUser.shared.block = canvasResponse?["block"] as? String ?? ""
                
                
                ExistingUser.shared.branchName = canvasResponse?["branchName"] as? String ?? ""
                ExistingUser.shared.building = canvasResponse?["building"] as? String ?? ""
                ExistingUser.shared.city = canvasResponse?["city"] as? String ?? ""
                ExistingUser.shared.countOfExpectedTxn = canvasResponse?["countOfExpectedTxn"] as? String ?? ""
                ExistingUser.shared.countOfExpectedTxn_MY = canvasResponse?["countOfExpectedTxn_MY"] as? String ?? ""
                ExistingUser.shared.country = canvasResponse?["country"] as? String ?? ""
                
                ExistingUser.shared.countryCode = canvasResponse?["countryCode"] as? String ?? ""
                ExistingUser.shared.countryOfBirth = canvasResponse?["countryOfBirth"] as? String ?? ""
                ExistingUser.shared.dateOfBirth = canvasResponse?["dateOfBirth"] as? String ?? ""
                ExistingUser.shared.designation = canvasResponse?["designation"] as? String ?? ""
                ExistingUser.shared.doesIDExpiry = canvasResponse?["doesIDExpiry"] as? String ?? ""
                ExistingUser.shared.employerLocation = canvasResponse?["employerLocation"] as? String ?? ""
                
                ExistingUser.shared.employerName = canvasResponse?["employerName"] as? String ?? ""
                ExistingUser.shared.firstName = canvasResponse?["firstName"] as? String ?? ""
                ExistingUser.shared.flat = canvasResponse?["flat"] as? String ?? ""
                ExistingUser.shared.floor = canvasResponse?["floor"] as? String ?? ""
                ExistingUser.shared.gada = canvasResponse?["gada"] as? String ?? ""
                ExistingUser.shared.gender = canvasResponse?["gender"] as? String ?? ""
                
                ExistingUser.shared.idExpiryDate = canvasResponse?["idExpiryDate"] as? String ?? ""
                ExistingUser.shared.idIssueDate = canvasResponse?["idIssueDate"] as? String ?? ""
                ExistingUser.shared.idIssuer = canvasResponse?["idIssuer"] as? String ?? ""
                ExistingUser.shared.identityCountryIssue = canvasResponse?["identityCountryIssue"] as? String ?? ""
                ExistingUser.shared.identityId = canvasResponse?["identityId"] as? String ?? ""
                ExistingUser.shared.identityPlaseIssue = canvasResponse?["identityPlaseIssue"] as? String ?? ""
                
                ExistingUser.shared.identityType = canvasResponse?["identityType"] as? String ?? ""
                ExistingUser.shared.isPoliticallyExposed = canvasResponse?["isPoliticallyExposed"] as? String ?? ""
                ExistingUser.shared.nationality = canvasResponse?["nationality"] as? String ?? ""
                ExistingUser.shared.occupation = canvasResponse?["occupation"] as? String ?? ""
                ExistingUser.shared.otherIncome = canvasResponse?["otherIncome"] as? String ?? ""
                ExistingUser.shared.pepPosition = canvasResponse?["pepPosition"] as? String ?? ""
                
                ExistingUser.shared.placeOfBirth = canvasResponse?["placeOfBirth"] as? String ?? ""
                ExistingUser.shared.politicalScope = canvasResponse?["politicalScope"] as? String ?? ""
                ExistingUser.shared.postCode = canvasResponse?["postCode"] as? String ?? ""
                ExistingUser.shared.preferredLanguage = canvasResponse?["preferredLanguage"] as? String ?? ""
                ExistingUser.shared.purpose = canvasResponse?["purpose"] as? String ?? ""
                ExistingUser.shared.purposeOfTrasnfer = canvasResponse?["purposeOfTrasnfer"] as? String ?? ""
                
                ExistingUser.shared.remID = canvasResponse?["remID"] as? String ?? ""
                ExistingUser.shared.remexpdate = canvasResponse?["remexpdate"] as? String ?? ""
                ExistingUser.shared.remitterCategory = canvasResponse?["remitterCategory"] as? String ?? ""
                ExistingUser.shared.remitterCode = canvasResponse?["remitterCode"] as? String ?? ""
                ExistingUser.shared.remitterstatus = canvasResponse?["remitterstatus"] as? String ?? ""
                ExistingUser.shared.residentType = canvasResponse?["residentType"] as? String ?? ""
                
                ExistingUser.shared.salary = canvasResponse?["salary"] as? String ?? ""
                ExistingUser.shared.salutation = canvasResponse?["salutation"] as? String ?? ""
                ExistingUser.shared.sourceOfIncome = canvasResponse?["sourceOfIncome"] as? String ?? ""
                ExistingUser.shared.state = canvasResponse?["state"] as? String ?? ""
                ExistingUser.shared.street = canvasResponse?["street"] as? String ?? ""
                ExistingUser.shared.telephone = canvasResponse?["telephone"] as? String ?? ""
                
                ExistingUser.shared.typeOfService = canvasResponse?["typeOfService"] as? String ?? ""
                ExistingUser.shared.valueForExpectedTxn = canvasResponse?["valueForExpectedTxn"] as? String ?? ""
                ExistingUser.shared.valueForExpectedTxn_MY = canvasResponse?["valueForExpectedTxn_MY"] as? String ?? ""
                
                
                if let statusCode = canvasResponse?.value(forKey: "statusCodes") as? Int {
                    if(statusCode == 200) {
                        self.pushViewController(controller: ExistingIdentityVc.initiateController(),isGestureEnable: false)
                    }
                    
                    else {
                        let alert = ViewControllerManager.displayAlert(message: "Please register yourself as a customer in one of Al Muzaini Branches.", title:APPLICATIONNAME)
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
    func verifyOTP() {
        
        let otpStr1 = otp1.text!  + otp2.text!
        let otpStr2 = otp3.text! + otp4.text!
        let otpStr = otpStr1 + otpStr2
        
        let paramaterPasing: [String:Any] =
            ["mobile":  ExistingUser.shared.mobileNumbExtCustApi ?? "",
             "otp":  otpStr , "otpType": Global.shared.otpType ?? 0]
        
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        NetWorkDataManager.sharedInstance.verifyOtpImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            self.confirmBtnOtlt.isEnabled = true
            if errorString == nil
            {
                   print(resonseTal)
                let mesageCode = resonseTal?.value(forKey: "messageCode") as? String
                if let statusCode = resonseTal?.value(forKey: "statusCodes") as? Int {
                    
                    print(statusCode)
                    if(statusCode == 200) {
                        self.verifyAccount()
                        
                    }
                        
                    else {
                        self.removeSpinner()
                     
                        self.otp1.text = ""
                        self.otp2.text = ""
                        self.otp3.text = ""
                        self.otp4.text = ""
                        self.invalidOtpTxt.isHidden = false
                        
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
    
    func verifyNewUserOTP() {
        
        let otpStr1 = otp1.text!  + otp2.text!
        let otpStr2 = otp3.text! + otp4.text!
        let otpStr = otpStr1 + otpStr2
        
        let paramaterPasing: [String:Any] =
            ["mobile":  NewUser.shared.mobile ?? "",
             "otp":  otpStr , "otpType": Global.shared.otpType]
        
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        NetWorkDataManager.sharedInstance.verifyOtpImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            self.confirmBtnOtlt.isEnabled = true
            if errorString == nil
            {
                 print(resonseTal)
                let mesageCode = resonseTal?.value(forKey: "messageCode") as? String
                if let statusCode = resonseTal?.value(forKey: "statusCodes") as? Int {
                    
                    print(statusCode)
                    if(statusCode == 200) {
                        
                       /* let popOverVC = self.storyboard?.instantiateViewController(withIdentifier: "ProfileUnderReviewPopUp") as! ProfileUnderReviewPopUp
                        self.addChild(popOverVC)
                        popOverVC.view.frame = self.view.frame
                        self.view.addSubview(popOverVC.view)
                        popOverVC.didMove(toParent: self)*/
                        self.createNewUserMultipart()
                    }
                        
                    else {
                        self.removeSpinner()
                  
                        self.otp1.text = ""
                        self.otp2.text = ""
                        self.otp3.text = ""
                        self.otp4.text = ""
                        self.invalidOtpTxt.isHidden = false
                        
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
    
    func verifyOTPForResetPaswd() {
        
        let otpStr1 = otp1.text!  + otp2.text!
        let otpStr2 = otp3.text! + otp4.text!
        let otpStr = otpStr1 + otpStr2
        
        let paramaterPasing: [String:Any] =
            ["mobile":  Global.shared.forgotPswdMobileNumber ?? "",
             "otp":  otpStr , "otpType": Global.shared.otpType ?? 0]
        
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        NetWorkDataManager.sharedInstance.verifyOtpImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            self.confirmBtnOtlt.isEnabled = true
            if errorString == nil
            {
                //  print(resonseTal)
              //  let mesageCode = resonseTal?.value(forKey: "messageCode") as? String
                if let statusCode = resonseTal?.value(forKey: "statusCodes") as? Int {
                    
                    print(statusCode)
                    if(statusCode == 200) {
                        Global.shared.otpStr = otpStr
                      self.pushViewController(controller: ResetPswdVc.initiateController())
                      
                    }
                        
                    else {
                        self.removeSpinner()
                  
                        self.otp1.text = ""
                        self.otp2.text = ""
                        self.otp3.text = ""
                        self.otp4.text = ""
                        self.invalidOtpTxt.isHidden = false
                        
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
    
    @objc func textFieldDidChange(textField: UITextField){
        let text = textField.text
        self.invalidOtpTxt.isHidden = true
        if  text?.count == 1 {
            switch textField{
            case otp1:
                otp2.becomeFirstResponder()
            case otp2:
                otp3.becomeFirstResponder()
            case otp3:
                otp4.becomeFirstResponder()
            case otp4:
                otp4.resignFirstResponder()
            default:
                break
            }
        }
        if  text?.count == 0 {
            switch textField{
            case otp1:
                otp1.becomeFirstResponder()
            case otp2:
                otp1.becomeFirstResponder()
            case otp3:
                otp2.becomeFirstResponder()
            case otp4:
                otp3.becomeFirstResponder()
            default:
                break
            }
        }
        else{
            
        }
    }
    
    func verifyBeneficiaryOTP() {
        let otpStr1 = otp1.text!  + otp2.text!
        let otpStr2 = otp3.text! + otp4.text!
        let otpStr = otpStr1 + otpStr2
        
        let paramaterPasing: [String:Any] =
            ["registrationId": Global.shared.afterLoginRegistrtnId ?? "",
             "otp": otpStr,
             "otpType": Global.shared.otpType ?? 0]
        
        
      /*  let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]*/
        
        let headers: HTTPHeaders = [.authorization(bearerToken: UserDefaults.standard.string(forKey: "token")!)]
        
        NetWorkDataManager.sharedInstance.benefValidateOtpImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            self.confirmBtnOtlt.isEnabled = true
            if errorString == nil
            {
                  print(resonseTal)
                let statusMsgg = resonseTal?.value(forKey: "statusMessage") as? String ?? ""
                if let statusCode = resonseTal?.value(forKey: "statusCodes") as? Int {
                 
                 print(statusCode)
                 if(statusCode == 200) {
                    if  Global.shared.fromNewExistUser == "Benef1"  || Global.shared.fromNewExistUser == "Benef1Edit"  {
                           self.submitBankTransfer()
                           
                       }
                       else if  Global.shared.fromNewExistUser == "Benef2" || Global.shared.fromNewExistUser == "Benef2Edit" {
                           self.submitCashTransfer()
                           
                       }
                       else if  Global.shared.fromNewExistUser == "Benef3" || Global.shared.fromNewExistUser == "Benef3Edit" {
                           self.submitWesternUnionTransfer()
                           
                        
                 
                 }
                       else if Global.shared.fromNewExistUser == "BenefDirectTransfer" {
                        self.pushViewController(controller: BenefWuNewDirectTrnferVc.initiateController())
                       }
                 }
                 
                 else {
                    self.removeSpinner()
              /*   let alert = ViewControllerManager.displayAlert(message:statusMsgg, title:APPLICATIONNAME)
                 self.present(alert, animated: true, completion: nil)*/
                    self.otp1.text = ""
                    self.otp2.text = ""
                    self.otp3.text = ""
                    self.otp4.text = ""
                    self.invalidOtpTxt.isHidden = false
                 
                 }
                 
                 }
             /*   if  Global.shared.fromNewExistUser == "Benef1"  || Global.shared.fromNewExistUser == "Benef1Edit"  {
                    self.submitBankTransfer()
                    
                }
                else if  Global.shared.fromNewExistUser == "Benef2" || Global.shared.fromNewExistUser == "Benef2Edit" {
                    self.submitCashTransfer()
                    
                }
                else if  Global.shared.fromNewExistUser == "Benef3" || Global.shared.fromNewExistUser == "Benef3Edit" {
                    self.submitWesternUnionTransfer()
                    
                }*/
                
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
    
    
    func submitBankTransfer() {
        
         var beneficiaryIdd = BeneficiaryDetails.shared.beneficiaryId ?? 0
         if  Global.shared.fromNewExistUser == "Benef1"  {
             beneficiaryIdd = 0
            
        }
         else {
           beneficiaryIdd = BeneficiaryDetails.shared.beneficiaryId ?? 0
        }
        
        if BankTransfer.shared.dob == "" {
            BankTransfer.shared.dob = nil
        }
        
        let paramaterPasing: [String:Any] = ["beneficiaryId": beneficiaryIdd, "registrationId": Global.shared.afterLoginRegistrtnId ?? "",
                                             "firstName": BankTransfer.shared.firstName ?? "",
                                            "lastName": BankTransfer.shared.lastName ?? "",
                                            "middleName": BankTransfer.shared.middleName ?? "",
                                            "mobile": BankTransfer.shared.mobile ?? "",
                                            "telephone": BankTransfer.shared.telephone ?? "",
                                            "nationality": BankTransfer.shared.nationality ?? "",
                                            "address1": BankTransfer.shared.address1 ?? "",
                                            "address2": BankTransfer.shared.address2 ?? "",
                                            "district": BankTransfer.shared.district ?? "",
                                            "city": BankTransfer.shared.city ?? "",
                                            "state": BankTransfer.shared.state ?? "",
                                            "postCode": BankTransfer.shared.postCode ?? "",
                                            "country": BankTransfer.shared.country ?? "",
                                            "currency": BankTransfer.shared.currency ?? "",
                                            "beneficiaryIdType": BankTransfer.shared.beneficiaryIdType ?? "",
                                            "beneficiaryIdNumber": BankTransfer.shared.beneficiaryIdNumber ?? "",
                                            "beneficiaryRelationship": BankTransfer.shared.beneficiaryRelationship ?? "",
                                            "bankName": BankTransfer.shared.bankName ?? "",
                                            "branchName": BankTransfer.shared.branchName ?? "",
                                            "accountType": BankTransfer.shared.accountType ?? "",
                                            "ifscCode": BankTransfer.shared.ifscCode ?? "",
                                            "swiftCode": BankTransfer.shared.swiftCode ?? "",
                                            "cnicno": BankTransfer.shared.cnicno ?? "",
                                            "ibanCode": BankTransfer.shared.ibanCode ?? "",
                                            "accountNumber": BankTransfer.shared.accountNumber ?? "",
                                            "branchAddress1": BankTransfer.shared.branchAddress1 ?? "",
                                            "branchAddress2": BankTransfer.shared.branchAddress2 ?? "",
                                            "branchCode": BankTransfer.shared.branchCode ?? "", "dob": BankTransfer.shared.dob,
                                            "branchDistrict": BankTransfer.shared.branchDistrict ?? "",
                                            "remarks": BankTransfer.shared.remarks ?? "", "BeneficiaryImage": BankTransfer.shared.benefImg ?? ""]
        
        let headers: HTTPHeaders = [.authorization(bearerToken: UserDefaults.standard.string(forKey: "token")!)]
        
     /*   let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]*/
        
        NetWorkDataManager.sharedInstance.benefBankTransferImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            
            if errorString == nil
            {
                self.removeSpinner()
                
                print(resonseTal!)
                
                let statusMsg = resonseTal?.value(forKey: "statusMessage") as? String
                if let statusCode = resonseTal?.value(forKey: "statusCodes") as? Int {
                    
                    print(statusCode)
                    if(statusCode == 200) {
                
                if  Global.shared.fromNewExistUser == "Benef1"  {
                    let popOverVC = self.storyboard?.instantiateViewController(withIdentifier: "BenefAddedPopUpVc") as! BenefAddedPopUpVc
                                           self.addChild(popOverVC)
                                           popOverVC.view.frame = self.view.frame
                                           self.view.addSubview(popOverVC.view)
                                           popOverVC.didMove(toParent: self)
                }
                
                else if  Global.shared.fromNewExistUser == "Benef1Edit" {
               /*     self.navigationController?.popToRootViewController(animated: true)
                    let alert = ViewControllerManager.displayAlert(message: statusMsg ?? "Invalid input", title:APPLICATIONNAME)
                    self.present(alert, animated: true, completion: nil)
                 //   self.navigationController?.popToRootViewController(animated: true)*/
                    
                    
                    let alert6 = UIAlertController(
                        title: "",
                        message: statusMsg ?? "Invalid input",
                        preferredStyle: UIAlertController.Style.alert)
                    
                    let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                        self.navigationController?.popToRootViewController(animated: true)
                    }
                    alert6.addAction(OKAction)
                    self.present(alert6, animated: true, completion: nil)
                    
                }
                    }
                    else {
                        let alert = ViewControllerManager.displayAlert(message: statusMsg ?? "Invalid input", title:APPLICATIONNAME)
                        self.present(alert, animated: true, completion: nil)
                    }
                }
                
                
             /*   if let statusCode = resonseTal?.value(forKey: "statusCodes") as? Int {
                    
                    print(statusCode)
                    if(statusCode == 200) {
                     /*   let alert = ViewControllerManager.displayAlert(message: "Beneficiary added successfully", title:APPLICATIONNAME)
                        self.present(alert, animated: true, completion: nil)
                        self.navigationController?.popViewController(animated: true)*/
                        
                    }
                    else {
                        let alert = ViewControllerManager.displayAlert(message: "Beneficiary added successfully", title:APPLICATIONNAME)
                        self.present(alert, animated: true, completion: nil)
                        self.navigationController?.popViewController(animated: true)
                    }
                }*/
                
                
                
            }
                
            else
            {
                            print(errorString!)
                          
                            self.removeSpinner()
                          /*  let finalError = errorString?.components(separatedBy: ":")
                            let alert = ViewControllerManager.displayAlert(message: finalError?[1] ?? "", title:APPLICATIONNAME)
                            self.present(alert, animated: true, completion: nil)*/
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
    
    func submitCashTransfer() {
        
        var beneficiaryIdd = BeneficiaryDetails.shared.beneficiaryId ?? 0
                if  Global.shared.fromNewExistUser == "Benef2"  {
                    beneficiaryIdd = 0
               }
                else {
                  
                    beneficiaryIdd = BeneficiaryDetails.shared.beneficiaryId
               }
        if CashTransfer.shared.dob == "" {
            CashTransfer.shared.dob = nil
        }
        
        let paramaterPasing: [String:Any] = ["beneficiaryId": beneficiaryIdd,"registrationId": Global.shared.afterLoginRegistrtnId ?? "",
                                             "firstName": CashTransfer.shared.firstName ,
                                             "lastName": CashTransfer.shared.lastName ,
                                             "middleName": CashTransfer.shared.middleName ,
                                             "mobile": CashTransfer.shared.mobile ,
                                             "telephone": CashTransfer.shared.telephone ,
                                             "nationality": CashTransfer.shared.nationality ,
                                             "address1": CashTransfer.shared.address1 ,
                                             "address2": CashTransfer.shared.address2 ,
                                             "district": CashTransfer.shared.district ,
                                             "city": CashTransfer.shared.city ,
                                             "state": CashTransfer.shared.state ,
                                             "postCode": CashTransfer.shared.postCode ,
                                             "country": CashTransfer.shared.country ,
                                             "currency": CashTransfer.shared.currency ,
                                             "beneficiaryIdType": CashTransfer.shared.beneficiaryIdType ,
                                             "beneficiaryIdNumber": CashTransfer.shared.beneficiaryIdNumber ,
                                             "beneficiaryRelationship": CashTransfer.shared.beneficiaryRelationship ,
                                             "bankName": CashTransfer.shared.bankName ,
                                             "branchName": CashTransfer.shared.branchName ,
                                             "accountType": CashTransfer.shared.accountType ,
                                             "ifscCode": CashTransfer.shared.ifscCode ,
                                             "swiftCode": CashTransfer.shared.swiftCode ,
                                             "cnicno": CashTransfer.shared.cnicno ,
                                             "ibanCode": CashTransfer.shared.ibanCode ,
                                             "accountNumber": CashTransfer.shared.accountNumber ,
                                             "branchAddress1": CashTransfer.shared.branchAddress1 ,
                                             "branchAddress2": CashTransfer.shared.branchAddress2 ,
                                             "branchCode": CashTransfer.shared.branchCode , "dob": CashTransfer.shared.dob,
                                             "branchDistrict": CashTransfer.shared.branchDistrict ,
                                             "remarks": CashTransfer.shared.remarks , "BeneficiaryImage": CashTransfer.shared.benefImg
        ]
        
        
        /*   let headers: HTTPHeaders = [
         "Content-Type": "application/json"
         ]*/
        
        let headers: HTTPHeaders = [.authorization(bearerToken: UserDefaults.standard.string(forKey: "token")!)]
        
        NetWorkDataManager.sharedInstance.benefCashTransferImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            
            if errorString == nil
            {
                self.removeSpinner()
                print(resonseTal!)
               /* if let statusCode = resonseTal?.value(forKey: "statusCodes") as? Int {
                    
                    print(statusCode)
                    if(statusCode == 200) {
                        let alert = ViewControllerManager.displayAlert(message: "Beneficiary added successfully", title:APPLICATIONNAME)
                                            self.present(alert, animated: true, completion: nil)
                                            self.navigationController?.popViewController(animated: true)
                       
                    }
                    else {
                        let alert = ViewControllerManager.displayAlert(message: "Beneficiary added successfully", title:APPLICATIONNAME)
                                            self.present(alert, animated: true, completion: nil)
                                            self.navigationController?.popViewController(animated: true)
                    }
                }*/
                
                let statusMsg = resonseTal?.value(forKey: "statusMessage") as? String
                if let statusCode = resonseTal?.value(forKey: "statusCodes") as? Int {
                    
                    print(statusCode)
                    if(statusCode == 200) {
                
                if  Global.shared.fromNewExistUser == "Benef2"  {
                    let popOverVC = self.storyboard?.instantiateViewController(withIdentifier: "BenefAddedPopUpVc") as! BenefAddedPopUpVc
                                           self.addChild(popOverVC)
                                           popOverVC.view.frame = self.view.frame
                                           self.view.addSubview(popOverVC.view)
                                           popOverVC.didMove(toParent: self)
                }
                
                else if  Global.shared.fromNewExistUser == "Benef2Edit" {
                    
                    let alert6 = UIAlertController(
                        title: "",
                        message: statusMsg ?? "Invalid input",
                        preferredStyle: UIAlertController.Style.alert)
                    
                    let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                        self.navigationController?.popToRootViewController(animated: true)
                    }
                    alert6.addAction(OKAction)
                    self.present(alert6, animated: true, completion: nil)
                    
                    
                  /*  let alert = ViewControllerManager.displayAlert(message: statusMsg ?? "Invalid input", title:APPLICATIONNAME)
                    self.present(alert, animated: true, completion: nil)*/
                   
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
//                                    let refreshAlert = UIAlertController(title: "", message: Global.shared.sessionTimedOutTxt, preferredStyle: UIAlertController.Style.alert)
//                                    refreshAlert.view.tintColor = ColorCodes.newAppRed
//                                    refreshAlert.addAction(UIAlertAction(title: Global.shared.okTxt, style: .default, handler: { (action: UIAlertAction!) in
//                                       self.pushViewController(controller: LoginVc.initiateController())
//                                    }))
//
//                                    self.present(refreshAlert, animated: true, completion: nil)
                                }
                                
                                else {
                                    let alert = ViewControllerManager.displayAlert(message: errorString ?? "", title:APPLICATIONNAME)
                                    self.present(alert, animated: true, completion: nil)
                                }
                               
                                
                            }

                
            }
        }
    
    
    func submitWesternUnionTransfer() {
        
        var beneficiaryIdd = BeneficiaryDetails.shared.beneficiaryId ?? 0
                       if  Global.shared.fromNewExistUser == "Benef3"  {
                           beneficiaryIdd = 0
                      }
                       else {
                         
                           beneficiaryIdd = BeneficiaryDetails.shared.beneficiaryId
                      }
        
        let paramaterPasing: [String:Any] = ["beneficiaryId": beneficiaryIdd, "registrationId": Global.shared.afterLoginRegistrtnId ?? "",
                                             "firstName":  WesternUnion.shared.firstName ?? "",
                                             "lastName":  WesternUnion.shared.lastName ?? "",
                                             "middleName":  WesternUnion.shared.middleName ?? "",
                                             "address1": WesternUnion.shared.address1 ?? "",
                                             "address2": WesternUnion.shared.address2 ?? "",
                                             "city": WesternUnion.shared.city ?? "",
                                             "state": WesternUnion.shared.state ?? "",
                                             "country": WesternUnion.shared.country ?? "",
                                             "currency":  WesternUnion.shared.currency ?? "",
                                             "mobile": WesternUnion.shared.mobile ?? "", "BeneficiaryImage": BankTransfer.shared.benefImg ?? ""
            
        ]
        
        
    /*    let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]*/
        
        let headers: HTTPHeaders = [.authorization(bearerToken: UserDefaults.standard.string(forKey: "token")!)]
        
        NetWorkDataManager.sharedInstance.benefWesternUnionTransferImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            
            if errorString == nil
            {
                self.removeSpinner()
                print(resonseTal!)
               /* if let statusCode = resonseTal?.value(forKey: "statusCodes") as? Int {
                    
                    print(statusCode)
                    if(statusCode == 200) {
                       let alert = ViewControllerManager.displayAlert(message: "Beneficiary added successfully", title:APPLICATIONNAME)
                                           self.present(alert, animated: true, completion: nil)
                                           self.navigationController?.popViewController(animated: true)
                    }
                    else {
                        let alert = ViewControllerManager.displayAlert(message: "Beneficiary added successfully", title:APPLICATIONNAME)
                                            self.present(alert, animated: true, completion: nil)
                                            self.navigationController?.popViewController(animated: true)
                    }
                }*/
                let statusMsg = resonseTal?.value(forKey: "statusMessage") as? String
                if let statusCode = resonseTal?.value(forKey: "statusCodes") as? Int {
                    
                    print(statusCode)
                    if(statusCode == 200) {
                if  Global.shared.fromNewExistUser == "Benef3"  {
                    let popOverVC = self.storyboard?.instantiateViewController(withIdentifier: "BenefAddedPopUpVc") as! BenefAddedPopUpVc
                                           self.addChild(popOverVC)
                                           popOverVC.view.frame = self.view.frame
                                           self.view.addSubview(popOverVC.view)
                                           popOverVC.didMove(toParent: self)
                }
                
                else if  Global.shared.fromNewExistUser == "Benef3Edit" {
                 /*   self.navigationController?.popToRootViewController(animated: true)
                    let alert = ViewControllerManager.displayAlert(message: "Beneficiary updated successfully", title:APPLICATIONNAME)
                    self.present(alert, animated: true, completion: nil)*/
                    
                    let alert6 = UIAlertController(
                        title: "",
                        message: statusMsg ?? "Invalid input",
                        preferredStyle: UIAlertController.Style.alert)
                    
                    let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                        self.navigationController?.popToRootViewController(animated: true)
                    }
                    alert6.addAction(OKAction)
                    self.present(alert6, animated: true, completion: nil)
                   
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
    
    func createNewUserMultipart() {
         
         self.showSpinner(onView: self.view)
        
        let hmacResult2: String = Global.shared.publicKeyStr.hmac(algorithm: HMACAlgorithm.SHA512, key: Global.shared.privateKeyStr)
          
          let headersHmac: HTTPHeaders = ["x-publickey" : Global.shared.publicKeyStr, "x-client": hmacResult2, "x-hash" : ""]
        
        
         AF.upload(multipartFormData: { multipartFormData in
             
             multipartFormData.append(NewUser.shared.identityType.data(using: String.Encoding.utf8, allowLossyConversion: false)!, withName :"IdentityDetails.IdentityType")
             multipartFormData.append(NewUser.shared.identityId.data(using: String.Encoding.utf8, allowLossyConversion: false)!, withName :"IdentityDetails.IdentityId")
             multipartFormData.append(NewUser.shared.identityIssueDate.data(using: String.Encoding.utf8, allowLossyConversion: false)!, withName :"IdentityDetails.IdentityIssueDate")
             multipartFormData.append(NewUser.shared.identityExpireDate.data(using: String.Encoding.utf8, allowLossyConversion: false)!, withName :"IdentityDetails.IdentityExpiryDate")
             multipartFormData.append(NewUser.shared.identityCountryIsuue.data(using: String.Encoding.utf8, allowLossyConversion: false)!, withName :"IdentityDetails.IdentityCountryIssue")
             multipartFormData.append(NewUser.shared.identityPlaceIsue.data(using: String.Encoding.utf8, allowLossyConversion: false)!, withName :"IdentityDetails.IdentityPlaseIssue")
             multipartFormData.append(NewUser.shared.preferredLang.data(using: String.Encoding.utf8, allowLossyConversion: false)!, withName :"PersonalDetails.PreferredLanguage")
             multipartFormData.append(NewUser.shared.residentType.data(using: String.Encoding.utf8, allowLossyConversion: false)!, withName :"PersonalDetails.ResidentType")
             multipartFormData.append(NewUser.shared.salutation.data(using: String.Encoding.utf8, allowLossyConversion: false)!, withName :"PersonalDetails.Salutation")
             multipartFormData.append(NewUser.shared.firstName.data(using: String.Encoding.utf8, allowLossyConversion: false)!, withName :"PersonalDetails.FirstName")
             multipartFormData.append(NewUser.shared.middleName.data(using: String.Encoding.utf8, allowLossyConversion: false)!, withName :"PersonalDetails.MiddleName")
             multipartFormData.append(NewUser.shared.lastName.data(using: String.Encoding.utf8, allowLossyConversion: false)!, withName :"PersonalDetails.LastName")
             multipartFormData.append(NewUser.shared.dob.data(using: String.Encoding.utf8, allowLossyConversion: false)!, withName :"PersonalDetails.DateOfBirth")
             multipartFormData.append(NewUser.shared.placeOfBirth.data(using: String.Encoding.utf8, allowLossyConversion: false)!, withName :"PersonalDetails.PlaceOfBirth")
             multipartFormData.append(NewUser.shared.nationality.data(using: String.Encoding.utf8, allowLossyConversion: false)!, withName :"PersonalDetails.Nationality")
             multipartFormData.append(NewUser.shared.flat.data(using: String.Encoding.utf8, allowLossyConversion: false)!, withName :"PersonalDetails.Flat")
             multipartFormData.append(NewUser.shared.floor.data(using: String.Encoding.utf8, allowLossyConversion: false)!, withName :"PersonalDetails.Floor")
             multipartFormData.append(NewUser.shared.building.data(using: String.Encoding.utf8, allowLossyConversion: false)!, withName :"PersonalDetails.Building")
             multipartFormData.append(NewUser.shared.gada.data(using: String.Encoding.utf8, allowLossyConversion: false)!, withName :"PersonalDetails.Gada")
             multipartFormData.append(NewUser.shared.street.data(using: String.Encoding.utf8, allowLossyConversion: false)!, withName :"PersonalDetails.Street")
             multipartFormData.append(NewUser.shared.block.data(using: String.Encoding.utf8, allowLossyConversion: false)!, withName :"PersonalDetails.Block")
             multipartFormData.append(NewUser.shared.city.data(using: String.Encoding.utf8, allowLossyConversion: false)!, withName :"PersonalDetails.City")
             multipartFormData.append(NewUser.shared.state.data(using: String.Encoding.utf8, allowLossyConversion: false)!, withName :"PersonalDetails.State")
             multipartFormData.append(NewUser.shared.country.data(using: String.Encoding.utf8, allowLossyConversion: false)!, withName :"PersonalDetails.Country")
             multipartFormData.append(NewUser.shared.mobile.data(using: String.Encoding.utf8, allowLossyConversion: false)!, withName :"PersonalDetails.Mobile")
             multipartFormData.append(NewUser.shared.telephone.data(using: String.Encoding.utf8, allowLossyConversion: false)!, withName :"PersonalDetails.Telephone")
             multipartFormData.append(NewUser.shared.zipcode.data(using: String.Encoding.utf8, allowLossyConversion: false)!, withName :"PersonalDetails.ZipCode")
             multipartFormData.append(NewUser.shared.secondryEmail.data(using: String.Encoding.utf8, allowLossyConversion: false)!, withName :"PersonalDetails.SecondaryEmail")
             multipartFormData.append(NewUser.shared.gender.data(using: String.Encoding.utf8, allowLossyConversion: false)!, withName :"PersonalDetails.Gender")
             multipartFormData.append(NewUser.shared.remitterCategry.data(using: String.Encoding.utf8, allowLossyConversion: false)!, withName :"PersonalDetails.RemitterCategory")
             multipartFormData.append(NewUser.shared.politicalScope.data(using: String.Encoding.utf8, allowLossyConversion: false)!, withName :"PersonalDetails.PoliticalScope")
             multipartFormData.append(NewUser.shared.pepPosition.data(using: String.Encoding.utf8, allowLossyConversion: false)!, withName :"PersonalDetails.PEPPosition")
             
              multipartFormData.append(NewUser.shared.isPoliticallyExposed.data(using: String.Encoding.utf8, allowLossyConversion: false)!, withName :"PersonalDetails.IsPoliticallyExposed")
          //   let dataP : Data? = NewUser.shared.isPoliticallyExposed.description.data(using: .utf8)
            // multipartFormData.append(dataP!, withName: "PersonalDetails.IsPoliticallyExposed")
            
             
             
             multipartFormData.append(NewUser.shared.relationshipPEP.data(using: String.Encoding.utf8, allowLossyConversion: false)!, withName :"PersonalDetails.RelationshipPEP")
             
            if NewUser.shared.occupation != nil {
                
            }
            else {
                NewUser.shared.occupation = "Software Engineer"
            }
             
             multipartFormData.append(NewUser.shared.occupation.data(using: String.Encoding.utf8, allowLossyConversion: false)!, withName :"EmploymentDetails.Occupation")
             multipartFormData.append(NewUser.shared.employerName.data(using: String.Encoding.utf8, allowLossyConversion: false)!, withName :"EmploymentDetails.EmployerName")
             multipartFormData.append(NewUser.shared.employeeID.data(using: String.Encoding.utf8, allowLossyConversion: false)!, withName :"EmploymentDetails.EmployeeID")
             multipartFormData.append(NewUser.shared.employLocation.data(using: String.Encoding.utf8, allowLossyConversion: false)!, withName :"EmploymentDetails.EmployerLocation")
             multipartFormData.append(NewUser.shared.designation.data(using: String.Encoding.utf8, allowLossyConversion: false)!, withName :"EmploymentDetails.Designation")
             multipartFormData.append(NewUser.shared.salary.data(using: String.Encoding.utf8, allowLossyConversion: false)!, withName :"EmploymentDetails.Salary")
             multipartFormData.append(NewUser.shared.otherIncome.data(using: String.Encoding.utf8, allowLossyConversion: false)!, withName :"EmploymentDetails.OtherIncome")
             
             
             multipartFormData.append(NewUser.shared.serviceType.data(using: String.Encoding.utf8, allowLossyConversion: false)!, withName :"RemittanceDetails.TypeOfService")
             multipartFormData.append(NewUser.shared.purpose.data(using: String.Encoding.utf8, allowLossyConversion: false)!, withName :"RemittanceDetails.Purpose")
             
             
             multipartFormData.append(NewUser.shared.CountOfExpectedTxn.data(using: String.Encoding.utf8, allowLossyConversion: false)!, withName :"RemittanceDetails.CountOfExpectedTxn")
             multipartFormData.append(NewUser.shared.CountOfExpectedTxnMY.data(using: String.Encoding.utf8, allowLossyConversion: false)!, withName :"RemittanceDetails.CountOfExpectedTxnMY")
             multipartFormData.append(NewUser.shared.ValueForExpectedTxn.data(using: String.Encoding.utf8, allowLossyConversion: false)!, withName :"RemittanceDetails.ValueForExpectedTxn")
             multipartFormData.append(NewUser.shared.ValueForExpectedTxnMY.data(using: String.Encoding.utf8, allowLossyConversion: false)!, withName :"RemittanceDetails.ValueForExpectedTxnMY")
             
             
             multipartFormData.append(NewUser.shared.incomeSource.data(using: String.Encoding.utf8, allowLossyConversion: false)!, withName :"RemittanceDetails.SourceOfIncome")
             multipartFormData.append(NewUser.shared.averageIncome.data(using: String.Encoding.utf8, allowLossyConversion: false)!, withName :"RemittanceDetails.AverageYearIncome")
             
             
              multipartFormData.append("".data(using: String.Encoding.utf8, allowLossyConversion: false)!, withName :"RemitterCode")
               multipartFormData.append("3".data(using: String.Encoding.utf8, allowLossyConversion: false)!, withName :"RegistrationSource")
             
             
             
        /*     if  ExistingUser.shared.numberOfQuestions == "two" {
                 let AllQuetnAry:[[String:Any]] = [["securityQuestion": ExistingUser.shared.firstQuestn ?? "","answer": ExistingUser.shared.firstAnswer ?? ""],["securityQuestion": ExistingUser.shared.secndQuestn ?? "","answer": ExistingUser.shared.secndAnswer ?? ""]]*/
                 
                 let jsonData = try! JSONSerialization.data(withJSONObject: Global.shared.AllQuetnAry ?? [[:]], options: JSONSerialization.WritingOptions.fragmentsAllowed)
                 
                 self.userSecurityQuestionsList = NSString(data: jsonData, encoding: String.Encoding.utf8.rawValue)! as String
                 
                 print(self.userSecurityQuestionsList)
          /*   }
             else {
                 let AllQuetnAry:[[String:Any]] = [["securityQuestion": ExistingUser.shared.firstQuestn ?? "","answer": ExistingUser.shared.firstAnswer ?? ""],["securityQuestion": ExistingUser.shared.secndQuestn ?? "","answer": ExistingUser.shared.secndAnswer ?? ""],["securityQuestion": ExistingUser.shared.userQuestion ?? "","answer": ExistingUser.shared.userAnswer ?? ""]]
                 
                 let jsonData = try! JSONSerialization.data(withJSONObject: AllQuetnAry, options: JSONSerialization.WritingOptions.fragmentsAllowed)
                 
                 self.userSecurityQuestionsList = NSString(data: jsonData, encoding: String.Encoding.utf8.rawValue)! as String
                 
                 print(self.userSecurityQuestionsList)
             }*/
             
             multipartFormData.append(self.userSecurityQuestionsList.data(using: String.Encoding.utf8, allowLossyConversion: false)!, withName :"UserSecurityQuestionsList")
             
             
             multipartFormData.append(ExistingUser.shared.imgSelected.data(using: String.Encoding.utf8, allowLossyConversion: false)!, withName :"SecurityImage")
             
             
             multipartFormData.append(NewUser.shared.DocumentFrontSide.data(using: String.Encoding.utf8, allowLossyConversion: false)!, withName :"DocumentFrontSide")
             multipartFormData.append(NewUser.shared.DocumentFrontSideExtension.data(using: String.Encoding.utf8, allowLossyConversion: false)!, withName :"DocumentFrontSideExtension")
             multipartFormData.append(NewUser.shared.DocumentBackSide.data(using: String.Encoding.utf8, allowLossyConversion: false)!, withName :"DocumentBackSide")
             multipartFormData.append(NewUser.shared.DocumentBackSideExtension.data(using: String.Encoding.utf8, allowLossyConversion: false)!, withName :"DocumentBackSideExtension")
             
             
             multipartFormData.append(NewUser.shared.videoUrl as URL, withName:  "VideoFile")
             
             let username = Global.shared.newUserUserName ?? ""
             let pswd =  Global.shared.newUserPaswd ?? ""
             multipartFormData.append(username.data(using: String.Encoding.utf8, allowLossyConversion: false)!, withName :"RegistrModel.Username")
             multipartFormData.append(pswd.data(using: String.Encoding.utf8, allowLossyConversion: false)!, withName :"RegistrModel.Password")
             multipartFormData.append(NewUser.shared.email.data(using: String.Encoding.utf8, allowLossyConversion: false)!, withName :"RegistrModel.Email")
            
        //    let strIPAddress : String = self.getIPAddress()
            let ipAddress = try? String(contentsOf: URL(string: "https://api.ipify.org")!, encoding: .utf8)
                   print(ipAddress)
            let newIpAdress = ipAddress ?? ""
            multipartFormData.append(newIpAdress.data(using: String.Encoding.utf8, allowLossyConversion: false)!, withName :"ipAddress")
        
             
         }, to: CanvasUrls.baseUrl + CanvasUrls.versionNumber + CanvasUrls.newUserFinalApi, headers: headersHmac)
             .responseJSON { response in
                 debugPrint(response)
                 
                 self.removeSpinner()
                 let status = response.result
                 print(status)
                 
                 let jsonvalue = response.value as? NSDictionary
              //   print(jsonvalue)
                 let mesageCode = jsonvalue?.value(forKey: "messageCode") as? String
                let statusMsgg = jsonvalue?.value(forKey: "statusMessage") as? String ?? ""
                 if let statusCode = jsonvalue?.value(forKey: "statusCodes") as? Int {
                     
                     print(statusCode)
                     if(statusCode == 200) {
                         DispatchQueue.main.async {
                        
                                 let popOverVC = self.storyboard?.instantiateViewController(withIdentifier: "ProfileUnderReviewPopUp") as! ProfileUnderReviewPopUp
                                 self.addChild(popOverVC)
                                 popOverVC.view.frame = self.view.frame
                                 self.view.addSubview(popOverVC.view)
                                 popOverVC.didMove(toParent: self)
                        /*     }
                             
                             alert6.addAction(OKAction)
                             self.present(alert6, animated: true, completion: nil)*/
                         }
                         
                         
                     }
                         
                     else {
                     
                        let alert = ViewControllerManager.displayAlert(message: statusMsgg, title:APPLICATIONNAME)
                         self.present(alert, animated: true, completion: nil)
                         
                     }
                 }
                 
                 
                 
         }
         
         
     }
    
}

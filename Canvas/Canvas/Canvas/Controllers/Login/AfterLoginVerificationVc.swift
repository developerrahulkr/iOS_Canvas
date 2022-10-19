//
//  AfterLoginVerificationVc.swift
//  Canvas
//
//  Created by urmila reddy on 20/08/20.
//  Copyright © 2020 urmila reddy. All rights reserved.
//

import UIKit
import Alamofire

class AfterLoginVerificationVc: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var headerTxt: UILabel!
    
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var titleTxt: UILabel!
    
    @IBOutlet weak var securityImg: UIImageView!
    
   // @IBOutlet weak var checkBtnOtlt: UIButton!
    
    @IBOutlet weak var subTitleTxt: UILabel!
    
    
    @IBOutlet weak var verifyProceedBtnOtlt: UIButton!
    
    @IBOutlet weak var tryDiferentQuestnOtlt: UIButton!
    
    
    @IBOutlet weak var firstView: UIView!
    
    @IBOutlet weak var firstQuestnLbl: UILabel!
    
    @IBOutlet weak var firstAnswerField: UITextField!
    
    @IBOutlet weak var firstReqLbl: UILabel!
    
    @IBOutlet weak var secndView: UIView!
    
    @IBOutlet weak var secndQuestnLbl: UILabel!
    
    @IBOutlet weak var secndAnswerField: UITextField!
    
    @IBOutlet weak var secndReqLbl: UILabel!
    
    @IBOutlet weak var thirdView: UIView!
    
    @IBOutlet weak var thirdQuestnLbl: UILabel!
    
    @IBOutlet weak var thirdAnswerField: UITextField!
    
    @IBOutlet weak var thirdReqLbl: UILabel!
    
    @IBOutlet weak var fourthView: UIView!
    
    @IBOutlet weak var fourQuestnLbl: UILabel!
    
    @IBOutlet weak var fourQuestnField: UITextField!
    
    @IBOutlet weak var fourReqLbl: UILabel!
    
    @IBOutlet weak var fifthView: UIView!
    
    @IBOutlet weak var fifthQuestnLbl: UILabel!
    
    @IBOutlet weak var fifthQuestnField: UITextField!
    
    @IBOutlet weak var fifthReqLbl: UILabel!
    
    @IBOutlet weak var sixthView: UIView!
    
    @IBOutlet weak var sixQuestnLbl: UILabel!
    
    @IBOutlet weak var sixthQuestnField: UITextField!
    
    @IBOutlet weak var sixthReqLbl: UILabel!
    
    @IBOutlet weak var mainViewHeightConstrt: NSLayoutConstraint!
    
    @IBOutlet weak var tryAnotherTopConstrt: NSLayoutConstraint!
    
    @IBOutlet weak var validateQuestnsBtnOtlt: UIButton!
    
    
    
    var parameterListResponse = [Any]()
    var answersAry = [String]()
    
//    var checkMarkClicked:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Global.shared.ratePcountryNameData.removeAll()
        Global.shared.ratePcountryCodesData.removeAll()
        Global.shared.ratePcurrencyCodesData.removeAll()
        Global.shared.ratePcurrencyNameData.removeAll()
        Global.shared.ratePphoneCodesData.removeAll()
        Global.shared.ratePpickerResponseCountryData.removeAll()
        Global.shared.ratePpickerResponseOnlyCurrencyData.removeAll()
        Global.shared.ratePpickerResponseFullCurrencyNameData.removeAll()
        
        
        Global.shared.pickerResponseOnlyCurrencyDataWU.removeAll()
        Global.shared.pickerResponseFullCurrencyNameDataWU.removeAll()
        Global.shared.pickerResponseCountryDataWU.removeAll()
        Global.shared.pickerResponseOnlyCurrencyDataWUAdd.removeAll()
        Global.shared.pickerResponseFullCurrencyNameDataWUAdd.removeAll()
        Global.shared.pickerResponseCountryDataWUAdd.removeAll()
        Global.shared.pickerResponseOnlyCurrencyDataBankAdd.removeAll()
        Global.shared.pickerResponseFullCurrencyNameDataBankAdd.removeAll()
        Global.shared.pickerResponseCountryDataBankAdd.removeAll()
        Global.shared.pickerResponseOnlyCurrencyDataCashAdd.removeAll()
        Global.shared.pickerResponseFullCurrencyNameDataCashAdd.removeAll()
        Global.shared.pickerResponseCountryDataCashAdd.removeAll()
        Global.shared.ratePpickerResponseOnlyCurrencyData.removeAll()
        Global.shared.ratePpickerResponseFullCurrencyNameData.removeAll()
        Global.shared.ratePpickerResponseCountryData.removeAll()
        Global.shared.pickerResponseOnlyCurrencyDataBank.removeAll()
        Global.shared.pickerResponseFullCurrencyNameDataBank.removeAll()
        Global.shared.pickerResponseCountryDataBank.removeAll()
        
        Global.shared.pickerResponseOnlyCurrencyDataFc.removeAll()
        Global.shared.pickerResponseFullCurrencyNameDataFc.removeAll()
        Global.shared.pickerResponseCountryDataFc.removeAll()
        
        // Do any additional setup after loading the view.
        UserDefaults.standard.set("grid", forKey: "enableListView")
        Global.shared.fromListGrid = "grid"
        
        firstReqLbl.font = Global.shared.fontReqLbl
               firstReqLbl.textColor = ColorCodes.newAppRed
        
        secndReqLbl.font = Global.shared.fontReqLbl
               secndReqLbl.textColor = ColorCodes.newAppRed
        
        thirdReqLbl.font = Global.shared.fontReqLbl
               thirdReqLbl.textColor = ColorCodes.newAppRed
        
        fourReqLbl.font = Global.shared.fontReqLbl
               fourReqLbl.textColor = ColorCodes.newAppRed
        
        fifthReqLbl.font = Global.shared.fontReqLbl
               fifthReqLbl.textColor = ColorCodes.newAppRed
        
        sixthReqLbl.font = Global.shared.fontReqLbl
               sixthReqLbl.textColor = ColorCodes.newAppRed
        
  
        validateQuestnsBtnOtlt.makeButtonFitToContent(buttonTitle: validateQuestnsBtnOtlt)
        tryDiferentQuestnOtlt.makeButtonFitToContent(buttonTitle: tryDiferentQuestnOtlt)
        
        validateQuestnsBtnOtlt.setTitle(Global.shared.restQuestnsTxt, for: .normal)
        
        
        firstAnswerField.delegate = self
        firstView.layer.cornerRadius = 5
        secndView.layer.cornerRadius = 5
        thirdView.layer.cornerRadius = 5
        fourthView.layer.cornerRadius = 5
        fifthView.layer.cornerRadius = 5
        
        mainView.layer.cornerRadius = 5
        titleTxt.layer.cornerRadius = 5
        verifyProceedBtnOtlt.layer.cornerRadius = 5
        Global.shared.questionAryCount = Global.shared.afterLoginSecurityQuestnsList.count
        
        if Global.shared.questionAryCount == 6 {
            displayQuestionsAccordingly(AryCount: 6, heightConstant: 670, topConstant: 430, firstViewH: false, secndViewH: false, thirdViewH: false, fourthViewH: false, fifthViewH: false, sixthViewH: false)
            firstQuestnLbl.text = Global.shared.afterLoginSecurityQuestnsList[0]
            secndQuestnLbl.text = Global.shared.afterLoginSecurityQuestnsList[1]
            thirdQuestnLbl.text = Global.shared.afterLoginSecurityQuestnsList[2]
            fourQuestnLbl.text = Global.shared.afterLoginSecurityQuestnsList[3]
            fifthQuestnLbl.text = Global.shared.afterLoginSecurityQuestnsList[4]
            sixQuestnLbl.text = Global.shared.afterLoginSecurityQuestnsList[5]
            
        } else  if Global.shared.questionAryCount == 5 {
            displayQuestionsAccordingly(AryCount: 5, heightConstant: 570, topConstant: 330, firstViewH: false, secndViewH: false, thirdViewH: false, fourthViewH: false, fifthViewH: false, sixthViewH: true)
            firstQuestnLbl.text = Global.shared.afterLoginSecurityQuestnsList[0]
            secndQuestnLbl.text = Global.shared.afterLoginSecurityQuestnsList[1]
            thirdQuestnLbl.text = Global.shared.afterLoginSecurityQuestnsList[2]
            fourQuestnLbl.text = Global.shared.afterLoginSecurityQuestnsList[3]
            fifthQuestnLbl.text = Global.shared.afterLoginSecurityQuestnsList[4]
            
            
        } else  if Global.shared.questionAryCount == 4 {
            displayQuestionsAccordingly(AryCount: 4, heightConstant: 490, topConstant: 250, firstViewH: false, secndViewH: false, thirdViewH: false, fourthViewH: false, fifthViewH: true, sixthViewH: true)
            firstQuestnLbl.text = Global.shared.afterLoginSecurityQuestnsList[0]
            secndQuestnLbl.text = Global.shared.afterLoginSecurityQuestnsList[1]
            thirdQuestnLbl.text = Global.shared.afterLoginSecurityQuestnsList[2]
            fourQuestnLbl.text = Global.shared.afterLoginSecurityQuestnsList[3]
            
        } else  if Global.shared.questionAryCount == 3 {
            displayQuestionsAccordingly(AryCount: 3, heightConstant: 410, topConstant: 170, firstViewH: false, secndViewH: false, thirdViewH: false, fourthViewH: true, fifthViewH: true, sixthViewH: true)
            firstQuestnLbl.text = Global.shared.afterLoginSecurityQuestnsList[0]
            secndQuestnLbl.text = Global.shared.afterLoginSecurityQuestnsList[1]
            thirdQuestnLbl.text = Global.shared.afterLoginSecurityQuestnsList[2]
            
            
        } else  if Global.shared.questionAryCount == 2 {
            displayQuestionsAccordingly(AryCount: 2, heightConstant: 330, topConstant: 90, firstViewH: false, secndViewH: false, thirdViewH: true, fourthViewH: true, fifthViewH: true, sixthViewH: true)
            firstQuestnLbl.text = Global.shared.afterLoginSecurityQuestnsList[0]
            secndQuestnLbl.text = Global.shared.afterLoginSecurityQuestnsList[1]
            
        } else  if Global.shared.questionAryCount == 1 {
            displayQuestionsAccordingly(AryCount: 1, heightConstant: 260, topConstant: 5, firstViewH: false, secndViewH: true, thirdViewH: true, fourthViewH: true, fifthViewH: true, sixthViewH: true)
            firstQuestnLbl.text = Global.shared.afterLoginSecurityQuestnsList[0]
        } else  {
          /*  displayQuestionsAccordingly(AryCount: 1, heightConstant: 260, topConstant: 5, firstViewH: false, secndViewH: true, thirdViewH: true, fourthViewH: true, fifthViewH: true, sixthViewH: true)
            firstQuestnLbl.text = Global.shared.afterLoginSecurityQuestnsList[0]*/
            print("nothing")
            
        }
        
        assignLabels()
    }
    
    
    func displayQuestionsAccordingly(AryCount: Int, heightConstant: Int, topConstant: Int, firstViewH: Bool, secndViewH: Bool, thirdViewH: Bool, fourthViewH: Bool, fifthViewH: Bool, sixthViewH: Bool) {
        mainViewHeightConstrt.constant = CGFloat(heightConstant)
        tryAnotherTopConstrt.constant = CGFloat(topConstant)
        firstView.isHidden = firstViewH
        secndView.isHidden = secndViewH
        thirdView.isHidden = thirdViewH
        fourthView.isHidden = fourthViewH
        fifthView.isHidden = fifthViewH
        sixthView.isHidden = sixthViewH
    }
    
    var reqTxt = Global.shared.securityAnswerTxt + " " + Global.shared.errorTxtRequired.lowercased()
    
    func assignLabels() {
        headerTxt.text = Global.shared.securityVerfictnTxt
        titleTxt.text = Global.shared.verifySecurityImg
      
        verifyProceedBtnOtlt.setTitle(Global.shared.verifyProceedAfterLogin, for: .normal)
     
        subTitleTxt.adjustsFontSizeToFitWidth = true
        if LocalizationSystem.sharedInstance.getLanguage() == "ar" {
            //    if textAlignment == .natural {
            subTitleTxt.textAlignment = .right
          
        }
        let newSubtitle = Global.shared.securityimglblOne + "\n" + Global.shared.securityimglblTwo + "\n" + Global.shared.securityimglblThree
        
        subTitleTxt.text = newSubtitle
    
        tryDiferentQuestnOtlt.setTitle(Global.shared.tryAnotherQuestnTxt, for: .normal)
        
        let image1 = Global.shared.afterLoginSecurityImg.base64ToImage()
        self.securityImg.image = image1
        
        firstReqLbl.text = reqTxt
        secndReqLbl.text = reqTxt
        thirdReqLbl.text = reqTxt
        fourReqLbl.text = reqTxt
        fifthReqLbl.text = reqTxt
        sixthReqLbl.text = reqTxt
       
        self.removeSpinner()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
       if Global.shared.logoutValue == 1
       {
           Global.shared.logoutValue = 0
           self.navigationController?.popViewController(animated: false)
       }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @IBAction func verifyProceedBtnActn(_ sender: Any) {
        self.parameterListResponse.removeAll()
        if firstAnswerField.text == "" {
            firstReqLbl.isHidden = false
           
        } else if firstAnswerField.text == ""  {
            firstReqLbl.isHidden = false
            
        }
        else {
            
            self.showSpinner(onView: self.view)
            
            //   let vc = self.storyboard?.instantiateViewController(identifier: "ExistingCustomerVc") as! ExistingCustomerVc
            //    self.navigationController?.pushViewController(vc, animated: true)
            if Global.shared.questionAryCount == 6 {
                let questnsList:[[String:Any]] = [
                    ["securityQuestionId": Global.shared.afterLoginSecurityIdList[0] ,"securityQuestion": "\(Global.shared.afterLoginSecurityQuestnsList[0])" , "answer": firstAnswerField.text ?? ""],
                    ["securityQuestionId": Global.shared.afterLoginSecurityIdList[1] ,"securityQuestion": "\(Global.shared.afterLoginSecurityQuestnsList[1])" , "answer": secndAnswerField.text ?? ""],
                    ["securityQuestionId": Global.shared.afterLoginSecurityIdList[2] ,"securityQuestion": "\(Global.shared.afterLoginSecurityQuestnsList[2])" , "answer": thirdAnswerField.text ?? ""],
                    ["securityQuestionId": Global.shared.afterLoginSecurityIdList[3] ,"securityQuestion": "\(Global.shared.afterLoginSecurityQuestnsList[3])" , "answer": fourQuestnField.text ?? ""],
                    ["securityQuestionId": Global.shared.afterLoginSecurityIdList[4] ,"securityQuestion": "\(Global.shared.afterLoginSecurityQuestnsList[4])" , "answer": fifthQuestnField.text ?? ""],
                    ["securityQuestionId": Global.shared.afterLoginSecurityIdList[5] ,"securityQuestion": "\(Global.shared.afterLoginSecurityQuestnsList[5])" , "answer": sixthQuestnField.text ?? ""]]
                
                self.parameterListResponse = questnsList
           
                checkBioOrNormalLogin()
            } else  if Global.shared.questionAryCount == 5 {
                let questnsList:[[String:Any]] = [
                    ["securityQuestionId": Global.shared.afterLoginSecurityIdList[0] ,"securityQuestion": "\(Global.shared.afterLoginSecurityQuestnsList[0])" , "answer": firstAnswerField.text ?? ""],
                    ["securityQuestionId": Global.shared.afterLoginSecurityIdList[1] ,"securityQuestion": "\(Global.shared.afterLoginSecurityQuestnsList[1])" , "answer": secndAnswerField.text ?? ""],
                    ["securityQuestionId": Global.shared.afterLoginSecurityIdList[2] ,"securityQuestion": "\(Global.shared.afterLoginSecurityQuestnsList[2])" , "answer": thirdAnswerField.text ?? ""],
                    ["securityQuestionId": Global.shared.afterLoginSecurityIdList[3] ,"securityQuestion": "\(Global.shared.afterLoginSecurityQuestnsList[3])" , "answer": fourQuestnField.text ?? ""],
                    ["securityQuestionId": Global.shared.afterLoginSecurityIdList[4] ,"securityQuestion": "\(Global.shared.afterLoginSecurityQuestnsList[4])" , "answer": fifthQuestnField.text ?? ""]]
                
               self.parameterListResponse = questnsList
                
             //   loginVerification()
                checkBioOrNormalLogin()
            } else  if Global.shared.questionAryCount == 4 {
                let questnsList:[[String:Any]] = [
                    ["securityQuestionId": Global.shared.afterLoginSecurityIdList[0] ,"securityQuestion": "\(Global.shared.afterLoginSecurityQuestnsList[0])" , "answer": firstAnswerField.text ?? ""],
                    ["securityQuestionId": Global.shared.afterLoginSecurityIdList[1] ,"securityQuestion": "\(Global.shared.afterLoginSecurityQuestnsList[1])" , "answer": secndAnswerField.text ?? ""],
                    ["securityQuestionId": Global.shared.afterLoginSecurityIdList[2] ,"securityQuestion": "\(Global.shared.afterLoginSecurityQuestnsList[2])" , "answer": thirdAnswerField.text ?? ""],
                    ["securityQuestionId": Global.shared.afterLoginSecurityIdList[3] ,"securityQuestion": "\(Global.shared.afterLoginSecurityQuestnsList[3])" , "answer": fourQuestnField.text ?? ""]]
               self.parameterListResponse = questnsList
                
               // loginVerification()
                checkBioOrNormalLogin()
            } else  if Global.shared.questionAryCount == 3 {
                let questnsList:[[String:Any]] = [
                    ["securityQuestionId": Global.shared.afterLoginSecurityIdList[0] ,"securityQuestion": "\(Global.shared.afterLoginSecurityQuestnsList[0])" , "answer": firstAnswerField.text ?? ""],
                    ["securityQuestionId": Global.shared.afterLoginSecurityIdList[1] ,"securityQuestion": "\(Global.shared.afterLoginSecurityQuestnsList[1])" , "answer": secndAnswerField.text ?? ""],
                    ["securityQuestionId": Global.shared.afterLoginSecurityIdList[2] ,"securityQuestion": "\(Global.shared.afterLoginSecurityQuestnsList[2])" , "answer": thirdAnswerField.text ?? ""]]
               self.parameterListResponse = questnsList
                
               // loginVerification()
                checkBioOrNormalLogin()
            } else  if Global.shared.questionAryCount == 2 {
                
                let questnsList:[[String:Any]] = [
                    ["securityQuestionId": Global.shared.afterLoginSecurityIdList[0] ,"securityQuestion": "\(Global.shared.afterLoginSecurityQuestnsList[0])" , "answer": firstAnswerField.text ?? ""],
                    ["securityQuestionId": Global.shared.afterLoginSecurityIdList[1] ,"securityQuestion": "\(Global.shared.afterLoginSecurityQuestnsList[1])" , "answer": secndAnswerField.text ?? ""]]
                self.parameterListResponse = questnsList
                
             //   loginVerification()
                checkBioOrNormalLogin()
                
            } else  if Global.shared.questionAryCount == 1 {
                let questnsList:[[String:Any]] = [
                    ["securityQuestionId": Global.shared.afterLoginSecurityIdList[0] ,"securityQuestion": "\(Global.shared.afterLoginSecurityQuestnsList[0])" , "answer": firstAnswerField.text ?? ""]]
                self.parameterListResponse = questnsList
                
              //  loginVerification()
                checkBioOrNormalLogin()
            }
            else  {
              print("nothing")
                checkBioOrNormalLogin()
           }
            
        }
    }
    
    // MARK: To check whether it is normal login or biometric and do verification
    func checkBioOrNormalLogin() {
        if Global.shared.biometricNormalLogin == "Login" {
            loginVerification()
        }
        else {
            biometricVerification()
        }
    }
    
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        //doneAction()
        if textField == firstAnswerField{
            if firstAnswerField.text!.count ==  0 {
                firstReqLbl.isHidden = false
            }
            else {
                firstReqLbl.isHidden = true
            }
        }
        
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField == firstAnswerField {
            if firstAnswerField.text!.count <= -1 {
                firstReqLbl.isHidden = false
            }
            else {
                firstReqLbl.isHidden = true
            }
        }
        
        return true
        
    }
 
    // MARK: Biometric verification
    func biometricVerification() {
    
    let paramaterPasing: [String:Any] = ["identityId": UIDevice.current.identifierForVendor?.uuidString ?? " ",
    "registrationId": Global.shared.afterLoginRegistrtnId ?? "",
    "securityQuestionsList": self.parameterListResponse]
    
    let headers: HTTPHeaders = [
    "Content-Type": "application/json"
    ]
    
    NetWorkDataManager.sharedInstance.verifyLoginbiometricImplementation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
    
    if errorString == nil
    {
    
    print(resonseTal!)
        let statusMsg = resonseTal?.value(forKey: "statusMessage") as? String ?? ""
    let mesageCode = resonseTal?.value(forKey: "messageCode") as? String ?? statusMsg
    if let statusCode = resonseTal?.value(forKey: "statusCodes") as? Int {
    
    if(statusCode == 200) {
 
       let remitterStatus = resonseTal?.value(forKey: "remitterStatus") as? Int
       let remiterStr = String(remitterStatus ?? 1)
       UserDefaults.standard.set(remiterStr, forKey: "remitterStatus")
        
       let civilIDExpiryDate = resonseTal?.value(forKey: "civilIDExpiryDate") as? String
       UserDefaults.standard.set(civilIDExpiryDate, forKey: "civilIDExpiryDate")
    
       let token = resonseTal?.value(forKey: "token") as? String
       UserDefaults.standard.set(token, forKey: "token")
    
       let registrationId = resonseTal?.value(forKey: "registrationId") as? String
       UserDefaults.standard.set(registrationId, forKey: "registrationId")
    
       let username = resonseTal?.value(forKey: "username") as? String
       UserDefaults.standard.set(username, forKey: "username")
       
       let imageName = resonseTal?.value(forKey: "imageName") as? String
       UserDefaults.standard.set(imageName, forKey: "imageName")
       
       let randomColour = resonseTal?.value(forKey: "randomColour") as? String
       UserDefaults.standard.set(randomColour, forKey: "randomColour")
    
       let displayName = resonseTal?.value(forKey: "displayName") as? String
       UserDefaults.standard.set(displayName, forKey: "displayName")
    
       let email = resonseTal?.value(forKey: "email") as? String
       UserDefaults.standard.set(email, forKey: "displayEmail")
       
       let mobile = resonseTal?.value(forKey: "mobile") as? String
       UserDefaults.standard.set(mobile, forKey: "displayMobile")
        
        let salute = resonseTal?.value(forKey: "salutation") as? String
        UserDefaults.standard.set(salute, forKey: "salutation")
        
        let fName = resonseTal?.value(forKey: "firstName") as? String
        UserDefaults.standard.set(fName, forKey: "firstName")
        
        let lName = resonseTal?.value(forKey: "lastName") as? String
        UserDefaults.standard.set(lName, forKey: "lastName")
       
       let lastLogin = resonseTal?.value(forKey: "lastLogin") as? String
       UserDefaults.standard.set(lastLogin, forKey: "lastLogin")
       
       let profileImg = resonseTal?.value(forKey: "profileImage") as? String ?? ""
       UserDefaults.standard.set(profileImg, forKey: "profileImage")
        
        let remitterStatusMess = resonseTal?.value(forKey: "remitterStatusMessage") as? String ?? ""
        UserDefaults.standard.set(remitterStatusMess, forKey: "remitterStatusMessage")
        
        NetWorkDataManager.sharedInstance.setTokenValue()
       
       self.loginTrack()
     
       self.removeSpinner()
       
       //FIXME::-remember below 2 lines when presenting
       
  //   let customTabBarVc: CustomTabBarVc = .initiateController()
  //   self.present(customTabBarVc, animated: true, completion: nil)
       
       
       
     //  let customTabBarVc: CustomTabBarVc = .initiateController()
     //  CustomTabBarVc.initiateController()
       self.presentController(controller: CustomTabBarVc.initiateController())
       
//        let vc = self.storyboard?.instantiateViewController(identifier: "CustomTabBarVc") as! CustomTabBarVc
//        vc.modalPresentationStyle = .fullScreen
//        self.present(vc, animated: true, completion: nil)
  //  }
    
//     alert6.addAction(OKAction)
//    self.present(alert6, animated: true, completion: nil)
    
    }
    
    else {
       self.removeSpinner()
  
        let alert = ViewControllerManager.displayAlert(message:Global.shared.messageCodeType(text: mesageCode), title:APPLICATIONNAME)
    self.present(alert, animated: true, completion: nil)
       self.removeSpinner()
    
    }
    
    }
    
    }
    
    else
    {
    print(errorString!)
    self.removeSpinner()
    let finalError = errorString?.components(separatedBy: ":")
        if finalError?.count == 2
        {
           let alert = ViewControllerManager.displayAlert(message: finalError?[1] ?? "", title:APPLICATIONNAME)
            self.present(alert, animated: true, completion: nil)
        }
        else
        {
            let alert = ViewControllerManager.displayAlert(message: errorString ?? "", title:APPLICATIONNAME)
            self.present(alert, animated: true, completion: nil)
        }
//    let alert = ViewControllerManager.displayAlert(message: finalError?[1] ?? "", title:APPLICATIONNAME)
//    self.present(alert, animated: true, completion: nil)
    
    }
    }
    
    }
    
    // MARK: For normal login verification
     func loginVerification() {
     
     let paramaterPasing: [String:Any] = ["username": Global.shared.afterLoginUserName ?? "",
     "password": Global.shared.afterLoginPaswd ?? "",
     "registrationId": Global.shared.afterLoginRegistrtnId ?? "",
     "securityQuestionsList": self.parameterListResponse]
   
     let headers: HTTPHeaders = [
     "Content-Type": "application/json"
     ]
     
     NetWorkDataManager.sharedInstance.loginVerificationImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
     
     if errorString == nil
     {
     
     print(resonseTal!)
     
        let statusMsg = resonseTal?.value(forKey: "statusMessage") as? String ?? ""
        let mesageCode = resonseTal?.value(forKey: "messageCode") as? String ?? statusMsg
     if let statusCode = resonseTal?.value(forKey: "statusCodes") as? Int {
     
     if(statusCode == 200) {
     
  
     
//        let remitterStatus = resonseTal?.value(forKey: "remitterStatus") as? Int
//        let remiterStr = String(remitterStatus ?? 1)
//        UserDefaults.standard.set(remiterStr, forKey: "remitterStatus")
        
        let civilIDExpiryDate = resonseTal?.value(forKey: "civilIDExpiryDate") as? String
        UserDefaults.standard.set(civilIDExpiryDate, forKey: "civilIDExpiryDate")
     
     let token = resonseTal?.value(forKey: "token") as? String
     UserDefaults.standard.set(token, forKey: "token")
         
         let token1 = UserDefaults.standard.object(forKey: "token") as! String
         
         print("token is :\(token1)  xyz")

     
        let registrationId = resonseTal?.value(forKey: "registrationId") as? String
        UserDefaults.standard.set(registrationId, forKey: "registrationId")
     
        let username = resonseTal?.value(forKey: "username") as? String
        UserDefaults.standard.set(username, forKey: "username")
        
        let imageName = resonseTal?.value(forKey: "imageName") as? String
        UserDefaults.standard.set(imageName, forKey: "imageName")
        
        let randomColour = resonseTal?.value(forKey: "randomColour") as? String
        UserDefaults.standard.set(randomColour, forKey: "randomColour")
     
        let displayName = resonseTal?.value(forKey: "displayName") as? String
        UserDefaults.standard.set(displayName, forKey: "displayName")
     
        let email = resonseTal?.value(forKey: "email") as? String
        UserDefaults.standard.set(email, forKey: "displayEmail")
        
        let mobile = resonseTal?.value(forKey: "mobile") as? String
        UserDefaults.standard.set(mobile, forKey: "displayMobile")
         
         let salute = resonseTal?.value(forKey: "salutation") as? String
         UserDefaults.standard.set(salute, forKey: "salutation")
         
         let fName = resonseTal?.value(forKey: "firstName") as? String
         UserDefaults.standard.set(fName, forKey: "firstName")
         
         let lName = resonseTal?.value(forKey: "lastName") as? String
         UserDefaults.standard.set(lName, forKey: "lastName")
        
        let lastLogin = resonseTal?.value(forKey: "lastLogin") as? String
        UserDefaults.standard.set(lastLogin, forKey: "lastLogin")
         
         let remId = resonseTal?.value(forKey: "remId") as? String
         UserDefaults.standard.set(remId, forKey: "remId")

        
        let profileImg = resonseTal?.value(forKey: "profileImage") as? String ?? ""
        UserDefaults.standard.set(profileImg, forKey: "profileImage")
        
        let remitterStat = resonseTal?.value(forKey: "remitterStatus") as? Int ?? 123
        UserDefaults.standard.set(remitterStat, forKey: "remitterStatus")
        
        let remitterStatusMess = resonseTal?.value(forKey: "remitterStatusMessage") as? String ?? ""
        UserDefaults.standard.set(remitterStatusMess, forKey: "remitterStatusMessage")
        
         NetWorkDataManager.sharedInstance.setTokenValue()
                
        self.loginTrack()
        self.removeSpinner()
        
        self.presentController(controller: CustomTabBarVc.initiateController())
  
     }
     
     else {
        self.removeSpinner()
     let alert = ViewControllerManager.displayAlert(message:Global.shared.messageCodeType(text: mesageCode), title:APPLICATIONNAME)
     self.present(alert, animated: true, completion: nil)
        self.removeSpinner()
     
     }
     
     }
     
     }
     
     else
     {
     print(errorString!)
     self.removeSpinner()
     let finalError = errorString?.components(separatedBy: ":")
        if finalError?.count == 2
        {
           let alert = ViewControllerManager.displayAlert(message: finalError?[1] ?? "", title:APPLICATIONNAME)
            self.present(alert, animated: true, completion: nil)
        }
        else
        {
            let alert = ViewControllerManager.displayAlert(message: errorString ?? "", title:APPLICATIONNAME)
            self.present(alert, animated: true, completion: nil)
        }
        
//     let alert = ViewControllerManager.displayAlert(message: finalError?[1] ?? "", title:APPLICATIONNAME)
//     self.present(alert, animated: true, completion: nil)
     
     }
     }
     
     }
    
    // MARK: Sending device details like os version, fcm token, deviceUdid & ip adress
    func loginTrack() {
        
        let apiUlr = CanvasUrls.baseUrl +  CanvasUrls.versionNumber + CanvasUrls.loginTrack
        let url = NSURL(string:  apiUlr)
        
        let deviceDetails: [String:Any] = ["deviceUDID": UIDevice.current.identifierForVendor?.uuidString ?? " ",
                                           "osVersion": UIDevice.current.systemVersion, "deviceToken":UserDefaults.standard.string(forKey: "fcmToken") ?? "","browserDetails":""]
    
        let ipAddress = try? String(contentsOf: URL(string: "https://api.ipify.org")!, encoding: .utf8)
             //  print(ipAddress)
        let newIpAdress = ipAddress ?? ""
       
        let postParams:[String:Any] = ["registrationId": Global.shared.afterLoginRegistrtnId ?? "",
                                       "loginSource": 3, "ipAddress": newIpAdress,
                                       "deviseDetails": deviceDetails]
    
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
                    
                    if let statusCode = jsonobj.value(forKey: "statusCodes") as? Int {
                        
                        print(statusCode)
                        
                    }
                    
                }
            } catch let error {
                
                print(error.localizedDescription)
            }
        })
        task.resume()
    }
    
    
    // MARK: Refresh questions
    func generateSecurityQuestions() {
        
        
        let paramaterPasing: [String:Any] = ["registrationId": Global.shared.afterLoginRegistrtnId ?? "",
                                             "questionIds":  Global.shared.afterLoginSecurityIdListString ]
      
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        NetWorkDataManager.sharedInstance.generateSecurityQuestionsImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            
            if errorString == nil
            {
                
               print(resonseTal!)
              
                if let securityQuestionsData = resonseTal?.value(forKey: "securityQuestionsList") as? NSArray {
                    print(securityQuestionsData)
                    if let securityQuestion = securityQuestionsData.value(forKey: "securityQuestion") as? [String] {
                        if securityQuestion.count < 1 {
                           print("do nothing")
                        }
                        else {
                        Global.shared.afterLoginSecurityQuestnsList = securityQuestion
                        }
                    }
                    if let securityQuestionId = securityQuestionsData.value(forKey: "securityQuestionId") as? [Int] {
                        if securityQuestionId.count < 1 {
                           print("do nothing")
                        }
                        else {
                        Global.shared.afterLoginSecurityIdList = securityQuestionId
                        
                        Global.shared.afterLoginSecurityIdListString = Global.shared.afterLoginSecurityIdList.map(String.init)
                            self.viewDidLoad()
                        }
                    }
                    
                    
                }
                
                
                
            }
                
            else
            {
                print(errorString!)
                self.removeSpinner()
                let finalError = errorString?.components(separatedBy: ":")
                if finalError?.count == 2
                {
                   let alert = ViewControllerManager.displayAlert(message: finalError?[1] ?? "", title:APPLICATIONNAME)
                    self.present(alert, animated: true, completion: nil)
                }
                else
                {
                    let alert = ViewControllerManager.displayAlert(message: errorString ?? "", title:APPLICATIONNAME)
                    self.present(alert, animated: true, completion: nil)
                }
//                let alert = ViewControllerManager.displayAlert(message: finalError?[1] ?? "", title:APPLICATIONNAME)
//                self.present(alert, animated: true, completion: nil)
              
            }
        }
        
    }
    
    
    
    
    @IBAction func bckBtnActn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func tryDIfferentQuestnActn(_ sender: Any) {
        generateSecurityQuestions()
    }
    
    
    @IBAction func langugeChangeActn(_ sender: Any) {
        
    Global.shared.languageChangeActn()
    }
    
    @IBAction func validateQuestnsActn(_ sender: Any) {
        let popOverVC = self.storyboard?.instantiateViewController(withIdentifier: "SecurityQuestnOtpPopUp") as! SecurityQuestnOtpPopUp
        self.addChild(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParent: self)
    }
    
    
}

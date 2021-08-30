//
//  ProfileIdentityVc.swift
//  Canvas
//
//  Created by urmila reddy on 07/10/20.
//  Copyright © 2020 urmila reddy. All rights reserved.
//

import UIKit
import Alamofire

class ProfileIdentityVc: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var scrollVieww: UIScrollView!
    
    @IBOutlet weak var backgrndImg: UIImageView!
    
    @IBOutlet weak var labelOne: UILabel!
    
    @IBOutlet weak var labelTwo: UILabel!
    
    @IBOutlet weak var labelThree: UILabel!
    
    @IBOutlet weak var labelFour: UILabel!
    
    @IBOutlet weak var headerLbl: UILabel!
    
    @IBOutlet weak var firstView: UIView!
    
    @IBOutlet weak var civilIdLbl: UILabel!
    
    @IBOutlet weak var civilIdAnswerLbl: UILabel!
    
    @IBOutlet weak var secndView: UIView!
    
    @IBOutlet weak var idNumberLbl: UILabel!
    
    @IBOutlet weak var idNumberField: CustomTextField!
    
    @IBOutlet weak var thirdView: UIView!
    
    @IBOutlet weak var idIsuueDateLbl: UILabel!
    
    @IBOutlet weak var idIssueAnswerLbl: UILabel!
    
    @IBOutlet weak var fourthView: UIView!
    
    @IBOutlet weak var idExpiryDateLbl: UILabel!
    
    @IBOutlet weak var idExpiryAnswerLbl: UILabel!
    
    @IBOutlet weak var fifthView: UIView!
    
    @IBOutlet weak var countryOfIssueLbl: UILabel!
    
    @IBOutlet weak var countryOfAnswerLbl: UILabel!
    
    @IBOutlet weak var sixthView: UIView!
    
    @IBOutlet weak var placeOfIssueLbl: UILabel!
    
    
    @IBOutlet weak var placeOfAnswerField: CustomTextField!
    
    @IBOutlet weak var nextBtnOtlt: UIButton!
    
    @IBOutlet weak var bckBtnOtlt: UIButton!
    
    
    @IBOutlet weak var secndTabOneLbl: UILabel!
    
    @IBOutlet weak var secndTabTwoLbl: UILabel!
    
    @IBOutlet weak var secndTabThreeLbl: UILabel!
    
    @IBOutlet weak var secndTabFourLbl: UILabel!
    
    @IBOutlet weak var identityTypeReqLbl: UILabel!
    
    @IBOutlet weak var idNumReqLbl: UILabel!
    
    @IBOutlet weak var idIssueDateReqLbl: UILabel!
    
    
    @IBOutlet weak var idIssueExpireReqLbl: UILabel!
    
    
    @IBOutlet weak var countryOfIsueReqLbl: UILabel!
    
    @IBOutlet weak var placeOfIsueReqLbl: UILabel!
    
    
    @IBOutlet weak var pdTwelveView: UIView!
    
    @IBOutlet weak var mobileNumberLbl: UILabel!
    
    @IBOutlet weak var mobileNumberField: CustomTextField!
    
    @IBOutlet weak var pdThirteenView: UIView!
    
    @IBOutlet weak var telephonelbl: UILabel!
    
    @IBOutlet weak var telephoneField: CustomTextField!
    
    @IBOutlet weak var pdFourteenView: UIView!
    
    @IBOutlet weak var emailIDLbl: UILabel!
    
    @IBOutlet weak var emailIdField: CustomTextField!
    
    @IBOutlet weak var mobileNumberReqLbl: UILabel!
    
    @IBOutlet weak var telephnReqLbl: UILabel!
    
    @IBOutlet weak var emailReqLbl: UILabel!
    
    
    var identityIsuue = ""
    var identityExpire = ""
    
    var idNumberMinLength = 5
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        identityTypeReqLbl.font = Global.shared.fontReqLbl
        identityTypeReqLbl.textColor = ColorCodes.newAppRed
        
        idIssueDateReqLbl.font = Global.shared.fontReqLbl
        idIssueDateReqLbl.textColor = ColorCodes.newAppRed
        
        idIssueExpireReqLbl.font = Global.shared.fontReqLbl
        idIssueExpireReqLbl.textColor = ColorCodes.newAppRed
        
        countryOfIsueReqLbl.font = Global.shared.fontReqLbl
        countryOfIsueReqLbl.textColor = ColorCodes.newAppRed
        
        placeOfIsueReqLbl.font = Global.shared.fontReqLbl
        placeOfIsueReqLbl.textColor = ColorCodes.newAppRed
        
        mobileNumberReqLbl.font = Global.shared.fontReqLbl
        mobileNumberReqLbl.textColor = ColorCodes.newAppRed
        
        telephnReqLbl.font = Global.shared.fontReqLbl
        telephnReqLbl.textColor = ColorCodes.newAppRed
        
        emailReqLbl.font = Global.shared.fontReqLbl
        emailReqLbl.textColor = ColorCodes.newAppRed
        
        idNumberField.isEnabled = false
        placeOfAnswerField.isEnabled = false
        mobileNumberField.isEnabled = false
        telephoneField.isEnabled = false
        emailIdField.isEnabled = false
        
        
        
        self.scrollVieww.backgroundColor = UIColor(patternImage: UIImage(named: "AppBckgroundImg")!)
        self.mainView.backgroundColor = UIColor(patternImage: UIImage(named: "AppBckgroundImg")!)
        
        firstView.layer.cornerRadius = 5
        secndView.layer.cornerRadius = 5
        thirdView.layer.cornerRadius = 5
        fourthView.layer.cornerRadius = 5
        fifthView.layer.cornerRadius = 5
        sixthView.layer.cornerRadius = 5
        nextBtnOtlt.layer.cornerRadius = 5
        bckBtnOtlt.layer.cornerRadius = 5
        
        idNumberField.delegate = self
        placeOfAnswerField.delegate = self
        
        mobileNumberField.delegate = self
        telephoneField.delegate = self
        emailIdField.delegate = self
        
        pdTwelveView.layer.cornerRadius = 5
        pdThirteenView.layer.cornerRadius = 5
        pdFourteenView.layer.cornerRadius = 5
        
        idNumberField.maxLength = 10
        
        //  self.countryOfAnswerLbl.text = "KUWAIT"
        //  ProfileDetails.shared.identityCountryIsuue = "AF"
        
        assignLabels()
        
    }
    func assignLabels() {
        
        let formatter = DateFormatter()
        let todaysDate = NSDate()
        formatter.dateFormat = "dd/MM/yyyy"
        let idExpiredt = formatter.date(from: ProfileDetails.shared.identityExpireDate)
        self.idExpiryAnswerLbl.text = formatter.string(from: idExpiredt ?? todaysDate as Date)
        formatter.dateFormat = "yyyy-MM-dd"
        self.identityExpire = formatter.string(from: idExpiredt ?? todaysDate as Date)
        
        
        formatter.dateFormat = "dd/MM/yyyy"
        let idIssueDt = formatter.date(from: ProfileDetails.shared.identityIssueDate)
        self.idIssueAnswerLbl.text = formatter.string(from: idIssueDt ?? todaysDate as Date)
        formatter.dateFormat = "yyyy-MM-dd"
        self.identityIsuue = formatter.string(from: idIssueDt ?? todaysDate as Date)
        
        
        let indexId = Global.shared.identityTypes.firstIndex(of:  ProfileDetails.shared.identityType)
        self.civilIdAnswerLbl.text = Global.shared.civilIdNames[indexId ?? 0]
        
        let indexThree = Global.shared.countryCodesData.firstIndex(of:  ProfileDetails.shared.identityCountryIsuue)
        if indexThree != nil {
            self.countryOfAnswerLbl.text = Global.shared.countryNameData[indexThree ?? 0]
            
        }
        else {
            self.countryOfAnswerLbl.text = ""
        }
        
        
        idNumberField.text = ProfileDetails.shared.identityId ?? ""
       
        
        placeOfAnswerField.text = ProfileDetails.shared.identityPlaceIsue ?? ""
        
        
        
        //  countryOfAnswerLbl.text = "KUWAIT"
        
        mobileNumberField.text = ProfileDetails.shared.mobile
        telephoneField.text = ProfileDetails.shared.telephone
        emailIdField.text = ProfileDetails.shared.email
        
        
        
        //header
        headerLbl.text = Global.shared.newCustomerHeader
        
        if Global.shared.new_identityType_is_required == true {
            civilIdLbl.text = Global.shared.newCidentityTypeTxt + "*"
        }
        else {
            civilIdLbl.text = Global.shared.newCidentityTypeTxt
        }
        if Global.shared.new_identityId_is_required == true {
            idNumberLbl.text = Global.shared.newCidentityNumberTxt + "*"
        }
        else {
            idNumberLbl.text = Global.shared.newCidentityNumberTxt
        }
        if Global.shared.new_identityIssueDate_is_required == true {
            idIsuueDateLbl.text = Global.shared.newCIdIssueDateTxt + "*"
        }
        else {
            idIsuueDateLbl.text = Global.shared.newCIdIssueDateTxt
        }
        if Global.shared.new_identityExpiryDate_is_required == true {
            idExpiryDateLbl.text = Global.shared.newCIdExpiryDateTxt + "*"
        }
        else {
            idExpiryDateLbl.text = Global.shared.newCIdExpiryDateTxt
        }
        if Global.shared.new_identityCountryIssue_is_required == true {
            countryOfIssueLbl.text = Global.shared.newCCountryOfIsueTxt + "*"
        }
        else {
            countryOfIssueLbl.text = Global.shared.newCCountryOfIsueTxt
        }
        if Global.shared.new_identityPlaseIssue_is_required == true {
            placeOfIssueLbl.text = Global.shared.newCPlaceOfIsueTxt + "*"
        }
        else {
            placeOfIssueLbl.text = Global.shared.newCPlaceOfIsueTxt
        }
        if Global.shared.new_mobileNumber_is_required == true {
            mobileNumberLbl.text = Global.shared.persnalMobileNumberTxt + "*"
        }
        else {
            mobileNumberLbl.text = Global.shared.persnalMobileNumberTxt
        }
        if Global.shared.new_telephone_is_required == true {
            telephonelbl.text = Global.shared.persnalTelephnTxt + "*"
        }
        else {
            telephonelbl.text = Global.shared.persnalTelephnTxt
        }
        if Global.shared.new_emailId_is_required == true {
            emailIDLbl.text = Global.shared.persnalEmailIdTxt + "*"
        }
        else {
            emailIDLbl.text = Global.shared.persnalEmailIdTxt
        }
        
        
        
        secndTabOneLbl.text = Global.shared.identityTabNameTxt
        secndTabTwoLbl.text = Global.shared.personalTabNameTxt
        secndTabThreeLbl.text = Global.shared.employmentTabNameTxt
        secndTabFourLbl.text = Global.shared.remitanceTabNameTxt
        
        nextBtnOtlt.setTitle(Global.shared.nxtBtnTxt, for: .normal)
        bckBtnOtlt.setTitle(Global.shared.backBtnTxt, for: .normal)
        
        identityTypeReqLbl.text = Global.shared.newCidentityTypeTxt + " " + Global.shared.errorTxtRequired.lowercased()
        idNumReqLbl.text = Global.shared.newCidentityNumberTxt + " " + Global.shared.errorTxtRequired.lowercased()
        idIssueDateReqLbl.text = Global.shared.newCIdIssueDateTxt + " " + Global.shared.errorTxtRequired.lowercased()
        idIssueExpireReqLbl.text = Global.shared.newCIdExpiryDateTxt + " " + Global.shared.errorTxtRequired.lowercased()
        countryOfIsueReqLbl.text = Global.shared.newCCountryOfIsueTxt + " " + Global.shared.errorTxtRequired.lowercased()
        placeOfIsueReqLbl.text = Global.shared.newCPlaceOfIsueTxt + " " + Global.shared.errorTxtRequired.lowercased()
        mobileNumberReqLbl.text = Global.shared.persnalMobileNumberTxt + " " + Global.shared.errorTxtRequired.lowercased()
        emailReqLbl.text = Global.shared.persnalEmailIdTxt + " " + Global.shared.errorTxtRequired.lowercased()
        telephnReqLbl.text = Global.shared.persnalTelephnTxt + " " + Global.shared.errorTxtRequired.lowercased()
        
        idNumberField.maxLength = Global.shared.new_identityId_max_length
        placeOfAnswerField.maxLength = Global.shared.new_identityPlaseIssue_max_length
        mobileNumberField.maxLength = Global.shared.new_mobileNumber_max_length
        telephoneField.maxLength = Global.shared.new_telephone_max_length
        emailIdField.maxLength = Global.shared.new_emailId_max_length
        
        idNumberField.valueType = Global.shared.getFieldType(text: Global.shared.new_identityId_field_accept)
        placeOfAnswerField.valueType = Global.shared.getFieldType(text: Global.shared.new_identityPlaseIssue_field_accept)
        mobileNumberField.valueType = Global.shared.getFieldType(text: Global.shared.new_mobileNumber_field_accept)
        telephoneField.valueType = Global.shared.getFieldType(text: Global.shared.new_telephone_field_accept)
        emailIdField.valueType = Global.shared.getFieldType(text: Global.shared.new_emailId_field_accept)
        
        
        
        mobileNumberField.maxLength = ProfileDetails.shared.new_mobileNumber_max_length
        telephoneField.maxLength = ProfileDetails.shared.new_telephone_max_length
        emailIdField.maxLength = ProfileDetails.shared.new_emailId_max_length
        
        mobileNumberField.valueType = Global.shared.getFieldType(text: ProfileDetails.shared.new_mobileNumber_field_accept)
        telephoneField.valueType = Global.shared.getFieldType(text: ProfileDetails.shared.new_telephone_field_accept)
        emailIdField.valueType = Global.shared.getFieldType(text: ProfileDetails.shared.new_emailId_field_accept)
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        Global.shared.countrysChangeAccordingly = "Any"
        Global.shared.countris = Country.getCountries(Global.shared.countrisAll)
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    @IBAction func nextBtnActn(_ sender: Any) {
        
        /* else   if  Global.shared.new_telephone_max_length !=  telephoneField.text?.count {
         let alert = ViewControllerManager.displayAlert(message:"Invalid telephone number", title:APPLICATIONNAME)
         self.present(alert, animated: true, completion: nil)
         
         }*/
        /*
         if ProfileDetails.shared.new_emailId_is_required == true && emailIdField.text == "" {
         
         emailReqLbl.isHidden = false
         }
         else   if AlertsValidations.SharedInstanceOfSingleTon.validateEmail(emailid: emailIdField.text!) == false
         {
         let alert = ViewControllerManager.displayAlert(message:Global.shared.invalidEmailTxtAlert , title:APPLICATIONNAME)
         //  let alert = ViewControllerManager.displayAlert(message:"Please enter valid email", title:APPLICATIONNAME)
         self.present(alert, animated: true, completion: nil)
         }*/
        
        
        
        // ProfileDetails.shared.identityType = "0"
        ProfileDetails.shared.identityId = idNumberField.text ?? ""
        ProfileDetails.shared.identityIssueDate = identityIsuue
        ProfileDetails.shared.identityExpireDate = identityExpire
        //  ProfileDetails.shared.identityCountryIsuue = countryOfAnswerLbl.text ?? ""
        ProfileDetails.shared.identityPlaceIsue = placeOfAnswerField.text ?? ""
        
        ProfileDetails.shared.mobile = mobileNumberField.text ?? ""
        ProfileDetails.shared.telephone = telephoneField.text ?? ""
        ProfileDetails.shared.email = emailIdField.text ?? ""
        self.pushViewController(controller: ProfilePersonalVc.initiateController(), isGestureEnable: false, animated: false)
    }
    
    
    @IBAction func bckBtnActn(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func idIssueBtnActn(_ sender: Any) {
        /*   DatePickerDialog().show(Global.shared.newCIdIssueDateTxt, doneButtonTitle: "Done", cancelButtonTitle: "Cancel", maximumDate: NSDate() as Date, datePickerMode: .date) {
         (date) -> Void in
         if let dt = date {
         let formatter = DateFormatter()
         formatter.dateFormat = "dd/MM/yyyy"
         self.idIssueAnswerLbl.text = formatter.string(from: dt)
         formatter.dateFormat = "yyyy-MM-dd"
         self.identityIsuue = formatter.string(from: dt)
         if ProfileDetails.shared.new_identityIssueDate_is_required == true {
         self.idIssueDateReqLbl.isHidden = true
         }
         
         }
         }*/
    }
    
    
    @IBAction func idIsuueExpireBtnActn(_ sender: Any) {
        /* DatePickerDialog().show(Global.shared.newCIdExpiryDateTxt, doneButtonTitle: "Done", cancelButtonTitle: "Cancel", datePickerMode: .date) {
         (date) -> Void in
         if let dt = date {
         let formatter = DateFormatter()
         formatter.dateFormat = "dd/MM/yyyy"
         self.idExpiryAnswerLbl.text = formatter.string(from: dt)
         formatter.dateFormat = "yyyy-MM-dd"
         self.identityExpire = formatter.string(from: dt)
         
         if ProfileDetails.shared.new_identityExpiryDate_is_required == true {
         self.idIssueExpireReqLbl.isHidden = true
         }
         
         }
         }*/
    }
    
    /* func textFieldDidEndEditing(_ textField: UITextField) {
     
     if textField == emailIdField{
     if Global.shared.new_emailId_is_required == true {
     if emailIdField.text!.count ==  0 {
     emailReqLbl.isHidden = false
     }
     else {
     emailReqLbl.isHidden = true
     }
     }
     }
     
     }
     
     func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
     
     if textField == emailIdField {
     if Global.shared.new_emailId_is_required == true {
     if emailIdField.text!.count <= -1 {
     emailReqLbl.isHidden = false
     }
     else {
     emailReqLbl.isHidden = true
     }
     }
     return emailIdField.verifyFields(shouldChangeCharactersIn: range, replacementString: string)
     }
     
     return true
     
     }*/
    
    
    
    
    @IBAction func identityDropDwnBtnActn(_ sender: Any) {
        /*   let pickerData = Global.shared.pickerResponseCivilId
         PickerDialog().show(title: "", options: pickerData , selected: "") {
         (value) -> Void in
         self.civilIdAnswerLbl.text = "\(value)"
         let indexS = Global.shared.civilIdNames.firstIndex(of: "\(value)")
         ProfileDetails.shared.identityType = Global.shared.identityTypes[indexS ?? 0]
         
         if ProfileDetails.shared.new_identityType_is_required == true {
         self.identityTypeReqLbl.isHidden = true
         }
         }*/
    }
    
    
    @IBAction func countryOfIsueDrpDwnActn(_ sender: Any) {
        
        /*    let pickerData = Global.shared.pickerResponseCountryData
         PickerDialog().show(title: "", options: pickerData , selected: "") {
         (value) -> Void in
         self.countryOfAnswerLbl.text = "\(value)"
         let indexS = Global.shared.countryNameData.firstIndex(of: "\(value)")
         ProfileDetails.shared.identityCountryIsuue = Global.shared.countryCodesData[indexS ?? 0]
         
         if ProfileDetails.shared.new_identityCountryIssue_is_required == true {
         self.countryOfIsueReqLbl.isHidden = true
         }
         }*/
    }
    
    
    func verifyCivilId() {
        
        let paramaterPasing: [String:Any] = [
            "civilID": idNumberField.text ?? ""
        ]
        
        print(paramaterPasing)
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        NetWorkDataManager.sharedInstance.verifyCivilIdImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            
            if errorString == nil
            {
                
                print(resonseTal!)
                if let statusCode = resonseTal?.value(forKey: "statusCodes") as? Int {
                    
                    print(statusCode)
                    if(statusCode == 200) {
                        
                        self.idNumReqLbl.isHidden = true
                        self.idNumReqLbl.text = Global.shared.errorTxtRequired
                        
                    }
                    
                    else {
                        self.idNumReqLbl.text = resonseTal?["statusMessage"] as? String ?? "Invalid"
                        self.idNumReqLbl.isHidden = false
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
    
    @IBAction func languageChangeActn(_ sender: Any) {
        Global.shared.languageChangeActn()
    }
    
    
}




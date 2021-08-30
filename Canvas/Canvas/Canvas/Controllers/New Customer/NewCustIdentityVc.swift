//
//  NewCustIdentityVc.swift
//  Canvas
//
//  Created by urmila reddy on 11/08/20.
//  Copyright © 2020 urmila reddy. All rights reserved.
//

import UIKit
import Alamofire

class NewCustIdentityVc: UIViewController, UITextFieldDelegate {
    
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
    
    var minmLengthTxt = Global.shared.newCidentityNumberTxt + " " + Global.shared.minLengthTxtt + "12"
    
    
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
        
        idNumberField.maxLength = 12
        
        self.labelOne.layer.cornerRadius = self.labelOne.frame.size.width / 2;
        self.labelOne.clipsToBounds = true
        
        self.labelTwo.layer.cornerRadius = self.labelTwo.frame.size.width / 2;
        self.labelTwo.clipsToBounds = true
        
        self.labelThree.layer.cornerRadius = self.labelThree.frame.size.width / 2;
        self.labelThree.clipsToBounds = true
        
        self.labelFour.layer.cornerRadius = self.labelFour.frame.size.width / 2;
        self.labelFour.clipsToBounds = true
        
        self.countryOfAnswerLbl.text = "KUWAIT"
        self.placeOfAnswerField.text = "Kuwait"
        NewUser.shared.identityCountryIsuue = "AF"
        
        
        assignLabels()
        
    }
    func assignLabels() {
        
        headerLbl.text = Global.shared.newCustomerHeader
        
        civilIdLbl.font = Global.shared.fontTopLbl
        civilIdLbl.textColor = ColorCodes.topTitleColor
        
        civilIdAnswerLbl.font = Global.shared.fontBottomLbl
        civilIdAnswerLbl.textColor = ColorCodes.bottomTitleColor
        
        idNumberLbl.font = Global.shared.fontTopLbl
        idNumberLbl.textColor = ColorCodes.topTitleColor
        
        idNumberField.font = Global.shared.fontBottomLbl
        idNumberField.textColor = ColorCodes.bottomTitleColor
        
        idIsuueDateLbl.font = Global.shared.fontTopLbl
        idIsuueDateLbl.textColor = ColorCodes.topTitleColor
        
        idIssueAnswerLbl.font = Global.shared.fontBottomLbl
        idIssueAnswerLbl.textColor = ColorCodes.bottomTitleColor
        
        idExpiryDateLbl.font = Global.shared.fontTopLbl
        idExpiryDateLbl.textColor = ColorCodes.topTitleColor
        
        idExpiryAnswerLbl.font = Global.shared.fontBottomLbl
        idExpiryAnswerLbl.textColor = ColorCodes.bottomTitleColor
        
        countryOfIssueLbl.font = Global.shared.fontTopLbl
        countryOfIssueLbl.textColor = ColorCodes.topTitleColor
        
        countryOfAnswerLbl.font = Global.shared.fontBottomLbl
        countryOfAnswerLbl.textColor = ColorCodes.bottomTitleColor
        
        placeOfIssueLbl.font = Global.shared.fontTopLbl
        placeOfIssueLbl.textColor = ColorCodes.topTitleColor
        
        placeOfAnswerField.font = Global.shared.fontBottomLbl
        placeOfAnswerField.textColor = ColorCodes.bottomTitleColor
        
        mobileNumberLbl.font = Global.shared.fontTopLbl
        mobileNumberLbl.textColor = ColorCodes.topTitleColor
        
        mobileNumberField.font = Global.shared.fontBottomLbl
        mobileNumberField.textColor = ColorCodes.bottomTitleColor
        
        telephonelbl.font = Global.shared.fontTopLbl
        telephonelbl.textColor = ColorCodes.topTitleColor
        
        telephoneField.font = Global.shared.fontBottomLbl
        telephoneField.textColor = ColorCodes.bottomTitleColor
        
        emailIDLbl.font = Global.shared.fontTopLbl
        emailIDLbl.textColor = ColorCodes.topTitleColor
        
        emailIdField.font = Global.shared.fontBottomLbl
        emailIdField.textColor = ColorCodes.bottomTitleColor
        
       
        
        
        
       
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
        
    //    idNumReqLbl.text = Global.shared.newCidentityNumberTxt + " " + Global.shared.errorTxtRequired.lowercased()
        
        
        idNumReqLbl.text = minmLengthTxt
        
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
        
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    @IBAction func nextBtnActn(_ sender: Any) {
        if Global.shared.new_identityType_is_required == true && civilIdAnswerLbl.text == ""{
            identityTypeReqLbl.isHidden = false
        }
        else  if Global.shared.new_identityId_is_required == true && idNumberField.text == "" || idNumReqLbl.isHidden == false{
            idNumberField.becomeFirstResponder()
            idNumReqLbl.isHidden = false
            
        }
        else if Global.shared.new_identityIssueDate_is_required == true &&  idIssueAnswerLbl.text == "" {
            idIssueDateReqLbl.isHidden = false
            
        }
        else if Global.shared.new_identityExpiryDate_is_required == true && idExpiryAnswerLbl.text == ""{
            
            idIssueExpireReqLbl.isHidden = false
            
        }
        else if Global.shared.new_identityCountryIssue_is_required == true && countryOfAnswerLbl.text == "" {
            
            countryOfIsueReqLbl.isHidden = false
            
        }
        else if Global.shared.new_identityPlaseIssue_is_required == true  && placeOfAnswerField.text == "" {
            placeOfAnswerField.becomeFirstResponder()
            placeOfIsueReqLbl.isHidden = false
            
        }
        else   if  Global.shared.new_mobileNumber_max_length !=  mobileNumberField.text?.count {
           
            let alert = ViewControllerManager.displayAlert(message: Global.shared.invalidMobileNumberTxtAlert, title:APPLICATIONNAME)
            self.present(alert, animated: true, completion: nil)
            
        }
           
            
              else   if Global.shared.new_mobileNumber_is_required == true && mobileNumberField.text == "" {
                mobileNumberField.becomeFirstResponder()
                  mobileNumberReqLbl.isHidden = false
              }
                  
              else   if Global.shared.new_telephone_is_required == true && telephoneField.text == "" {
                telephoneField.becomeFirstResponder()
                  telephnReqLbl.isHidden = false
              }
       /* else   if  Global.shared.new_telephone_max_length !=  telephoneField.text?.count {
            let alert = ViewControllerManager.displayAlert(message:"Invalid telephone number", title:APPLICATIONNAME)
            self.present(alert, animated: true, completion: nil)
            
        }*/
                  
        else   if Global.shared.new_emailId_is_required == true && emailIdField.text == "" {
            emailIdField.becomeFirstResponder()
            emailReqLbl.isHidden = false
        }
        else   if AlertsValidations.SharedInstanceOfSingleTon.validateEmail(emailid: emailIdField.text!) == false
        {
            let alertInvalid = Global.shared.persnalEmailIdTxt + " " + Global.shared.isInvalidTxt
            let alert = ViewControllerManager.displayAlert(message:alertInvalid , title:APPLICATIONNAME)
            //  let alert = ViewControllerManager.displayAlert(message:"Please enter valid email", title:APPLICATIONNAME)
            self.present(alert, animated: true, completion: nil)
        }
        else   if identityIsuue == identityExpire {
            let alert = ViewControllerManager.displayAlert(message: Global.shared.isueExpireSameAlert, title:APPLICATIONNAME)
            self.present(alert, animated: true, completion: nil)
        }
            
        else {
            // NewUser.shared.identityType = "0"
            NewUser.shared.identityId = idNumberField.text ?? ""
            NewUser.shared.identityIssueDate = identityIsuue
            NewUser.shared.identityExpireDate = identityExpire
            //  NewUser.shared.identityCountryIsuue = countryOfAnswerLbl.text ?? ""
            NewUser.shared.identityPlaceIsue = placeOfAnswerField.text ?? ""
            NewUser.shared.mobile = mobileNumberField.text ?? ""
                       NewUser.shared.telephone = telephoneField.text ?? ""
                       NewUser.shared.email = emailIdField.text ?? ""
          self.pushViewController(controller: NewCustPersonalVc.initiateController(),isGestureEnable: false, animated: false) }

    }
    
    
    @IBAction func bckBtnActn(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func idIssueBtnActn(_ sender: Any) {
       DatePickerDialog().show(Global.shared.newCIdIssueDateTxt, doneButtonTitle: "Done", cancelButtonTitle: "Cancel", maximumDate: NSDate() as Date, datePickerMode: .date) {
            (date) -> Void in
            if let dt = date {
      
        
     /*   DatePickerDialog().show(Global.shared.newCIdIssueDateTxt, doneButtonTitle: "Done", cancelButtonTitle: "Cancel", datePickerMode: .date) {
            (date) -> Void in
            if let dt = date {*/
                
                NewUser.shared.dateDobMaximum = date
        
                let formatter = DateFormatter()
                formatter.locale = Locale(identifier: "en_US_POSIX")
                formatter.dateFormat = "dd/MM/yyyy"
                self.idIssueAnswerLbl.text = formatter.string(from: dt)
                formatter.dateFormat = "yyyy-MM-dd"
                self.identityIsuue = formatter.string(from: dt)
                /*    let formatter1 = DateFormatter()
                 formatter1.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
                 formatter1.timeZone = NSTimeZone(forSecondsFromGMT: 0) as TimeZone
                 self.identityIsuue = formatter.string(from: dt)*/
                if Global.shared.new_identityIssueDate_is_required == true {
                    self.idIssueDateReqLbl.isHidden = true
                }
                
            }
        }
    }
    
    
    @IBAction func idIsuueExpireBtnActn(_ sender: Any) {
      
        let today = Date()
        print(today)
            
        DatePickerDialog().show(Global.shared.newCIdExpiryDateTxt, doneButtonTitle: "Done", cancelButtonTitle: "Cancel", minimumDate: Calendar.current.date(byAdding: .day, value: 1, to: today)!, datePickerMode: .date) {
              (date) -> Void in
            if let dt = date {
                let formatter = DateFormatter()
                formatter.locale = Locale(identifier: "en_US_POSIX")
                formatter.dateFormat = "dd/MM/yyyy"
                self.idExpiryAnswerLbl.text = formatter.string(from: dt)
                /*    let formatter1 = DateFormatter()
                 formatter1.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
                 formatter1.timeZone = NSTimeZone(forSecondsFromGMT: 0) as TimeZone
                 self.identityExpire = formatter.string(from: dt)*/
                
                formatter.dateFormat = "yyyy-MM-dd"
                self.identityExpire = formatter.string(from: dt)
                
                if Global.shared.new_identityExpiryDate_is_required == true {
                    self.idIssueExpireReqLbl.isHidden = true
                }
                
            }
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        //doneAction()
        if textField == idNumberField{
            if Global.shared.new_identityId_is_required == true {
                if idNumberField.text!.count <= 11 {
                     idNumReqLbl.text = minmLengthTxt
                    idNumReqLbl.isHidden = false
                }
               // else if idNumberField.text!.count == 12 || idNumberField.text!.count == 11 {
                else if idNumberField.text!.count == 12 {

                    verifyCivilId()
                    civilIdDobValidation()
                    idNumReqLbl.isHidden = true
                }
                else {
                     idNumReqLbl.text = minmLengthTxt
                    idNumReqLbl.isHidden = false
                }
            }
        }
        if textField == placeOfAnswerField{
            if Global.shared.new_identityPlaseIssue_is_required == true {
                if placeOfAnswerField.text!.count ==  0 {
                    placeOfIsueReqLbl.isHidden = false
                }
                else {
                    placeOfIsueReqLbl.isHidden = true
                }
            }
        }
        else  if textField == mobileNumberField{
                   if Global.shared.new_mobileNumber_is_required == true {
                       if mobileNumberField.text!.count ==  0 {
                           mobileNumberReqLbl.isHidden = false
                       }
                       else {
                           mobileNumberReqLbl.isHidden = true
                       }
                   }
               }
               else  if textField == telephoneField{
                   if Global.shared.new_telephone_is_required == true {
                       if telephoneField.text!.count ==  0 {
                           telephnReqLbl.isHidden = false
                       }
                       else {
                           telephnReqLbl.isHidden = true
                       }
                   }
               }
               else  if textField == emailIdField{
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
        
        if textField == idNumberField {
            if Global.shared.new_identityId_is_required == true {
                if idNumberField.text!.count < 11 {
                     idNumReqLbl.text = minmLengthTxt
                    idNumReqLbl.isHidden = false
                    print(idNumberField.text!.count)
                }
               // else if idNumberField.text!.count == 11 || idNumberField.text!.count == 12 {
                else if idNumberField.text!.count == 11 {
                  //  verifyCivilId()
                    idNumReqLbl.isHidden = true
                }
                else {
                   //  idNumReqLbl.text = minmLengthTxt
                   // idNumReqLbl.isHidden = false
                    print("abc")
                }
            }
            return idNumberField.verifyFields(shouldChangeCharactersIn: range, replacementString: string)
        } else  if textField == placeOfAnswerField {
            if Global.shared.new_identityPlaseIssue_is_required == true {
                if placeOfAnswerField.text!.count <= -1 {
                    placeOfIsueReqLbl.isHidden = false
                }
                else {
                    placeOfIsueReqLbl.isHidden = true
                }
            }
            return placeOfAnswerField.verifyFields(shouldChangeCharactersIn: range, replacementString: string)
        }
        else  if textField == mobileNumberField {
                  if Global.shared.new_mobileNumber_is_required == true {
                      if mobileNumberField.text!.count <= -1 {
                          mobileNumberReqLbl.isHidden = false
                      }
                      else {
                          mobileNumberReqLbl.isHidden = true
                      }
                  }
                  return mobileNumberField.verifyFields(shouldChangeCharactersIn: range, replacementString: string)
              }
              else  if textField == telephoneField {
                  if Global.shared.new_telephone_is_required == true {
                      if telephoneField.text!.count <= -1 {
                          telephnReqLbl.isHidden = false
                      }
                      else {
                          telephnReqLbl.isHidden = true
                      }
                  }
                  return telephoneField.verifyFields(shouldChangeCharactersIn: range, replacementString: string)
              }
              else  if textField == emailIdField {
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
        
    }
    
    
    @IBAction func identityDropDwnBtnActn(_ sender: Any) {
        let pickerData = Global.shared.pickerResponseCivilId
        PickerDialog().show(title: "", options: pickerData , selected: "") {
            (value) -> Void in
            self.civilIdAnswerLbl.text = "\(value)"
            let indexS = Global.shared.civilIdNames.firstIndex(of: "\(value)")
            NewUser.shared.identityType = Global.shared.identityTypes[indexS ?? 0]
            
            if Global.shared.new_identityType_is_required == true {
                self.identityTypeReqLbl.isHidden = true
            }
        }
    }
    
    
    @IBAction func countryOfIsueDrpDwnActn(_ sender: Any) {
        
        let pickerData = Global.shared.pickerResponseCountryData
        PickerDialog().show(title: "", options: pickerData , selected: "") {
            (value) -> Void in
            self.countryOfAnswerLbl.text = "\(value)"
            let indexS = Global.shared.countryNameData.firstIndex(of: "\(value)")
            NewUser.shared.identityCountryIsuue = Global.shared.countryCodesData[indexS ?? 0]
            
            if Global.shared.new_identityCountryIssue_is_required == true {
                self.countryOfIsueReqLbl.isHidden = true
            }
        }
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
                        self.idNumReqLbl.text = Global.shared.newCidentityNumberTxt + " " + Global.shared.errorTxtRequired.lowercased()
                        
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
       // Global.shared.languageChangeActn()
        let refreshAlert = UIAlertController(title: Global.shared.changeLangeHeaderTxt, message: Global.shared.changeLangSubTitleTxt, preferredStyle: UIAlertController.Style.alert)
        refreshAlert.view.tintColor = ColorCodes.newAppRed
        refreshAlert.addAction(UIAlertAction(title: Global.shared.okTxt, style: .default, handler: { (action: UIAlertAction!) in
        //   self.pushViewController(controller: LoginVc.initiateController())
            
            Global.shared.languageChangeActn()
            
        }))
        
        refreshAlert.addAction(UIAlertAction(title: Global.shared.cancelTxt, style: .default, handler: { (action: UIAlertAction!) in
            print("Handle Cancel Logic here")
              refreshAlert.dismiss(animated: true, completion: nil)
            
        }))
        
        present(refreshAlert, animated: true, completion: nil)
    }
    
    
    func civilIdDobValidation() {
        
        if NewUser.shared.dob != nil {
            
        }
        else {
            let paramaterPasing: [String:Any] = ["civilID":  NewUser.shared.identityId,
                                                 "dateOfBirth": NewUser.shared.dob]
            
            
            let headers: HTTPHeaders = [
                "Content-Type": "application/json"
            ]
            
            NetWorkDataManager.sharedInstance.civildDobValidationImplementation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
                
                if errorString == nil
                {
                    
                 //   print(resonseTal)
                    if let statusCode = resonseTal?.value(forKey: "statusCodes") as? Int {
                        
                        print(statusCode)
                        if(statusCode == 200) {
                            
                            self.idNumReqLbl.isHidden = true
                            self.idNumReqLbl.text = Global.shared.newCidentityNumberTxt + " " + Global.shared.errorTxtRequired.lowercased()
                            
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
        
        
        
    }
    
    
}



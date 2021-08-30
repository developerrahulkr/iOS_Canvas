//
//  VerifyAccountSecndVc.swift
//  Canvas
//
//  Created by urmila reddy on 06/08/20.
//  Copyright © 2020 urmila reddy. All rights reserved.
//

import UIKit

class VerifyAccountSecndVc: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var topView: UIView!
    
    @IBOutlet weak var bckgrndImg: UIImageView!
    
    @IBOutlet weak var tabLblTwo: UILabel!
    
    @IBOutlet weak var tabLblThree: UILabel!
    
    
    @IBOutlet weak var tabLblFour: UILabel!
    
    
    @IBOutlet weak var topHeaderLbl: UILabel!
    
    @IBOutlet weak var civilIdLbl: UILabel!
    
    @IBOutlet weak var civilIdTxt: UITextField!
    
    @IBOutlet weak var mobileNumberLbl: UILabel!
    
    @IBOutlet weak var mobileNumberField: UITextField!
    
    @IBOutlet weak var emaildIDLbl: UILabel!
    
    @IBOutlet weak var emailIdField: CustomTextField!
    
    @IBOutlet weak var firstNameLbl: UILabel!
    
    @IBOutlet weak var firstNameField: CustomTextField!
    
    @IBOutlet weak var lastNameLbl: UILabel!
    
    @IBOutlet weak var lastNameField: CustomTextField!
    
    
    @IBOutlet weak var middleNameLbl: UILabel!
    
    @IBOutlet weak var middleNameField: CustomTextField!
    
    
    @IBOutlet weak var continueBtnOtlt: UIButton!
    
    
    @IBOutlet weak var backBtnOtlt: UIButton!
    
    
    @IBOutlet weak var firstView: UIView!
    
    @IBOutlet weak var secndView: UIView!
    
    @IBOutlet weak var thirdView: UIView!
    
    @IBOutlet weak var fourthView: UIView!
    
    @IBOutlet weak var fifthView: UIView!
    
    @IBOutlet weak var sixthView: UIView!
    
    
    
    @IBOutlet weak var emailReqLbl: UILabel!
    @IBOutlet weak var firstNameReqLbl: UILabel!
    
    @IBOutlet weak var lastNameReqLbl: UILabel!
    
    @IBOutlet weak var middleNameReqLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailReqLbl.font = Global.shared.fontReqLbl
        emailReqLbl.textColor = ColorCodes.newAppRed
        
        firstNameReqLbl.font = Global.shared.fontReqLbl
        firstNameReqLbl.textColor = ColorCodes.newAppRed
        
        lastNameReqLbl.font = Global.shared.fontReqLbl
        lastNameReqLbl.textColor = ColorCodes.newAppRed
        
        middleNameReqLbl.font = Global.shared.fontReqLbl
        middleNameReqLbl.textColor = ColorCodes.newAppRed
        
       
        firstView.layer.cornerRadius = 5
        secndView.layer.cornerRadius = 5
        thirdView.layer.cornerRadius = 5
        fourthView.layer.cornerRadius = 5
        fifthView.layer.cornerRadius = 5
        sixthView.layer.cornerRadius = 5
        continueBtnOtlt.layer.cornerRadius = 5
        backBtnOtlt.layer.cornerRadius = 5
        
        firstNameField.delegate = self
        lastNameField.delegate = self
        middleNameField.delegate = self
        
        self.scrollView.backgroundColor = UIColor(patternImage: UIImage(named: "AppBckgroundImg")!)
        //  self.scrollView.addSubview()
        self.topView.backgroundColor = UIColor(patternImage: UIImage(named: "AppBckgroundImg")!)
        
        // Do any additional setup after loading the view.
        self.tabLblTwo.layer.cornerRadius = self.tabLblTwo.frame.size.width / 2;
        self.tabLblTwo.clipsToBounds = true
        
        self.tabLblThree.layer.cornerRadius = self.tabLblThree.frame.size.width / 2;
        self.tabLblThree.clipsToBounds = true
        
        self.tabLblFour.layer.cornerRadius = self.tabLblFour.frame.size.width / 2;
        self.tabLblFour.clipsToBounds = true
        
        assignLabels()
        assignFields()
    }
    
    func assignLabels() {
        topHeaderLbl.text = Global.shared.firstSecndTabHeaderTxt
        civilIdLbl.text = Global.shared.civilIdTxt + "*"
        mobileNumberLbl.text = Global.shared.mobileNumberTxt + "*"
        
        if Global.shared.exist_emailID_is_required == true {
            emaildIDLbl.text = Global.shared.emailIdTxt + "*"
        }
        else {
            emaildIDLbl.text = Global.shared.emailIdTxt
        }
        if Global.shared.exist_firstName_is_required == true {
            firstNameLbl.text = Global.shared.firstNameTxt + "*"
        }
        else {
            firstNameLbl.text = Global.shared.firstNameTxt
        }
        if Global.shared.exist_lastName_is_required == true {
            lastNameLbl.text = Global.shared.lastNameTxt + "*"
        }
        else {
            lastNameLbl.text = Global.shared.lastNameTxt
        }
        if Global.shared.exist_middleName_is_required == true {
            middleNameLbl.text = Global.shared.middleNameTxt + "*"
        }
        else {
            middleNameLbl.text = Global.shared.middleNameTxt
            
        }
        
        //
        
        continueBtnOtlt.setTitle(Global.shared.continueBtnTxt, for: .normal)
        backBtnOtlt.setTitle(Global.shared.backBtnTxt, for: .normal)
        
        firstNameField.maxLength = Global.shared.exist_firstName_max_length
        lastNameField.maxLength = Global.shared.exist_lastName_max_length
        middleNameField.maxLength = Global.shared.exist_middleName_max_length
        
        firstNameField.valueType = Global.shared.getFieldType(text: Global.shared.exist_firstName_field_accept)
        lastNameField.valueType = Global.shared.getFieldType(text: Global.shared.exist_lastName_field_accept)
        middleNameField.valueType = Global.shared.getFieldType(text: Global.shared.exist_middleName_field_accept)
        
         firstNameReqLbl.text = Global.shared.firstNameTxt + " " + Global.shared.errorTxtRequired.lowercased()
        lastNameReqLbl.text = Global.shared.lastNameTxt + " " + Global.shared.errorTxtRequired.lowercased()
               middleNameReqLbl.text = Global.shared.middleNameTxt + " " + Global.shared.errorTxtRequired.lowercased()
               emailReqLbl.text = Global.shared.emailIdTxt + " " + Global.shared.errorTxtRequired.lowercased()
        
    }
    
    func assignFields() {
        civilIdTxt.text = ExistingUser.shared.civildId
        emailIdField.text = ExistingUser.shared.emailId
        firstNameField.text = ExistingUser.shared.firstName
        lastNameField.text = ExistingUser.shared.lastName
        middleNameField.text = ExistingUser.shared.middleName
        mobileNumberField.text = ExistingUser.shared.mobileNumber
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @IBAction func continueBtnActn(_ sender: Any) {
        if Global.shared.exist_firstName_is_required == true  && firstNameField.text == "" {
                firstNameReqLbl.isHidden = false
        }
            
        else if Global.shared.exist_lastName_is_required == true  && lastNameField.text == ""  {
           
                lastNameReqLbl.isHidden = false
      
        }
        else if Global.shared.exist_middleName_is_required == true  && middleNameField.text == "" {
           
                middleNameReqLbl.isHidden = false
   
        }
        else if Global.shared.exist_emailID_is_required == true  && middleNameField.text == "" {
            
            emailReqLbl.isHidden = false
            
        }
        else   if AlertsValidations.SharedInstanceOfSingleTon.validateEmail(emailid: emailIdField.text!) == false
        {
            emailReqLbl.text = Global.shared.invalidEmailTxtAlert
            emailReqLbl.isHidden = false
        }
        else {
            ExistingUser.shared.emailId = emailIdField.text
            ExistingUser.shared.firstName =  firstNameField.text
            ExistingUser.shared.lastName = lastNameField.text
            ExistingUser.shared.middleName = middleNameField.text
            
          let verifyAcnThirdVC: VerifyAcntThirdVc = .initiateController()
          self.pushViewController(controller: verifyAcnThirdVC, isGestureEnable: false)
        }
        
    }
    
    @IBAction func bckBtnActn(_ sender: Any) {
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        self.navigationController?.popViewController(animated: false)
    }
    
    //on done button clicked
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        //doneAction()
        if textField == firstNameField{
            if Global.shared.exist_firstName_is_required == true {
                if firstNameField.text!.count ==  0 {
                    firstNameReqLbl.isHidden = false
                }
                else {
                    firstNameReqLbl.isHidden = true
                }
            }
        }
            
        else  if textField == lastNameField{
            //  verifyMobile()
            if Global.shared.exist_lastName_is_required == true {
                if lastNameField.text!.count ==  0 {
                    lastNameReqLbl.isHidden = false
                }
                else {
                    lastNameReqLbl.isHidden = true
                }
            }
        }
        else  if textField == middleNameField{
            //   verifyEmail()
            if Global.shared.exist_middleName_is_required == true {
                if middleNameField.text!.count ==  0 {
                    middleNameReqLbl.isHidden = false
                }
                else {
                    middleNameReqLbl.isHidden = true
                }
            }
        }
        else  if textField == emailIdField{
            //   verifyEmail()
            if Global.shared.exist_firstName_is_required == true {
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
        
        if textField == firstNameField {
            if Global.shared.exist_firstName_is_required == true {
                if firstNameField.text!.count <= -1 {
                    firstNameReqLbl.isHidden = false
                }
                else {
                    firstNameReqLbl.isHidden = true
                }
            }
            return firstNameField.verifyFields(shouldChangeCharactersIn: range, replacementString: string)
        } else if textField == lastNameField {
            if Global.shared.exist_lastName_is_required == true {
                if lastNameField.text!.count <= -1 {
                    lastNameReqLbl.isHidden = false
                }
                else {
                    lastNameReqLbl.isHidden = true
                }
            }
            return lastNameField.verifyFields(shouldChangeCharactersIn: range, replacementString: string)
            
        } else if textField == middleNameField {
            if Global.shared.exist_middleName_is_required == true {
                if middleNameField.text!.count <= -1 {
                    middleNameReqLbl.isHidden = false
                }
                else {
                    middleNameReqLbl.isHidden = true
                }
            }
            return middleNameField.verifyFields(shouldChangeCharactersIn: range, replacementString: string)
            
        }
        else if textField == emailIdField {
            if Global.shared.exist_middleName_is_required == true {
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
    
     
    @IBAction func languageChangeActn(_ sender: Any) {
        Global.shared.languageChangeActn()
    }
    
   
}

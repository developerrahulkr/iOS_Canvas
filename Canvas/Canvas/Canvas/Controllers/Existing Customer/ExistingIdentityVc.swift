//
//  ExistingIdentityVc.swift
//  Canvas
//
//  Created by urmila reddy on 05/12/20.
//  Copyright © 2020 urmila reddy. All rights reserved.
//

import UIKit

class ExistingIdentityVc: UIViewController, UITextFieldDelegate  {
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var scrollVieww: UIScrollView!
    
    @IBOutlet weak var backgrndImg: UIImageView!
    
    
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
    
    
    @IBOutlet weak var tabLblTwo: UILabel!
    
    @IBOutlet weak var tabLblThree: UILabel!
    
    
    @IBOutlet weak var tabLblFour: UILabel!
    
    var identityIsuue = ""
    var identityExpire = ""
    
    var idNumberMinLength = 5
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabLblTwo.layer.cornerRadius = self.tabLblTwo.frame.size.width / 2;
        self.tabLblTwo.clipsToBounds = true
        
        self.tabLblThree.layer.cornerRadius = self.tabLblThree.frame.size.width / 2;
        self.tabLblThree.clipsToBounds = true
        
        self.tabLblFour.layer.cornerRadius = self.tabLblFour.frame.size.width / 2;
        self.tabLblFour.clipsToBounds = true
        
        // Do any additional setup after loading the view.
        
        
        emailReqLbl.font = Global.shared.fontReqLbl
        emailReqLbl.textColor = ColorCodes.newAppRed
        
        idNumberField.isEnabled = false
        placeOfAnswerField.isEnabled = false
        mobileNumberField.isEnabled = false
        telephoneField.isEnabled = false
        
        let indexId = Global.shared.identityTypes.firstIndex(of:  ExistingUser.shared.identityType)
               self.civilIdAnswerLbl.text = Global.shared.civilIdNames[indexId ?? 0]
        
        idNumberField.text = ExistingUser.shared.civildId
        idIssueAnswerLbl.text = ExistingUser.shared.idIssueDate
        idExpiryAnswerLbl.text = ExistingUser.shared.idExpiryDate
        placeOfAnswerField.text = ExistingUser.shared.identityPlaseIssue
        countryOfAnswerLbl.text = "KUWAIT"
        mobileNumberField.text = ExistingUser.shared.mobileNumber
        telephoneField.text = ExistingUser.shared.telephone
        emailIdField.text = ExistingUser.shared.emailId
        
        
        
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
        
        /* idNumberField.delegate = self
         placeOfAnswerField.delegate = self
         
         mobileNumberField.delegate = self
         telephoneField.delegate = self*/
        
        emailIdField.delegate = self
        
        pdTwelveView.layer.cornerRadius = 5
        pdThirteenView.layer.cornerRadius = 5
        pdFourteenView.layer.cornerRadius = 5
        
        idNumberField.maxLength = 10
        
        /*    self.countryOfAnswerLbl.text = "KUWAIT"
         NewUser.shared.identityCountryIsuue = "AF"*/
        
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

        
        
        assignLabels()
        
    }
    func assignLabels() {
        
        headerLbl.text = Global.shared.newCustomerHeader
        
        
        civilIdLbl.text = Global.shared.newCidentityTypeTxt
        
        idNumberLbl.text = Global.shared.newCidentityNumberTxt
        
        idIsuueDateLbl.text = Global.shared.newCIdIssueDateTxt
        
        idExpiryDateLbl.text = Global.shared.newCIdExpiryDateTxt
        
        countryOfIssueLbl.text = Global.shared.newCCountryOfIsueTxt
        
        placeOfIssueLbl.text = Global.shared.newCPlaceOfIsueTxt
        
        mobileNumberLbl.text = Global.shared.persnalMobileNumberTxt
        
        telephonelbl.text = Global.shared.persnalTelephnTxt
        
        emailIDLbl.text = Global.shared.persnalEmailIdTxt + "*"
        
        
        secndTabOneLbl.text = Global.shared.identityTabNameTxt
        secndTabTwoLbl.text = Global.shared.personalTabNameTxt
        secndTabThreeLbl.text = Global.shared.employmentTabNameTxt
        secndTabFourLbl.text = Global.shared.remitanceTabNameTxt
        
        nextBtnOtlt.setTitle(Global.shared.nxtBtnTxt, for: .normal)
        bckBtnOtlt.setTitle(Global.shared.backBtnTxt, for: .normal)
        
        
        
        emailReqLbl.text = Global.shared.persnalEmailIdTxt + " " + Global.shared.errorTxtRequired.lowercased()
        
        emailIdField.maxLength = Global.shared.new_emailId_max_length
        
        
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
        
        if Global.shared.new_emailId_is_required == true && emailIdField.text == "" {
            emailIdField.becomeFirstResponder()
            emailReqLbl.isHidden = false
        }
        else   if AlertsValidations.SharedInstanceOfSingleTon.validateEmail(emailid: emailIdField.text!) == false
        {
            let alertInvalid = Global.shared.persnalEmailIdTxt + " " + Global.shared.isInvalidTxt
            let alert = ViewControllerManager.displayAlert(message:alertInvalid, title:APPLICATIONNAME)
            //  let alert = ViewControllerManager.displayAlert(message:"Please enter valid email", title:APPLICATIONNAME)
            self.present(alert, animated: true, completion: nil)
        }
            
            
        else {
            ExistingUser.shared.emailId = emailIdField.text ?? ""
            self.pushViewController(controller: ExistingPersonalVc.initiateController(),isGestureEnable: false, animated: false)
        }
    }
    
    
    @IBAction func bckBtnActn(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func idIssueBtnActn(_ sender: Any) {
        
    }
    
    
    @IBAction func idIsuueExpireBtnActn(_ sender: Any) {
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
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
        
    }
    
    
    @IBAction func identityDropDwnBtnActn(_ sender: Any) {
        
    }
    
    
    @IBAction func countryOfIsueDrpDwnActn(_ sender: Any) {
        
    }
    
    
    
    @IBAction func languageChangeActn(_ sender: Any) {
      //  Global.shared.languageChangeActn()
        
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
    
}



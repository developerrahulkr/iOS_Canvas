//
//  BeneficiaryBankTransferVc.swift
//  Canvas
//
//  Created by urmila reddy on 27/08/20.
//  Copyright © 2020 urmila reddy. All rights reserved.
//

import UIKit
import Alamofire

class BeneficiaryBankTransferVc: UIViewController, UITextFieldDelegate, UIPopoverControllerDelegateM,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIPopoverControllerDelegate, UIDropDownCountryDelegateM  {
    
    @IBOutlet weak var navHeaderLbl: UILabel!
    
    @IBOutlet weak var profileDetlsLbl: UILabel!
    
    @IBOutlet weak var bankDetlsLbl: UILabel!
    
    @IBOutlet weak var submitBtnOtlt: UIButton!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var expandOneHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var expandTwoHeightConstrt: NSLayoutConstraint!
    
    @IBOutlet weak var firstView: UIView!
    
    @IBOutlet weak var firstName: UILabel!
    
    @IBOutlet weak var firstField: CustomTextField!
    
    @IBOutlet weak var secondView: UIView!
    
    @IBOutlet weak var lastName: UILabel!
    
    @IBOutlet weak var lastField: CustomTextField!
    
    @IBOutlet weak var thirdView: UIView!
    
    @IBOutlet weak var middleName: UILabel!
    
    @IBOutlet weak var middleField: CustomTextField!
    
    @IBOutlet weak var fourthView: UIView!
    
    @IBOutlet weak var adres1Lbl: UILabel!
    
    @IBOutlet weak var adres1Field: CustomTextField!
    
    @IBOutlet weak var fifthView: UIView!
    
    @IBOutlet weak var adres2Lbl: UILabel!
    
    @IBOutlet weak var adres2Field: CustomTextField!
    
    @IBOutlet weak var sixthView: UIView!
    
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var cityField: CustomTextField!
    
    @IBOutlet weak var seventhView: UIView!
    
    @IBOutlet weak var stateLbl: UILabel!
    
    @IBOutlet weak var stateField: CustomTextField!
    
    @IBOutlet weak var eightView: UIView!
    
    @IBOutlet weak var postCodeLbl: UILabel!
    
    @IBOutlet weak var postCodeField: CustomTextField!
    
    @IBOutlet weak var ninthView: UIView!
    
    @IBOutlet weak var countryLbl: UILabel!
    
    @IBOutlet weak var countryField: UILabel!
    
    @IBOutlet weak var tenthView: UIView!
    
    @IBOutlet weak var currencyLbl: UILabel!
    
    @IBOutlet weak var curencyField: CustomTextField!
    
    @IBOutlet weak var eleventhView: UIView!
    
    @IBOutlet weak var mobileLbl: UILabel!
    
    @IBOutlet weak var mobileField: CustomTextField!
    
    @IBOutlet weak var expandOneView: UIView!
    
    @IBOutlet weak var expandTwoView: UIView!
    
    @IBOutlet weak var bkOneView: UIView!
    
    @IBOutlet weak var acntNumberLbl: UILabel!
    
    @IBOutlet weak var acntNumberField: CustomTextField!
    
    @IBOutlet weak var bkThreeView: UIView!
    
    @IBOutlet weak var bankNameLbl: UILabel!
    
    @IBOutlet weak var bankNameField: CustomTextField!
    
    @IBOutlet weak var bkFifthView: UIView!
    
    @IBOutlet weak var branchNameLbl: UILabel!
    
    @IBOutlet weak var branchNameField: CustomTextField!
    
    @IBOutlet weak var bkSixthView: UIView!
    
    @IBOutlet weak var ifscCodeLbl: UILabel!
    
    @IBOutlet weak var ifscCodeField: CustomTextField!
    
    @IBOutlet weak var bkSeventhView: UIView!
    
    @IBOutlet weak var swiftCodeLbl: UILabel!
    
    @IBOutlet weak var swiftCodeField: CustomTextField!
    
    @IBOutlet weak var bkEightView: UIView!
    
    @IBOutlet weak var ibanCodeLbl: UILabel!
    
    @IBOutlet weak var ibanCodeField: CustomTextField!
    
    @IBOutlet weak var bkNinthView: UIView!
    
    @IBOutlet weak var cnicnoLbl: UILabel!
    
    @IBOutlet weak var cnicnoField: CustomTextField!
    
    @IBOutlet weak var firstNameReqLbl: UILabel!
    
    @IBOutlet weak var lastNameReqLbl: UILabel!
    
    @IBOutlet weak var middleNameReqLbl: UILabel!
    
    @IBOutlet weak var adresOneReqLbl: UILabel!
    
    @IBOutlet weak var adresTwoReqLbl: UILabel!
    
    @IBOutlet weak var cityReqLbl: UILabel!
    
    @IBOutlet weak var stateReqLbl: UILabel!
    
    @IBOutlet weak var postCodeReqLbl: UILabel!
    
    @IBOutlet weak var countryReqLbl: UILabel!
    
    @IBOutlet weak var currencyReqLbl: UILabel!
    
    @IBOutlet weak var mobileReqLbl: UILabel!
    
    @IBOutlet weak var acntNumberReqLbl: UILabel!
    
    @IBOutlet weak var bankNameReqLbl: UILabel!
    
    @IBOutlet weak var branchNameReqLbl: UILabel!
    
    @IBOutlet weak var ifscCodeReqLbl: UILabel!
    
    @IBOutlet weak var swiftCodeReqLbl: UILabel!
    
    @IBOutlet weak var ibanReqLbl: UILabel!
    
    @IBOutlet weak var cnincoReqLbl: UILabel!
    
    
    
    
    
    @IBOutlet weak var telephneView: UIView!
    
    @IBOutlet weak var telephnLbl: UILabel!
    
    @IBOutlet weak var telephnField: CustomTextField!
    
    
    @IBOutlet weak var telephnReqLbl: UILabel!
    
    @IBOutlet weak var nationalityView: UIView!
    
    @IBOutlet weak var nationalityLbl: UILabel!
    
    @IBOutlet weak var nationalityField: UILabel!
    
    @IBOutlet weak var nationalityReqLbl: UILabel!
    
    @IBOutlet weak var districtView: UIView!
    
    @IBOutlet weak var districtLbl: UILabel!
    
    @IBOutlet weak var districtField: CustomTextField!
    
    @IBOutlet weak var districtReqLbl: UILabel!
    
    @IBOutlet weak var benefIdTypeView: UIView!
    
    @IBOutlet weak var benefIdTypeLbl: UILabel!
    
    @IBOutlet weak var benefIdTypeField: UILabel!
    
    @IBOutlet weak var benefIdTypeReqLbl: UILabel!
    
    @IBOutlet weak var benefIdView: UIView!
    
    @IBOutlet weak var benefIdLbl: UILabel!
    
    @IBOutlet weak var benefIdField: CustomTextField!
    
    @IBOutlet weak var benefIdReqLbl: UILabel!
    
    @IBOutlet weak var reltnshipBenefView: UIView!
    
    @IBOutlet weak var reltnshipBenefLbl: UILabel!
    
    @IBOutlet weak var reltnshipBenefField: CustomTextField!
    
    @IBOutlet weak var reltnshipBenfReqLbl: UILabel!
    
    @IBOutlet weak var acntTypeView: UIView!
    
    @IBOutlet weak var acntTypeLbl: UILabel!
    
    @IBOutlet weak var acntTypeField: UILabel!
    
    @IBOutlet weak var acntTypeReqLbl: UILabel!
    
    @IBOutlet weak var branchAdres1View: UIView!
    
    @IBOutlet weak var branchAdres1Lbl: UILabel!
    
    @IBOutlet weak var branchAdres1Field: CustomTextField!
    
    @IBOutlet weak var branchAdres1ReqLbl: UILabel!
    
    @IBOutlet weak var branchAdres2View: UIView!
    
    @IBOutlet weak var branchAdres2lbl: UILabel!
    
    @IBOutlet weak var branchAdres2Field: CustomTextField!
    
    @IBOutlet weak var branchAdres2ReqLbl: UILabel!
    
    @IBOutlet weak var branchCodeView: UIView!
    
    @IBOutlet weak var branchCodeLbl: UILabel!
    
    @IBOutlet weak var branchCodeField: CustomTextField!
    
    @IBOutlet weak var branchCodeReqLbl: UILabel!
    
    
    @IBOutlet weak var profileImg: UIImageView!
    
    
    
    
    @IBOutlet weak var dobLbl: UILabel!
    
    @IBOutlet weak var dobField: UILabel!
    
    
    @IBOutlet weak var remarksLbl: UILabel!
    
    @IBOutlet weak var remarksField: CustomTextField!
    
    
    @IBOutlet weak var mobileCodeField: UILabel!
    
    @IBOutlet weak var dobReqLbl: UILabel!
    
    @IBOutlet weak var remarksReqLbl: UILabel!
    
    
    @IBOutlet weak var nationalityDrpImg: UIImageView!
    
    @IBOutlet weak var countryDrpImg: UIImageView!
    @IBOutlet weak var curncyDrpImg: UIImageView!
       
       @IBOutlet weak var telePhnCodeLbl: UILabel!
    
    var pickerImg:UIImagePickerController?=UIImagePickerController()
       
       var imgeXX:String = ""
       
       var popover:UIPopoverController?=nil
    
     var dob = ""
    
    
    
    var expandOneClick = true
    var expandTwoClick = true
    
    var countryCodeSelected = ""
    var nationalityCodeSelected = ""
    var benefIdTypeSelected = ""
    var bankAcntTypeSelected = ""
    
 /*   var countryNameData = [String]()
    var countryCodeData = [String]()
    var currencyData = [String]()
    var pickerResponseData = [[String: String]]()*/
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setKeyBoardType()
        
        downloadAccountConfigCountriesBankAddBenef()
        navHeaderLbl.text = Global.shared.addBeneficiaryTxt
        
        profileDetlsLbl.text = Global.shared.profileDetlsTxt
        bankDetlsLbl.text =  Global.shared.bankDetlsTxt
        
        Global.shared.countrysChangeAccordingly = "BankAdd" 
        
        // Do any additional setup after loading the view.
        self.remarksLbl.text = Global.shared.remarksTxtt
        self.dobLbl.text = Global.shared.persnalDobTxt
        
        
        firstNameReqLbl.font = Global.shared.fontReqLbl
        firstNameReqLbl.textColor = ColorCodes.newAppRed
        
        lastNameReqLbl.font = Global.shared.fontReqLbl
        lastNameReqLbl.textColor = ColorCodes.newAppRed
        
        middleNameReqLbl.font = Global.shared.fontReqLbl
        middleNameReqLbl.textColor = ColorCodes.newAppRed
        
        adresOneReqLbl.font = Global.shared.fontReqLbl
        adresOneReqLbl.textColor = ColorCodes.newAppRed
        
        adresTwoReqLbl.font = Global.shared.fontReqLbl
        adresTwoReqLbl.textColor = ColorCodes.newAppRed
        
        cityReqLbl.font = Global.shared.fontReqLbl
        cityReqLbl.textColor = ColorCodes.newAppRed
        
        stateReqLbl.font = Global.shared.fontReqLbl
        stateReqLbl.textColor = ColorCodes.newAppRed
        
        postCodeReqLbl.font = Global.shared.fontReqLbl
        postCodeReqLbl.textColor = ColorCodes.newAppRed
        
        countryReqLbl.font = Global.shared.fontReqLbl
        countryReqLbl.textColor = ColorCodes.newAppRed
        
        currencyReqLbl.font = Global.shared.fontReqLbl
        currencyReqLbl.textColor = ColorCodes.newAppRed
        
        mobileReqLbl.font = Global.shared.fontReqLbl
        mobileReqLbl.textColor = ColorCodes.newAppRed
        
        acntNumberReqLbl.font = Global.shared.fontReqLbl
        acntNumberReqLbl.textColor = ColorCodes.newAppRed
        
        bankNameReqLbl.font = Global.shared.fontReqLbl
        bankNameReqLbl.textColor = ColorCodes.newAppRed
        
        branchNameReqLbl.font = Global.shared.fontReqLbl
        branchNameReqLbl.textColor = ColorCodes.newAppRed
        
        ifscCodeReqLbl.font = Global.shared.fontReqLbl
        ifscCodeReqLbl.textColor = ColorCodes.newAppRed
        
        swiftCodeReqLbl.font = Global.shared.fontReqLbl
        swiftCodeReqLbl.textColor = ColorCodes.newAppRed
        
        ibanReqLbl.font = Global.shared.fontReqLbl
        ibanReqLbl.textColor = ColorCodes.newAppRed
        
        cnincoReqLbl.font = Global.shared.fontReqLbl
        cnincoReqLbl.textColor = ColorCodes.newAppRed
        
        telephnReqLbl.font = Global.shared.fontReqLbl
        telephnReqLbl.textColor = ColorCodes.newAppRed
        
        nationalityReqLbl.font = Global.shared.fontReqLbl
        nationalityReqLbl.textColor = ColorCodes.newAppRed
        
        districtReqLbl.font = Global.shared.fontReqLbl
        districtReqLbl.textColor = ColorCodes.newAppRed
        
        benefIdTypeReqLbl.font = Global.shared.fontReqLbl
        benefIdTypeReqLbl.textColor = ColorCodes.newAppRed
        
        benefIdReqLbl.font = Global.shared.fontReqLbl
        benefIdReqLbl.textColor = ColorCodes.newAppRed
        
        reltnshipBenfReqLbl.font = Global.shared.fontReqLbl
        reltnshipBenfReqLbl.textColor = ColorCodes.newAppRed
        
        acntTypeReqLbl.font = Global.shared.fontReqLbl
        acntTypeReqLbl.textColor = ColorCodes.newAppRed
        
        branchAdres1ReqLbl.font = Global.shared.fontReqLbl
        branchAdres1ReqLbl.textColor = ColorCodes.newAppRed
        
        branchAdres2ReqLbl.font = Global.shared.fontReqLbl
        branchAdres2ReqLbl.textColor = ColorCodes.newAppRed
        
        branchCodeReqLbl.font = Global.shared.fontReqLbl
        branchCodeReqLbl.textColor = ColorCodes.newAppRed
        
        dobReqLbl.font = Global.shared.fontReqLbl
        dobReqLbl.textColor = ColorCodes.newAppRed
        
        remarksReqLbl.font = Global.shared.fontReqLbl
        remarksReqLbl.textColor = ColorCodes.newAppRed
        
        Global.shared.countrysChangeAccordingly = "BankAdd" 
        
        firstField.delegate = self
        lastField.delegate = self
        middleField.delegate = self
        adres1Field.delegate = self
        adres2Field.delegate = self
        cityField.delegate = self
        stateField.delegate = self
        postCodeField.delegate = self
        mobileField.delegate = self
        
        branchCodeField.delegate = self
        acntNumberField.delegate = self
        
        bankNameField.delegate = self
        telephnField.delegate = self
        benefIdField.delegate = self
        
        branchNameField.delegate = self
        ifscCodeField.delegate = self
        swiftCodeField.delegate = self
        ibanCodeField.delegate = self
        cnicnoField.delegate = self
        remarksField.delegate = self
        
        
        firstView.layer.cornerRadius = 5
        secondView.layer.cornerRadius = 5
        thirdView.layer.cornerRadius = 5
        fourthView.layer.cornerRadius = 5
        fifthView.layer.cornerRadius = 5
        sixthView.layer.cornerRadius = 5
        seventhView.layer.cornerRadius = 5
        eightView.layer.cornerRadius = 5
        ninthView.layer.cornerRadius = 5
        tenthView.layer.cornerRadius = 5
        eleventhView.layer.cornerRadius = 5
        bkOneView.layer.cornerRadius = 5
        
        bkThreeView.layer.cornerRadius = 5
        
        bkFifthView.layer.cornerRadius = 5
        bkSixthView.layer.cornerRadius = 5
        bkSeventhView.layer.cornerRadius = 5
        bkEightView.layer.cornerRadius = 5
        bkNinthView.layer.cornerRadius = 5
        submitBtnOtlt.layer.cornerRadius = 5
        
        
        telephneView.layer.cornerRadius = 5
        nationalityView.layer.cornerRadius = 5
        districtView.layer.cornerRadius = 5
        benefIdTypeView.layer.cornerRadius = 5
        benefIdView.layer.cornerRadius = 5
        reltnshipBenefView.layer.cornerRadius = 5
        acntTypeView.layer.cornerRadius = 5
        branchAdres1View.layer.cornerRadius = 5
        branchAdres2View.layer.cornerRadius = 5
        branchCodeView.layer.cornerRadius = 5
        
        assigingLabels()
        
   //     downloadAccountConfig()
         profileImg.setRounded()
        pickerImg!.delegate=self as UIImagePickerControllerDelegate & UINavigationControllerDelegate
               imageGesture()
        
    }
    
    
    func assigingLabels() {
        //   fetchContactBtnOtlt.setTitle(Global.shared.importContacts, for: .normal)
       // ibanCodeField.keyboardType = .asciiCapable
       
        submitBtnOtlt.setTitle(Global.shared.submitBtnTxt, for: .normal)
       
        if BeneficiaryDetails.shared.bank_FirstName_is_required == true {
            firstName.text = Global.shared.firstNameb + "*"
        }
        else {
            firstName.text = Global.shared.firstNameb
        }
        if BeneficiaryDetails.shared.bank_LastName_is_required == true {
            lastName.text = Global.shared.lastNameb + "*"
        }
        else {
            lastName.text = Global.shared.lastNameb
        }
        if BeneficiaryDetails.shared.bank_MiddleName_is_required == true {
            middleName.text = Global.shared.middleNameb + "*"
        }
        else {
            middleName.text = Global.shared.middleNameb
        }
        if BeneficiaryDetails.shared.bank_Mobile_is_required == true {
            mobileLbl.text = Global.shared.mobileNumberBenfTxt + "*"
        }
        else {
            mobileLbl.text = Global.shared.mobileNumberBenfTxt
        }
        if BeneficiaryDetails.shared.bank_Telephone_is_required == true {
            telephnLbl.text = Global.shared.telephneNumbrBenefTxt + "*"
        }
        else {
            telephnLbl.text = Global.shared.telephneNumbrBenefTxt
        }
        if BeneficiaryDetails.shared.bank_Nationality_is_required == true {
            nationalityLbl.text =  Global.shared.nationalityBenefTxt + "*"
        }
        else {
            nationalityLbl.text =  Global.shared.nationalityBenefTxt
        }
        if BeneficiaryDetails.shared.bank_Address1_is_required == true {
            adres1Lbl.text = Global.shared.address1b + "*"
        }
        else {
            adres1Lbl.text = Global.shared.address1b
        }
        if BeneficiaryDetails.shared.bank_Address2_is_required == true {
            adres2Lbl.text = Global.shared.address2b + "*"
        }
        else {
            adres2Lbl.text = Global.shared.address2b
        }
        branchCodeLbl.text = Global.shared.districtBenefTxt + ""
        if BeneficiaryDetails.shared.bank_District_is_required == true {
            districtLbl.text = Global.shared.districtBenefTxt + "*"
            
        }
        else {
            districtLbl.text = Global.shared.districtBenefTxt
        }
        if BeneficiaryDetails.shared.bank_City_is_required == true {
            cityLabel.text = Global.shared.cityb + "*"
            branchCodeLbl.text = Global.shared.districtBenefTxt + ""
        }
        else {
            cityLabel.text = Global.shared.cityb
        }
        if BeneficiaryDetails.shared.bank_State_is_required == true {
            stateLbl.text = Global.shared.stateb + "*"
        }
        else {
            stateLbl.text = Global.shared.stateb
        }
        if BeneficiaryDetails.shared.bank_PostCode_is_required == true {
            postCodeLbl.text = Global.shared.postCodeb + "*"
        }
        else {
            postCodeLbl.text = Global.shared.postCodeb
        }
        if BeneficiaryDetails.shared.bank_Country_is_required == true {
            countryLbl.text = Global.shared.countryb + "*"
        }
        else {
            countryLbl.text = Global.shared.countryb
        }
        if BeneficiaryDetails.shared.bank_Currency_is_required == true {
            currencyLbl.text = Global.shared.currencyb + "*"
        }
        else {
            currencyLbl.text = Global.shared.currencyb
        }
        if BeneficiaryDetails.shared.bank_BeneficiaryIdType_is_required == true {
            benefIdTypeLbl.text = Global.shared.benefIdTypeTxtt + "*"
        }
        else {
            benefIdTypeLbl.text = Global.shared.benefIdTypeTxtt
        }
        if BeneficiaryDetails.shared.bank_BeneficiaryIdNumber_is_required == true {
            benefIdLbl.text = Global.shared.AddBenefIDNumber + "*"
        }
        else {
            benefIdLbl.text = Global.shared.AddBenefIDNumber
        }
        if BeneficiaryDetails.shared.bank_BeneficiaryRelationship_is_required == true {
            reltnshipBenefLbl.text = Global.shared.AddBenefRelationBeneficiary + "*"
        }
        else {
            reltnshipBenefLbl.text =  Global.shared.AddBenefRelationBeneficiary
        }
        
        
        if BeneficiaryDetails.shared.bank_BankName_is_required == true {
            bankNameLbl.text = Global.shared.bankNameb + "*"
        }
        else {
            bankNameLbl.text = Global.shared.bankNameb
        }
        if BeneficiaryDetails.shared.bank_BranchName_is_required == true {
            branchNameLbl.text = Global.shared.branchNameb + "*"
        }
        else {
            branchNameLbl.text = Global.shared.branchNameb
        }
        if BeneficiaryDetails.shared.bank_AccountType_is_required == true {
            acntTypeLbl.text =  Global.shared.accounttypeTxt  + "*"
        }
        else {
            acntTypeLbl.text =  Global.shared.accounttypeTxt
        }
        if BeneficiaryDetails.shared.bank_IFSCCode_is_required == true {
            ifscCodeLbl.text = Global.shared.ifscCodeb + "*"
        }
        else {
            ifscCodeLbl.text = Global.shared.ifscCodeb
        }
        if BeneficiaryDetails.shared.bank_SWIFTCode_is_required == true {
            swiftCodeLbl.text = Global.shared.swiftCodeb + "*"
        }
        else {
            swiftCodeLbl.text = Global.shared.swiftCodeb
        }
        if BeneficiaryDetails.shared.bank_CNICNO_is_required == true {
            cnicnoLbl.text = Global.shared.cnicnob + "*"
        }
        else {
            cnicnoLbl.text = Global.shared.cnicnob
        }
        if BeneficiaryDetails.shared.bank_IBANCode_is_required == true {
            ibanCodeLbl.text = Global.shared.ibanCodeb + "*"
        }
        else {
            ibanCodeLbl.text = Global.shared.ibanCodeb
        }
        if BeneficiaryDetails.shared.bank_AccountNumber_is_required == true {
            acntNumberLbl.text = Global.shared.accountNumberb + "*"
        }
        else {
            acntNumberLbl.text = Global.shared.accountNumberb
        }
        if BeneficiaryDetails.shared.bank_BranchAddress1_is_required == true {
            branchAdres1Lbl.text = Global.shared.branchAddress1Txtt + "*"
        }
        else {
            branchAdres1Lbl.text = Global.shared.branchAddress1Txtt
        }
        if BeneficiaryDetails.shared.bank_BranchAddress2_is_required == true {
            branchAdres2lbl.text = Global.shared.branchAddress2Txtt + "*"
        }
        else {
            branchAdres2lbl.text = Global.shared.branchAddress2Txtt
        }
      /*  if BeneficiaryDetails.shared.bank_BranchCode_is_required == true {
            branchCodeLbl.text = "Branch Code" + "*"
        }
        else {
            branchCodeLbl.text = "Branch Code"
        }*/
        
        //branchCodeLbl.text = "District"
        
        
        
        firstNameReqLbl.text = Global.shared.firstNameb + " " + Global.shared.errorTxtRequired.lowercased()
        lastNameReqLbl.text =  Global.shared.lastNameb + " " + Global.shared.errorTxtRequired.lowercased()
        middleNameReqLbl.text =  Global.shared.middleNameb + " " + Global.shared.errorTxtRequired.lowercased()
        adresOneReqLbl.text =  Global.shared.address1b + " " + Global.shared.errorTxtRequired.lowercased()
        adresTwoReqLbl.text =  Global.shared.address2b + " " + Global.shared.errorTxtRequired.lowercased()
        cityReqLbl.text =  Global.shared.cityb + " " + Global.shared.errorTxtRequired.lowercased()
        stateReqLbl.text =  Global.shared.stateb + " " + Global.shared.errorTxtRequired.lowercased()
        postCodeReqLbl.text =  Global.shared.postCodeb + " " + Global.shared.errorTxtRequired.lowercased()
        countryReqLbl.text =  Global.shared.countryb + " " + Global.shared.errorTxtRequired.lowercased()
        currencyReqLbl.text =  Global.shared.currencyb + " " + Global.shared.errorTxtRequired.lowercased()
        mobileReqLbl.text =  Global.shared.mobileNumberBenfTxt + " " + Global.shared.errorTxtRequired.lowercased()
        
        acntNumberReqLbl.text =  Global.shared.accountNumberb + " " + Global.shared.errorTxtRequired.lowercased()
        
        bankNameReqLbl.text =  Global.shared.bankNameb + " " + Global.shared.errorTxtRequired.lowercased()
        
        branchNameReqLbl.text =  Global.shared.branchNameb + " " + Global.shared.errorTxtRequired.lowercased()
        ifscCodeReqLbl.text = Global.shared.ifscCodeb + " " +  Global.shared.errorTxtRequired.lowercased()
        swiftCodeReqLbl.text =  Global.shared.swiftCodeb + " " + Global.shared.errorTxtRequired.lowercased()
        ibanReqLbl.text =  Global.shared.ibanCodeb + " " + Global.shared.errorTxtRequired.lowercased()
        cnincoReqLbl.text =  Global.shared.cnicnob + " " + Global.shared.errorTxtRequired.lowercased()
        
        telephnReqLbl.text =  Global.shared.telephneNumbrBenefTxt + " " + Global.shared.errorTxtRequired.lowercased()
        nationalityReqLbl.text =   Global.shared.nationalityBenefTxt + " " + Global.shared.errorTxtRequired.lowercased()
        districtReqLbl.text =  Global.shared.districtBenefTxt + " " +  Global.shared.errorTxtRequired.lowercased()
        benefIdTypeReqLbl.text =  Global.shared.benefIdTypeTxtt  + " " + Global.shared.errorTxtRequired.lowercased()
        benefIdReqLbl.text =  Global.shared.AddBenefIDNumber + " " + Global.shared.errorTxtRequired.lowercased()
        reltnshipBenfReqLbl.text =  Global.shared.AddBenefRelationBeneficiary + " " + Global.shared.errorTxtRequired.lowercased()
        acntTypeReqLbl.text =  Global.shared.AddBenefAccountType + " " + Global.shared.errorTxtRequired.lowercased()
        branchAdres1ReqLbl.text =   Global.shared.branchAddress1Txtt  + " " + Global.shared.errorTxtRequired.lowercased()
        branchAdres2ReqLbl.text = Global.shared.branchAddress2Txtt  + " " +  Global.shared.errorTxtRequired.lowercased()
        branchCodeReqLbl.text = Global.shared.branchCodeb + " " +  Global.shared.errorTxtRequired.lowercased()
        
        dobReqLbl.text =  Global.shared.persnalDobTxt + " " + Global.shared.errorTxtRequired.lowercased()
        remarksReqLbl.text = Global.shared.remarksTxtt + " " + Global.shared.errorTxtRequired.lowercased()
        
        
        
        firstField.maxLength = BeneficiaryDetails.shared.bank_FirstName_max_length
        lastField.maxLength = BeneficiaryDetails.shared.bank_LastName_max_length
        middleField.maxLength = BeneficiaryDetails.shared.bank_MiddleName_max_length
        adres1Field.maxLength = BeneficiaryDetails.shared.bank_Address1_max_length
        adres2Field.maxLength = BeneficiaryDetails.shared.bank_Address2_max_length
        cityField.maxLength = BeneficiaryDetails.shared.bank_City_max_length
        stateField.maxLength = BeneficiaryDetails.shared.bank_State_max_length
        postCodeField.maxLength = BeneficiaryDetails.shared.bank_PostCode_max_length
        mobileField.maxLength = BeneficiaryDetails.shared.bank_Mobile_max_length
        acntNumberField.maxLength = BeneficiaryDetails.shared.bank_AccountNumber_max_length
        bankNameField.maxLength = BeneficiaryDetails.shared.bank_BankName_max_length
        branchNameField.maxLength = BeneficiaryDetails.shared.bank_BranchName_max_length
        ifscCodeField.maxLength = BeneficiaryDetails.shared.bank_IFSCCode_max_length
        swiftCodeField.maxLength = BeneficiaryDetails.shared.bank_SWIFTCode_max_length
        ibanCodeField.maxLength = BeneficiaryDetails.shared.bank_IBANCode_max_length
        cnicnoField.maxLength = BeneficiaryDetails.shared.bank_CNICNO_max_length
        telephnField.maxLength = BeneficiaryDetails.shared.bank_Telephone_max_length
        districtField.maxLength = BeneficiaryDetails.shared.bank_District_max_length
        benefIdField.maxLength = BeneficiaryDetails.shared.bank_BeneficiaryIdNumber_max_length
        reltnshipBenefField.maxLength = BeneficiaryDetails.shared.bank_BeneficiaryRelationship_max_length
        branchAdres1Field.maxLength = BeneficiaryDetails.shared.bank_BranchAddress1_max_length
        branchAdres2Field.maxLength = BeneficiaryDetails.shared.bank_BranchAddress2_max_length
        branchCodeField.maxLength = BeneficiaryDetails.shared.bank_BranchCode_max_length
        remarksField.maxLength = BeneficiaryDetails.shared.bank_Remarks_max_length
        
        remarksField.valueType = Global.shared.getFieldType(text: BeneficiaryDetails.shared.bank_Remarks_field_accept)
        firstField.valueType = Global.shared.getFieldType(text: BeneficiaryDetails.shared.bank_FirstName_field_accept)
        lastField.valueType = Global.shared.getFieldType(text: BeneficiaryDetails.shared.bank_LastName_field_accept)
        middleField.valueType = Global.shared.getFieldType(text: BeneficiaryDetails.shared.bank_MiddleName_field_accept)
        adres1Field.valueType = Global.shared.getFieldType(text: BeneficiaryDetails.shared.bank_Address1_field_accept)
        adres2Field.valueType = Global.shared.getFieldType(text: BeneficiaryDetails.shared.bank_Address2_field_accept)
        cityField.valueType = Global.shared.getFieldType(text: BeneficiaryDetails.shared.bank_City_field_accept)
        stateField.valueType = Global.shared.getFieldType(text: BeneficiaryDetails.shared.bank_State_field_accept)
        postCodeField.valueType = Global.shared.getFieldType(text: BeneficiaryDetails.shared.bank_PostCode_field_accept)
        mobileField.valueType = Global.shared.getFieldType(text: BeneficiaryDetails.shared.bank_Mobile_field_accept)
        acntNumberField.valueType = Global.shared.getFieldType(text: BeneficiaryDetails.shared.bank_AccountNumber_field_accept)
        bankNameField.valueType = Global.shared.getFieldType(text: BeneficiaryDetails.shared.bank_BankName_field_accept)
        branchNameField.valueType = Global.shared.getFieldType(text: BeneficiaryDetails.shared.bank_BranchName_field_accept)
        ifscCodeField.valueType = Global.shared.getFieldType(text: BeneficiaryDetails.shared.bank_IFSCCode_field_accept)
        swiftCodeField.valueType = Global.shared.getFieldType(text: BeneficiaryDetails.shared.bank_SWIFTCode_field_accept)
        ibanCodeField.valueType = Global.shared.getFieldType(text: BeneficiaryDetails.shared.bank_IBANCode_field_accept)
        cnicnoField.valueType = Global.shared.getFieldType(text: BeneficiaryDetails.shared.bank_CNICNO_field_accept)
        telephnField.valueType = Global.shared.getFieldType(text: BeneficiaryDetails.shared.bank_Telephone_field_accept)
        districtField.valueType = Global.shared.getFieldType(text: BeneficiaryDetails.shared.bank_District_field_accept)
        benefIdField.valueType = Global.shared.getFieldType(text: BeneficiaryDetails.shared.bank_BeneficiaryIdNumber_field_accept)
        reltnshipBenefField.valueType = Global.shared.getFieldType(text: BeneficiaryDetails.shared.bank_BeneficiaryRelationship_field_accept)
        branchAdres1Field.valueType = Global.shared.getFieldType(text: BeneficiaryDetails.shared.bank_BranchAddress1_field_accept)
        branchAdres2Field.valueType = Global.shared.getFieldType(text: BeneficiaryDetails.shared.bank_BranchAddress2_field_accept)
        branchCodeField.valueType = Global.shared.getFieldType(text: BeneficiaryDetails.shared.bank_BranchCode_field_accept)
        
    }
    
    func setKeyBoardType(){
        
        firstField.keyboardType = UIKeyboardType.asciiCapable
        lastField.keyboardType = UIKeyboardType.asciiCapable
        middleField.keyboardType = UIKeyboardType.asciiCapable
        adres1Field.keyboardType = UIKeyboardType.asciiCapable
        adres2Field.keyboardType = UIKeyboardType.asciiCapable
        cityField.keyboardType = UIKeyboardType.asciiCapable
        stateField.keyboardType = UIKeyboardType.asciiCapable
        postCodeField.keyboardType = UIKeyboardType.asciiCapableNumberPad
        mobileField.keyboardType = UIKeyboardType.asciiCapableNumberPad
        acntNumberField.keyboardType = UIKeyboardType.asciiCapable
        bankNameField.keyboardType = UIKeyboardType.asciiCapable
        branchNameField.keyboardType = UIKeyboardType.asciiCapable
        ifscCodeField.keyboardType = UIKeyboardType.asciiCapable
        swiftCodeField.keyboardType = UIKeyboardType.asciiCapable
        ibanCodeField.keyboardType = UIKeyboardType.asciiCapable
        cnicnoField.keyboardType = UIKeyboardType.asciiCapable
        telephnField.keyboardType = UIKeyboardType.asciiCapableNumberPad
        districtField.keyboardType = UIKeyboardType.asciiCapable
        benefIdField.keyboardType = UIKeyboardType.asciiCapable
        reltnshipBenefField.keyboardType = UIKeyboardType.asciiCapable
        branchAdres1Field.keyboardType = UIKeyboardType.asciiCapable
        branchAdres2Field.keyboardType = UIKeyboardType.asciiCapable
        branchCodeField.keyboardType = UIKeyboardType.asciiCapable
        remarksField.keyboardType = UIKeyboardType.asciiCapable
        
    }
    
    @IBAction func expandOneActn(_ sender: Any) {
        if(expandOneClick == true) {
            self.expandOneView.isHidden = true
            self.expandOneHeightConstraint.constant = 0
        } else {
            self.expandOneView.isHidden = false
            self.expandOneHeightConstraint.constant = 1650
            
        }
        
        expandOneClick = !expandOneClick
    }
    
    
    @IBAction func expandSecndActn(_ sender: Any) {
        if(expandTwoClick == true) {
            self.expandTwoView.isHidden = false
            self.expandTwoHeightConstrt.constant = 890
            
        } else {
            self.expandTwoView.isHidden = true
            self.expandTwoHeightConstrt.constant = 0
            
        }
        
        expandTwoClick = !expandTwoClick
    }
    
  
    @IBAction func submitBtnActn(_ sender: Any) {
        
        self.expandTwoView.isHidden = false
        self.expandTwoHeightConstrt.constant = 890
        
        self.showSpinner(onView: self.view)
        if BeneficiaryDetails.shared.bank_FirstName_is_required == true && firstField.text == ""{
            firstNameReqLbl.isHidden = false
            firstField.becomeFirstResponder()
            self.removeSpinner()
            
        }
        else  if BeneficiaryDetails.shared.bank_MiddleName_is_required == true &&  middleField.text == "" {
            middleNameReqLbl.isHidden = false
            middleField.becomeFirstResponder()
            self.removeSpinner()
           
        }
        else  if BeneficiaryDetails.shared.bank_LastName_is_required == true && lastField.text == "" {
            lastNameReqLbl.isHidden = false
            lastField.becomeFirstResponder()
            self.removeSpinner()
        }
            else  if BeneficiaryDetails.shared.bank_Address1_is_required == true &&  adres1Field.text == "" {
                       adresOneReqLbl.isHidden = false
                adres1Field.becomeFirstResponder()
            self.removeSpinner()
                   }
                   else  if BeneficiaryDetails.shared.bank_Address2_is_required == true &&  adres2Field.text == "" {
                       adresTwoReqLbl.isHidden = false
                    adres2Field.becomeFirstResponder()
            self.removeSpinner()
            
                   }
                   else  if BeneficiaryDetails.shared.bank_District_is_required == true &&  districtField.text == "" {
                       districtReqLbl.isHidden = false
                    districtField.becomeFirstResponder()
            self.removeSpinner()
                   }
                   else  if BeneficiaryDetails.shared.bank_City_is_required == true &&  cityField.text == "" {
                       cityReqLbl.isHidden = false
                    cityField.becomeFirstResponder()
            self.removeSpinner()
                   }
                   else  if BeneficiaryDetails.shared.bank_State_is_required == true &&  stateField.text == "" {
                       stateReqLbl.isHidden = false
                    stateField.becomeFirstResponder()
            self.removeSpinner()
                   }
                   else  if BeneficiaryDetails.shared.bank_PostCode_is_required == true &&  postCodeField.text == "" {
                       postCodeReqLbl.isHidden = false
                    postCodeField.becomeFirstResponder()
            self.removeSpinner()
                   }
            else  if BeneficiaryDetails.shared.bank_Country_is_required == true &&  countryField.text == "" {
                       countryReqLbl.isHidden = false
               
            self.removeSpinner()
                   }
                   else  if BeneficiaryDetails.shared.bank_Currency_is_required == true &&  curencyField.text == "" {
                       currencyReqLbl.isHidden = false
            self.removeSpinner()
                   }
            
        else  if BeneficiaryDetails.shared.bank_Mobile_is_required == true && mobileField.text == "" {
            mobileReqLbl.isHidden = false
            mobileField.becomeFirstResponder()
            self.removeSpinner()
        }
        else  if BeneficiaryDetails.shared.bank_Telephone_is_required == true && telephnField.text == "" {
            telephnReqLbl.isHidden = false
            telephnField.becomeFirstResponder()
            self.removeSpinner()
        }
        else  if BeneficiaryDetails.shared.bank_Nationality_is_required == true && nationalityField.text == "" {
            nationalityReqLbl.isHidden = false
            self.removeSpinner()
        }
       
       
        else  if BeneficiaryDetails.shared.bank_BeneficiaryIdType_is_required == true &&  benefIdTypeField.text == "" {
            benefIdTypeReqLbl.isHidden = false
            self.removeSpinner()
        }
        else  if BeneficiaryDetails.shared.bank_BeneficiaryIdNumber_is_required == true &&  benefIdField.text == "" {
            benefIdReqLbl.isHidden = false
            benefIdField.becomeFirstResponder()
            self.removeSpinner()
        }
        else  if BeneficiaryDetails.shared.bank_BeneficiaryRelationship_is_required == true &&  reltnshipBenefField.text == "" {
            reltnshipBenfReqLbl.isHidden = false
            self.removeSpinner()
        }
        else  if BeneficiaryDetails.shared.bank_BankName_is_required == true && bankNameField.text == "" {
            bankNameReqLbl.isHidden = false
            bankNameField.becomeFirstResponder()
            self.removeSpinner()
        }
        else  if BeneficiaryDetails.shared.bank_BranchName_is_required == true && branchNameField.text == "" {
            branchNameReqLbl.isHidden = false
            branchNameField.becomeFirstResponder()
            self.removeSpinner()
        }
        else  if BeneficiaryDetails.shared.bank_AccountType_is_required == true && acntTypeField.text == "" {
            acntTypeReqLbl.isHidden = false
            self.removeSpinner()
        }
        else  if BeneficiaryDetails.shared.bank_IFSCCode_is_required == true && ifscCodeField.text == "" {
            ifscCodeReqLbl.isHidden = false
            ifscCodeField.becomeFirstResponder()
            self.removeSpinner()
        }
        else  if BeneficiaryDetails.shared.bank_SWIFTCode_is_required == true && swiftCodeField.text == "" {
            swiftCodeReqLbl.isHidden = false
            swiftCodeField.becomeFirstResponder()
            self.removeSpinner()
        }
            else  if BeneficiaryDetails.shared.bank_CNICNO_is_required == true && cnicnoField.text == "" {
                cnincoReqLbl.isHidden = false
                cnicnoField.becomeFirstResponder()
            self.removeSpinner()
            }
        else  if BeneficiaryDetails.shared.bank_IBANCode_is_required == true && ibanCodeField.text == "" {
            ibanReqLbl.isHidden = false
            ibanCodeField.becomeFirstResponder()
            self.removeSpinner()
        }
        
        else  if BeneficiaryDetails.shared.bank_AccountNumber_is_required == true && acntNumberField.text == "" {
            acntNumberReqLbl.isHidden = false
            acntNumberField.becomeFirstResponder()
            self.removeSpinner()
        }
        else  if BeneficiaryDetails.shared.bank_BranchAddress1_is_required == true && branchAdres1Field.text == "" {
            branchAdres1ReqLbl.isHidden = false
            branchAdres1Field.becomeFirstResponder()
            self.removeSpinner()
        }
        else  if BeneficiaryDetails.shared.bank_BranchAddress2_is_required == true && branchAdres2Field.text == "" {
            branchAdres2ReqLbl.isHidden = false
            branchAdres2Field.becomeFirstResponder()
            self.removeSpinner()
        }
       /* else  if BeneficiaryDetails.shared.bank_BranchCode_is_required == true && branchCodeField.text == "" {
            branchCodeReqLbl.isHidden = false
            self.removeSpinner()
        }*/
            
        else {
            self.submitBtnOtlt.isEnabled = false
            generateOTP()
        }
        
    }
    
    
    @IBAction func countryDrpDwnActn(_ sender: Any) {
      /*  let pickerData = Global.shared.pickerResponseCountryData
              PickerDialog().show(title: "", options: pickerData , selected: "") {
                  (value) -> Void in
                  self.countryField.text = "\(value)"
                  let indexS = Global.shared.countryNameData.firstIndex(of: "\(value)")
               self.countryCodeSelected   = Global.shared.countryCodesData[indexS ?? 0]
                 self.curencyField.text = Global.shared.currencyCodesData[indexS ?? 0]
                self.mobileCodeField.text = Global.shared.phoneCodesData[indexS ?? 0]
                  
                      self.countryReqLbl.isHidden = true
                                 self.currencyReqLbl.isHidden = true
                  
              }*/
        
        
        
    /*    Global.shared.contryNationality = "country"
               let popOverVC = self.storyboard?.instantiateViewController(withIdentifier: "CountryDrpDownSearch") as! CountryDrpDownSearch
                             self.addChild(popOverVC)
                             popOverVC.delegate = self
                             popOverVC.view.frame = self.view.frame
                             self.view.addSubview(popOverVC.view)
                             popOverVC.didMove(toParent: self)*/
        
        Global.shared.contryNationality = "country"
        let popOverVC = self.storyboard?.instantiateViewController(withIdentifier: "CountryDrpDownSearch") as! CountryDrpDownSearch
        self.addChild(popOverVC)
        popOverVC.delegate = self
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParent: self)
        
    }
    
    var curncyNames = [String]()
    var curncyValues = [String]()
    var pickerResponseCurency = [[String: String]]()
    
    func dropValuesCountryChanged(dropDisplay: String) {
          
          if Global.shared.contryNationality == "country" {
        /*     self.countryField.text = dropDisplay
          let indexS = Global.shared.countryNameData.firstIndex(of: "\(dropDisplay)")
         self.countryCodeSelected   = Global.shared.countryCodesData[indexS ?? 0]
                        self.curencyField.text = Global.shared.currencyCodesData[indexS ?? 0]
                       self.mobileCodeField.text = Global.shared.phoneCodesData[indexS ?? 0]
            
            let indexM = Global.shared.countryNameData.firstIndex(of: "\(dropDisplay)")

              let countryImgCode = Global.shared.countryCodesData[indexM ?? 0]
                      //  self.placeOfBirthImg.image = UIImage(named: dropDisplay)
            self.countryDrpImg.image = UIImage(named:  countryImgCode.lowercased())
            
            self.curncyDrpImg.image = UIImage(named: countryImgCode.lowercased())
            
            // self.countryDrpImg.image = UIImage(named: dropDisplay)
           // self.curncyDrpImg.image = UIImage(named: dropDisplay)
                           self.telePhnCodeLbl.text = Global.shared.phoneCodesData[indexS ?? 0]
                         
                             self.countryReqLbl.isHidden = true
                                        self.currencyReqLbl.isHidden = true*/
            
            
            self.curencyField.text = ""
            self.curncyNames.removeAll()
            self.curncyValues.removeAll()
            self.pickerResponseCurency.removeAll()
            
            self.countryField.text = "\(dropDisplay)"
            self.countryField.text = "\(dropDisplay)"
            let indexS = Global.shared.countryNameData.firstIndex(of: "\(dropDisplay)")
            self.countryCodeSelected   = Global.shared.countryCodesData[indexS ?? 0]
            
            
            let mobileIndex = Global.shared.countryCodesDataAll.firstIndex(of: self.countryCodeSelected)
            self.telePhnCodeLbl.text = Global.shared.phoneCodesDataAll[mobileIndex ?? 0]
            self.mobileCodeField.text = Global.shared.phoneCodesDataAll[mobileIndex ?? 0]
            
            if let curencysList = Global.shared.countryCurncyBankAry[indexS ?? 0] as? NSArray {
                print(curencysList)
                //please check country
                if let langName = curencysList.value(forKey: "name") as? [String] {
                    self.curncyNames = langName
                }
                if let langValue = curencysList.value(forKey: "value") as? [String] {
                    self.curncyValues = langValue
                }
                
            
                for i in 0..<self.curncyNames.count {
                    self.pickerResponseCurency.append(["value":  self.curncyValues[i], "display":   self.curncyValues[i]])
                }
                
               
                    self.curencyField.text = self.curncyValues[0]
                    let indexS = self.curncyValues.firstIndex(of: self.curncyValues[0])
                    BeneficiaryDetails.shared.targetCurncyFulName = self.curncyNames[indexS ?? 0]
                    
                    self.currencyReqLbl.isHidden = true
            }
            BeneficiaryDetails.shared.countryCode = self.countryCodeSelected
            self.countryReqLbl.isHidden = true
            self.currencyReqLbl.isHidden = true
        
            self.countryDrpImg.image = UIImage(named:  self.countryCodeSelected.lowercased())
            self.curncyDrpImg.image = UIImage(named: self.countryCodeSelected.lowercased())
        
            self.countryReqLbl.isHidden = true
            self.currencyReqLbl.isHidden = true
            
            
          }
          else {
              self.nationalityField.text = dropDisplay
             self.nationalityField.text = "\(dropDisplay)"
                            let indexS = Global.shared.countryNameData.firstIndex(of: "\(dropDisplay)")
                            self.nationalityCodeSelected   = Global.shared.countryCodesData[indexS ?? 0]
            self.nationalityDrpImg.image = UIImage(named: self.nationalityCodeSelected.lowercased())
                            self.nationalityReqLbl.isHidden = true
          }
          
      }
    
    @IBAction func nationalityBtnActn(_ sender: Any) {
           
      /*     let pickerData = Global.shared.pickerResponseCountryData
           PickerDialog().show(title: "", options: pickerData , selected: "") {
               (value) -> Void in
               self.nationalityField.text = "\(value)"
               let indexS = Global.shared.countryNameData.firstIndex(of: "\(value)")
               self.nationalityCodeSelected   = Global.shared.countryCodesData[indexS ?? 0]
              
               self.nationalityReqLbl.isHidden = true
               
           }*/
        
        Global.shared.contryNationality = "nationality"
               let popOverVC = self.storyboard?.instantiateViewController(withIdentifier: "CountryDrpDownSearch") as! CountryDrpDownSearch
                                    self.addChild(popOverVC)
                                    popOverVC.delegate = self
                                    popOverVC.view.frame = self.view.frame
                                    self.view.addSubview(popOverVC.view)
                                    popOverVC.didMove(toParent: self)
        
        
           
       }
    
    
    override func viewWillAppear(_ animated: Bool) {
       
        Global.shared.countrysChangeAccordingly = "BankAdd"
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        Global.shared.timeoUtOrNot = "yes"
        observeTimeout()
    }
    
    func valuesChanged(firstName:String,middleName:String,lastName:String, mobileNumber:String) {
        //     self.firstField.text = BeneficiaryDetails.shared.contactFirstName
        //     self.mobileField.text = BeneficiaryDetails.shared.contactMobileNumber
        self.firstField.text = ""
        self.lastField.text = ""
        self.middleField.text = ""
        self.mobileField.text = ""
//        if firstName.contains(" "){
//                print("Has space")
//            let result = firstName.split(separator: " ")
//            if result.count == 2
//            {
//            self.firstField.text = String(result[0])
//            self.lastField.text = String(result[1])
//            }
//            else if result.count == 3
//            {
//                self.firstField.text = String(result[0])
//                self.lastField.text = String(result[2])
//                self.middleField.text = String(result[1])
//            }
//            else{
//                self.firstName.text = String(result[0])
//            }
//            
//            }else{
//                self.firstField.text = firstName
//            }
//        
        self.mobileField.text = mobileNumber
        self.firstField.text = firstName
        self.lastField.text = lastName
        self.middleField.text = middleName
    }
    
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    
    
    @IBAction func bckBtnActn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        
        BeneficiaryDetails.shared.contactFirstName = ""
        BeneficiaryDetails.shared.contactMobileNumber = ""
        
    }
    
    
 
    // Mark: generating otp
    func generateOTP() {
        
        let paramaterPasing: [String:Any] =
            [
                "registrationId": Global.shared.afterLoginRegistrtnId ?? "",
                "beneficiaryFirstName": firstField.text ?? ""
        ]
        
        
     /*   let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]*/
        
        let headers: HTTPHeaders = [.authorization(bearerToken: UserDefaults.standard.string(forKey: "token")!)]
        
        NetWorkDataManager.sharedInstance.benefGenerateOtpImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            self.submitBtnOtlt.isEnabled = true
            if errorString == nil
            {
                // print(resonseTal)
                self.removeSpinner()
                Global.shared.otpType = resonseTal?.value(forKey: "otpType") as? Int
                
                BankTransfer.shared.firstName = self.firstField.text ?? ""
                BankTransfer.shared.lastName =  self.lastField.text ?? ""
                BankTransfer.shared.middleName =  self.middleField.text ?? ""
                BankTransfer.shared.mobile =  self.mobileField.text ?? ""
                BankTransfer.shared.telephone =  self.telephnField.text ?? ""
                BankTransfer.shared.nationality =  self.nationalityCodeSelected
                BankTransfer.shared.address1 =  self.adres1Field.text ?? ""
                BankTransfer.shared.address2 =  self.adres2Field.text ?? ""
                BankTransfer.shared.district =  self.districtField.text ?? ""
                BankTransfer.shared.city =  self.cityField.text ?? ""
                BankTransfer.shared.state =  self.stateField.text ?? ""
                BankTransfer.shared.postCode =  self.postCodeField.text ?? ""
                BankTransfer.shared.country =  self.countryCodeSelected
                BankTransfer.shared.currency =  self.curencyField.text ?? ""
                BankTransfer.shared.beneficiaryIdType =  self.benefIdTypeSelected
                BankTransfer.shared.beneficiaryIdNumber =  self.benefIdField.text ?? ""
                BankTransfer.shared.beneficiaryRelationship =  self.reltnshipBenefField.text ?? ""
                BankTransfer.shared.bankName =  self.bankNameField.text ?? ""
                BankTransfer.shared.branchName =  self.branchNameField.text ?? ""
                BankTransfer.shared.accountType =  self.bankAcntTypeSelected
                BankTransfer.shared.ifscCode =  self.ifscCodeField.text ?? ""
                BankTransfer.shared.swiftCode =  self.swiftCodeField.text ?? ""
                BankTransfer.shared.cnicno =  self.cnicnoField.text ?? ""
                BankTransfer.shared.ibanCode =  self.ibanCodeField.text ?? ""
                BankTransfer.shared.accountNumber =  self.acntNumberField.text ?? ""
                BankTransfer.shared.branchAddress1 =  self.branchAdres1Field.text ?? ""
                BankTransfer.shared.branchAddress2 =  self.branchAdres2Field.text ?? ""
                BankTransfer.shared.branchCode =  self.branchCodeField.text ?? ""
                BankTransfer.shared.benefImg = self.imgeXX
                
               
                BankTransfer.shared.dob =  self.dob
                BankTransfer.shared.remarks =  self.remarksField.text ?? ""
                BankTransfer.shared.branchDistrict = "d"
                
                //   Global.shared.otpTypeForBeneficiary =
                
                Global.shared.fromNewExistUser = "Benef1"
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
        if textField == firstField{
            if BeneficiaryDetails.shared.bank_FirstName_is_required == true {
                if firstField.text!.count ==  0 {
                    firstNameReqLbl.isHidden = false
                }
                else {
                    firstNameReqLbl.isHidden = true
                }
            }
        }
            else  if textField == middleField{
                if BeneficiaryDetails.shared.bank_MiddleName_is_required == true {
                    if middleField.text!.count ==  0 {
                        middleNameReqLbl.isHidden = false
                    }
                    else {
                        middleNameReqLbl.isHidden = true
                    }
                }
            }
        else  if textField == lastField{
            if BeneficiaryDetails.shared.bank_LastName_is_required == true {
                if lastField.text!.count ==  0 {
                    lastNameReqLbl.isHidden = false
                }
                else {
                    lastNameReqLbl.isHidden = true
                }
            }
        }
            else  if textField == adres1Field{
                       if BeneficiaryDetails.shared.bank_Address1_is_required == true {
                           if adres1Field.text!.count ==  0 {
                               adresOneReqLbl.isHidden = false
                           }
                           else {
                               adresOneReqLbl.isHidden = true
                           }
                       }
                   }
                   else  if textField == adres2Field{
                       if BeneficiaryDetails.shared.bank_Address2_is_required == true {
                           if adres2Field.text!.count ==  0 {
                               adresTwoReqLbl.isHidden = false
                           }
                           else {
                               adresTwoReqLbl.isHidden = true
                           }
                       }
                   }
                   else  if textField == districtField{
                       if BeneficiaryDetails.shared.bank_District_is_required == true {
                           if districtField.text!.count ==  0 {
                               districtReqLbl.isHidden = false
                           }
                           else {
                               districtReqLbl.isHidden = true
                           }
                       }
                   }
                   else  if textField == cityField{
                       if BeneficiaryDetails.shared.bank_City_is_required == true {
                           if cityField.text!.count ==  0 {
                               cityReqLbl.isHidden = false
                           }
                           else {
                               cityReqLbl.isHidden = true
                           }
                       }
                   }
                   else  if textField == stateField {
                       if BeneficiaryDetails.shared.bank_State_is_required == true {
                           if stateField.text!.count ==  0 {
                               stateReqLbl.isHidden = false
                           }
                           else {
                               stateReqLbl.isHidden = true
                           }
                       }
                   }
                   else  if textField == postCodeField {
                       if BeneficiaryDetails.shared.bank_PostCode_is_required == true {
                           if postCodeField.text!.count ==  0 {
                               postCodeReqLbl.isHidden = false
                           }
                           else {
                               postCodeReqLbl.isHidden = true
                           }
                       }
                   }
        
        else  if textField == mobileField {
            if BeneficiaryDetails.shared.bank_Mobile_is_required == true {
                if mobileField.text!.count ==  0 {
                    mobileReqLbl.isHidden = false
                }
                else {
                    mobileReqLbl.isHidden = true
                }
            }
        }
        else  if textField == telephnField {
            if BeneficiaryDetails.shared.bank_Telephone_is_required == true {
                if telephnField.text!.count ==  0 {
                    telephnReqLbl.isHidden = false
                }
                else {
                    telephnReqLbl.isHidden = true
                }
            }
        }
       
        else  if textField == benefIdField {
            if BeneficiaryDetails.shared.bank_BeneficiaryIdNumber_is_required == true {
                if benefIdField.text!.count ==  0 {
                    benefIdReqLbl.isHidden = false
                }
                else {
                    benefIdReqLbl.isHidden = true
                }
            }
        }
        else  if textField == reltnshipBenefField {
            if BeneficiaryDetails.shared.bank_BeneficiaryRelationship_is_required == true {
                if reltnshipBenefField.text!.count ==  0 {
                    reltnshipBenfReqLbl.isHidden = false
                }
                else {
                    reltnshipBenfReqLbl.isHidden = true
                }
            }
        }
          /*  else  if textField == remarksField {
                
                    if remarksField.text!.count ==  0 {
                        remarksReqLbl.isHidden = false
                    }
                    else {
                        remarksReqLbl.isHidden = true
                    }
                
            }*/

        else  if textField == bankNameField {
            if BeneficiaryDetails.shared.bank_BankName_is_required == true {
                if bankNameField.text!.count ==  0 {
                    bankNameReqLbl.isHidden = false
                }
                else {
                    bankNameReqLbl.isHidden = true
                }
            }
        }
            
        else  if textField == branchNameField {
            if BeneficiaryDetails.shared.bank_BranchName_is_required == true {
                if branchNameField.text!.count ==  0 {
                    branchNameReqLbl.isHidden = false
                }
                else {
                    branchNameReqLbl.isHidden = true
                }
            }
        }
            
        else  if textField == ifscCodeField {
            if BeneficiaryDetails.shared.bank_IFSCCode_is_required == true {
                if ifscCodeField.text!.count ==  0 {
                    ifscCodeReqLbl.isHidden = false
                }
                else {
                    ifscCodeReqLbl.isHidden = true
                }
            }
        }
        else  if textField == swiftCodeField {
            if BeneficiaryDetails.shared.bank_SWIFTCode_is_required == true {
                if swiftCodeField.text!.count ==  0 {
                    swiftCodeReqLbl.isHidden = false
                }
                else {
                    swiftCodeReqLbl.isHidden = true
                }
            }
        }
            else  if textField == cnicnoField {
                       if BeneficiaryDetails.shared.bank_CNICNO_is_required == true {
                           if cnicnoField.text!.count ==  0 {
                               cnincoReqLbl.isHidden = false
                           }
                           else {
                               cnincoReqLbl.isHidden = true
                           }
                       }
                   }
        else  if textField == ibanCodeField {
            if BeneficiaryDetails.shared.bank_IBANCode_is_required == true {
                if ibanCodeField.text!.count ==  0 {
                    ibanReqLbl.isHidden = false
                }
                else {
                    ibanReqLbl.isHidden = true
                }
            }
        }
        
        else  if textField == acntNumberField {
            if BeneficiaryDetails.shared.bank_AccountNumber_is_required == true {
                if acntNumberField.text!.count ==  0 {
                    acntNumberReqLbl.isHidden = false
                }
                else {
                    acntNumberReqLbl.isHidden = true
                }
            }
        }
        else  if textField == branchAdres1Field {
            if BeneficiaryDetails.shared.bank_BranchAddress1_is_required == true {
                if branchAdres1Field.text!.count ==  0 {
                    branchAdres1ReqLbl.isHidden = false
                }
                else {
                    branchAdres1ReqLbl.isHidden = true
                }
            }
        }
        else  if textField == branchAdres2Field {
            if BeneficiaryDetails.shared.bank_BranchAddress2_is_required == true {
                if branchAdres2Field.text!.count ==  0 {
                    branchAdres2ReqLbl.isHidden = false
                }
                else {
                    branchAdres2ReqLbl.isHidden = true
                }
            }
        }
      /*  else  if textField == branchCodeField {
            if BeneficiaryDetails.shared.bank_BranchCode_is_required == true {
                if branchCodeField.text!.count ==  0 {
                    branchCodeReqLbl.isHidden = false
                }
                else {
                    branchCodeReqLbl.isHidden = true
                }
            }
        }*/
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
       // textField.keyboardType = .asciiCapable
      
        if textField == firstField {
            if BeneficiaryDetails.shared.bank_FirstName_is_required == true {
                if firstField.text!.count <= -1 {
                    firstNameReqLbl.isHidden = false
                }
                else {
                    firstNameReqLbl.isHidden = true
                }
            }
            return firstField.verifyFields(shouldChangeCharactersIn: range, replacementString: string)
        }
            else  if textField == middleField {
                       if BeneficiaryDetails.shared.bank_MiddleName_is_required == true {
                           if middleField.text!.count <= -1 {
                               middleNameReqLbl.isHidden = false
                           }
                           else {
                               middleNameReqLbl.isHidden = true
                           }
                       }
                       return middleField.verifyFields(shouldChangeCharactersIn: range, replacementString: string)
                   }
        else  if textField == lastField {
            if BeneficiaryDetails.shared.bank_LastName_is_required == true {
                if lastField.text!.count <= -1 {
                    lastNameReqLbl.isHidden = false
                }
                else {
                    lastNameReqLbl.isHidden = true
                }
            }
            return lastField.verifyFields(shouldChangeCharactersIn: range, replacementString: string)
        }
            else  if textField == adres1Field {
                      if BeneficiaryDetails.shared.bank_Address1_is_required == true {
                          if adres1Field.text!.count <= -1 {
                              adresOneReqLbl.isHidden = false
                          }
                          else {
                              adresOneReqLbl.isHidden = true
                          }
                      }
                      return adres1Field.verifyFields(shouldChangeCharactersIn: range, replacementString: string)
                  }
                  else  if textField == adres2Field {
                      if BeneficiaryDetails.shared.bank_Address2_is_required == true {
                          if adres2Field.text!.count <= -1 {
                              adresTwoReqLbl.isHidden = false
                          }
                          else {
                              adresTwoReqLbl.isHidden = true
                          }
                      }
                      return adres2Field.verifyFields(shouldChangeCharactersIn: range, replacementString: string)
                  }
                  else  if textField == districtField {
                      if BeneficiaryDetails.shared.bank_District_is_required == true {
                          if districtField.text!.count <= -1 {
                              districtReqLbl.isHidden = false
                          }
                          else {
                              districtReqLbl.isHidden = true
                          }
                      }
                      return districtField.verifyFields(shouldChangeCharactersIn: range, replacementString: string)
                  }
                  else  if textField == cityField {
                      if BeneficiaryDetails.shared.bank_City_is_required == true {
                          if cityField.text!.count <= -1 {
                              cityReqLbl.isHidden = false
                          }
                          else {
                              cityReqLbl.isHidden = true
                          }
                      }
                      return cityField.verifyFields(shouldChangeCharactersIn: range, replacementString: string)
                  }
                  else  if textField == stateField {
                      if BeneficiaryDetails.shared.bank_State_is_required == true {
                          if stateField.text!.count <= -1 {
                              stateReqLbl.isHidden = false
                          }
                          else {
                              stateReqLbl.isHidden = true
                          }
                      }
                      return stateField.verifyFields(shouldChangeCharactersIn: range, replacementString: string)
                  }
                  else  if textField == postCodeField {
                      if BeneficiaryDetails.shared.bank_PostCode_is_required == true {
                          if postCodeField.text!.count <= -1 {
                              postCodeReqLbl.isHidden = false
                          }
                          else {
                              postCodeReqLbl.isHidden = true
                          }
                      }
                      return postCodeField.verifyFields(shouldChangeCharactersIn: range, replacementString: string)
                  }
       
        else  if textField == mobileField {
            if BeneficiaryDetails.shared.bank_Mobile_is_required == true {
                if mobileField.text!.count <= -1 {
                    mobileReqLbl.isHidden = false
                }
                else {
                    mobileReqLbl.isHidden = true
                }
            }
            return mobileField.verifyFields(shouldChangeCharactersIn: range, replacementString: string)
        }
        else  if textField == telephnField {
            if BeneficiaryDetails.shared.bank_Telephone_is_required == true {
                if telephnField.text!.count <= -1 {
                    telephnReqLbl.isHidden = false
                }
                else {
                    telephnReqLbl.isHidden = true
                }
            }
            return telephnField.verifyFields(shouldChangeCharactersIn: range, replacementString: string)
        }
        
        else  if textField == remarksField {
            if BeneficiaryDetails.shared.bank_Remarks_is_required == true {
                if remarksField.text!.count <= -1 {
                    remarksReqLbl.isHidden = false
                }
                else {
                    remarksReqLbl.isHidden = true
                }
            }
            return remarksField.verifyFields(shouldChangeCharactersIn: range, replacementString: string)
        }
      
        else  if textField == benefIdField {
            if BeneficiaryDetails.shared.bank_BeneficiaryIdNumber_is_required == true {
                if benefIdField.text!.count <= -1 {
                    benefIdReqLbl.isHidden = false
                }
                else {
                    benefIdReqLbl.isHidden = true
                }
            }
            return benefIdField.verifyFields(shouldChangeCharactersIn: range, replacementString: string)
        }
        else  if textField == reltnshipBenefField {
            if BeneficiaryDetails.shared.bank_BeneficiaryRelationship_is_required == true {
                if reltnshipBenefField.text!.count <= -1 {
                    reltnshipBenfReqLbl.isHidden = false
                }
                else {
                    reltnshipBenfReqLbl.isHidden = true
                }
            }
            return reltnshipBenefField.verifyFields(shouldChangeCharactersIn: range, replacementString: string)
        }
        else  if textField == bankNameField {
            if BeneficiaryDetails.shared.bank_BankName_is_required == true {
                if bankNameField.text!.count <= -1 {
                    bankNameReqLbl.isHidden = false
                }
                else {
                    bankNameReqLbl.isHidden = true
                }
            }
            return bankNameField.verifyFields(shouldChangeCharactersIn: range, replacementString: string)
        }
            
        else  if textField == branchNameField {
            if BeneficiaryDetails.shared.bank_BranchName_is_required == true {
                if branchNameField.text!.count <= -1 {
                    branchNameReqLbl.isHidden = false
                }
                else {
                    branchNameReqLbl.isHidden = true
                }
            }
            return branchNameField.verifyFields(shouldChangeCharactersIn: range, replacementString: string)
        }
        else  if textField == ifscCodeField {
            if BeneficiaryDetails.shared.bank_IFSCCode_is_required == true {
                if ifscCodeField.text!.count <= -1 {
                    ifscCodeReqLbl.isHidden = false
                }
                else {
                    ifscCodeReqLbl.isHidden = true
                }
            }
            return ifscCodeField.verifyFields(shouldChangeCharactersIn: range, replacementString: string)
        }
        else  if textField == swiftCodeField {
            if BeneficiaryDetails.shared.bank_SWIFTCode_is_required == true {
                if swiftCodeField.text!.count <= -1 {
                    swiftCodeReqLbl.isHidden = false
                }
                else {
                    swiftCodeReqLbl.isHidden = true
                }
            }
            return swiftCodeField.verifyFields(shouldChangeCharactersIn: range, replacementString: string)
        }
            else  if textField == cnicnoField {
                if BeneficiaryDetails.shared.bank_CNICNO_is_required == true {
                    if cnicnoField.text!.count <= -1 {
                        cnincoReqLbl.isHidden = false
                    }
                    else {
                        cnincoReqLbl.isHidden = true
                    }
                }
                return cnicnoField.verifyFields(shouldChangeCharactersIn: range, replacementString: string)
            }
        else  if textField == ibanCodeField {
            if BeneficiaryDetails.shared.bank_IBANCode_is_required == true {
                if ibanCodeField.text!.count <= -1 {
                    ibanReqLbl.isHidden = false
                }
                else {
                    ibanReqLbl.isHidden = true
                }
            }
            return ibanCodeField.verifyFields(shouldChangeCharactersIn: range, replacementString: string)
        }
        
            
        else  if textField == acntNumberField {
            if BeneficiaryDetails.shared.bank_AccountNumber_is_required == true {
                if acntNumberField.text!.count <= -1 {
                    acntNumberReqLbl.isHidden = false
                }
                else {
                    acntNumberReqLbl.isHidden = true
                }
            }
            return acntNumberField.verifyFields(shouldChangeCharactersIn: range, replacementString: string)
        }
        else  if textField == branchAdres1Field {
            if BeneficiaryDetails.shared.bank_BranchAddress1_is_required == true {
                if branchAdres1Field.text!.count <= -1 {
                    branchAdres1ReqLbl.isHidden = false
                }
                else {
                    branchAdres1ReqLbl.isHidden = true
                }
            }
            return branchAdres1Field.verifyFields(shouldChangeCharactersIn: range, replacementString: string)
        }
        else  if textField == branchAdres2Field {
            if BeneficiaryDetails.shared.bank_BranchAddress2_is_required == true {
                if branchAdres2Field.text!.count <= -1 {
                    branchAdres2ReqLbl.isHidden = false
                }
                else {
                    branchAdres2ReqLbl.isHidden = true
                }
            }
            return branchAdres2Field.verifyFields(shouldChangeCharactersIn: range, replacementString: string)
        }
      /*  else  if textField == branchCodeField {
            if BeneficiaryDetails.shared.bank_BranchCode_is_required == true {
                if branchCodeField.text!.count <= -1 {
                    branchCodeReqLbl.isHidden = false
                }
                else {
                    branchCodeReqLbl.isHidden = true
                }
            }
            return branchCodeField.verifyFields(shouldChangeCharactersIn: range, replacementString: string)
        }*/
        
        return true
        
    }
    
    
 /*   @IBAction func fetchContactsActn(_ sender: Any) {
        let popOverVC = self.storyboard?.instantiateViewController(withIdentifier: "ContactVc") as! ContactVc
        self.addChild(popOverVC)
        popOverVC.delegate = self
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParent: self)
    }*/
    
    
    
   
    
    @IBAction func benefidTypeBtnActn(_ sender: Any) {
        let pickerData = BeneficiaryDetails.shared.pickerbeneficiaryIDTypesData
        PickerDialog().show(title: "", options: pickerData , selected: "") {
            (value) -> Void in
            self.benefIdTypeSelected = "\(value)"
            let indexS =  BeneficiaryDetails.shared.beneficiaryIDTypesValueData.firstIndex(of: "\(value)")
            self.benefIdTypeField.text = BeneficiaryDetails.shared.beneficiaryIDTypesNameData[indexS ?? 0]
            self.benefIdTypeReqLbl.isHidden = true
            
        }
    }
    
    @IBAction func acntTypeBtnActn(_ sender: Any) {
        let pickerData = BeneficiaryDetails.shared.pickerbankAccountTypesData
        PickerDialog().show(title: "", options: pickerData , selected: "") {
            (value) -> Void in
            self.bankAcntTypeSelected = "\(value)"
            let indexS =  BeneficiaryDetails.shared.bankAccountTypesValueData.firstIndex(of: "\(value)")
            self.acntTypeField.text = BeneficiaryDetails.shared.bankAccountTypesNameData[indexS ?? 0]
            self.acntTypeReqLbl.isHidden = true
            
        }
    }
    
    
    //MARK:- Profile Pic Gesture Methods
      func imageGesture()
      {
          let tap = UITapGestureRecognizer(target: self, action: #selector(ProfileVc.tappedMe))
          profileImg.addGestureRecognizer(tap)
          profileImg.isUserInteractionEnabled = true
      }
      @objc func tappedMe()
      {
          let alert:UIAlertController=UIAlertController(title: "Choose Image", message: nil, preferredStyle: UIAlertController.Style.actionSheet)
          
          let cameraAction = UIAlertAction(title: Global.shared.cameraTxt, style: UIAlertAction.Style.default)
          {
              UIAlertAction in
              self.openCamera()
          }
          let gallaryAction = UIAlertAction(title: Global.shared.galryTxt, style: UIAlertAction.Style.default)
          {
              UIAlertAction in
              self.openGallary()
          }
          let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel)
          {
              UIAlertAction in
          }
          
          // Add the actions
          pickerImg?.delegate = self
          alert.addAction(cameraAction)
          alert.addAction(gallaryAction)
          alert.addAction(cancelAction)
          // Present the controller
          if UIDevice.current.userInterfaceIdiom == .phone
          {
              self.present(alert, animated: true, completion: nil)
          }
          else
          {
              popover=UIPopoverController(contentViewController: alert)
              popover!.present(from: profileImg.frame, in: self.view, permittedArrowDirections: UIPopoverArrowDirection.any, animated: true)
          }
      }
      
      func openCamera()
      {
          self.imgeXX.removeAll()
          if(UIImagePickerController .isSourceTypeAvailable(UIImagePickerController.SourceType.camera))
          {
              pickerImg!.sourceType = UIImagePickerController.SourceType.camera
              self .present(pickerImg!, animated: true, completion: nil)
          }
          else
          {
              openGallary()
          }
      }
      func openGallary()
      {
          self.imgeXX.removeAll()
          pickerImg!.sourceType = .photoLibrary
          if UIDevice.current.userInterfaceIdiom == .phone
          {
              self.present(pickerImg!, animated: true, completion: nil)
          }
          else
          {
              popover=UIPopoverController(contentViewController: pickerImg!)
              popover!.present(from: profileImg.frame, in: self.view, permittedArrowDirections: UIPopoverArrowDirection.any, animated: true)
          }
      }
      func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
      {
          // Local variable inserted by Swift 4.2 migrator.
          let info = convertFromUIImagePickerControllerInfoKeyDictionary(info)
          
          
          
          if let pickedImage = info[convertFromUIImagePickerControllerInfoKey(UIImagePickerController.InfoKey.originalImage)] as? UIImage
          {
              picker .dismiss(animated: true, completion: nil)
              
              self.profileImg.image = pickedImage
              let imgeeDattta = pickedImage.jpegData(compressionQuality: 0.1)
              
              let strBjj:String = imgeeDattta!.base64EncodedString(options: .lineLength64Characters)
              
              print(strBjj)
              
              self.imgeXX = strBjj
            
            
              
           //   updateProfileImage()
              
          }
          
      }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController)
       {
           print("picker cancel.")
           dismiss(animated: true, completion: nil)
       }
    
    
    @IBAction func rltnshipBenefActn(_ sender: Any) {
        
        let pickerData = BeneficiaryDetails.shared.pickerbeneficiaryRltnData
               PickerDialog().show(title: "", options: pickerData , selected: "") {
                   (value) -> Void in
                   self.benefIdTypeSelected = "\(value)"
                   let indexS =  BeneficiaryDetails.shared.beneficiaryRltnValueData.firstIndex(of: "\(value)")
                   self.reltnshipBenefField.text = BeneficiaryDetails.shared.beneficiaryRltnNameData[indexS ?? 0]
                   self.reltnshipBenfReqLbl.isHidden = true
                   
               }
    }
    
    @IBAction func dobActn(_ sender: Any) {
        DatePickerDialog().show("DOB", doneButtonTitle: "Done", cancelButtonTitle: "Cancel", maximumDate: NSDate() as Date, datePickerMode: .date) {
            (date) -> Void in
            if let dt = date {
                let formatter = DateFormatter()
                formatter.locale = Locale(identifier: "en_US_POSIX")
                formatter.dateFormat = "dd/MM/yyyy"
                self.dobField.text = formatter.string(from: dt)
                
                
                formatter.dateFormat = "yyyy-MM-dd"
                self.dob = formatter.string(from: dt)
                
               
                    self.dobReqLbl.isHidden = true
               
            }
        }
    }
    
    
    @IBAction func languageChangeActn(_ sender: Any) {
      //  Global.shared.languageChangeActn()
        
        let popOverVC = self.storyboard?.instantiateViewController(withIdentifier: "ContactVc") as! ContactVc
        self.addChild(popOverVC)
        popOverVC.delegate = self
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParent: self)
    }
    
    
    @IBAction func currencyDrpBtnActn(_ sender: Any) {
        let pickerData = self.pickerResponseCurency
        PickerDialog().show(title: "", options: pickerData , selected: "") {
            (value) -> Void in
            self.curencyField.text = "\(value)"
            let indexS = self.curncyValues.firstIndex(of: "\(value)")
            BeneficiaryDetails.shared.targetCurncyFulName = self.curncyNames[indexS ?? 0]
            
            self.currencyReqLbl.isHidden = true
        }
    }
    
    func downloadAccountConfigCountriesBankAddBenef() {
        
        let paramaterPasing: [String:Any] = ["languageCode":LocalizationSystem.sharedInstance.getLanguage(),
                                             "type": 5]
        
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        NetWorkDataManager.sharedInstance.countryListImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            
            if errorString == nil
            {
                
                print(resonseTal!)
                if let countres = resonseTal?.value(forKey: "countriesList") as? [[String: Any]] {
                    //    Global.shared.countrisWUAdd = Country.getCountries(countres)
                    Global.shared.countrisAllBankAdd = countres
                }
                if let countries = resonseTal?.value(forKey: "countriesList") as? NSArray {
                    print(countries)
                    //please check country
                    
                    if let countryCurncyAry = countries.value(forKey: "countryCurrencyList") as? NSArray {
                        Global.shared.countryCurncyBankAry = countryCurncyAry
                    }
                    
                    if let countryName = countries.value(forKey: "countryName") as? [String] {
                        Global.shared.countryNameDataBankAdd = countryName
                    }
                    if let countryCode = countries.value(forKey: "countryCode") as? [String] {
                        Global.shared.countryCodesDataBankAdd = countryCode
                    }
                    if let currency = countries.value(forKey: "countryCurrency") as? [String] {
                        Global.shared.currencyCodesDataBankAdd = currency
                    }
                    if let currencyNames = countries.value(forKey: "currencyName") as? [String] {
                        Global.shared.currencyNameDataBankAdd = currencyNames
                    }
                    
                    
                    
                    if let phoneCodes = countries.value(forKey: "phoneCode") as? [String] {
                        Global.shared.phoneCodesDataBankAdd = phoneCodes
                    }
                    
                    for i in 0..<Global.shared.currencyCodesDataBankAdd.count {
                        Global.shared.pickerResponseOnlyCurrencyDataBankAdd.append(["value":  Global.shared.currencyCodesDataBankAdd[i], "display":  Global.shared.currencyCodesDataBankAdd[i]])
                    }
                    
                    for i in 0..<Global.shared.currencyNameDataBankAdd.count {
                        Global.shared.pickerResponseFullCurrencyNameDataBankAdd.append(["value":  Global.shared.currencyNameDataBankAdd[i], "display":  Global.shared.currencyNameDataBankAdd[i]])
                    }
                    
                    
                    for i in 0..<Global.shared.countryNameDataBankAdd.count {
                        Global.shared.pickerResponseCountryDataBankAdd.append(["value": Global.shared.countryNameDataBankAdd[i], "display": Global.shared.countryNameDataBankAdd[i]])
                    }
                    
                    /*    for i in 0..<self.countryNameData.count {
                     self.pickerResponseData.append(["value": self.countryCodeData[i], "display": self.countryNameData[i]])
                     }*/
                    
                    
                }
                //       print(self.pickerResponseData)
                
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
// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromUIImagePickerControllerInfoKeyDictionary(_ input: [UIImagePickerController.InfoKey: Any]) -> [String: Any] {
    return Dictionary(uniqueKeysWithValues: input.map {key, value in (key.rawValue, value)})
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromUIImagePickerControllerInfoKey(_ input: UIImagePickerController.InfoKey) -> String {
    return input.rawValue
}

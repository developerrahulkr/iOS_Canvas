//
//  BenefCashEditVc.swift
//  Canvas
//
//  Created by urmila reddy on 07/09/20.
//  Copyright © 2020 urmila reddy. All rights reserved.
//

import UIKit
import Alamofire

class BenefCashEditVc: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate,UINavigationControllerDelegate, UIPopoverControllerDelegate, UIDropDownCountryDelegateM  {
    
    
    @IBOutlet weak var navHeaderLbl: UILabel!
    @IBOutlet weak var bankDetailsLbl: UILabel!
    @IBOutlet weak var profileDetlsLbl: UILabel!
    
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
    
      @IBOutlet weak var bkThreeView: UIView!
      
      @IBOutlet weak var bankNameLbl: UILabel!
      
      @IBOutlet weak var bankNameField: CustomTextField!
      
      @IBOutlet weak var bkFifthView: UIView!
      
      @IBOutlet weak var branchNameLbl: UILabel!
      
      @IBOutlet weak var branchNameField: CustomTextField!
      
  
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
      
  
      @IBOutlet weak var bankNameReqLbl: UILabel!
      
      @IBOutlet weak var branchNameReqLbl: UILabel!
      
     
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
      
      @IBOutlet weak var fetchContactBtnOtlt: UIButton!
      
      
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
    
    var expandOneClick = true
    var expandTwoClick = true
    
    var countryCodeSelected = ""
    var nationalityCodeSelected = ""
    var benefIdTypeSelected = ""
    var bankAcntTypeSelected = ""
     var dob = ""
      
    override func viewDidLoad() {
        super.viewDidLoad()
        
        submitBtnOtlt.isHidden = true
        
        
        self.expandTwoView.isHidden = false
        self.expandTwoHeightConstrt.constant = 450
        
        profileDetlsLbl.text = Global.shared.profileDetlsTxt
        bankDetailsLbl.text =  Global.shared.bankDetlsTxt
        
        downloadAccountConfigCountriesCashAddBenef()
        
        Global.shared.countrysChangeAccordingly = "CashAdd"
        branchCodeLbl.text = Global.shared.districtBenefTxt + ""
        navHeaderLbl.text = Global.shared.editBeneficiryTxt
        
        // Do any additional setup after loading the view.
        
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
      
        bankNameReqLbl.font = Global.shared.fontReqLbl
        bankNameReqLbl.textColor = ColorCodes.newAppRed
        
        branchNameReqLbl.font = Global.shared.fontReqLbl
        branchNameReqLbl.textColor = ColorCodes.newAppRed
        
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
        
        profileImg.setRounded()
               pickerImg!.delegate=self as UIImagePickerControllerDelegate & UINavigationControllerDelegate
                      imageGesture()
        
        self.remarksLbl.text = Global.shared.remarksTxtt
                     self.dobLbl.text =  Global.shared.persnalDobTxt 
        
        
        firstField.delegate = self
        lastField.delegate = self
        middleField.delegate = self
        adres1Field.delegate = self
        adres2Field.delegate = self
        cityField.delegate = self
        stateField.delegate = self
        postCodeField.delegate = self
        mobileField.delegate = self
        remarksField.delegate = self
        
        bankNameField.delegate = self
        branchNameField.delegate = self
        
        telephnField.delegate = self
        benefIdField.delegate = self
        
        firstField.text = BeneficiaryDetails.shared.firstName
        lastField.text = BeneficiaryDetails.shared.lastName
        middleField.text = BeneficiaryDetails.shared.middleName
        adres1Field.text = BeneficiaryDetails.shared.address1
        adres2Field.text = BeneficiaryDetails.shared.address2
        cityField.text = BeneficiaryDetails.shared.city
        stateField.text = BeneficiaryDetails.shared.state
        postCodeField.text = BeneficiaryDetails.shared.postCode
    
        let dropDisplay = BeneficiaryDetails.shared.country
        let indexS = Global.shared.countryCodesData.firstIndex(of: dropDisplay ?? "")
        self.countryCodeSelected   = BeneficiaryDetails.shared.country
        self.curencyField.text = BeneficiaryDetails.shared.currency
        self.countryField.text = Global.shared.countryNameData[indexS ?? 0]
        self.mobileCodeField.text = Global.shared.phoneCodesData[indexS ?? 0]
        
        let indexM = Global.shared.countryCodesData.firstIndex(of: dropDisplay ?? "")
        
        let countryImgCode = Global.shared.countryCodesData[indexM ?? 0]
        //  self.placeOfBirthImg.image = UIImage(named: dropDisplay)
        self.countryDrpImg.image = UIImage(named:  countryImgCode.lowercased())
        
        self.curncyDrpImg.image = UIImage(named: countryImgCode.lowercased())
        
        // self.countryDrpImg.image = UIImage(named: dropDisplay)
        // self.curncyDrpImg.image = UIImage(named: dropDisplay)
        self.telePhnCodeLbl.text = Global.shared.phoneCodesData[indexS ?? 0]
        
        self.countryReqLbl.isHidden = true
        self.currencyReqLbl.isHidden = true
           
           
         //  curencyField.text = BeneficiaryDetails.shared.currency
        mobileField.text = BeneficiaryDetails.shared.mobile
        bankNameField.text = BeneficiaryDetails.shared.bankName
        branchNameField.text =  BeneficiaryDetails.shared.branchName
      
        
    /*    firstField.isUserInteractionEnabled = false
        lastField.isUserInteractionEnabled = false
        middleField.isUserInteractionEnabled = false
        cityField.isUserInteractionEnabled = false
        stateField.isUserInteractionEnabled = false
        postCodeField.isUserInteractionEnabled = false
        mobileField.isUserInteractionEnabled = false
        bankNameField.isUserInteractionEnabled = false
        ifscCodeField.isUserInteractionEnabled = false
        swiftCodeField.isUserInteractionEnabled = false
        ibanCodeField.isUserInteractionEnabled = false
        cnicnoField.isUserInteractionEnabled = false*/
        
        
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
        bkThreeView.layer.cornerRadius = 5
        bkFifthView.layer.cornerRadius = 5
       
        //   cancelBtnOtlt.layer.cornerRadius = 5
        submitBtnOtlt.layer.cornerRadius = 5
        
        telephneView.layer.cornerRadius = 5
        nationalityView.layer.cornerRadius = 5
        districtView.layer.cornerRadius = 5
        benefIdTypeView.layer.cornerRadius = 5
        benefIdView.layer.cornerRadius = 5
        reltnshipBenefView.layer.cornerRadius = 5
       
        branchAdres1View.layer.cornerRadius = 5
        branchAdres2View.layer.cornerRadius = 5
        
        
      /*  firstView.backgroundColor = ColorCodes.FREEZEGRAY
        secondView.backgroundColor = ColorCodes.FREEZEGRAY
        thirdView.backgroundColor = ColorCodes.FREEZEGRAY
        sixthView.backgroundColor = ColorCodes.FREEZEGRAY
        seventhView.backgroundColor = ColorCodes.FREEZEGRAY
        eightView.backgroundColor = ColorCodes.FREEZEGRAY
        ninthView.backgroundColor = ColorCodes.FREEZEGRAY
        tenthView.backgroundColor = ColorCodes.FREEZEGRAY
        eleventhView.backgroundColor = ColorCodes.FREEZEGRAY
        bkThreeView.backgroundColor = ColorCodes.FREEZEGRAY
        bkFifthView.backgroundColor = ColorCodes.FREEZEGRAY
        bkSixthView.backgroundColor = ColorCodes.FREEZEGRAY
        bkSeventhView.backgroundColor = ColorCodes.FREEZEGRAY
        bkEightView.backgroundColor = ColorCodes.FREEZEGRAY
        
        telephneView.backgroundColor = ColorCodes.FREEZEGRAY
        nationalityView.backgroundColor = ColorCodes.FREEZEGRAY
        districtView.backgroundColor = ColorCodes.FREEZEGRAY
        benefIdTypeView.backgroundColor = ColorCodes.FREEZEGRAY
        benefIdView.backgroundColor = ColorCodes.FREEZEGRAY
        reltnshipBenefView.backgroundColor = ColorCodes.FREEZEGRAY
        acntTypeView.backgroundColor = ColorCodes.FREEZEGRAY
        branchAdres1View.backgroundColor = ColorCodes.FREEZEGRAY
        branchAdres2View.backgroundColor = ColorCodes.FREEZEGRAY*/
        
        
        assigingLabels()
        
    }
    
    
    func assigingLabels() {
        let profileImage = BeneficiaryDetails.shared.beneficiaryImg
        if profileImage == "" {
            self.profileImg.image = UIImage(named: "defaultProfile")
        }
                                   else if let decodedImageData = Data(base64Encoded: profileImage ?? "", options: .ignoreUnknownCharacters) {
                                          let image2 = UIImage(data: decodedImageData)
                                          if image2 != nil {
                                              self.profileImg.image = image2
                                          }
                                          else if profileImage != nil {
                                            let image1 = profileImage?.base64ToImage()
                                                     self.profileImg.image = image1
                                          }
                                          else {
                                            self.profileImg.image = UIImage(named: "defaultProfile")
                                          }
                                          
                                          
                                      }
                                      else {
                                        self.profileImg.image = UIImage(named: "defaultProfile")
                                      }
        
        submitBtnOtlt.setTitle(Global.shared.updateTxt, for: .normal)
       
        if BeneficiaryDetails.shared.cash_FirstName_is_required == true {
            firstName.text = Global.shared.firstNameb + "*"
        }
        else {
            firstName.text = Global.shared.firstNameb
        }
        if BeneficiaryDetails.shared.cash_LastName_is_required == true {
            lastName.text = Global.shared.lastNameb + "*"
        }
        else {
            lastName.text = Global.shared.lastNameb
        }
        if BeneficiaryDetails.shared.cash_MiddleName_is_required == true {
            middleName.text = Global.shared.middleNameb + "*"
        }
        else {
            middleName.text = Global.shared.middleNameb
        }
        if BeneficiaryDetails.shared.cash_Mobile_is_required == true {
            mobileLbl.text = Global.shared.mobileNumberBenfTxt + "*"
        }
        else {
            mobileLbl.text = Global.shared.mobileNumberBenfTxt
        }
        if BeneficiaryDetails.shared.cash_Telephone_is_required == true {
            telephnLbl.text = Global.shared.telephneNumbrBenefTxt + "*"
        }
        else {
            telephnLbl.text = Global.shared.telephneNumbrBenefTxt
        }
        if BeneficiaryDetails.shared.cash_Nationality_is_required == true {
            nationalityLbl.text = Global.shared.nationalityBenefTxt + "*"
        }
        else {
            nationalityLbl.text = Global.shared.nationalityBenefTxt
        }
        if BeneficiaryDetails.shared.cash_Address1_is_required == true {
            adres1Lbl.text = Global.shared.address1b + "*"
        }
        else {
            adres1Lbl.text = Global.shared.address1b
        }
        if BeneficiaryDetails.shared.cash_Address2_is_required == true {
            adres2Lbl.text = Global.shared.address2b + "*"
        }
        else {
            adres2Lbl.text = Global.shared.address2b
        }
        if BeneficiaryDetails.shared.cash_District_is_required == true {
            districtLbl.text =  Global.shared.districtBenefTxt + "*"
        }
        else {
            districtLbl.text =  Global.shared.districtBenefTxt
        }
        if BeneficiaryDetails.shared.cash_City_is_required == true {
            cityLabel.text = Global.shared.cityb + "*"
        }
        else {
            cityLabel.text = Global.shared.cityb
        }
        if BeneficiaryDetails.shared.cash_State_is_required == true {
            stateLbl.text = Global.shared.stateb + "*"
        }
        else {
            stateLbl.text = Global.shared.stateb
        }
        if BeneficiaryDetails.shared.cash_PostCode_is_required == true {
            postCodeLbl.text = Global.shared.postCodeb + "*"
        }
        else {
            postCodeLbl.text = Global.shared.postCodeb
        }
        if BeneficiaryDetails.shared.cash_Country_is_required == true {
            countryLbl.text = Global.shared.countryb + "*"
        }
        else {
            countryLbl.text = Global.shared.countryb
        }
        if BeneficiaryDetails.shared.cash_Currency_is_required == true {
            currencyLbl.text = Global.shared.currencyb + "*"
        }
        else {
            currencyLbl.text = Global.shared.currencyb
        }
        if BeneficiaryDetails.shared.cash_BeneficiaryIdType_is_required == true {
            benefIdTypeLbl.text =  Global.shared.benefIdTypeTxtt + "*"
        }
        else {
            benefIdTypeLbl.text =  Global.shared.benefIdTypeTxtt
        }
       
        if BeneficiaryDetails.shared.cash_BeneficiaryIdNumber_is_required == true {
            benefIdLbl.text = Global.shared.AddBenefIDNumber + "*"
        }
        else {
            benefIdLbl.text = Global.shared.AddBenefIDNumber
        }
        if BeneficiaryDetails.shared.cash_BeneficiaryRelationship_is_required == true {
            reltnshipBenefLbl.text =  Global.shared.AddBenefRelationBeneficiary + "*"
        }
        else {
            reltnshipBenefLbl.text = Global.shared.AddBenefRelationBeneficiary
        }
        
        
        if BeneficiaryDetails.shared.cash_BankName_is_required == true {
            bankNameLbl.text = Global.shared.bankNameb + "*"
        }
        else {
            bankNameLbl.text = Global.shared.bankNameb
        }
        if BeneficiaryDetails.shared.cash_BranchName_is_required == true {
            branchNameLbl.text = Global.shared.branchNameb + "*"
        }
        else {
            branchNameLbl.text = Global.shared.branchNameb
        }
       
        if BeneficiaryDetails.shared.cash_BranchAddress1_is_required == true {
            branchAdres1Lbl.text = Global.shared.branchAddress1Txtt  + "*"
        }
        else {
            branchAdres1Lbl.text = Global.shared.branchAddress1Txtt 
        }
        if BeneficiaryDetails.shared.cash_BranchAddress2_is_required == true {
            branchAdres2lbl.text = Global.shared.branchAddress2Txtt + "*"
        }
        else {
            branchAdres2lbl.text = Global.shared.branchAddress2Txtt
        }
        
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
                     
                     bankNameReqLbl.text =  Global.shared.bankNameb + " " + Global.shared.errorTxtRequired.lowercased()
                     
                     branchNameReqLbl.text =  Global.shared.branchNameb + " " + Global.shared.errorTxtRequired.lowercased()
                    
                     telephnReqLbl.text = Global.shared.telephneNumbrBenefTxt + " " + Global.shared.errorTxtRequired.lowercased()
                     nationalityReqLbl.text =  Global.shared.nationalityBenefTxt + " " + Global.shared.errorTxtRequired.lowercased()
                     districtReqLbl.text = Global.shared.districtBenefTxt + " " +  Global.shared.errorTxtRequired.lowercased()
                     benefIdTypeReqLbl.text =  Global.shared.benefIdTypeTxtt + " " + Global.shared.errorTxtRequired.lowercased()
                     benefIdReqLbl.text =  Global.shared.AddBenefIDNumber + " " + Global.shared.errorTxtRequired.lowercased()
                     reltnshipBenfReqLbl.text =  Global.shared.AddBenefRelationBeneficiary + " " + Global.shared.errorTxtRequired.lowercased()
                   
                     branchAdres1ReqLbl.text =  Global.shared.branchAddress1Txtt + " " + Global.shared.errorTxtRequired.lowercased()
                     branchAdres2ReqLbl.text = Global.shared.branchAddress2Txtt + " " +  Global.shared.errorTxtRequired.lowercased()
                     branchCodeReqLbl.text = Global.shared.branchCodeb + " " +  Global.shared.errorTxtRequired.lowercased()
                     
                     dobReqLbl.text =  Global.shared.persnalDobTxt + " " + Global.shared.errorTxtRequired.lowercased()
                     remarksReqLbl.text =  Global.shared.remarksTxtt + " " + Global.shared.errorTxtRequired.lowercased()
               
        
       
        
        firstField.maxLength = BeneficiaryDetails.shared.cash_FirstName_max_length
        lastField.maxLength = BeneficiaryDetails.shared.cash_LastName_max_length
        middleField.maxLength = BeneficiaryDetails.shared.cash_MiddleName_max_length
        adres1Field.maxLength = BeneficiaryDetails.shared.cash_Address1_max_length
        adres2Field.maxLength = BeneficiaryDetails.shared.cash_Address2_max_length
        cityField.maxLength = BeneficiaryDetails.shared.cash_City_max_length
        stateField.maxLength = BeneficiaryDetails.shared.cash_State_max_length
        postCodeField.maxLength = BeneficiaryDetails.shared.cash_PostCode_max_length
        mobileField.maxLength = BeneficiaryDetails.shared.cash_Mobile_max_length
        bankNameField.maxLength = BeneficiaryDetails.shared.cash_BankName_max_length
        branchNameField.maxLength = BeneficiaryDetails.shared.cash_BranchName_max_length
        
        telephnField.maxLength = BeneficiaryDetails.shared.cash_Telephone_max_length
        districtField.maxLength = BeneficiaryDetails.shared.cash_District_max_length
        benefIdField.maxLength = BeneficiaryDetails.shared.cash_BeneficiaryIdNumber_max_length
        reltnshipBenefField.maxLength = BeneficiaryDetails.shared.cash_BeneficiaryRelationship_max_length
        branchAdres1Field.maxLength = BeneficiaryDetails.shared.cash_BranchAddress1_max_length
        branchAdres2Field.maxLength = BeneficiaryDetails.shared.cash_BranchAddress2_max_length
        
        remarksField.maxLength = BeneficiaryDetails.shared.cash_Remarks_max_length
        
        remarksField.valueType = Global.shared.getFieldType(text: BeneficiaryDetails.shared.cash_Remarks_field_accept)
     //   acntNumberField.maxLength = BeneficiaryDetails.shared.cash_AccountNumber_max_length
        
        firstField.valueType = Global.shared.getFieldType(text: BeneficiaryDetails.shared.cash_FirstName_field_accept)
        lastField.valueType = Global.shared.getFieldType(text: BeneficiaryDetails.shared.cash_LastName_field_accept)
        middleField.valueType = Global.shared.getFieldType(text: BeneficiaryDetails.shared.cash_MiddleName_field_accept)
        adres1Field.valueType = Global.shared.getFieldType(text: BeneficiaryDetails.shared.cash_Address1_field_accept)
        adres2Field.valueType = Global.shared.getFieldType(text: BeneficiaryDetails.shared.cash_Address2_field_accept)
        cityField.valueType = Global.shared.getFieldType(text: BeneficiaryDetails.shared.cash_City_field_accept)
        stateField.valueType = Global.shared.getFieldType(text: BeneficiaryDetails.shared.cash_State_field_accept)
        postCodeField.valueType = Global.shared.getFieldType(text: BeneficiaryDetails.shared.cash_PostCode_field_accept)
        mobileField.valueType = Global.shared.getFieldType(text: BeneficiaryDetails.shared.cash_Mobile_field_accept)
        bankNameField.valueType = Global.shared.getFieldType(text: BeneficiaryDetails.shared.cash_BankName_field_accept)
        branchNameField.valueType = Global.shared.getFieldType(text: BeneficiaryDetails.shared.cash_BranchName_field_accept)
        
        telephnField.valueType = Global.shared.getFieldType(text: BeneficiaryDetails.shared.cash_Telephone_field_accept)
        districtField.valueType = Global.shared.getFieldType(text: BeneficiaryDetails.shared.cash_District_field_accept)
        benefIdField.valueType = Global.shared.getFieldType(text: BeneficiaryDetails.shared.cash_BeneficiaryIdNumber_field_accept)
        reltnshipBenefField.valueType = Global.shared.getFieldType(text: BeneficiaryDetails.shared.cash_BeneficiaryRelationship_field_accept)
        branchAdres1Field.valueType = Global.shared.getFieldType(text: BeneficiaryDetails.shared.cash_BranchAddress1_field_accept)
        branchAdres2Field.valueType = Global.shared.getFieldType(text: BeneficiaryDetails.shared.cash_BranchAddress2_field_accept)
        
        
    }
    
    @IBAction func expandOneActn(_ sender: Any) {
        if(expandOneClick == true) {
            self.expandOneView.isHidden = true
            self.expandOneHeightConstraint.constant = 0
        } else {
            self.expandOneView.isHidden = false
            self.expandOneHeightConstraint.constant = 1200
            
        }
        
        expandOneClick = !expandOneClick
    }
    
    
    @IBAction func expandSecndActn(_ sender: Any) {
        if(expandTwoClick == true) {
            self.expandTwoView.isHidden = false
            self.expandTwoHeightConstrt.constant = 450
            
        } else {
            self.expandTwoView.isHidden = true
            self.expandTwoHeightConstrt.constant = 0
            
        }
        
        expandTwoClick = !expandTwoClick
    }
    
    
    
    @IBAction func submitBtnActn(_ sender: Any) {
        self.expandTwoView.isHidden = false
        self.expandTwoHeightConstrt.constant = 450
        
        // submitCashTransfer()
        self.showSpinner(onView: self.view)
          if BeneficiaryDetails.shared.cash_FirstName_is_required == true && firstField.text == ""{
            
              firstNameReqLbl.isHidden = false
            firstField.becomeFirstResponder()
            self.removeSpinner()
          }
          else  if BeneficiaryDetails.shared.cash_MiddleName_is_required == true &&  middleField.text == "" {
              middleNameReqLbl.isHidden = false
            middleField.becomeFirstResponder()
            self.removeSpinner()
          }
          else  if BeneficiaryDetails.shared.cash_LastName_is_required == true && lastField.text == "" {
              lastNameReqLbl.isHidden = false
            lastField.becomeFirstResponder()
            self.removeSpinner()
          }
              else  if BeneficiaryDetails.shared.cash_Address1_is_required == true &&  adres1Field.text == "" {
                        adresOneReqLbl.isHidden = false
                adres1Field.becomeFirstResponder()
            self.removeSpinner()
                    }
                    else  if BeneficiaryDetails.shared.cash_Address2_is_required == true &&  adres2Field.text == "" {
                        adresTwoReqLbl.isHidden = false
                        adres2Field.becomeFirstResponder()
            self.removeSpinner()
                    }
                    else  if BeneficiaryDetails.shared.cash_District_is_required == true &&  districtField.text == "" {
                        districtReqLbl.isHidden = false
                        districtField.becomeFirstResponder()
            self.removeSpinner()
                    }
                    else  if BeneficiaryDetails.shared.cash_City_is_required == true &&  cityField.text == "" {
                        cityReqLbl.isHidden = false
                        cityField.becomeFirstResponder()
            self.removeSpinner()
                    }
                    else  if BeneficiaryDetails.shared.cash_State_is_required == true &&  stateField.text == "" {
                        stateReqLbl.isHidden = false
                        stateField.becomeFirstResponder()
            self.removeSpinner()
                    }
                    else  if BeneficiaryDetails.shared.cash_PostCode_is_required == true &&  postCodeField.text == "" {
                        postCodeReqLbl.isHidden = false
                        postCodeField.becomeFirstResponder()
            self.removeSpinner()
                    }
        
              else  if BeneficiaryDetails.shared.cash_Country_is_required == true &&  countryField.text == "" {
                         countryReqLbl.isHidden = false
            self.removeSpinner()
                     }
                     else  if BeneficiaryDetails.shared.cash_Currency_is_required == true &&  curencyField.text == "" {
                         currencyReqLbl.isHidden = false
            self.removeSpinner()
                     }
              else  if BeneficiaryDetails.shared.cash_Mobile_is_required == true && mobileField.text == "" {
                        mobileReqLbl.isHidden = false
                mobileField.becomeFirstResponder()
            self.removeSpinner()
                    }
          else  if BeneficiaryDetails.shared.cash_Telephone_is_required == true && telephnField.text == "" {
              telephnReqLbl.isHidden = false
            telephnField.becomeFirstResponder()
            self.removeSpinner()
          }
          else  if BeneficiaryDetails.shared.cash_Nationality_is_required == true && nationalityField.text == "" {
              nationalityReqLbl.isHidden = false
            self.removeSpinner()
          }
        
         
          else  if BeneficiaryDetails.shared.cash_BeneficiaryIdType_is_required == true &&  benefIdTypeField.text == "" {
              benefIdTypeReqLbl.isHidden = false
            self.removeSpinner()
          }
          else  if BeneficiaryDetails.shared.cash_BeneficiaryIdNumber_is_required == true &&  benefIdField.text == "" {
              benefIdReqLbl.isHidden = false
            benefIdField.becomeFirstResponder()
            self.removeSpinner()
          }
          else  if BeneficiaryDetails.shared.cash_BeneficiaryRelationship_is_required == true &&  reltnshipBenefField.text == "" {
              reltnshipBenfReqLbl.isHidden = false
            self.removeSpinner()
          }
          else  if BeneficiaryDetails.shared.cash_BankName_is_required == true && bankNameField.text == "" {
              bankNameReqLbl.isHidden = false
            bankNameField.becomeFirstResponder()
            self.removeSpinner()
          }
          else  if BeneficiaryDetails.shared.cash_BranchName_is_required == true && branchNameField.text == "" {
              branchNameReqLbl.isHidden = false
            branchNameField.becomeFirstResponder()
            self.removeSpinner()
          }
         
          else  if BeneficiaryDetails.shared.cash_BranchAddress1_is_required == true && branchAdres1Field.text == "" {
              branchAdres1ReqLbl.isHidden = false
            branchAdres1Field.becomeFirstResponder()
            self.removeSpinner()
          }
          else  if BeneficiaryDetails.shared.cash_BranchAddress2_is_required == true && branchAdres2Field.text == "" {
              branchAdres2ReqLbl.isHidden = false
            branchAdres2Field.becomeFirstResponder()
            self.removeSpinner()
          }
              
          else {
              generateOTP()
          }

    }
    
    
    func submitCashTransfer() {
        
        let paramaterPasing: [String:Any] = ["registrationId": Global.shared.afterLoginRegistrtnId ?? "",
                                             "beneficiaryId":  BeneficiaryDetails.shared.beneficiaryId ?? "",
                                             "address1": adres1Field.text ?? "",
                                             "address2": adres2Field.text ?? "",
                                             
        ]
        
        
     /*   let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]*/
        let headers: HTTPHeaders = [.authorization(bearerToken: UserDefaults.standard.string(forKey: "token")!)]
        
        NetWorkDataManager.sharedInstance.benefCashTransferImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            
            if errorString == nil
            {
                
                print(resonseTal!)
                let statusMsg = resonseTal?.value(forKey: "statusMessage") as? String ?? ""
            let mesageCode = resonseTal?.value(forKey: "messageCode") as? String ?? statusMsg
                if let statusCode = resonseTal?.value(forKey: "statusCodes") as? Int {
                    
                    print(statusCode)
                    if(statusCode == 200) {
                        // self.navigationController?.popViewController(animated: true)
                        let alert6 = UIAlertController(
                            title: "",
                            message: Global.shared.messageCodeType(text: mesageCode),
                            preferredStyle: UIAlertController.Style.alert)
                        
                        let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                            self.navigationController?.popViewController(animated: true)
                        }
                        
                        alert6.addAction(OKAction)
                        self.present(alert6, animated: true, completion: nil)
                    }
                    
                    if statusCode ==  400 {
                        if mesageCode == "E110042"
                        {
                            self.showAlert(withTitle: "", withMessage: resonseTal?["statusMessage"] as? String ?? "")

                        }
                        else{
                        let alert = ViewControllerManager.displayAlert(message: statusMsg ?? "", title:APPLICATIONNAME)
                        self.present(alert, animated: true, completion: nil)
                        }
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
    
    
    // Mark: Generating otp
    
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
              
              if errorString == nil
              {
                  
                self.removeSpinner()
                  Global.shared.otpType = resonseTal?.value(forKey: "otpType") as? Int
                  
                  
                  CashTransfer.shared.firstName = self.firstField.text ?? ""
                  CashTransfer.shared.lastName =  self.lastField.text ?? ""
                  CashTransfer.shared.middleName =  self.middleField.text ?? ""
                  CashTransfer.shared.mobile =  self.mobileField.text ?? ""
                  CashTransfer.shared.telephone =  self.telephnField.text ?? ""
                  CashTransfer.shared.nationality =  self.nationalityCodeSelected
                  CashTransfer.shared.address1 =  self.adres1Field.text ?? ""
                  CashTransfer.shared.address2 =  self.adres2Field.text ?? ""
                  CashTransfer.shared.district =  self.districtField.text ?? ""
                  CashTransfer.shared.city =  self.cityField.text ?? ""
                  CashTransfer.shared.state =  self.stateField.text ?? ""
                  CashTransfer.shared.postCode =  self.postCodeField.text ?? ""
                  CashTransfer.shared.country =  self.countryCodeSelected
                  CashTransfer.shared.currency =  self.curencyField.text ?? ""
                  CashTransfer.shared.beneficiaryIdType =  self.benefIdTypeSelected
                  CashTransfer.shared.beneficiaryIdNumber =  self.benefIdField.text ?? ""
                  CashTransfer.shared.beneficiaryRelationship =  self.reltnshipBenefField.text ?? ""
                  CashTransfer.shared.bankName =  self.bankNameField.text ?? ""
                  CashTransfer.shared.branchName =  self.branchNameField.text ?? ""
                  CashTransfer.shared.accountType =  self.bankAcntTypeSelected
                 
                  CashTransfer.shared.branchAddress1 =  self.branchAdres1Field.text ?? ""
                  CashTransfer.shared.branchAddress2 =  self.branchAdres2Field.text ?? ""
               
                   CashTransfer.shared.benefImg = self.imgeXX
                  CashTransfer.shared.dob =  self.dob
                                 CashTransfer.shared.remarks =  self.remarksField.text ?? ""
                                 CashTransfer.shared.branchDistrict = "d"
                  
                  
                  Global.shared.fromNewExistUser = "Benef2Edit"
                  let popOverVC = self.storyboard?.instantiateViewController(withIdentifier: "VerificationPopUpVc") as! VerificationPopUpVc
                  self.addChild(popOverVC)
                  popOverVC.view.frame = self.view.frame
                  self.view.addSubview(popOverVC.view)
                  popOverVC.didMove(toParent: self)
                  
                  let statusMsg = resonseTal?.value(forKey: "statusMessage") as? String
                  let statusCode = resonseTal?.value(forKey: "statusCodes") as? Int
                  let mesageCode = resonseTal?.value(forKey: "messageCode") as? String ?? statusMsg

                  if statusCode ==  400 {
                      if mesageCode == "E110042"
                      {
                          self.showAlert(withTitle: "", withMessage: resonseTal?["statusMessage"] as? String ?? "")

                      }
                      else{
                      let alert = ViewControllerManager.displayAlert(message: statusMsg ?? "", title:APPLICATIONNAME)
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
//                                  let refreshAlert = UIAlertController(title: "", message: Global.shared.sessionTimedOutTxt, preferredStyle: UIAlertController.Style.alert)
//                                  refreshAlert.view.tintColor = ColorCodes.newAppRed
//                                  refreshAlert.addAction(UIAlertAction(title: Global.shared.okTxt, style: .default, handler: { (action: UIAlertAction!) in
//                                     self.pushViewController(controller: LoginVc.initiateController())
//                                  }))
//
//                                  self.present(refreshAlert, animated: true, completion: nil)
                              }
                              
                              else {
                                  let alert = ViewControllerManager.displayAlert(message: errorString ?? "", title:APPLICATIONNAME)
                                  self.present(alert, animated: true, completion: nil)
                              }
                             
                              
                          }
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
            
            if let curencysList = Global.shared.countryCurncyCashAry[indexS ?? 0] as? NSArray {
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
        Global.shared.contryNationality = "nationality"
               let popOverVC = self.storyboard?.instantiateViewController(withIdentifier: "CountryDrpDownSearch") as! CountryDrpDownSearch
                                    self.addChild(popOverVC)
                                    popOverVC.delegate = self
                                    popOverVC.view.frame = self.view.frame
                                    self.view.addSubview(popOverVC.view)
                                    popOverVC.didMove(toParent: self)
          }
    
    
    override func viewWillAppear(_ animated: Bool) {
        Global.shared.timeoUtOrNot = "yes"
        observeTimeout()
        Global.shared.countrysChangeAccordingly = "CashAdd"
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        Global.shared.timeoUtOrNot = "yes"
        observeTimeout()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    
    
    @IBAction func bckBtnActn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
  
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        //doneAction()
        if textField == firstField{
            if BeneficiaryDetails.shared.cash_FirstName_is_required == true {
                if firstField.text!.count ==  0 {
                    firstNameReqLbl.isHidden = false
                }
                else {
                    firstNameReqLbl.isHidden = true
                }
            }
        } else  if textField == lastField{
            if BeneficiaryDetails.shared.cash_LastName_is_required == true {
                if lastField.text!.count ==  0 {
                    lastNameReqLbl.isHidden = false
                }
                else {
                    lastNameReqLbl.isHidden = true
                }
            }
        }
        else  if textField == middleField{
            if BeneficiaryDetails.shared.cash_MiddleName_is_required == true {
                if middleField.text!.count ==  0 {
                    middleNameReqLbl.isHidden = false
                }
                else {
                    middleNameReqLbl.isHidden = true
                }
            }
        }
        else  if textField == mobileField {
            if BeneficiaryDetails.shared.cash_Mobile_is_required == true {
                if mobileField.text!.count ==  0 {
                    mobileReqLbl.isHidden = false
                }
                else {
                    mobileReqLbl.isHidden = true
                }
            }
        }
        else  if textField == telephnField {
            if BeneficiaryDetails.shared.cash_Telephone_is_required == true {
                if telephnField.text!.count ==  0 {
                    telephnReqLbl.isHidden = false
                }
                else {
                    telephnReqLbl.isHidden = true
                }
            }
        }
        else  if textField == adres1Field{
            if BeneficiaryDetails.shared.cash_Address1_is_required == true {
                if adres1Field.text!.count ==  0 {
                    adresOneReqLbl.isHidden = false
                }
                else {
                    adresOneReqLbl.isHidden = true
                }
            }
        }
        else  if textField == adres2Field{
            if BeneficiaryDetails.shared.cash_Address2_is_required == true {
                if adres2Field.text!.count ==  0 {
                    adresTwoReqLbl.isHidden = false
                }
                else {
                    adresTwoReqLbl.isHidden = true
                }
            }
        }
        else  if textField == districtField{
            if BeneficiaryDetails.shared.cash_District_is_required == true {
                if districtField.text!.count ==  0 {
                    districtReqLbl.isHidden = false
                }
                else {
                    districtReqLbl.isHidden = true
                }
            }
        }
        else  if textField == cityField{
            if BeneficiaryDetails.shared.cash_City_is_required == true {
                if cityField.text!.count ==  0 {
                    cityReqLbl.isHidden = false
                }
                else {
                    cityReqLbl.isHidden = true
                }
            }
        }
        else  if textField == stateField {
            if BeneficiaryDetails.shared.cash_State_is_required == true {
                if stateField.text!.count ==  0 {
                    stateReqLbl.isHidden = false
                }
                else {
                    stateReqLbl.isHidden = true
                }
            }
        }
        else  if textField == postCodeField {
            if BeneficiaryDetails.shared.cash_PostCode_is_required == true {
                if postCodeField.text!.count ==  0 {
                    postCodeReqLbl.isHidden = false
                }
                else {
                    postCodeReqLbl.isHidden = true
                }
            }
        }
        else  if textField == benefIdField {
            if BeneficiaryDetails.shared.cash_BeneficiaryIdNumber_is_required == true {
                if benefIdField.text!.count ==  0 {
                    benefIdReqLbl.isHidden = false
                }
                else {
                    benefIdReqLbl.isHidden = true
                }
            }
        }
        else  if textField == reltnshipBenefField {
            if BeneficiaryDetails.shared.cash_BeneficiaryRelationship_is_required == true {
                if reltnshipBenefField.text!.count ==  0 {
                    reltnshipBenfReqLbl.isHidden = false
                }
                else {
                    reltnshipBenfReqLbl.isHidden = true
                }
            }
        }
        else  if textField == bankNameField {
            if BeneficiaryDetails.shared.cash_BankName_is_required == true {
                if bankNameField.text!.count ==  0 {
                    bankNameReqLbl.isHidden = false
                }
                else {
                    bankNameReqLbl.isHidden = true
                }
            }
        }
            
        else  if textField == branchNameField {
            if BeneficiaryDetails.shared.cash_BranchName_is_required == true {
                if branchNameField.text!.count ==  0 {
                    branchNameReqLbl.isHidden = false
                }
                else {
                    branchNameReqLbl.isHidden = true
                }
            }
        }
            
     
        else  if textField == branchAdres1Field {
            if BeneficiaryDetails.shared.cash_BranchAddress1_is_required == true {
                if branchAdres1Field.text!.count ==  0 {
                    branchAdres1ReqLbl.isHidden = false
                }
                else {
                    branchAdres1ReqLbl.isHidden = true
                }
            }
        }
        else  if textField == branchAdres2Field {
            if BeneficiaryDetails.shared.cash_BranchAddress2_is_required == true {
                if branchAdres2Field.text!.count ==  0 {
                    branchAdres2ReqLbl.isHidden = false
                }
                else {
                    branchAdres2ReqLbl.isHidden = true
                }
            }
        }
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField == firstField {
            if BeneficiaryDetails.shared.cash_FirstName_is_required == true {
                if firstField.text!.count <= -1 {
                    firstNameReqLbl.isHidden = false
                }
                else {
                    firstNameReqLbl.isHidden = true
                }
            }
            return firstField.verifyFields(shouldChangeCharactersIn: range, replacementString: string)
        }
        else  if textField == lastField {
            if BeneficiaryDetails.shared.cash_LastName_is_required == true {
                if lastField.text!.count <= -1 {
                    lastNameReqLbl.isHidden = false
                }
                else {
                    lastNameReqLbl.isHidden = true
                }
            }
            return lastField.verifyFields(shouldChangeCharactersIn: range, replacementString: string)
        }
        else  if textField == middleField {
            if BeneficiaryDetails.shared.cash_MiddleName_is_required == true {
                if middleField.text!.count <= -1 {
                    middleNameReqLbl.isHidden = false
                }
                else {
                    middleNameReqLbl.isHidden = true
                }
            }
            return middleField.verifyFields(shouldChangeCharactersIn: range, replacementString: string)
        }
        else  if textField == mobileField {
            if BeneficiaryDetails.shared.cash_Mobile_is_required == true {
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
            if BeneficiaryDetails.shared.cash_Telephone_is_required == true {
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
            if BeneficiaryDetails.shared.cash_Remarks_is_required == true {
                if remarksField.text!.count <= -1 {
                    remarksReqLbl.isHidden = false
                }
                else {
                    remarksReqLbl.isHidden = true
                }
            }
            return remarksField.verifyFields(shouldChangeCharactersIn: range, replacementString: string)
        }
        else  if textField == adres1Field {
            if BeneficiaryDetails.shared.cash_Address1_is_required == true {
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
            if BeneficiaryDetails.shared.cash_Address2_is_required == true {
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
            if BeneficiaryDetails.shared.cash_District_is_required == true {
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
            if BeneficiaryDetails.shared.cash_City_is_required == true {
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
            if BeneficiaryDetails.shared.cash_State_is_required == true {
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
            if BeneficiaryDetails.shared.cash_PostCode_is_required == true {
                if postCodeField.text!.count <= -1 {
                    postCodeReqLbl.isHidden = false
                }
                else {
                    postCodeReqLbl.isHidden = true
                }
            }
            return postCodeField.verifyFields(shouldChangeCharactersIn: range, replacementString: string)
        }
        else  if textField == benefIdField {
            if BeneficiaryDetails.shared.cash_BeneficiaryIdNumber_is_required == true {
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
            if BeneficiaryDetails.shared.cash_BeneficiaryRelationship_is_required == true {
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
            if BeneficiaryDetails.shared.cash_BankName_is_required == true {
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
            if BeneficiaryDetails.shared.cash_BranchName_is_required == true {
                if branchNameField.text!.count <= -1 {
                    branchNameReqLbl.isHidden = false
                }
                else {
                    branchNameReqLbl.isHidden = true
                }
            }
            return branchNameField.verifyFields(shouldChangeCharactersIn: range, replacementString: string)
        }
       
        else  if textField == branchAdres1Field {
            if BeneficiaryDetails.shared.cash_BranchAddress1_is_required == true {
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
            if BeneficiaryDetails.shared.cash_BranchAddress2_is_required == true {
                if branchAdres2Field.text!.count <= -1 {
                    branchAdres2ReqLbl.isHidden = false
                }
                else {
                    branchAdres2ReqLbl.isHidden = true
                }
            }
            return branchAdres2Field.verifyFields(shouldChangeCharactersIn: range, replacementString: string)
        }
        
        
        return true
        
    }
    
    
    
    
   
    
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
            let deleteAction = UIAlertAction(title: Global.shared.deleteTxt, style: UIAlertAction.Style.default)
                            {
                                UIAlertAction in
                                self.imgeXX = ""
                                self.updateProfileImage()
                                
                            }
            let cancelAction = UIAlertAction(title: Global.shared.cancelTxt, style: UIAlertAction.Style.cancel)
              {
                  UIAlertAction in
              }
              
              // Add the actions
              pickerImg?.delegate = self
              alert.addAction(cameraAction)
              alert.addAction(gallaryAction)
            alert.addAction(deleteAction)
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
              pickerImg!.sourceType =  .photoLibrary
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
                  
                 updateProfileImage()
                  
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
        Global.shared.languageChangeActn()
    }
    func updateProfileImage() {
              let paramaterPasing: [String:Any] = [
               "registrationId": UserDefaults.standard.string(forKey: "registrationId")!, "beneficiaryId": BeneficiaryDetails.shared.beneficiaryId ?? 0,
                  "beneficiaryImage": imgeXX
                  
              ]
              
              let headers: HTTPHeaders = [.authorization(bearerToken: UserDefaults.standard.string(forKey: "token")!)]
              
              
              NetWorkDataManager.sharedInstance.benefImgImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
                  
                  if errorString == nil
                  {
                      
                      print(resonseTal!)
                    Global.shared.refreshOrNot = "yes"
                    let statusMsg = resonseTal?.value(forKey: "statusMessage") as? String ?? ""
                let mesageCode = resonseTal?.value(forKey: "messageCode") as? String ?? statusMsg
                      
                      if let statusCode = resonseTal?.value(forKey: "statusCodes") as? Int {
                          
                          print(statusCode)
                          if(statusCode == 200) {
                              
                              let alert6 = UIAlertController(
                                  title: "",
                                  message: Global.shared.messageCodeType(text: mesageCode),
                                  preferredStyle: UIAlertController.Style.alert)
                              
                              
                              
                              let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                                  /*     let vc = self.storyboard?.instantiateViewController(identifier: "HomeVc") as! HomeVc
                                   self.navigationController?.pushViewController(vc, animated: true)*/
                                if  self.imgeXX == "" {
                                  self.profileImg.image = UIImage(named: "defaultProfile")
                                    self.profileImg.tintColor = .darkGray
                                }
                                else {
                                    print("image there")
                                }
                                
                                  
                              }
                              
                              alert6.addAction(OKAction)
                              self.present(alert6, animated: true, completion: nil)
                              
                          }
                          else if statusCode ==  400 {
                               if mesageCode == "E110042"
                               {
                                   self.showAlert(withTitle: "", withMessage: resonseTal?["statusMessage"] as? String ?? "")

                               }
                               else{
                                   let alert = ViewControllerManager.displayAlert(message: statusMsg , title:APPLICATIONNAME)
                               self.present(alert, animated: true, completion: nil)
                               }
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
       
    
    @IBAction func curncyDrpActn(_ sender: Any) {
        let pickerData = self.pickerResponseCurency
        PickerDialog().show(title: "", options: pickerData , selected: "") {
            (value) -> Void in
            self.curencyField.text = "\(value)"
            let indexS = self.curncyValues.firstIndex(of: "\(value)")
            BeneficiaryDetails.shared.targetCurncyFulName = self.curncyNames[indexS ?? 0]
            
            self.currencyReqLbl.isHidden = true
        }
    }
    
    func downloadAccountConfigCountriesCashAddBenef() {
        
        let paramaterPasing: [String:Any] = ["languageCode":LocalizationSystem.sharedInstance.getLanguage(),
                                             "type": 7]
        
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        NetWorkDataManager.sharedInstance.countryListImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            
            if errorString == nil
            {
                
                print(resonseTal!)
                if let countres = resonseTal?.value(forKey: "countriesList") as? [[String: Any]] {
                    //    Global.shared.countrisWUAdd = Country.getCountries(countres)
                    Global.shared.countrisAllCashAdd = countres
                }
                if let countries = resonseTal?.value(forKey: "countriesList") as? NSArray {
                    print(countries)
                    //please check country
                    
                    if let countryCurncyAry = countries.value(forKey: "countryCurrencyList") as? NSArray {
                        Global.shared.countryCurncyCashAry = countryCurncyAry
                    }
                    
                    if let countryName = countries.value(forKey: "countryName") as? [String] {
                        Global.shared.countryNameDataCashAdd = countryName
                    }
                    if let countryCode = countries.value(forKey: "countryCode") as? [String] {
                        Global.shared.countryCodesDataCashAdd = countryCode
                    }
                    if let currency = countries.value(forKey: "countryCurrency") as? [String] {
                        Global.shared.currencyCodesDataCashAdd = currency
                    }
                    if let currencyNames = countries.value(forKey: "currencyName") as? [String] {
                        Global.shared.currencyNameDataCashAdd = currencyNames
                    }
                    
                    
                    
                    if let phoneCodes = countries.value(forKey: "phoneCode") as? [String] {
                        Global.shared.phoneCodesDataCashAdd = phoneCodes
                    }
                    
                    for i in 0..<Global.shared.currencyCodesDataCashAdd.count {
                        Global.shared.pickerResponseOnlyCurrencyDataCashAdd.append(["value":  Global.shared.currencyCodesDataCashAdd[i], "display":  Global.shared.currencyCodesDataCashAdd[i]])
                    }
                    
                    for i in 0..<Global.shared.currencyNameDataCashAdd.count {
                        Global.shared.pickerResponseFullCurrencyNameDataCashAdd.append(["value":  Global.shared.currencyNameDataCashAdd[i], "display":  Global.shared.currencyNameDataCashAdd[i]])
                    }
                    
                    
                    for i in 0..<Global.shared.countryNameDataCashAdd.count {
                        Global.shared.pickerResponseCountryDataCashAdd.append(["value": Global.shared.countryNameDataCashAdd[i], "display": Global.shared.countryNameDataCashAdd[i]])
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


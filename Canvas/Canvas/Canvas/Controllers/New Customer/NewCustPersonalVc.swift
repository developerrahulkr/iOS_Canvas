//
//  NewCustPersonalVc.swift
//  Canvas
//
//  Created by urmila reddy on 11/08/20.
//  Copyright © 2020 urmila reddy. All rights reserved.
//

import UIKit
import Alamofire

class NewCustPersonalVc: UIViewController, UITextFieldDelegate, UIDropDownCountryDelegateM, EasyTipViewDelegate  {
    
    
    @IBOutlet weak var persnlDetlsLbl: UILabel!
    
    @IBOutlet weak var adresDetlsLbl: UILabel!
    
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var scrollVieww: UIScrollView!
    
    @IBOutlet weak var backgrndImg: UIImageView!
    
    @IBOutlet weak var lblOne: UILabel!
    
    @IBOutlet weak var lblTwo: UILabel!
    
    @IBOutlet weak var lblThree: UILabel!
    
    @IBOutlet weak var lblFour: UILabel!
    
    @IBOutlet weak var headerLbl: UILabel!
    
    
    @IBOutlet weak var nextBtnOtlt: UIButton!
    
    @IBOutlet weak var bckBtnOtlt: UIButton!
    
    @IBOutlet weak var expandFirstView: UIView!
    
    @IBOutlet weak var expandSecndView: UIView!
    
    
    @IBOutlet weak var expand1viewHeightConstrt: NSLayoutConstraint!
    
    
    @IBOutlet weak var expand2ViewHeightConstrt: NSLayoutConstraint!
    
    @IBOutlet weak var expand1BtnOtl: UIButton!
    
    @IBOutlet weak var expand2BtnOtlt: UIButton!
    
    
    @IBOutlet weak var pdFirstView: UIView!
    
    @IBOutlet weak var salutationLbl: UILabel!
    
    @IBOutlet weak var salutationAnswerLbl: UILabel!
    
    @IBOutlet weak var pdSecndView: UIView!
    
    @IBOutlet weak var firstNameLbl: UILabel!
    
    @IBOutlet weak var firstNameField: CustomTextField!
    
    @IBOutlet weak var pdThirdView: UIView!
    
    @IBOutlet weak var middleNameLbl: UILabel!
    
    @IBOutlet weak var middleNameField: CustomTextField!
    
    
    @IBOutlet weak var pdFourthView: UIView!
    
    @IBOutlet weak var lastNameLbl: UILabel!
    
    @IBOutlet weak var lastNameField: CustomTextField!
    
    @IBOutlet weak var pdFifthView: UIView!
    
    @IBOutlet weak var genderLbl: UILabel!
    
    @IBOutlet weak var maleRadioBtnOtlt: UIButton!
    
    @IBOutlet weak var maleLbl: UILabel!
    
    @IBOutlet weak var femaleRadioBtnOtlt: UIButton!
    
    
    @IBOutlet weak var femaleLbl: UILabel!
    
    @IBOutlet weak var neutralRadioBtnOtlt: UIButton!
    
    @IBOutlet weak var neutralLbl: UILabel!
    
    
    @IBOutlet weak var pdSixthView: UIView!
    
    @IBOutlet weak var nationalityLbl: UILabel!
    
    
    @IBOutlet weak var nationalityField: UITextField!
    
    @IBOutlet weak var pdSeventhView: UIView!
    
    @IBOutlet weak var dateOfBirthLbl: UILabel!
    
    @IBOutlet weak var dobValueLbl: UILabel!
    
    @IBOutlet weak var pdEightView: UIView!
    
    @IBOutlet weak var placeOfBLbl: UILabel!
    
    
    @IBOutlet weak var placeOfBirthField: CustomTextField!
    
    @IBOutlet weak var pdFifteenView: UIView!
    @IBOutlet weak var secndryEmailLbl: UILabel!
    
    @IBOutlet weak var secndryEmailField: CustomTextField!
    
    //Account Details
    
    @IBOutlet weak var adFirstView: UIView!
    
    @IBOutlet weak var residentLbl: UILabel!
    
    @IBOutlet weak var residentAnswerLbl: UILabel!
    
    
    @IBOutlet weak var adSecndView: UIView!
    
    @IBOutlet weak var flatLbl: UILabel!
    
    @IBOutlet weak var flatAnswerField: CustomTextField!
    
    @IBOutlet weak var adThirdView: UIView!
    
    @IBOutlet weak var floorLbl: UILabel!
    
    @IBOutlet weak var floorField: CustomTextField!
    
    @IBOutlet weak var adFourthVIew: UIView!
    
    @IBOutlet weak var buildingLbl: UILabel!
    
    @IBOutlet weak var buildingField: CustomTextField!
    
    @IBOutlet weak var adFifthView: UIView!
    
    @IBOutlet weak var gadaLbl: UILabel!
    
    @IBOutlet weak var gadaField: CustomTextField!
    
    @IBOutlet weak var adSixthView: UIView!
    
    @IBOutlet weak var streetLbl: UILabel!
    
    @IBOutlet weak var streetField: CustomTextField!
    
    @IBOutlet weak var adSeventhView: UIView!
    
    
    @IBOutlet weak var blockLbl: UILabel!
    
    
    @IBOutlet weak var blockField: CustomTextField!
    
    @IBOutlet weak var adEightView: UIView!
    
    @IBOutlet weak var areaCityLbl: UILabel!
    
    @IBOutlet weak var areaCityField: CustomTextField!
    
    
    @IBOutlet weak var adNinthView: UIView!
    
    @IBOutlet weak var zipcodeLbl: UILabel!
    
    @IBOutlet weak var zipCodeField: CustomTextField!
    
    @IBOutlet weak var adTenthView: UIView!
    
    @IBOutlet weak var stateLbl: UILabel!
    
    
    @IBOutlet weak var adEleventhView: UIView!
    
    @IBOutlet weak var countryLbl: UILabel!
    
    @IBOutlet weak var countryAnswerLbl: UILabel!
    
    @IBOutlet weak var adTwelveView: UIView!
    
    @IBOutlet weak var remiterCatgryLbl: UILabel!
    
    @IBOutlet weak var indiviRadioBtnOtlt: UIButton!
    
    @IBOutlet weak var individualLbl: UILabel!
    
    @IBOutlet weak var politicalyExposedBtnOtlt: UIButton!
    
    @IBOutlet weak var politicalExposedLbl: UILabel!
    
    @IBOutlet weak var adThirteenView: UIView!
    
    @IBOutlet weak var politicalScopeLbl: UILabel!
    
    @IBOutlet weak var localBtnOtlt: UIButton!
    
    @IBOutlet weak var localLbl: UILabel!
    
    @IBOutlet weak var interntnlBtnOtlt: UIButton!
    
    @IBOutlet weak var interntnalLbl: UILabel!
    
    @IBOutlet weak var adFourteenView: UIView!
    
    @IBOutlet weak var areYouRelativeLbl: UILabel!
    
    @IBOutlet weak var relativeYesBtnOtlt: UIButton!
    
    @IBOutlet weak var relativeYesLbl: UILabel!
    
    
    @IBOutlet weak var relativeNoBtnOtlt: UIButton!
    
    @IBOutlet weak var relativeNoLbl: UILabel!
    
    @IBOutlet weak var adFifteenView: UIView!
    
    
    @IBOutlet weak var degreeOfRltnshpLbl: UILabel!
    
    @IBOutlet weak var closeBtnOtlt: UIButton!
    
    @IBOutlet weak var closeLbl: UILabel!
    
    
    @IBOutlet weak var distantBtnOtlt: UIButton!
    
    @IBOutlet weak var distantLbl: UILabel!
    
    
    @IBOutlet weak var neutralBtnOtlt: UIButton!
    
    
    @IBOutlet weak var neutralRadioLbl: UILabel!
    
    
    @IBOutlet weak var preferedLngView: UIView!
    
    @IBOutlet weak var preferedLangQuestnLbl: UILabel!
    
    @IBOutlet weak var preferedLngAnswerLbl: UILabel!
    
    
    @IBOutlet weak var prefLangReqLbl: UILabel!
    
    @IBOutlet weak var firstNameReqLbl: UILabel!
    
    @IBOutlet weak var lastNameReqLbl: UILabel!
    
    @IBOutlet weak var dobReLbl: UILabel!
    
    
    @IBOutlet weak var residentReqLbl: UILabel!
    
    
    @IBOutlet weak var identityTabLbl: UILabel!
    
    @IBOutlet weak var personalTabLbl: UILabel!
    
    @IBOutlet weak var employmntTabLbl: UILabel!
    
    @IBOutlet weak var remitanceTabLbl: UILabel!
    
    
    
    @IBOutlet weak var salutationReqLbl: UILabel!
    
    
    
    @IBOutlet weak var flatReqLbl: UILabel!
    
    
    @IBOutlet weak var floorReqLbl: UILabel!
    
    
    @IBOutlet weak var buildingReqLbl: UILabel!
    
    
    @IBOutlet weak var gadaReqLbl: UILabel!
    
    
    @IBOutlet weak var streetReqLbl: UILabel!
    
    
    @IBOutlet weak var blockReqLbl: UILabel!
    
    
    @IBOutlet weak var stateField: CustomTextField!
    
    
    @IBOutlet weak var countryReqLbl: UILabel!
    
    
    @IBOutlet weak var pepPositionView: UIView!
    
    @IBOutlet weak var pepPositionLbl: UILabel!
    
    @IBOutlet weak var pepPositionField: CustomTextField!
    
    
    @IBOutlet weak var oneHeightConstrt: NSLayoutConstraint!
    
    @IBOutlet weak var twoHeightConstrt: NSLayoutConstraint!
    
    @IBOutlet weak var threeHeightConstrt: NSLayoutConstraint!
    
    @IBOutlet weak var fourHeightConstrt: NSLayoutConstraint!
    
    
    @IBOutlet weak var middleNameReqLbl: UILabel!
    
    @IBOutlet weak var nationalityReqLbl: UILabel!
    
    @IBOutlet weak var placeOfBirthReqLbl: UILabel!
    
    
    
    @IBOutlet weak var secndryEmailReqLbl: UILabel!
    
    
    
    @IBOutlet weak var areaCityReqLbl: UILabel!
    
    @IBOutlet weak var zipCodeReqLbl: UILabel!
    
    @IBOutlet weak var stateReqLbl: UILabel!
    
    @IBOutlet weak var pepPositionReqLbl: UILabel!
    
    
    @IBOutlet weak var placeOfBirthImg: UIImageView!
    @IBOutlet weak var countryDrpImg: UIImageView!
    
    @IBOutlet weak var nationalityDrpImg: UIImageView!
    
    
    
    var expandOneClick = true
    var expandTwoClick = true
    
    //expand2view = 1350,1020
    //expand1view = 1120
    
    
    var dob = ""
    //  var genderStr = Global.shared.persnalMaleTxt
    var genderStr = "M"
    var remiterCategryStr = "I"
    var politicalScope = ""
    var areYouRelative = ""
    var degreOfReltn = ""
    
    
    var invalidSalutnTxt = Global.shared.invalidTxt + " " + Global.shared.persnalSalutatnTxt
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if LocalizationSystem.sharedInstance.getLanguage() == "ar" {
            //    if textAlignment == .natural {
            persnlDetlsLbl.textAlignment = .right
            adresDetlsLbl.textAlignment = .right
            //   }
            
        }
        persnlDetlsLbl.text = "  " +  Global.shared.persnalDetlsLbl
        adresDetlsLbl.text =  "  " +  Global.shared.addresDetlsLbl
        
        
        //    relativeYesBtnOtlt.setImage(UIImage(named: "circleUnchecked"), for: .normal)
        //    relativeNoBtnOtlt.setImage(UIImage(named: "circleChecked"), for: .normal)
        self.countryAnswerLbl.text = "KUWAIT"
        NewUser.shared.country = "KW"
        self.countryDrpImg.image = UIImage(named: "kw")
        
        areYouRelative = ""
        
        adFifteenView.isHidden = true
        
        
        prefLangReqLbl.font = Global.shared.fontReqLbl
        prefLangReqLbl.textColor = ColorCodes.newAppRed
        
        firstNameReqLbl.font = Global.shared.fontReqLbl
        firstNameReqLbl.textColor = ColorCodes.newAppRed
        
        lastNameReqLbl.font = Global.shared.fontReqLbl
        lastNameReqLbl.textColor = ColorCodes.newAppRed
        
        dobReLbl.font = Global.shared.fontReqLbl
        dobReLbl.textColor = ColorCodes.newAppRed
        
        residentReqLbl.font = Global.shared.fontReqLbl
        residentReqLbl.textColor = ColorCodes.newAppRed
        
        salutationReqLbl.font = Global.shared.fontReqLbl
        salutationReqLbl.textColor = ColorCodes.newAppRed
        
        flatReqLbl.font = Global.shared.fontReqLbl
        flatReqLbl.textColor = ColorCodes.newAppRed
        
        floorReqLbl.font = Global.shared.fontReqLbl
        floorReqLbl.textColor = ColorCodes.newAppRed
        
        buildingReqLbl.font = Global.shared.fontReqLbl
        buildingReqLbl.textColor = ColorCodes.newAppRed
        
        gadaReqLbl.font = Global.shared.fontReqLbl
        gadaReqLbl.textColor = ColorCodes.newAppRed
        
        streetReqLbl.font = Global.shared.fontReqLbl
        streetReqLbl.textColor = ColorCodes.newAppRed
        
        blockReqLbl.font = Global.shared.fontReqLbl
        blockReqLbl.textColor = ColorCodes.newAppRed
        
        countryReqLbl.font = Global.shared.fontReqLbl
        countryReqLbl.textColor = ColorCodes.newAppRed
        
        middleNameReqLbl.font = Global.shared.fontReqLbl
        middleNameReqLbl.textColor = ColorCodes.newAppRed
        
        nationalityReqLbl.font = Global.shared.fontReqLbl
        nationalityReqLbl.textColor = ColorCodes.newAppRed
        
        placeOfBirthReqLbl.font = Global.shared.fontReqLbl
        placeOfBirthReqLbl.textColor = ColorCodes.newAppRed
        
        secndryEmailReqLbl.font = Global.shared.fontReqLbl
        secndryEmailReqLbl.textColor = ColorCodes.newAppRed
        
        areaCityReqLbl.font = Global.shared.fontReqLbl
        areaCityReqLbl.textColor = ColorCodes.newAppRed
        
        zipCodeReqLbl.font = Global.shared.fontReqLbl
        zipCodeReqLbl.textColor = ColorCodes.newAppRed
        
        stateReqLbl.font = Global.shared.fontReqLbl
        stateReqLbl.textColor = ColorCodes.newAppRed
        
        pepPositionReqLbl.font = Global.shared.fontReqLbl
        pepPositionReqLbl.textColor = ColorCodes.newAppRed
        
        
        
        self.expandSecndView.isHidden = false
        self.expand2ViewHeightConstrt.constant = 950
        
        firstNameField.delegate = self
        middleNameField.delegate = self
        lastNameField.delegate = self
        //    placeOfBirthField.delegate = self
        
        secndryEmailField.delegate = self
        flatAnswerField.delegate = self
        floorField.delegate = self
        buildingField.delegate = self
        gadaField.delegate = self
        streetField.delegate = self
        blockField.delegate = self
        areaCityField.delegate = self
        zipCodeField.delegate = self
        stateField.delegate = self
        pepPositionField.delegate = self
        
        
        // Do any additional setup after loading the view.
        self.scrollVieww.backgroundColor = UIColor(patternImage: UIImage(named: "AppBckgroundImg")!)
        self.mainView.backgroundColor = UIColor(patternImage: UIImage(named: "AppBckgroundImg")!)
        //    self.scrollView.contentSize = CGSize(width: self.view.frame.size.width, height: contentHeight)
        
        
        
        
        pdFirstView.layer.cornerRadius = 5
        pdSecndView.layer.cornerRadius = 5
        pdThirdView.layer.cornerRadius = 5
        pdFourthView.layer.cornerRadius = 5
        pdFifthView.layer.cornerRadius = 5
        pdSixthView.layer.cornerRadius = 5
        pdSeventhView.layer.cornerRadius = 5
        pdEightView.layer.cornerRadius = 5
        
        pdFifteenView.layer.cornerRadius = 5
        
        
        adFirstView.layer.cornerRadius = 5
        adSecndView.layer.cornerRadius = 5
        adThirdView.layer.cornerRadius = 5
        adFourthVIew.layer.cornerRadius = 5
        adFifthView.layer.cornerRadius = 5
        adSixthView.layer.cornerRadius = 5
        adSeventhView.layer.cornerRadius = 5
        adEightView.layer.cornerRadius = 5
        adNinthView.layer.cornerRadius = 5
        adTenthView.layer.cornerRadius = 5
        adEleventhView.layer.cornerRadius = 5
        adTwelveView.layer.cornerRadius = 5
        adThirteenView.layer.cornerRadius = 5
        adFourteenView.layer.cornerRadius = 5
        adFifteenView.layer.cornerRadius = 5
        pepPositionView.layer.cornerRadius = 5
        
        
        nextBtnOtlt.layer.cornerRadius = 5
        bckBtnOtlt.layer.cornerRadius = 5
        
        self.lblOne.layer.cornerRadius = self.lblOne.frame.size.width / 2;
        self.lblOne.clipsToBounds = true
        
        self.lblTwo.layer.cornerRadius = self.lblTwo.frame.size.width / 2;
        self.lblTwo.clipsToBounds = true
        
        self.lblThree.layer.cornerRadius = self.lblThree.frame.size.width / 2;
        self.lblThree.clipsToBounds = true
        
        self.lblFour.layer.cornerRadius = self.lblFour.frame.size.width / 2;
        self.lblFour.clipsToBounds = true
        
        assignLabels()
        maleRadioBtnOtlt.setImage(UIImage(named: "circleUnchecked"), for: .normal)
        indiviRadioBtnOtlt.setImage(UIImage(named: "circleChecked"), for: .normal)
    }
    func assignLabels() {
        headerLbl.text = Global.shared.newCustomerHeader
        
        prefLangReqLbl.text = Global.shared.preferLangTxt + " " + Global.shared.errorTxtRequired.lowercased()
        firstNameReqLbl.text = Global.shared.persnalFirstNameTxt + " " + Global.shared.errorTxtRequired.lowercased()
        lastNameReqLbl.text = Global.shared.persnalLastNameTxt + " " + Global.shared.errorTxtRequired.lowercased()
        dobReLbl.text = Global.shared.persnalDobTxt + " " + Global.shared.errorTxtRequired.lowercased()
        
        residentReqLbl.text = Global.shared.acntResidentTypeTxt + " " + Global.shared.errorTxtRequired.lowercased()
        salutationReqLbl.text = Global.shared.persnalSalutatnTxt + " " + Global.shared.errorTxtRequired.lowercased()
        
        flatReqLbl.text = Global.shared.acntFlatTxt + " " + Global.shared.errorTxtRequired.lowercased()
        floorReqLbl.text = Global.shared.acntFloorTxt + " " + Global.shared.errorTxtRequired.lowercased()
        buildingReqLbl.text = Global.shared.acntBuildingTxt + " " + Global.shared.errorTxtRequired.lowercased()
        gadaReqLbl.text = Global.shared.acntGadaTxt + " " + Global.shared.errorTxtRequired.lowercased()
        streetReqLbl.text = Global.shared.acntStreetTxt + " " + Global.shared.errorTxtRequired.lowercased()
        blockReqLbl.text = Global.shared.acntblockTxt + " " + Global.shared.errorTxtRequired.lowercased()
        countryReqLbl.text = Global.shared.acntCountryTxt + " " + Global.shared.errorTxtRequired.lowercased()
        
        
        middleNameReqLbl.text = Global.shared.persnalmiddleNameTxt + " " + Global.shared.errorTxtRequired.lowercased()
        nationalityReqLbl.text = Global.shared.persnalNationlityTxt + " " + Global.shared.errorTxtRequired.lowercased()
        placeOfBirthReqLbl.text = Global.shared.persnalPobTxt + " " + Global.shared.errorTxtRequired.lowercased()
        
        secndryEmailReqLbl.text = Global.shared.persnalSecndryEmailTxt + " " + Global.shared.errorTxtRequired.lowercased()
        areaCityReqLbl.text = Global.shared.acntAreaCityTxt + " " + Global.shared.errorTxtRequired.lowercased()
        zipCodeReqLbl.text = Global.shared.acntZipcodeTxt + " " + Global.shared.errorTxtRequired.lowercased()
        stateReqLbl.text = Global.shared.acntStateTxt + " " + Global.shared.errorTxtRequired.lowercased()
        pepPositionReqLbl.text = Global.shared.pepPositionTxt + " " + Global.shared.errorTxtRequired.lowercased()
        
        identityTabLbl.text = Global.shared.identityTabNameTxt
        personalTabLbl.text = Global.shared.personalTabNameTxt
        employmntTabLbl.text = Global.shared.employmentTabNameTxt
        remitanceTabLbl.text = Global.shared.remitanceTabNameTxt
        
        preferedLangQuestnLbl.font = Global.shared.fontTopLbl
        preferedLangQuestnLbl.textColor = ColorCodes.topTitleColor
        
        preferedLngAnswerLbl.font = Global.shared.fontBottomLbl
        preferedLngAnswerLbl.textColor = ColorCodes.bottomTitleColor
        
        salutationLbl.font = Global.shared.fontTopLbl
        salutationLbl.textColor = ColorCodes.topTitleColor
        
        salutationAnswerLbl.font = Global.shared.fontBottomLbl
        salutationAnswerLbl.textColor = ColorCodes.bottomTitleColor
        
        firstNameLbl.font = Global.shared.fontTopLbl
        firstNameLbl.textColor = ColorCodes.topTitleColor
        
        firstNameField.font = Global.shared.fontBottomLbl
        firstNameField.textColor = ColorCodes.bottomTitleColor
        
        middleNameLbl.font = Global.shared.fontTopLbl
        middleNameLbl.textColor = ColorCodes.topTitleColor
        
        middleNameField.font = Global.shared.fontBottomLbl
        middleNameField.textColor = ColorCodes.bottomTitleColor
        
        lastNameLbl.font = Global.shared.fontTopLbl
        lastNameLbl.textColor = ColorCodes.topTitleColor
        
        lastNameField.font = Global.shared.fontBottomLbl
        lastNameField.textColor = ColorCodes.bottomTitleColor
        
        nationalityLbl.font = Global.shared.fontTopLbl
        nationalityLbl.textColor = ColorCodes.topTitleColor
        
        nationalityField.font = Global.shared.fontBottomLbl
        nationalityField.textColor = ColorCodes.bottomTitleColor
        
        dateOfBirthLbl.font = Global.shared.fontTopLbl
        dateOfBirthLbl.textColor = ColorCodes.topTitleColor
        
        dobValueLbl.font = Global.shared.fontBottomLbl
        dobValueLbl.textColor = ColorCodes.bottomTitleColor
        
        placeOfBLbl.font = Global.shared.fontTopLbl
        placeOfBLbl.textColor = ColorCodes.topTitleColor
        
        placeOfBirthField.font = Global.shared.fontBottomLbl
        placeOfBirthField.textColor = ColorCodes.bottomTitleColor
        
        secndryEmailLbl.font = Global.shared.fontTopLbl
        secndryEmailLbl.textColor = ColorCodes.topTitleColor
        
        secndryEmailField.font = Global.shared.fontBottomLbl
        secndryEmailField.textColor = ColorCodes.bottomTitleColor
        
        residentLbl.font = Global.shared.fontTopLbl
        residentLbl.textColor = ColorCodes.topTitleColor
        
        residentAnswerLbl.font = Global.shared.fontBottomLbl
        residentAnswerLbl.textColor = ColorCodes.bottomTitleColor
        
        flatLbl.font = Global.shared.fontTopLbl
        flatLbl.textColor = ColorCodes.topTitleColor
        
        flatAnswerField.font = Global.shared.fontBottomLbl
        flatAnswerField.textColor = ColorCodes.bottomTitleColor
        
        floorLbl.font = Global.shared.fontTopLbl
        floorLbl.textColor = ColorCodes.topTitleColor
        
        floorField.font = Global.shared.fontBottomLbl
        floorField.textColor = ColorCodes.bottomTitleColor
        
        buildingLbl.font = Global.shared.fontTopLbl
        buildingLbl.textColor = ColorCodes.topTitleColor
        
        buildingField.font = Global.shared.fontBottomLbl
        buildingField.textColor = ColorCodes.bottomTitleColor
        
        gadaLbl.font = Global.shared.fontTopLbl
        gadaLbl.textColor = ColorCodes.topTitleColor
        
        gadaField.font = Global.shared.fontBottomLbl
        gadaField.textColor = ColorCodes.bottomTitleColor
        
        streetLbl.font = Global.shared.fontTopLbl
        streetLbl.textColor = ColorCodes.topTitleColor
        
        streetField.font = Global.shared.fontBottomLbl
        streetField.textColor = ColorCodes.bottomTitleColor
        
        blockLbl.font = Global.shared.fontTopLbl
        blockLbl.textColor = ColorCodes.topTitleColor
        
        blockField.font = Global.shared.fontBottomLbl
        blockField.textColor = ColorCodes.bottomTitleColor
        
        areaCityLbl.font = Global.shared.fontTopLbl
        areaCityLbl.textColor = ColorCodes.topTitleColor
        
        areaCityField.font = Global.shared.fontBottomLbl
        areaCityField.textColor = ColorCodes.bottomTitleColor
        
        zipcodeLbl.font = Global.shared.fontTopLbl
        zipcodeLbl.textColor = ColorCodes.topTitleColor
        
        zipCodeField.font = Global.shared.fontBottomLbl
        zipCodeField.textColor = ColorCodes.bottomTitleColor
        
        stateLbl.font = Global.shared.fontTopLbl
        stateLbl.textColor = ColorCodes.topTitleColor
        
        stateField.font = Global.shared.fontBottomLbl
        stateField.textColor = ColorCodes.bottomTitleColor
        
        countryLbl.font = Global.shared.fontTopLbl
        countryLbl.textColor = ColorCodes.topTitleColor
        
        countryAnswerLbl.font = Global.shared.fontBottomLbl
        countryAnswerLbl.textColor = ColorCodes.bottomTitleColor
        
        countryLbl.font = Global.shared.fontTopLbl
        countryLbl.textColor = ColorCodes.topTitleColor
        
        countryAnswerLbl.font = Global.shared.fontBottomLbl
        countryAnswerLbl.textColor = ColorCodes.bottomTitleColor
        
        pepPositionField.font = Global.shared.fontBottomLbl
        pepPositionField.textColor = ColorCodes.bottomTitleColor
        
        genderLbl.font = Global.shared.fontTopLbl
        genderLbl.textColor = ColorCodes.topTitleColor
        
        maleLbl.font = Global.shared.fontTopLbl
        maleLbl.textColor = ColorCodes.topTitleColor
        
        femaleLbl.font = Global.shared.fontTopLbl
        femaleLbl.textColor = ColorCodes.topTitleColor
        
        neutralLbl.font = Global.shared.fontTopLbl
        neutralLbl.textColor = ColorCodes.topTitleColor
        
        remiterCatgryLbl.font = Global.shared.fontTopLbl
        remiterCatgryLbl.textColor = ColorCodes.topTitleColor
        
        individualLbl.font = Global.shared.fontTopLbl
        individualLbl.textColor = ColorCodes.topTitleColor
        
        politicalExposedLbl.font = Global.shared.fontTopLbl
        politicalExposedLbl.textColor = ColorCodes.topTitleColor
        
        localLbl.font = Global.shared.fontTopLbl
        localLbl.textColor = ColorCodes.topTitleColor
        
        interntnalLbl.font = Global.shared.fontTopLbl
        interntnalLbl.textColor = ColorCodes.topTitleColor
        
        pepPositionLbl.font = Global.shared.fontTopLbl
        pepPositionLbl.textColor = ColorCodes.topTitleColor
        
        areYouRelativeLbl.font = Global.shared.fontTopLbl
        areYouRelativeLbl.textColor = ColorCodes.topTitleColor
        
        relativeYesLbl.font = Global.shared.fontTopLbl
        relativeYesLbl.textColor = ColorCodes.topTitleColor
        
        relativeNoLbl.font = Global.shared.fontTopLbl
        relativeNoLbl.textColor = ColorCodes.topTitleColor
        
        degreeOfRltnshpLbl.font = Global.shared.fontTopLbl
        degreeOfRltnshpLbl.textColor = ColorCodes.topTitleColor
        
        closeLbl.font = Global.shared.fontTopLbl
        closeLbl.textColor = ColorCodes.topTitleColor
        
        distantLbl.font = Global.shared.fontTopLbl
        distantLbl.textColor = ColorCodes.topTitleColor
        
        neutralRadioLbl.font = Global.shared.fontTopLbl
        neutralRadioLbl.textColor = ColorCodes.topTitleColor
        
        
        
        
        if Global.shared.new_preferredLanguage_is_required == true {
            preferedLangQuestnLbl.text = Global.shared.preferLangTxt + "*"
        }
        else {
            preferedLangQuestnLbl.text = Global.shared.preferLangTxt
        }
        if Global.shared.new_salutation_is_required == true {
            salutationLbl.text = Global.shared.persnalSalutatnTxt + "*"
        }
        else {
            salutationLbl.text = Global.shared.persnalSalutatnTxt
        }
        if Global.shared.new_firstName_is_required == true {
            firstNameLbl.text = Global.shared.persnalFirstNameTxt + "*"
        }
        else {
            firstNameLbl.text = Global.shared.persnalFirstNameTxt
        }
        if Global.shared.new_middleName_is_required == true {
            middleNameLbl.text = Global.shared.persnalmiddleNameTxt + "*"
        }
        else {
            middleNameLbl.text = Global.shared.persnalmiddleNameTxt
        }
        if Global.shared.new_lastName_is_required == true {
            lastNameLbl.text = Global.shared.persnalLastNameTxt + "*"
        }
        else {
            lastNameLbl.text = Global.shared.persnalLastNameTxt
        }
        if Global.shared.new_nationality_is_required == true {
            nationalityLbl.text = Global.shared.persnalNationlityTxt + "*"
        }
        else {
            nationalityLbl.text = Global.shared.persnalNationlityTxt
        }
        if Global.shared.new_dob_is_required == true {
            dateOfBirthLbl.text = Global.shared.persnalDobTxt + "*"
        }
        else {
            dateOfBirthLbl.text = Global.shared.persnalDobTxt
        }
        if Global.shared.new_placeOfBirth_is_required == true {
            placeOfBLbl.text = Global.shared.persnalPobTxt + "*"
        }
        else {
            placeOfBLbl.text = Global.shared.persnalPobTxt
        }
        
        if Global.shared.new_secndryEmailId_is_required == true {
            secndryEmailLbl.text = Global.shared.persnalSecndryEmailTxt + "*"
        }
        else {
            secndryEmailLbl.text = Global.shared.persnalSecndryEmailTxt
        }
        
        
        if Global.shared.new_residentType_is_required == true {
            residentLbl.text = Global.shared.acntResidentTypeTxt + "*"
        }
        else {
            residentLbl.text = Global.shared.acntResidentTypeTxt
        }
        if Global.shared.new_flat_is_required == true {
            flatLbl.text = Global.shared.acntFlatTxt + "*"
        }
        else {
            flatLbl.text = Global.shared.acntFlatTxt
        }
        if Global.shared.new_floor_is_required == true {
            floorLbl.text = Global.shared.acntFloorTxt + "*"
        }
        else {
            floorLbl.text = Global.shared.acntFloorTxt
        }
        if Global.shared.new_building_is_required == true {
            buildingLbl.text = Global.shared.acntBuildingTxt + "*"
        }
        else {
            buildingLbl.text = Global.shared.acntBuildingTxt
        }
        if Global.shared.new_gada_is_required == true {
            gadaLbl.text = Global.shared.acntGadaTxt + "*"
        }
        else {
            gadaLbl.text = Global.shared.acntGadaTxt + "*"
        }
        if Global.shared.new_street_is_required == true {
            streetLbl.text = Global.shared.acntStreetTxt + "*"
        }
        else {
            streetLbl.text = Global.shared.acntStreetTxt
        }
        if Global.shared.new_block_is_required == true {
            blockLbl.text = Global.shared.acntblockTxt + "*"
        }
        else {
            blockLbl.text = Global.shared.acntblockTxt
        }
        if Global.shared.new_areaCity_is_required == true {
            areaCityLbl.text = Global.shared.acntAreaCityTxt + "*"
        }
        else {
            areaCityLbl.text = Global.shared.acntAreaCityTxt
        }
        if Global.shared.new_zipCode_is_required == true {
            zipcodeLbl.text = Global.shared.acntZipcodeTxt + "*"
        }
        else {
            zipcodeLbl.text = Global.shared.acntZipcodeTxt
        }
        if Global.shared.new_state_is_required == true {
            stateLbl.text = Global.shared.acntStateTxt + "*"
        }
        else {
            stateLbl.text = Global.shared.acntStateTxt
        }
        if Global.shared.new_countryCode_is_required == true {
            countryLbl.text = Global.shared.acntCountryTxt + "*"
        }
        else {
            countryLbl.text = Global.shared.acntCountryTxt + "*"
        }
        
      
        
        genderLbl.text = Global.shared.persnalGenderTxt + "*"
        maleLbl.text = Global.shared.persnalMaleTxt
        femaleLbl.text = Global.shared.persnalFemaleTxt
        neutralLbl.text = Global.shared.persnalNeutralTxt
        
        
        remiterCatgryLbl.text = Global.shared.acntRemiterCategryTxt + "*"
        politicalScopeLbl.text = Global.shared.acntPoliticalScopeTxt + "*"
        areYouRelativeLbl.text = Global.shared.acntAreYouRelativeTxt + "*"
        degreeOfRltnshpLbl.text = Global.shared.acntDegreOfReltnSHipTxt + "*"
        individualLbl.text = Global.shared.acntRemitIndividualTxt
        
        politicalExposedLbl.text = Global.shared.acntRemitPoliticalTxt
        localLbl.text = Global.shared.acntPoliticalLocalTxt
        interntnalLbl.text = Global.shared.acntPoliticalInterntnlTxt
        relativeYesLbl.text = Global.shared.acntRelativeYesTxt
        relativeNoLbl.text = Global.shared.acntRelativeNoTxt
        closeLbl.text = Global.shared.acntDegreCloseTxt
        distantLbl.text = Global.shared.acntDegreDistantTxt
        neutralRadioLbl.text = Global.shared.acntDegreNeutralsTxt
        pepPositionLbl.text = Global.shared.pepPositionTxt + "*"
        
        
        nextBtnOtlt.setTitle(Global.shared.nxtBtnTxt, for: .normal)
        bckBtnOtlt.setTitle(Global.shared.backBtnTxt, for: .normal)
        
        firstNameField.maxLength = Global.shared.new_firstName_max_length
        middleNameField.maxLength = Global.shared.new_middleName_max_length
        lastNameField.maxLength = Global.shared.new_lastName_max_length
        //   placeOfBirthField.maxLength = Global.shared.new_placeOfBirth_max_length
        
        secndryEmailField.maxLength = Global.shared.new_secndryEmailId_max_length
        flatAnswerField.maxLength = Global.shared.new_flat_max_length
        floorField.maxLength = Global.shared.new_floor_max_length
        buildingField.maxLength = Global.shared.new_building_max_length
        gadaField.maxLength = Global.shared.new_gada_max_length
        streetField.maxLength = Global.shared.new_street_max_length
        blockField.maxLength = Global.shared.new_block_max_length
        areaCityField.maxLength = Global.shared.new_areaCity_max_length
        zipCodeField.maxLength = Global.shared.new_zipCode_max_length
        stateField.maxLength = Global.shared.new_state_max_length
        pepPositionField.maxLength = Global.shared.new_PEPPosition_max_length
        
        
        firstNameField.valueType = Global.shared.getFieldType(text: Global.shared.new_firstName_field_accept)
        middleNameField.valueType = Global.shared.getFieldType(text: Global.shared.new_middleName_field_accept)
        lastNameField.valueType = Global.shared.getFieldType(text: Global.shared.new_lastName_field_accept)
        //  placeOfBirthField.valueType = Global.shared.getFieldType(text: Global.shared.new_placeOfBirth_field_accept)
        
        secndryEmailField.valueType = Global.shared.getFieldType(text: Global.shared.new_secndryEmailId_field_accept)
        flatAnswerField.valueType = Global.shared.getFieldType(text: Global.shared.new_flat_field_accept)
        floorField.valueType = Global.shared.getFieldType(text: Global.shared.new_floor_field_accept)
        buildingField.valueType = Global.shared.getFieldType(text: Global.shared.new_building_field_accept)
        gadaField.valueType = Global.shared.getFieldType(text: Global.shared.new_gada_field_accept)
        streetField.valueType = Global.shared.getFieldType(text: Global.shared.new_street_field_accept)
        blockField.valueType = Global.shared.getFieldType(text: Global.shared.new_block_field_accept)
        areaCityField.valueType = Global.shared.getFieldType(text: Global.shared.new_areaCity_field_accept)
        zipCodeField.valueType = Global.shared.getFieldType(text: Global.shared.new_zipCode_field_accept)
        stateField.valueType = Global.shared.getFieldType(text: Global.shared.new_state_field_accept)
        pepPositionField.valueType = Global.shared.getFieldType(text: Global.shared.new_PEPPosition_field_accept)
        
        
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
    
    @IBAction func nextBtnActn(_ sender: Any) {
        if self.easyTipView == nil {
            print("nothing")
        }
        else {
            easyTipView.dismiss()
            self.easyTipView = nil
        }
        if Global.shared.new_preferredLanguage_is_required == true && preferedLngAnswerLbl.text == ""{
            
            prefLangReqLbl.isHidden = false
        }
        else  if Global.shared.new_residentType_is_required == true && residentAnswerLbl.text == "" {
            
            residentReqLbl.isHidden = false
        }
            
        else  if Global.shared.new_salutation_is_required == true && salutationAnswerLbl.text == ""{
            
            salutationReqLbl.isHidden = false
            
        }
        else  if Global.shared.new_firstName_is_required == true && firstNameField.text == "" {
            firstNameField.becomeFirstResponder()
            firstNameReqLbl.isHidden = false
        }
            
        else  if Global.shared.new_middleName_is_required == true && middleNameField.text == ""{
            middleNameField.becomeFirstResponder()
            middleNameReqLbl.isHidden = false
        }
            
        else  if Global.shared.new_lastName_is_required == true && lastNameField.text == "" {
            lastNameField.becomeFirstResponder()
            lastNameReqLbl.isHidden = false
        }
        else   if Global.shared.new_dob_is_required == true && dob == "" {
            
            dobReLbl.isHidden = false
        }
        else   if Global.shared.new_placeOfBirth_is_required == true && placeOfBirthField.text == "" {
            
            placeOfBirthReqLbl.isHidden = false
        }
        else  if Global.shared.new_nationality_is_required == true && nationalityField.text == "" {
            
            nationalityReqLbl.isHidden = false
        }
        
        
        else if salutationAnswerLbl.text == "Mr." && self.genderStr == "F"{
            let alert = ViewControllerManager.displayAlert(message:invalidSalutnTxt, title:APPLICATIONNAME)
            self.present(alert, animated: true, completion: nil)
        }
            
        else if salutationAnswerLbl.text == "Mrs." && self.genderStr == "M"{
            let alert = ViewControllerManager.displayAlert(message:invalidSalutnTxt, title:APPLICATIONNAME)
            self.present(alert, animated: true, completion: nil)
        }
            
        else if salutationAnswerLbl.text == "Miss." && self.genderStr == "M"{
            let alert = ViewControllerManager.displayAlert(message:invalidSalutnTxt, title:APPLICATIONNAME)
            self.present(alert, animated: true, completion: nil)
        }
        
        else   if Global.shared.new_flat_is_required == true && flatAnswerField.text == "" {
            flatAnswerField.becomeFirstResponder()
            flatReqLbl.isHidden = false
            
        }
        else  if Global.shared.new_floor_is_required == true && floorField.text == "" {
            floorField.becomeFirstResponder()
            floorReqLbl.isHidden = false
        }
            
        else   if Global.shared.new_building_is_required == true && buildingField.text == "" {
            buildingField.becomeFirstResponder()
            buildingReqLbl.isHidden = false
        }
            
        else  if Global.shared.new_gada_is_required == true && gadaField.text == "" {
            gadaField.becomeFirstResponder()
            gadaReqLbl.isHidden = false
        }
            
        else   if Global.shared.new_street_is_required == true && streetField.text == "" {
            streetField.becomeFirstResponder()
            streetReqLbl.isHidden = false
        }
            
        else  if Global.shared.new_block_is_required == true && blockField.text == "" {
            blockField.becomeFirstResponder()
            blockReqLbl.isHidden = false
        }
            
            
        else   if Global.shared.new_areaCity_is_required == true && areaCityField.text == ""  {
            areaCityField.becomeFirstResponder()
            areaCityReqLbl.isHidden = false
        }
        else   if Global.shared.new_zipCode_is_required == true && zipCodeField.text == "" {
            zipCodeField.becomeFirstResponder()
            zipCodeReqLbl.isHidden = false
        }
        else   if Global.shared.new_state_is_required == true && stateField.text == "" {
            stateField.becomeFirstResponder()
            stateReqLbl.isHidden = false
        }
            
        else   if Global.shared.new_countryCode_is_required == true && countryAnswerLbl.text == "" {
            
            countryReqLbl.isHidden = false
        }
            else if  self.expand1viewHeightConstrt.constant == 1210.0  && politicalScope == ""  {
            let politicalScopeTxt = Global.shared.acntPoliticalScopeTxt + " " + Global.shared.errorTxtRequired
                       let alert = ViewControllerManager.displayAlert(message:politicalScopeTxt, title:APPLICATIONNAME)
                                self.present(alert, animated: true, completion: nil)
                       
                   }
        else if  self.expand1viewHeightConstrt.constant == 1210.0  && pepPositionField.text == ""  {
            let pepPostnTxt = Global.shared.pepPositionTxt + " " + Global.shared.errorTxtRequired
                       let alert = ViewControllerManager.displayAlert(message:pepPostnTxt, title:APPLICATIONNAME)
                                self.present(alert, animated: true, completion: nil)
                       
                   }
       
        else if  self.expand1viewHeightConstrt.constant == 1210.0  &&  areYouRelative == "" {
            let areReltv = Global.shared.acntAreYouRelativeTxt + " " + Global.shared.errorTxtRequired
                let alert = ViewControllerManager.displayAlert(message:areReltv, title:APPLICATIONNAME)
                         self.present(alert, animated: true, completion: nil)
                
            }
            
        else if  self.expand1viewHeightConstrt.constant == 1210.0  &&  adFifteenView.isHidden == false && degreOfReltn == ""{
            let degreReltn = Global.shared.acntDegreOfReltnSHipTxt + " " + Global.shared.errorTxtRequired
                let alert = ViewControllerManager.displayAlert(message:degreReltn, title:APPLICATIONNAME)
                         self.present(alert, animated: true, completion: nil)
                
            }
            
            
            
        else {
            //  NewUser.shared.preferredLang = preferedLngAnswerLbl.text ?? ""
            //  NewUser.shared.residentType = residentAnswerLbl.text
            //   NewUser.shared.salutation = salutationAnswerLbl.text
            NewUser.shared.firstName = firstNameField.text ?? ""
            NewUser.shared.middleName = middleNameField.text ?? ""
            NewUser.shared.lastName = lastNameField.text ?? ""
            NewUser.shared.dob = dob
            NewUser.shared.placeOfBirth = placeOfBirthField.text ?? ""
            //  NewUser.shared.nationality = nationalityField.text ?? ""
            NewUser.shared.flat = flatAnswerField.text ?? ""
            NewUser.shared.floor = floorField.text ?? ""
            NewUser.shared.building = buildingField.text ?? ""
            NewUser.shared.gada = gadaField.text ?? ""
            NewUser.shared.street = streetField.text ?? ""
            NewUser.shared.block = blockField.text ?? ""
            NewUser.shared.city = areaCityField.text ?? ""
            NewUser.shared.state = stateField.text ?? ""
            //  NewUser.shared.country = countryAnswerLbl.text ?? ""
            NewUser.shared.zipcode = zipCodeField.text ?? ""
            
            NewUser.shared.secondryEmail = secndryEmailField.text ?? ""
            NewUser.shared.gender = genderStr
            NewUser.shared.remitterCategry = remiterCategryStr
            
            if politicalScope == "" {
                NewUser.shared.politicalScope =  Global.shared.acntPoliticalLocalTxt
            }
            else {
                NewUser.shared.politicalScope = politicalScope
            }
            if areYouRelative == "" {
                 NewUser.shared.isPoliticallyExposed = "no"
            }
            else {
                NewUser.shared.isPoliticallyExposed = areYouRelative
            }
            
            degreOfReltn = Global.shared.acntDegreDistantTxt
           
            NewUser.shared.pepPosition = pepPositionField.text ?? ""
            NewUser.shared.relationshipPEP = degreOfReltn
            
            //just testing
          self.pushViewController(controller: NewCustEmploymentVc.initiateController(), isGestureEnable: false, animated: false)
        }
    }
    
    @IBAction func bckBtnActn(_ sender: Any) {
        if self.easyTipView == nil {
            print("nothing")
        }
        else {
            easyTipView.dismiss()
            self.easyTipView = nil
        }
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        self.navigationController?.popViewController(animated: false)
    }
    
    @IBAction func expand1Actn(_ sender: Any) {
        if self.easyTipView == nil {
            print("nothing")
        }
        else {
            easyTipView.dismiss()
            self.easyTipView = nil
        }
        
        if(expandOneClick == true) {
            
            
            self.expandFirstView.isHidden = false
            if remiterCategryStr == "P" {
                self.expand1viewHeightConstrt.constant = 1210
                //     self.mainViewHeightConstrt.constant = 2250
                if  areYouRelative == "yes" {
                    
                    adFifteenView.isHidden = false
                } else {
                    
                    adFifteenView.isHidden = true
                }
            }
            else {
                self.expand1viewHeightConstrt.constant = 950
              
                //    self.mainViewHeightConstrt.constant = 1950
            }
            
            
            
        }
        else {
            self.expandFirstView.isHidden = true
            self.expand1viewHeightConstrt.constant = 0
        }
        
        expandOneClick = !expandOneClick
        
        
        
        
        
        /*     if(expandOneClick == true) {
         self.expandFirstView.isHidden = true
         self.expand1viewHeightConstrt.constant = 0
         } else {
         self.expandFirstView.isHidden = false
         self.expand1viewHeightConstrt.constant = 1120
         
         }
         
         expandOneClick = !expandOneClick*/
        
    }
    
    @IBAction func expand2BtnActn(_ sender: Any) {
        if self.easyTipView == nil {
            print("nothing")
        }
        else {
            easyTipView.dismiss()
            self.easyTipView = nil
        }
        
        
        if(expandTwoClick == true) {
            
            self.expandSecndView.isHidden = false
            self.expand2ViewHeightConstrt.constant = 950
            
        } else {
            self.expandSecndView.isHidden = true
            self.expand2ViewHeightConstrt.constant = 0
            
        }
        
        expandTwoClick = !expandTwoClick
        
        /*  if(expandTwoClick == true) {
         self.expandSecndView.isHidden = false
         if remiterCategryStr == "P" {
         self.expand2ViewHeightConstrt.constant = 1350
         }
         else {
         self.expand2ViewHeightConstrt.constant = 1020
         }
         
         } else {
         self.expandSecndView.isHidden = true
         self.expand2ViewHeightConstrt.constant = 0
         }
         
         expandTwoClick = !expandTwoClick*/
    }
    
    @IBAction func maleRadioActn(_ sender: Any) {
        if self.easyTipView == nil {
            print("nothing")
        }
        else {
            easyTipView.dismiss()
            self.easyTipView = nil
        }
        maleRadioBtnOtlt.setImage(UIImage(named: "circleChecked"), for: .normal)
        femaleRadioBtnOtlt.setImage(UIImage(named: "circleUnchecked"), for: .normal)
        neutralRadioBtnOtlt.setImage(UIImage(named: "circleUnchecked"), for: .normal)
        
        //   genderStr = Global.shared.persnalMaleTxt
        genderStr = "M"
    }
    
    
    @IBAction func femaleActn(_ sender: Any) {
        if self.easyTipView == nil {
            print("nothing")
        }
        else {
            easyTipView.dismiss()
            self.easyTipView = nil
        }
        maleRadioBtnOtlt.setImage(UIImage(named: "circleUnchecked"), for: .normal)
        femaleRadioBtnOtlt.setImage(UIImage(named: "circleChecked"), for: .normal)
        neutralRadioBtnOtlt.setImage(UIImage(named: "circleUnchecked"), for: .normal)
        
        //  genderStr = Global.shared.persnalFemaleTxt
        genderStr = "F"
    }
    
    
    @IBAction func neutralActn(_ sender: Any) {
        if self.easyTipView == nil {
            print("nothing")
        }
        else {
            easyTipView.dismiss()
            self.easyTipView = nil
        }
        maleRadioBtnOtlt.setImage(UIImage(named: "circleUnchecked"), for: .normal)
        femaleRadioBtnOtlt.setImage(UIImage(named: "circleUnchecked"), for: .normal)
        neutralRadioBtnOtlt.setImage(UIImage(named: "circleChecked"), for: .normal)
        
        genderStr = Global.shared.persnalNeutralTxt
    }
    
    
    @IBAction func individualBtnActn(_ sender: Any) {
        if self.easyTipView == nil {
            print("nothing")
        }
        else {
            easyTipView.dismiss()
            self.easyTipView = nil
        }
        indiviRadioBtnOtlt.setImage(UIImage(named: "circleChecked"), for: .normal)
        politicalyExposedBtnOtlt.setImage(UIImage(named: "circleUnchecked"), for: .normal)
        
        remiterCategryStr = "I"
        self.expand1viewHeightConstrt.constant = 950
        
        self.oneHeightConstrt.constant = 0
        self.twoHeightConstrt.constant = 0
        self.threeHeightConstrt.constant = 0
        self.fourHeightConstrt.constant = 0
        
        adThirteenView.isHidden = true
        adFourteenView.isHidden = true
        adFifteenView.isHidden = true
        pepPositionView.isHidden = true
    }
    
    @IBAction func politicalExpoBtnActn(_ sender: Any) {
        if self.easyTipView == nil {
            print("nothing")
        }
        else {
            easyTipView.dismiss()
            self.easyTipView = nil
        }
        indiviRadioBtnOtlt.setImage(UIImage(named: "circleUnchecked"), for: .normal)
        politicalyExposedBtnOtlt.setImage(UIImage(named: "circleChecked"), for: .normal)
        
        remiterCategryStr = "P"
        
        self.expand1viewHeightConstrt.constant = 1210
        
        self.oneHeightConstrt.constant = 60
        self.twoHeightConstrt.constant = 60
        self.threeHeightConstrt.constant = 60
        self.fourHeightConstrt.constant = 60
        
        adThirteenView.isHidden = false
        adFourteenView.isHidden = false
        //  adFifteenView.isHidden = false
        pepPositionView.isHidden = false
        
        if  areYouRelative == "yes" {
            
            adFifteenView.isHidden = false
        } else {
            
            adFifteenView.isHidden = true
        }
        
        
    }
    
    
    @IBAction func localBtnActn(_ sender: Any) {
        if self.easyTipView == nil {
            print("nothing")
        }
        else {
            easyTipView.dismiss()
            self.easyTipView = nil
        }
        localBtnOtlt.setImage(UIImage(named: "circleChecked"), for: .normal)
        interntnlBtnOtlt.setImage(UIImage(named: "circleUnchecked"), for: .normal)
        politicalScope = Global.shared.acntPoliticalLocalTxt
    }
    
    
    @IBAction func interntnlBtnActn(_ sender: Any) {
        if self.easyTipView == nil {
            print("nothing")
        }
        else {
            easyTipView.dismiss()
            self.easyTipView = nil
        }
        localBtnOtlt.setImage(UIImage(named: "circleUnchecked"), for: .normal)
        interntnlBtnOtlt.setImage(UIImage(named: "circleChecked"), for: .normal)
        
        politicalScope = Global.shared.acntPoliticalInterntnlTxt
    }
    
    
    @IBAction func relativeYesBtnActn(_ sender: Any) {
        if self.easyTipView == nil {
            print("nothing")
        }
        else {
            easyTipView.dismiss()
            self.easyTipView = nil
        }
        relativeYesBtnOtlt.setImage(UIImage(named: "circleChecked"), for: .normal)
        relativeNoBtnOtlt.setImage(UIImage(named: "circleUnchecked"), for: .normal)
        
        areYouRelative = "yes"
        
        adFifteenView.isHidden = false
    }
    
    
    @IBAction func relativeNoBtnActn(_ sender: Any) {
        if self.easyTipView == nil {
            print("nothing")
        }
        else {
            easyTipView.dismiss()
            self.easyTipView = nil
        }
        
        relativeYesBtnOtlt.setImage(UIImage(named: "circleUnchecked"), for: .normal)
        relativeNoBtnOtlt.setImage(UIImage(named: "circleChecked"), for: .normal)
        areYouRelative = "no"
        
        adFifteenView.isHidden = true
    }
    
    
    @IBAction func closeBtnActn(_ sender: Any) {
        if self.easyTipView == nil {
            print("nothing")
        }
        else {
            easyTipView.dismiss()
            self.easyTipView = nil
        }
        closeBtnOtlt.setImage(UIImage(named: "circleChecked"), for: .normal)
        distantBtnOtlt.setImage(UIImage(named: "circleUnchecked"), for: .normal)
        neutralBtnOtlt.setImage(UIImage(named: "circleUnchecked"), for: .normal)
        
        degreOfReltn = Global.shared.acntDegreCloseTxt
    }
    
    @IBAction func distantBtnActn(_ sender: Any) {
        if self.easyTipView == nil {
            print("nothing")
        }
        else {
            easyTipView.dismiss()
            self.easyTipView = nil
        }
        closeBtnOtlt.setImage(UIImage(named: "circleUnchecked"), for: .normal)
        distantBtnOtlt.setImage(UIImage(named: "circleChecked"), for: .normal)
        neutralBtnOtlt.setImage(UIImage(named: "circleUnchecked"), for: .normal)
        
        degreOfReltn = Global.shared.acntDegreDistantTxt
    }
    
    
    @IBAction func neutralBtnActn(_ sender: Any) {
        if self.easyTipView == nil {
            print("nothing")
        }
        else {
            easyTipView.dismiss()
            self.easyTipView = nil
        }
        closeBtnOtlt.setImage(UIImage(named: "circleUnchecked"), for: .normal)
        distantBtnOtlt.setImage(UIImage(named: "circleUnchecked"), for: .normal)
        neutralBtnOtlt.setImage(UIImage(named: "circleChecked"), for: .normal)
        
        degreOfReltn = Global.shared.acntDegreNeutralsTxt
    }
    
    
    @IBAction func preferedLangDrpDownActn(_ sender: Any) {
        if self.easyTipView == nil {
            print("nothing")
        }
        else {
            easyTipView.dismiss()
            self.easyTipView = nil
        }
        let pickerData = Global.shared.pickerResponseLanguge
        PickerDialog().show(title: "", options: pickerData , selected: "") {
            (value) -> Void in
            self.preferedLngAnswerLbl.text = "\(value)"
            
            
            let indexS = Global.shared.languageNames.firstIndex(of: "\(value)")
            NewUser.shared.preferredLang = Global.shared.languageValues[indexS ?? 0]
            
            if Global.shared.new_preferredLanguage_is_required == true {
                self.prefLangReqLbl.isHidden = true
            }
            
        }
        
    }
    
    @IBAction func salutionDrpActn(_ sender: Any) {
        if self.easyTipView == nil {
            print("nothing")
        }
        else {
            easyTipView.dismiss()
            self.easyTipView = nil
        }
        let pickerData = Global.shared.pickerResponseSalutation
        PickerDialog().show(title: "", options: pickerData , selected: "") {
            (value) -> Void in
            self.salutationAnswerLbl.text = "\(value)"
            let indexS = Global.shared.salutationNames.firstIndex(of: "\(value)")
            NewUser.shared.salutation = Global.shared.salutationValues[indexS ?? 0]
            
            if Global.shared.new_salutation_is_required == true {
                self.salutationReqLbl.isHidden = true
            }
            if  self.salutationAnswerLbl.text == "Mrs." || self.salutationAnswerLbl.text == "Miss."{
                self.maleRadioBtnOtlt.setImage(UIImage(named: "circleUnchecked"), for: .normal)
                self.femaleRadioBtnOtlt.setImage(UIImage(named: "circleChecked"), for: .normal)
                self.genderStr = "F"
            }
            else {
                self.maleRadioBtnOtlt.setImage(UIImage(named: "circleChecked"), for: .normal)
                self.femaleRadioBtnOtlt.setImage(UIImage(named: "circleUnchecked"), for: .normal)
                self.genderStr = "M"
            }
            
        }
        
    }
    
    @IBAction func residentDrpActn(_ sender: Any) {
        if self.easyTipView == nil {
            print("nothing")
        }
        else {
            easyTipView.dismiss()
            self.easyTipView = nil
        }
        let pickerData = Global.shared.pickerResponseResident
        PickerDialog().show(title: "", options: pickerData , selected: "") {
            (value) -> Void in
            self.residentAnswerLbl.text = "\(value)"
            
            
            let indexS = Global.shared.residentNames.firstIndex(of: "\(value)")
            NewUser.shared.residentType = Global.shared.residentValues[indexS ?? 0]
            
            if Global.shared.new_residentType_is_required == true {
                self.residentReqLbl.isHidden = true
            }
        }
        
    }
    
    
    @IBAction func placeOfBirthDrpActn(_ sender: Any) {
        
        if self.easyTipView == nil {
            print("nothing")
        }
        else {
            easyTipView.dismiss()
            self.easyTipView = nil
        }
        Global.shared.contryNationality = "pob"
        let popOverVC = self.storyboard?.instantiateViewController(withIdentifier: "CountryDrpDownSearch") as! CountryDrpDownSearch
        self.addChild(popOverVC)
        popOverVC.delegate = self
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParent: self)
    }
    
    
    @IBAction func countryDrpBtnActn(_ sender: Any) {
        
        if self.easyTipView == nil {
            print("nothing")
        }
        else {
            easyTipView.dismiss()
            self.easyTipView = nil
        }
        /*   let pickerData = Global.shared.pickerResponseCountryData
         PickerDialog().show(title: "", options: pickerData , selected: "") {
         (value) -> Void in
         self.countryAnswerLbl.text = "\(value)"
         
         
         let indexS = Global.shared.countryNameData.firstIndex(of: "\(value)")
         NewUser.shared.country = Global.shared.countryCodesData[indexS ?? 0]
         
         if Global.shared.new_countryCode_is_required == true {
         self.countryReqLbl.isHidden = true
         }
         }*/
        Global.shared.contryNationality = "country"
        let popOverVC = self.storyboard?.instantiateViewController(withIdentifier: "CountryDrpDownSearch") as! CountryDrpDownSearch
        self.addChild(popOverVC)
        popOverVC.delegate = self
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParent: self)
        
    }
    
    func dropValuesCountryChanged(dropDisplay: String) {
        
        if Global.shared.contryNationality == "country" {
            self.countryAnswerLbl.text = dropDisplay
            let indexS = Global.shared.countryNameData.firstIndex(of: "\(dropDisplay)")
            NewUser.shared.country = Global.shared.countryCodesData[indexS ?? 0]
           // self.countryDrpImg.image = UIImage(named: dropDisplay)
            self.countryReqLbl.isHidden = true
            self.countryDrpImg.image = UIImage(named:  NewUser.shared.country.lowercased())
            
            // NewUser.shared.occupation = self.occuptionSelected
        }
        else  if Global.shared.contryNationality == "pob" {
            self.placeOfBirthField.text = dropDisplay
            let indexS = Global.shared.countryNameData.firstIndex(of: "\(dropDisplay)")
            NewUser.shared.placeOfBirth = Global.shared.countryCodesData[indexS ?? 0]
          //  self.placeOfBirthImg.image = UIImage(named: dropDisplay)
            self.placeOfBirthReqLbl.isHidden = true
            self.placeOfBirthImg.image = UIImage(named:  NewUser.shared.placeOfBirth.lowercased())
            // NewUser.shared.occupation = self.occuptionSelected
        }
        else {
            self.nationalityField.text = dropDisplay
            let indexS = Global.shared.countryNameData.firstIndex(of: "\(dropDisplay)")
            NewUser.shared.nationality = Global.shared.countryCodesData[indexS ?? 0]
            self.nationalityReqLbl.isHidden = true
            self.nationalityDrpImg.image = UIImage(named: NewUser.shared.nationality.lowercased())
          //  self.nationalityDrpImg.image = UIImage(named: dropDisplay)
        }
        
    }
    
    
    
    @IBAction func nationalityDrpDwnActn(_ sender: Any) {
        
        if self.easyTipView == nil {
            print("nothing")
        }
        else {
            easyTipView.dismiss()
            self.easyTipView = nil
        }
        
        Global.shared.contryNationality = "nationality"
        let popOverVC = self.storyboard?.instantiateViewController(withIdentifier: "CountryDrpDownSearch") as! CountryDrpDownSearch
        self.addChild(popOverVC)
        popOverVC.delegate = self
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParent: self)
        /*   let pickerData = Global.shared.pickerResponseCountryData
         PickerDialog().show(title: "", options: pickerData , selected: "") {
         (value) -> Void in
         self.nationalityField.text = "\(value)"
         
         let indexS = Global.shared.countryNameData.firstIndex(of: "\(value)")
         NewUser.shared.nationality = Global.shared.countryCodesData[indexS ?? 0]
         
         if Global.shared.new_nationality_is_required == true {
         self.nationalityReqLbl.isHidden = true
         }
         }*/
    }
    
    
    @IBAction func dobBtnActn(_ sender: Any) {
        
        if self.easyTipView == nil {
            print("nothing")
        }
        else {
            easyTipView.dismiss()
            self.easyTipView = nil
        }
        
        let maxxxx = Calendar.current.date(byAdding: .year, value: -18, to: NSDate() as Date)
        
        DatePickerDialog().show("DOB", doneButtonTitle: "Done", cancelButtonTitle: "Cancel", maximumDate: maxxxx, datePickerMode: .date) {
            (date) -> Void in
            if let dt = date {
                let formatter = DateFormatter()
                formatter.locale = Locale(identifier: "en_US_POSIX")
                formatter.dateFormat = "dd/MM/yyyy"
                self.dobValueLbl.text = formatter.string(from: dt)
                
                
                formatter.dateFormat = "yyyy-MM-dd"
                self.dob = formatter.string(from: dt)
                
                /*    let formatter1 = DateFormatter()
                 formatter1.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
                 formatter1.timeZone = NSTimeZone(forSecondsFromGMT: 0) as TimeZone
                 self.dob = formatter.string(from: dt)*/
                self.dobReLbl.isHidden = true
                
                
             //   if Global.shared.new_dob_is_required == true {
                  
                    self.civilIdDobValidation()
              //  }
            }
            
        }
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if self.easyTipView == nil {
            print("nothing")
        }
        else {
            easyTipView.dismiss()
            self.easyTipView = nil
        }
        
        //doneAction()
        if textField == firstNameField{
            if Global.shared.new_firstName_is_required == true {
                if firstNameField.text!.count ==  0 {
                    firstNameReqLbl.isHidden = false
                }
                else {
                    firstNameReqLbl.isHidden = true
                }
            }
        }
        else  if textField == middleNameField{
            if Global.shared.new_middleName_is_required == true {
                if middleNameField.text!.count ==  0 {
                    middleNameReqLbl.isHidden = false
                }
                else {
                    middleNameReqLbl.isHidden = true
                }
            }
        }
        else  if textField == lastNameField{
            if Global.shared.new_lastName_is_required == true {
                if lastNameField.text!.count ==  0 {
                    lastNameReqLbl.isHidden = false
                }
                else {
                    lastNameReqLbl.isHidden = true
                }
            }
        }
            /*   else  if textField == placeOfBirthField{
             if Global.shared.new_placeOfBirth_is_required == true {
             if placeOfBirthField.text!.count ==  0 {
             placeOfBirthReqLbl.isHidden = false
             }
             else {
             placeOfBirthReqLbl.isHidden = true
             }
             }
             }*/
            
        else  if textField == secndryEmailField{
            if Global.shared.new_secndryEmailId_is_required == true {
                if secndryEmailField.text!.count ==  0 {
                    secndryEmailReqLbl.isHidden = false
                }
                else {
                    secndryEmailReqLbl.isHidden = true
                }
            }
        }
        else  if textField == flatAnswerField{
            if Global.shared.new_flat_is_required == true {
                if flatAnswerField.text!.count ==  0 {
                    flatReqLbl.isHidden = false
                }
                else {
                    flatReqLbl.isHidden = true
                }
            }
        }
        else  if textField == floorField{
            if Global.shared.new_floor_is_required == true {
                if floorField.text!.count ==  0 {
                    floorReqLbl.isHidden = false
                }
                else {
                    floorReqLbl.isHidden = true
                }
            }
        }
        else  if textField == buildingField {
            if Global.shared.new_building_is_required == true {
                if buildingField.text!.count ==  0 {
                    buildingReqLbl.isHidden = false
                }
                else {
                    buildingReqLbl.isHidden = true
                }
            }
        }
        else  if textField == gadaField {
            if Global.shared.new_gada_is_required == true {
                if gadaField.text!.count ==  0 {
                    gadaReqLbl.isHidden = false
                }
                else {
                    gadaReqLbl.isHidden = true
                }
            }
        }
        else  if textField == streetField {
            if Global.shared.new_street_is_required == true {
                if streetField.text!.count ==  0 {
                    streetReqLbl.isHidden = false
                }
                else {
                    streetReqLbl.isHidden = true
                }
            }
        }
        else  if textField == blockField {
            if Global.shared.new_block_is_required == true {
                if blockField.text!.count ==  0 {
                    blockReqLbl.isHidden = false
                }
                else {
                    blockReqLbl.isHidden = true
                }
            }
        }
        else  if textField == areaCityField {
            if Global.shared.new_areaCity_is_required == true {
                if areaCityField.text!.count ==  0 {
                    areaCityReqLbl.isHidden = false
                }
                else {
                    areaCityReqLbl.isHidden = true
                }
            }
        }
        else  if textField == zipCodeField {
            if Global.shared.new_zipCode_is_required == true {
                if zipCodeField.text!.count ==  0 {
                    zipCodeReqLbl.isHidden = false
                }
                else {
                    zipCodeReqLbl.isHidden = true
                }
            }
        }
        else  if textField == stateField {
            if Global.shared.new_state_is_required == true {
                if stateField.text!.count ==  0 {
                    stateReqLbl.isHidden = false
                }
                else {
                    stateReqLbl.isHidden = true
                }
            }
        }
        else  if textField == pepPositionField {
            if Global.shared.new_PEPPosition_is_required == true {
                if pepPositionField.text!.count ==  0 {
                    pepPositionReqLbl.isHidden = false
                }
                else {
                    pepPositionReqLbl.isHidden = true
                }
            }
        }
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if self.easyTipView == nil {
            print("nothing")
        }
        else {
            easyTipView.dismiss()
            self.easyTipView = nil
        }
        if textField == firstNameField {
            if Global.shared.new_firstName_is_required == true {
                if firstNameField.text!.count <= -1 {
                    firstNameReqLbl.isHidden = false
                }
                else {
                    firstNameReqLbl.isHidden = true
                }
            }
            return firstNameField.verifyFields(shouldChangeCharactersIn: range, replacementString: string)
        }else  if textField == middleNameField {
            if Global.shared.new_middleName_is_required == true {
                if middleNameField.text!.count <= -1 {
                    middleNameReqLbl.isHidden = false
                }
                else {
                    middleNameReqLbl.isHidden = true
                }
            }
            return middleNameField.verifyFields(shouldChangeCharactersIn: range, replacementString: string)
        } else  if textField == lastNameField {
            if Global.shared.new_lastName_is_required == true {
                if lastNameField.text!.count <= -1 {
                    lastNameReqLbl.isHidden = false
                }
                else {
                    lastNameReqLbl.isHidden = true
                }
            }
            return lastNameField.verifyFields(shouldChangeCharactersIn: range, replacementString: string)
        }
            /*  else  if textField == placeOfBirthField {
             if Global.shared.new_placeOfBirth_is_required == true {
             if placeOfBirthField.text!.count <= -1 {
             placeOfBirthReqLbl.isHidden = false
             }
             else {
             placeOfBirthReqLbl.isHidden = true
             }
             }
             return placeOfBirthField.verifyFields(shouldChangeCharactersIn: range, replacementString: string)
             }*/
            
        else  if textField == secndryEmailField {
            if Global.shared.new_secndryEmailId_is_required == true {
                if secndryEmailField.text!.count <= -1 {
                    secndryEmailReqLbl.isHidden = false
                }
                else {
                    secndryEmailReqLbl.isHidden = true
                }
            }
            return secndryEmailField.verifyFields(shouldChangeCharactersIn: range, replacementString: string)
        }
        else  if textField == flatAnswerField {
            if Global.shared.new_flat_is_required == true {
                if flatAnswerField.text!.count <= -1 {
                    flatReqLbl.isHidden = false
                }
                else {
                    flatReqLbl.isHidden = true
                }
            }
            return flatAnswerField.verifyFields(shouldChangeCharactersIn: range, replacementString: string)
        }
        else  if textField == floorField {
            if Global.shared.new_floor_is_required == true {
                if floorField.text!.count <= -1 {
                    floorReqLbl.isHidden = false
                }
                else {
                    floorReqLbl.isHidden = true
                }
            }
            return floorField.verifyFields(shouldChangeCharactersIn: range, replacementString: string)
        }
        else  if textField == buildingField {
            if Global.shared.new_building_is_required == true {
                if buildingField.text!.count <= -1 {
                    buildingReqLbl.isHidden = false
                }
                else {
                    buildingReqLbl.isHidden = true
                }
            }
            return buildingField.verifyFields(shouldChangeCharactersIn: range, replacementString: string)
        }
        else  if textField == gadaField {
            if Global.shared.new_gada_is_required == true {
                if gadaField.text!.count <= -1 {
                    gadaReqLbl.isHidden = false
                }
                else {
                    gadaReqLbl.isHidden = true
                }
            }
            return gadaField.verifyFields(shouldChangeCharactersIn: range, replacementString: string)
        }
        else  if textField == streetField {
            if Global.shared.new_street_is_required == true {
                if streetField.text!.count <= -1 {
                    streetReqLbl.isHidden = false
                }
                else {
                    streetReqLbl.isHidden = true
                }
            }
            return streetField.verifyFields(shouldChangeCharactersIn: range, replacementString: string)
        }
        else  if textField == blockField {
            if Global.shared.new_block_is_required == true {
                if blockField.text!.count <= -1 {
                    blockReqLbl.isHidden = false
                }
                else {
                    blockReqLbl.isHidden = true
                }
            }
            return blockField.verifyFields(shouldChangeCharactersIn: range, replacementString: string)
        }
        else  if textField == areaCityField {
            if Global.shared.new_areaCity_is_required == true {
                if areaCityField.text!.count <= -1 {
                    areaCityReqLbl.isHidden = false
                }
                else {
                    areaCityReqLbl.isHidden = true
                }
            }
            return areaCityField.verifyFields(shouldChangeCharactersIn: range, replacementString: string)
        }
        else  if textField == zipCodeField {
            if Global.shared.new_zipCode_is_required == true {
                if zipCodeField.text!.count <= -1 {
                    zipCodeReqLbl.isHidden = false
                }
                else {
                    zipCodeReqLbl.isHidden = true
                }
            }
            return zipCodeField.verifyFields(shouldChangeCharactersIn: range, replacementString: string)
        }
        else  if textField == stateField {
            if Global.shared.new_state_is_required == true {
                if stateField.text!.count <= -1 {
                    stateReqLbl.isHidden = false
                }
                else {
                    stateReqLbl.isHidden = true
                }
            }
            return stateField.verifyFields(shouldChangeCharactersIn: range, replacementString: string)
        }
        else  if textField == pepPositionField {
            if Global.shared.new_PEPPosition_is_required == true {
                if pepPositionField.text!.count <= -1 {
                    pepPositionReqLbl.isHidden = false
                }
                else {
                    pepPositionReqLbl.isHidden = true
                }
            }
            return pepPositionField.verifyFields(shouldChangeCharactersIn: range, replacementString: string)
        }
        
        return true
        
    }
    
    
    @IBAction func languageChangeActn(_ sender: Any) {
     //   Global.shared.languageChangeActn()
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
    
    
    
    @IBAction func remitterToolTipActn(_ sender: Any) {
        var preferences = EasyTipView.Preferences()
        preferences.drawing.font = UIFont(name: "Futura-Medium", size: 13)!
        preferences.drawing.foregroundColor = UIColor.white
        preferences.drawing.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        preferences.drawing.arrowPosition = EasyTipView.ArrowPosition.top
        
        EasyTipView.globalPreferences = preferences
        
        
        
        if self.easyTipView == nil
        {
            self.easyTipView = EasyTipView(text: Global.shared.aPolticalExposedToolTip)
            self.easyTipView.show(animated: true, forView: sender as! UIView, withinSuperview: nil)
        }
        else
        {
            self.easyTipView.dismiss()
            self.easyTipView = nil
        }
    }
    
    
    @IBAction func areYoReltveToolTipActn(_ sender: Any) {
        var preferences = EasyTipView.Preferences()
               preferences.drawing.font = UIFont(name: "Futura-Medium", size: 13)!
               preferences.drawing.foregroundColor = UIColor.white
               preferences.drawing.backgroundColor = UIColor.black.withAlphaComponent(0.8)
               preferences.drawing.arrowPosition = EasyTipView.ArrowPosition.top
               
               EasyTipView.globalPreferences = preferences
               
               
               
               if self.easyTipView == nil
               {
                   self.easyTipView = EasyTipView(text: Global.shared.isPolticalExposedToolTip)
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
        
        let touch: UITouch? = touches.first
        if touch?.view != self.scrollVieww {
            
            if self.easyTipView == nil {
                print("nothing")
            }
            else {
                easyTipView.dismiss()
                self.easyTipView = nil
            }
        }
        
    }
    
   
    func civilIdDobValidation() {
           
        let paramaterPasing: [String:Any] = ["civilID":  NewUser.shared.identityId!,
                                                "dateOfBirth": self.dob]
           
           
           let headers: HTTPHeaders = [
               "Content-Type": "application/json"
           ]
           
           NetWorkDataManager.sharedInstance.civildDobValidationImplementation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
               
               if errorString == nil
               {
                   
                     // print(resonseTal)
                let statusMsg = resonseTal?.value(forKey: "statusMessage") as? String ?? ""
            let mesageCode = resonseTal?.value(forKey: "messageCode") as? String ?? statusMsg
                   if let statusCode = resonseTal?.value(forKey: "statusCodes") as? Int {
                       
                       print(statusCode)
                       if(statusCode == 200) {
                           
                        self.dobReLbl.isHidden = true
                           
                           
                       }
                           
                       else {
                        self.dobReLbl.text = resonseTal?.value(forKey: "statusMessage") as? String
                        self.dobReLbl.isHidden = false
                        
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
    
    
    
}

/*extension UIButton {
 open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
 super.touchesBegan(touches, with: event)
 
 next?.touchesBegan(touches, with: event)
 
 
 
 print("UIButton touchesBegan")
 }
 
 open override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
 super.touchesMoved(touches, with: event)
 
 next?.touchesMoved(touches, with: event)
 
 print("UIButton touchesMoved")
 
 }
 
 open override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
 super.touchesEnded(touches, with: event)
 
 next?.touchesEnded(touches, with: event)
 
 print("UIButton touchesEnded")
 
 }
 
 open override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
 super.touchesCancelled(touches, with: event)
 
 next?.touchesCancelled(touches, with: event)
 
 print("UIButton touchesCancelled")
 
 }
 
 open override func touchesEstimatedPropertiesUpdated(_ touches: Set<UITouch>) {
 super.touchesEstimatedPropertiesUpdated(touches)
 
 next?.touchesEstimatedPropertiesUpdated(touches)
 
 print("UIButton touchesEstimatedPropertiesUpdated")
 
 }
 }*/

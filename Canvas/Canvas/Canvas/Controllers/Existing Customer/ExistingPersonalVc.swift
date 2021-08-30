//
//  ExistingPersonalVc.swift
//  Canvas
//
//  Created by urmila reddy on 05/12/20.
//  Copyright © 2020 urmila reddy. All rights reserved.
//

import UIKit

class ExistingPersonalVc: UIViewController {
    
    
    @IBOutlet weak var pesnalDetlsLbl: UILabel!
    
    @IBOutlet weak var adresDetlsLbl: UILabel!
    
    
    
    @IBOutlet weak var tabLblTwo: UILabel!
    
    @IBOutlet weak var tabLblThree: UILabel!
    
    @IBOutlet weak var tabLblFour: UILabel!
    
      @IBOutlet weak var mainView: UIView!
        
        @IBOutlet weak var scrollVieww: UIScrollView!
        
        @IBOutlet weak var backgrndImg: UIImageView!
        
      
        
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
        var genderStr = ""
        var remiterCategryStr = "I"
        var politicalScope = Global.shared.acntPoliticalLocalTxt
        var areYouRelative = "no"
        var degreOfReltn = ""
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            self.tabLblTwo.layer.cornerRadius = self.tabLblTwo.frame.size.width / 2;
                   self.tabLblTwo.clipsToBounds = true
                   
                   self.tabLblThree.layer.cornerRadius = self.tabLblThree.frame.size.width / 2;
                   self.tabLblThree.clipsToBounds = true
                   
                   self.tabLblFour.layer.cornerRadius = self.tabLblFour.frame.size.width / 2;
                   self.tabLblFour.clipsToBounds = true
            
        //    relativeYesBtnOtlt.setImage(UIImage(named: "circleUnchecked"), for: .normal)
        //    relativeNoBtnOtlt.setImage(UIImage(named: "circleChecked"), for: .normal)
            firstNameField.isEnabled = false
            middleNameField.isEnabled = false
            lastNameField.isEnabled = false
            placeOfBirthField.isEnabled = false
            secndryEmailField.isEnabled = false
            flatAnswerField.isEnabled = false
            floorField.isEnabled = false
            buildingField.isEnabled = false
            gadaField.isEnabled = false
            streetField.isEnabled = false
            blockField.isEnabled = false
            areaCityField.isEnabled = false
            zipCodeField.isEnabled = false
            stateField.isEnabled = false
            pepPositionField.isEnabled = false
           
            
            self.countryAnswerLbl.text = "KUWAIT"
            NewUser.shared.country = "KW"
            
            
          //  self.countryDrpImg.image = UIImage(named: "KUWAIT")
            self.countryDrpImg.image = UIImage(named: "kw")
            
            areYouRelative = "no"
            
            adFifteenView.isHidden = true
            
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
            
            
            self.expandSecndView.isHidden = false
            self.expand2ViewHeightConstrt.constant = 950
      
            
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
            
          
            
            assignLabels()
          //  maleRadioBtnOtlt.setImage(UIImage(named: "circleUnchecked"), for: .normal)
            indiviRadioBtnOtlt.setImage(UIImage(named: "circleChecked"), for: .normal)
        }
        func assignLabels() {
            
            indiviRadioBtnOtlt.setImage(UIImage(named: "circleChecked"), for: .normal)
            politicalyExposedBtnOtlt.setImage(UIImage(named: "circleUnchecked"), for: .normal)
            
            
            adresDetlsLbl.text = Global.shared.addresDetlsLbl
            pesnalDetlsLbl.text = Global.shared.persnalDetlsLbl
           
            
            secndryEmailField.text = ""
                flatAnswerField.text = ExistingUser.shared.flat
            floorField.text = ExistingUser.shared.floor
            buildingField.text = ExistingUser.shared.building
            gadaField.text = ExistingUser.shared.gada
            streetField.text = ExistingUser.shared.street
            blockField.text = ExistingUser.shared.block
            areaCityField.text = ExistingUser.shared.city
            zipCodeField.text = ExistingUser.shared.postCode
            stateField.text = ExistingUser.shared.state
            pepPositionField.text = ExistingUser.shared.pepPosition
            
            let indexId = Global.shared.languageValues.firstIndex(of:  ExistingUser.shared.preferredLanguage)
            self.preferedLngAnswerLbl.text = Global.shared.languageNames[indexId ?? 0]
            
            
            let indexOne = Global.shared.salutationValues.firstIndex(of:  ExistingUser.shared.salutation)
            self.salutationAnswerLbl.text = Global.shared.salutationNames[indexOne ?? 0]
            
            let indexThree = Global.shared.residentValues.firstIndex(of:  ExistingUser.shared.residentType)
            self.residentAnswerLbl.text = Global.shared.residentNames[indexThree ?? 0]
            
            firstNameField.text = ExistingUser.shared.firstName
            middleNameField.text = ExistingUser.shared.middleName
            lastNameField.text = ExistingUser.shared.lastName
            dobValueLbl.text = ExistingUser.shared.dateOfBirth
            
            placeOfBirthField.text = ExistingUser.shared.placeOfBirth
            
            let indexTwo = Global.shared.countryCodesData.firstIndex(of:  ExistingUser.shared.nationality)
            self.nationalityField.text = Global.shared.countryNameData[indexTwo ?? 0]
            
            let indexFive = Global.shared.countryCodesData.firstIndex(of:  ExistingUser.shared.country)
            self.countryAnswerLbl.text = Global.shared.countryNameData[indexFive ?? 0]
            
          
            
            
            headerLbl.text = Global.shared.newCustomerHeader
            
            identityTabLbl.text = Global.shared.identityTabNameTxt
            personalTabLbl.text = Global.shared.personalTabNameTxt
            employmntTabLbl.text = Global.shared.employmentTabNameTxt
            remitanceTabLbl.text = Global.shared.remitanceTabNameTxt
            
          
                preferedLangQuestnLbl.text = Global.shared.preferLangTxt
           
                salutationLbl.text = Global.shared.persnalSalutatnTxt
           
                firstNameLbl.text = Global.shared.persnalFirstNameTxt
            
                middleNameLbl.text = Global.shared.persnalmiddleNameTxt
            
                lastNameLbl.text = Global.shared.persnalLastNameTxt
           
                nationalityLbl.text = Global.shared.persnalNationlityTxt
           
                dateOfBirthLbl.text = Global.shared.persnalDobTxt
           
                placeOfBLbl.text = Global.shared.persnalPobTxt
          
                secndryEmailLbl.text = Global.shared.persnalSecndryEmailTxt
           
            
           
                residentLbl.text = Global.shared.acntResidentTypeTxt
          
                flatLbl.text = Global.shared.acntFlatTxt
           
                floorLbl.text = Global.shared.acntFloorTxt
            
                buildingLbl.text = Global.shared.acntBuildingTxt
           
                gadaLbl.text = Global.shared.acntGadaTxt + "*"
           
                streetLbl.text = Global.shared.acntStreetTxt
            
                blockLbl.text = Global.shared.acntblockTxt
            
                areaCityLbl.text = Global.shared.acntAreaCityTxt
           
                zipcodeLbl.text = Global.shared.acntZipcodeTxt
          
                stateLbl.text = Global.shared.acntStateTxt
           
                countryLbl.text = Global.shared.acntCountryTxt + "*"
           
            genderLbl.text = Global.shared.persnalGenderTxt
            maleLbl.text = Global.shared.persnalMaleTxt
            femaleLbl.text = Global.shared.persnalFemaleTxt
            neutralLbl.text = Global.shared.persnalNeutralTxt
            
            
            remiterCatgryLbl.text = Global.shared.acntRemiterCategryTxt
            politicalScopeLbl.text = Global.shared.acntPoliticalScopeTxt
            areYouRelativeLbl.text = Global.shared.acntAreYouRelativeTxt
            degreeOfRltnshpLbl.text = Global.shared.acntDegreOfReltnSHipTxt
            individualLbl.text = Global.shared.acntRemitIndividualTxt
            
            politicalExposedLbl.text = Global.shared.acntRemitPoliticalTxt
            localLbl.text = Global.shared.acntPoliticalLocalTxt
            interntnalLbl.text = Global.shared.acntPoliticalInterntnlTxt
            relativeYesLbl.text = Global.shared.acntRelativeYesTxt
            relativeNoLbl.text = Global.shared.acntRelativeNoTxt
            closeLbl.text = Global.shared.acntDegreCloseTxt
            distantLbl.text = Global.shared.acntDegreDistantTxt
            neutralRadioLbl.text = Global.shared.acntDegreNeutralsTxt
            pepPositionLbl.text = Global.shared.pepPositionTxt
            
            
            nextBtnOtlt.setTitle(Global.shared.nxtBtnTxt, for: .normal)
            bckBtnOtlt.setTitle(Global.shared.backBtnTxt, for: .normal)
            
            
            
            
            genderStr =  ExistingUser.shared.gender
            if genderStr == "M" {
                maleRadioBtnOtlt.setImage(UIImage(named: "circleChecked"), for: .normal)
                femaleRadioBtnOtlt.setImage(UIImage(named: "circleUnchecked"), for: .normal)
            }
            else if genderStr == "F"{
                femaleRadioBtnOtlt.setImage(UIImage(named: "circleChecked"), for: .normal)
                maleRadioBtnOtlt.setImage(UIImage(named: "circleUnchecked"), for: .normal)
            }
            else  {
                femaleRadioBtnOtlt.setImage(UIImage(named: "circleUnchecked"), for: .normal)
                maleRadioBtnOtlt.setImage(UIImage(named: "circleUnchecked"), for: .normal)
            }
            remiterCategryStr = ExistingUser.shared.remitterCategory
            if  remiterCategryStr == "I" {
                indiviRadioBtnOtlt.setImage(UIImage(named: "circleChecked"), for: .normal)
                politicalyExposedBtnOtlt.setImage(UIImage(named: "circleUnchecked"), for: .normal)
            }
            else if remiterCategryStr == "P" {
                politicalyExposedBtnOtlt.setImage(UIImage(named: "circleChecked"), for: .normal)
                indiviRadioBtnOtlt.setImage(UIImage(named: "circleUnchecked"), for: .normal)
            }
            else {
                politicalyExposedBtnOtlt.setImage(UIImage(named: "circleUnchecked"), for: .normal)
                indiviRadioBtnOtlt.setImage(UIImage(named: "circleUnchecked"), for: .normal)
            }
            
            politicalScope = ExistingUser.shared.politicalScope
            if  politicalScope == Global.shared.acntPoliticalLocalTxt {
                localBtnOtlt.setImage(UIImage(named: "circleChecked"), for: .normal)
                interntnlBtnOtlt.setImage(UIImage(named: "circleUnchecked"), for: .normal)
            }
            else {
                interntnlBtnOtlt.setImage(UIImage(named: "circleChecked"), for: .normal)
                localBtnOtlt.setImage(UIImage(named: "circleUnchecked"), for: .normal)
            }
            
            areYouRelative = ExistingUser.shared.isPoliticallyExposed
            if  areYouRelative == "yes" {
                relativeYesBtnOtlt.setImage(UIImage(named: "circleChecked"), for: .normal)
                relativeNoBtnOtlt.setImage(UIImage(named: "circleUnchecked"), for: .normal)
            }
            else {
                relativeYesBtnOtlt.setImage(UIImage(named: "circleUnchecked"), for: .normal)
                relativeNoBtnOtlt.setImage(UIImage(named: "circleChecked"), for: .normal)
                areYouRelative = "no"
            }
          /*  degreOfReltn =  ExistingUser.shared.
            if  degreOfReltn == Global.shared.acntDegreCloseTxt {
                closeBtnOtlt.setImage(UIImage(named: "circleChecked"), for: .normal)
                distantBtnOtlt.setImage(UIImage(named: "circleUnchecked"), for: .normal)
                neutralBtnOtlt.setImage(UIImage(named: "circleUnchecked"), for: .normal)
                
                degreOfReltn = Global.shared.acntDegreCloseTxt
            } else if  degreOfReltn == Global.shared.acntDegreDistantTxt {
                closeBtnOtlt.setImage(UIImage(named: "circleUnchecked"), for: .normal)
                distantBtnOtlt.setImage(UIImage(named: "circleChecked"), for: .normal)
                neutralBtnOtlt.setImage(UIImage(named: "circleUnchecked"), for: .normal)
                
                degreOfReltn = Global.shared.acntDegreDistantTxt
            }
            else {
                closeBtnOtlt.setImage(UIImage(named: "circleUnchecked"), for: .normal)
                distantBtnOtlt.setImage(UIImage(named: "circleUnchecked"), for: .normal)
                neutralBtnOtlt.setImage(UIImage(named: "circleChecked"), for: .normal)
                
                degreOfReltn = Global.shared.acntDegreNeutralsTxt
            }*/
            
            closeBtnOtlt.setImage(UIImage(named: "circleUnchecked"), for: .normal)
            distantBtnOtlt.setImage(UIImage(named: "circleUnchecked"), for: .normal)
            neutralBtnOtlt.setImage(UIImage(named: "circleChecked"), for: .normal)
            
            degreOfReltn = Global.shared.acntDegreNeutralsTxt
            
            
            let indexM = Global.shared.languageValues.firstIndex(of:  ExistingUser.shared.preferredLanguage)
            if indexM != nil {
            self.preferedLngAnswerLbl.text = Global.shared.languageNames[indexM ?? 0]
            }
                else {
                    self.preferedLngAnswerLbl.text = Global.shared.languageNames[indexM ?? 0]
                    ExistingUser.shared.preferredLanguage = Global.shared.languageValues[0]
                }
            
            let indexN = Global.shared.salutationValues.firstIndex(of:  ExistingUser.shared.salutation)
            if indexN != nil {
                self.salutationAnswerLbl.text = Global.shared.salutationNames[indexN ?? 0]
               // ProfileDetails.shared.salutation = Global.shared.salutationValues[0]
            }
            else {
                self.salutationAnswerLbl.text = Global.shared.salutationNames[indexN ?? 0]
                ExistingUser.shared.salutation = Global.shared.salutationValues[0]
            }
            
            
            let indexO = Global.shared.countryCodesData.firstIndex(of:  ExistingUser.shared.nationality)
            if indexO != nil {
                self.nationalityField.text = Global.shared.countryNameData[indexO ?? 0]
                let img = Global.shared.countryCodesData[indexTwo ?? 0]
                
                
                self.nationalityDrpImg.image = UIImage(named: img.lowercased())
               // ProfileDetails.shared.salutation = Global.shared.salutationValues[0]
            }
            else {
                self.nationalityField.text = Global.shared.countryNameData[indexO ?? 0]
                ExistingUser.shared.nationality = Global.shared.countryCodesData[0]
            }
           
            
            let indexQ = Global.shared.residentValues.firstIndex(of:  ExistingUser.shared.residentType)
            if indexQ != nil {
                self.residentAnswerLbl.text = Global.shared.residentNames[indexQ ?? 0]
            }
            else {
                self.residentAnswerLbl.text = Global.shared.residentNames[indexQ ?? 0]
                ExistingUser.shared.residentType = Global.shared.residentValues[0]
            }
            
            
            let indexR = Global.shared.countryCodesData.firstIndex(of:  ExistingUser.shared.country)
            if indexR != nil {
                self.countryAnswerLbl.text = Global.shared.countryNameData[indexR ?? 0]
            }
            else {
                self.countryAnswerLbl.text = ""
                
            }
         
            
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
        
        //just testing
      self.pushViewController(controller: ExistingEmploymentVc.initiateController(),isGestureEnable: false, animated: false)
        
    }
        
        @IBAction func bckBtnActn(_ sender: Any) {
            self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
            self.navigationController?.popViewController(animated: false)
        }
        
        @IBAction func expand1Actn(_ sender: Any) {
            
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
         
        }
        
        
        @IBAction func femaleActn(_ sender: Any) {
        }
        
        
        @IBAction func neutralActn(_ sender: Any) {
          
        }
        
        
        @IBAction func individualBtnActn(_ sender: Any) {
           
        }
        
        @IBAction func politicalExpoBtnActn(_ sender: Any) {
          
        }
        
        
        @IBAction func localBtnActn(_ sender: Any) {
         
        }
        
        
        @IBAction func interntnlBtnActn(_ sender: Any) {
         
        }
        
        
        @IBAction func relativeYesBtnActn(_ sender: Any) {
           
        }
        
        
        @IBAction func relativeNoBtnActn(_ sender: Any) {
            
        }
        
        
        @IBAction func closeBtnActn(_ sender: Any) {
          
        }
        
        @IBAction func distantBtnActn(_ sender: Any) {
           
        }
        
        
        @IBAction func neutralBtnActn(_ sender: Any) {
        }
        
        
        @IBAction func preferedLangDrpDownActn(_ sender: Any) {
         
        }
        
        @IBAction func salutionDrpActn(_ sender: Any) {
           
            
        }
        
        @IBAction func residentDrpActn(_ sender: Any) {
           
        }
        
        
        @IBAction func placeOfBirthDrpActn(_ sender: Any) {
            
        }
        
        
        @IBAction func countryDrpBtnActn(_ sender: Any) {
        
            
        }
        
      
        
        
        @IBAction func nationalityDrpDwnActn(_ sender: Any) {
            
          
        }
        
        
        @IBAction func dobBtnActn(_ sender: Any) {
         
           
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


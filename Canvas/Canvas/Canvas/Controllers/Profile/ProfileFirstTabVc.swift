//
//  ProfileFirstTabVc.swift
//  Canvas
//
//  Created by urmila reddy on 07/11/20.
//  Copyright © 2020 urmila reddy. All rights reserved.
//

import UIKit
import Alamofire


class ProfileFirstTabVc: BaseViewController {
    
    @IBOutlet weak var identityTabLbl: UILabel!
    
    @IBOutlet weak var identityDetlsVieww: UIView!
    
    @IBOutlet weak var identyHeightConstrt: NSLayoutConstraint!
    
    //730
    @IBOutlet weak var persnlDetlsHeightConstrt: NSLayoutConstraint!
    
    @IBOutlet weak var adresHeightConstrt: NSLayoutConstraint!
    
    
    //470
    @IBOutlet weak var employmntDetlsHeightConstrt: NSLayoutConstraint!
    
    //280
    
    @IBOutlet weak var remitanceHeightConstrt: NSLayoutConstraint!
    //310
    
    @IBOutlet weak var trnsctnReltdHeigtConstrt: NSLayoutConstraint!
    
    
    
    @IBOutlet weak var profileDetailsView: UIView!
    
    
    
    
    
    
    @IBOutlet weak var identityTypeLbl: UILabel!
    @IBOutlet weak var identityFieldd: CustomTextField!
    
    
    @IBOutlet weak var civilIdLbl: UILabel!
    
    @IBOutlet weak var civilIdFieldd: CustomTextField!
    
    @IBOutlet weak var idIsueDateLbl: UILabel!
    
    @IBOutlet weak var idIsueDateField: CustomTextField!
    
    @IBOutlet weak var idExpireDateLbl: UILabel!
    
    
    @IBOutlet weak var idExpireDateField: CustomTextField!
    
    @IBOutlet weak var countryOfIsueLbl: UILabel!
    
    @IBOutlet weak var cntryOfIsueField: CustomTextField!
    
    @IBOutlet weak var placeOfIsueLbl: UILabel!
    
    @IBOutlet weak var placeOfIsueField: CustomTextField!
    
    
    @IBOutlet weak var mobileNumberLbl: UILabel!
    
    @IBOutlet weak var mobileNumbrField: CustomTextField!
    
    
    @IBOutlet weak var telephnNumbrLbl: UILabel!
    
    @IBOutlet weak var telpnNumbrField: CustomTextField!
    
    
    @IBOutlet weak var emailLbl: UILabel!
    
    @IBOutlet weak var emailFieldd: CustomTextField!
    
    
    
    //personal details outlets
    
    @IBOutlet weak var persnalDetlsTabLbl: UILabel!
    
    @IBOutlet weak var persnalDetlsExpandView: UIView!
    
    
    @IBOutlet weak var preferdLngLbl: UILabel!
    
    @IBOutlet weak var prefrdLangField: CustomTextField!
    
    @IBOutlet weak var residentTypeLbl: UILabel!
    
    @IBOutlet weak var residentField: CustomTextField!
    
    
    @IBOutlet weak var saluttionLbl: UILabel!
    
    @IBOutlet weak var salutnField: CustomTextField!
    
    @IBOutlet weak var firstNameLbl: UILabel!
    
    @IBOutlet weak var firstNameField: CustomTextField!
    
    @IBOutlet weak var middleNameLbl: UILabel!
    
    @IBOutlet weak var middleNameField: CustomTextField!
    
    
    @IBOutlet weak var lastNameLbl: UILabel!
    
    @IBOutlet weak var lastNameField: CustomTextField!
    
    @IBOutlet weak var dobLbl: UILabel!
    
    @IBOutlet weak var dobField: CustomTextField!
    
    @IBOutlet weak var placeOfBirthLbl: UILabel!
    
    @IBOutlet weak var placeOfBirthField: CustomTextField!
    
    
    @IBOutlet weak var nationalityLbl: UILabel!
    
    @IBOutlet weak var nationalityField: CustomTextField!
    
    @IBOutlet weak var genderLbl: UILabel!
    
    @IBOutlet weak var maleBtnOtlt: UIButton!
    
    @IBOutlet weak var maleField: UILabel!
    
    @IBOutlet weak var femaleBtnOtlt: UIButton!
    
    @IBOutlet weak var femaleField: UILabel!
    
    
    @IBOutlet weak var remiterCatgryLbl: UILabel!
    
    @IBOutlet weak var individualBtnOtlt: UIButton!
    
    @IBOutlet weak var individualTxt: UILabel!
    
    @IBOutlet weak var politcalExpsdBtnOtlt: UIButton!
    
    @IBOutlet weak var politiclExpsdLbl: UILabel!
    
    
    
    @IBOutlet weak var adresDetlsTabLbl: UILabel!
    
    @IBOutlet weak var adresExpandView: UIView!
    
    @IBOutlet weak var flatLbl: UILabel!
    
    @IBOutlet weak var flatField: CustomTextField!
    
    
    @IBOutlet weak var floorLbl: UILabel!
    
    @IBOutlet weak var floorField: CustomTextField!
    
    
    @IBOutlet weak var buildingLbl: UILabel!
    
    @IBOutlet weak var buildingField: CustomTextField!
    
    
    @IBOutlet weak var gadaLbl: UILabel!
    
    @IBOutlet weak var gadaField: CustomTextField!
    
    
    @IBOutlet weak var streetLbl: UILabel!
    
    @IBOutlet weak var streetField: CustomTextField!
    
    @IBOutlet weak var blockLbl: UILabel!
    @IBOutlet weak var blockField: CustomTextField!
    
    
    @IBOutlet weak var citylbl: UILabel!
    
    @IBOutlet weak var cityFiled: CustomTextField!
    
    @IBOutlet weak var stateLbl: UILabel!
    
    @IBOutlet weak var stateField: CustomTextField!
    
    @IBOutlet weak var countryLbl: UILabel!
    
    @IBOutlet weak var countryField: CustomTextField!
    
    @IBOutlet weak var postalCodeLbl: UILabel!
    
    @IBOutlet weak var postalCodeField: CustomTextField!
    
    
    @IBOutlet weak var secndryEmailLbl: UILabel!
    
    @IBOutlet weak var secndryEmailField: CustomTextField!
    
    
    
    
    @IBOutlet weak var employmntDetailsTab: UILabel!
    
    @IBOutlet weak var employmntDetlExpandView: UIView!
    
    
    @IBOutlet weak var employmntNameLbl: UILabel!
    
    @IBOutlet weak var emplyerNameField: CustomTextField!
    
    @IBOutlet weak var employmntLocatnLbl: UILabel!
    
    @IBOutlet weak var employmntLoctnField: CustomTextField!
    
    @IBOutlet weak var ocuptnLbl: UILabel!
    
    @IBOutlet weak var ocuptnField: CustomTextField!
    
    @IBOutlet weak var employIdLbl: UILabel!
    
    
    @IBOutlet weak var employIdField: CustomTextField!

    @IBOutlet weak var designtnLbl: UILabel!
    
    @IBOutlet weak var designtnField: CustomTextField!
    
    @IBOutlet weak var salaryLbl: UILabel!
    
    @IBOutlet weak var salryField: CustomTextField!
    
    @IBOutlet weak var otherIncomeLbl: UILabel!
    
    @IBOutlet weak var otherIncomeField: CustomTextField!
    
    
    
    
    @IBOutlet weak var remitanceDetlsTabLbl: UILabel!
    
    @IBOutlet weak var remiitanceExpndVieww: UIView!
    
    @IBOutlet weak var purposeOfTrnsferLbl: UILabel!
    
    @IBOutlet weak var purposeOfTrnsfrField: CustomTextField!
    
    @IBOutlet weak var typeOfServiceLbl: UILabel!
    
    @IBOutlet weak var typeOfServiceField: CustomTextField!
    
    
    @IBOutlet weak var sourceOfIncomeLbl: UILabel!
    
    @IBOutlet weak var sourceOfIncomeField: CustomTextField!
    
    @IBOutlet weak var avgYearlyIncomeLbl: UILabel!
    
    @IBOutlet weak var avgYearIncomeField: CustomTextField!
    
    
    
    
    
    @IBOutlet weak var trnsctnReltdDetlsTabLbl: UILabel!
    
    
    @IBOutlet weak var trnsctnnReltdDetlsExpandView: UIView!
    
    @IBOutlet weak var trnsctnCountPerLbl: UILabel!
    
    @IBOutlet weak var month1Lbl: UILabel!
    
    @IBOutlet weak var year1Lbl: UILabel!
    
    @IBOutlet weak var month1btnOtlt: UIButton!
    
    @IBOutlet weak var yearBtnOtlt: UIButton!
    
    
    
    
    
    @IBOutlet weak var trnsctnValuePerLbl: UILabel!
    @IBOutlet weak var month2BtnOtlt: UIButton!
    
    @IBOutlet weak var month2lbl: UILabel!
    
    
    @IBOutlet weak var yerar2BtnOtlt: UIButton!
    
    
    @IBOutlet weak var year2Lbl: UILabel!
    
    @IBOutlet weak var expctdTrnsctnCountLbl: UILabel!
    
    @IBOutlet weak var expctdTrnsctnField: CustomTextField!
    
    
    @IBOutlet weak var expctdTrnsctnValueLbl: UILabel!
    
    @IBOutlet weak var expctdtrnsctnValueField: CustomTextField!
    
    
    var expandOneClick = true
    var expandTwoClick = true
    var expandThreeClick = true
    var expandFourClick = true
    var expandFiveClick = true
    var expandSixClick = true
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if LocalizationSystem.sharedInstance.getLanguage() == "ar" {
            
            identityTabLbl.textAlignment = .right
            persnalDetlsTabLbl.textAlignment = .right
            adresDetlsTabLbl.textAlignment = .right
            employmntDetailsTab.textAlignment = .right
            remitanceDetlsTabLbl.textAlignment = .right
            trnsctnReltdDetlsTabLbl.textAlignment = .right
           
        }
        
        identityTabLbl.text = "  " + Global.shared.identityDetlsTxt
        persnalDetlsTabLbl.text = "  " + Global.shared.persnalDetlsLbl
        adresDetlsTabLbl.text = "  " + Global.shared.addresDetlsLbl
        employmntDetailsTab.text = "  " + Global.shared.employmntDetlsTxt
        remitanceDetlsTabLbl.text = "  " + Global.shared.remitanceDetlsLbl
        trnsctnReltdDetlsTabLbl.text = "  " + Global.shared.trnsctnReltdDetlsLbl
        
        
        
        // Do any additional setup after loading the view.
      //  self.showSpinner(onView: self.view)
    //    getProfileDetails()
    }
    override func viewWillAppear(_ animated: Bool) {
        
        self.showLoader()
        Global.shared.countrysChangeAccordingly = "Any"
        Global.shared.countris = Country.getCountries(Global.shared.countrisAll)
        getProfileDetails()
           super.viewWillAppear(animated)
           navigationController?.setNavigationBarHidden(true, animated: animated)
       }
    
    // Mark: For getting profile details
    func getProfileDetails() {
       // self.showSpinner(onView: self.view)
           let paramaterPasing: [String:Any] = [
               "registrationId": UserDefaults.standard.string(forKey: "registrationId")!
           ]
           
           let headers: HTTPHeaders = [.authorization(bearerToken: UserDefaults.standard.string(forKey: "token")!)]
           
           
           NetWorkDataManager.sharedInstance.profileDetailsImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
          
               if errorString == nil
               {
                
            //    self.removeSpinner()
                self.removeLoader()
                   print(resonseTal!)
                
                
                
                   if let statusCode = resonseTal?.value(forKey: "statusCodes") as? Int {
                       
                       print(statusCode)
                       if(statusCode == 200) {
                           
                           
                           ProfileDetails.shared.identityType = resonseTal?["identityType"] as? String ?? ""
                       //    let identityId = String(resonseTal?["identityId"] as? Int ?? 0)
                           ProfileDetails.shared.identityId = resonseTal?["identityId"] as? String ?? ""
                           ProfileDetails.shared.identityIssueDate = resonseTal?["idIssueDate"] as? String ?? ""
                           ProfileDetails.shared.identityExpireDate = resonseTal?["idExpiryDate"] as? String ?? ""
                           ProfileDetails.shared.identityCountryIsuue = resonseTal?["identityCountryIssue"] as? String ?? ""
                           ProfileDetails.shared.identityPlaceIsue = resonseTal?["identityPlaseIssue"] as? String ?? ""
                           ProfileDetails.shared.preferredLang = resonseTal?["preferredLanguage"] as? String ?? ""
                           
                          // let residentType = String(resonseTal?["residentType"] as? Int ?? 0)
                           ProfileDetails.shared.residentType = resonseTal?["residentType"] as? String ?? ""
                           ProfileDetails.shared.salutation = resonseTal?["salutation"] as? String ?? ""
                           ProfileDetails.shared.firstName = resonseTal?["firstName"] as? String ?? ""
                           ProfileDetails.shared.middleName = resonseTal?["middleName"] as? String ?? ""
                           ProfileDetails.shared.lastName = resonseTal?["lastName"] as? String ?? ""
                           ProfileDetails.shared.dob = resonseTal?["dateOfBirth"] as? String ?? ""
                           ProfileDetails.shared.placeOfBirth = resonseTal?["placeOfBirth"] as? String ?? ""
                           ProfileDetails.shared.nationality = resonseTal?["nationality"] as? String ?? ""
                           ProfileDetails.shared.flat = resonseTal?["flat"] as? String ?? ""
                           ProfileDetails.shared.floor = resonseTal?["floor"] as? String ?? ""
                           ProfileDetails.shared.building = resonseTal?["building"] as? String ?? ""
                           ProfileDetails.shared.gada = resonseTal?["gada"] as? String ?? ""
                           ProfileDetails.shared.street = resonseTal?["street"] as? String ?? ""
                           ProfileDetails.shared.block = resonseTal?["block"] as? String ?? ""
                           ProfileDetails.shared.city = resonseTal?["city"] as? String ?? ""
                           ProfileDetails.shared.state = resonseTal?["state"] as? String ?? ""
                           ProfileDetails.shared.country = resonseTal?["country"] as? String ?? ""
                           ProfileDetails.shared.mobile = resonseTal?["mobile"] as? String ?? ""
                           ProfileDetails.shared.telephone = resonseTal?["telephone"] as? String ?? ""
                        
                           
                           
                          ProfileDetails.shared.zipcode = resonseTal?["postCode"] as? String ?? ""
                           
                           ProfileDetails.shared.email = resonseTal?["emailId"] as? String ?? ""
                          // ProfileDetails.shared.secondryEmail = resonseTal?["idIssueDate"] as? String ?? ""
                           ProfileDetails.shared.gender = resonseTal?["gender"] as? String ?? ""
                           ProfileDetails.shared.remitterCategry = resonseTal?["remitterCategory"] as? String ?? ""
                           ProfileDetails.shared.politicalScope = resonseTal?["politicalScope"] as? String ?? ""
                           ProfileDetails.shared.pepPosition = resonseTal?["pepPosition"] as? String ?? ""
                           ProfileDetails.shared.isPoliticallyExposed = resonseTal?["isPoliticallyExposed"] as? String ?? ""
                           ProfileDetails.shared.relationshipPEP = resonseTal?["relationshipPEP"] as? String ?? ""
                           ProfileDetails.shared.occupation = resonseTal?["occupation"] as? String ?? ""
                           ProfileDetails.shared.employerName = resonseTal?["employerName"] as? String ?? ""
                        //   ProfileDetails.shared.employeeID = resonseTal?["mobile"] as? String ?? ""
                           ProfileDetails.shared.employLocation = resonseTal?["employerLocation"] as? String ?? ""
                           ProfileDetails.shared.designation = resonseTal?["designation"] as? String ?? ""
                           ProfileDetails.shared.salary = resonseTal?["salary"] as? String ?? ""
                           ProfileDetails.shared.otherIncome = resonseTal?["otherIncome"] as? String ?? ""
                           ProfileDetails.shared.serviceType = resonseTal?["typeOfService"] as? String ?? ""
                           ProfileDetails.shared.purpose = resonseTal?["purpose"] as? String ?? ""
                          
                           ProfileDetails.shared.incomeSource = resonseTal?["sourceOfIncome"] as? String ?? ""
                           ProfileDetails.shared.averageIncome = resonseTal?["averageYearIncome"] as? String ?? ""
                           
                        ProfileDetails.shared.CountOfExpectedTxn = resonseTal?["countOfExpectedTxn"] as? String ?? ""
                        ProfileDetails.shared.CountOfExpectedTxnMY = resonseTal?["countOfExpectedTxn_MY"] as? String ?? ""
                            
                           ProfileDetails.shared.ValueForExpectedTxn = resonseTal?["valueForExpectedTxn"] as? String ?? ""
                           ProfileDetails.shared.ValueForExpectedTxnMY = resonseTal?["valueForExpectedTxn_MY"] as? String ?? ""
                        DispatchQueue.main.async {
                            self.assigningLabels()
                        }
                           
                       }
                    if statusCode == 400
                    {
                        let alert = ViewControllerManager.displayAlert(message: resonseTal?["statusMessage"] as? String ?? "", title:APPLICATIONNAME)
                        self.present(alert, animated: true, completion: nil)
                    }
                       
                    
                   }
                   
                   self.removeSpinner()
               }
                   
                   
               else
               {
                               print(errorString!)
                self.removeLoader()
                               self.removeSpinner()
                           
                               if errorString == "Response could not be serialized, input data was nil or zero length." {
                                Global.shared.timeoUtOrNot = "no"
                                self.showAlertForTimer(titulo: "", mensagem: Global.shared.sessionTimedOutTxt, vc: self)
//                                   let refreshAlert = UIAlertController(title: "", message: Global.shared.sessionTimedOutTxt, preferredStyle: UIAlertController.Style.alert)
//                                   refreshAlert.view.tintColor = ColorCodes.newAppRed
//                                   refreshAlert.addAction(UIAlertAction(title: Global.shared.okTxt, style: .default, handler: { (action: UIAlertAction!) in
//                                      self.pushViewController(controller: LoginVc.initiateController())
//                                   }))
//
//                                   self.present(refreshAlert, animated: true, completion: nil)
                               }
                               
                               else {
                                   let alert = ViewControllerManager.displayAlert(message: errorString ?? "", title:APPLICATIONNAME)
                                   self.present(alert, animated: true, completion: nil)
                               }
                              
                               
                           }

               
           }
       }
    var identityIsuue = ""
    var identityExpire = ""
    
    var idNumberMinLength = 5
    
    var dob = ""
       //  var genderStr = Global.shared.persnalMaleTxt
       var genderStr = "M"
    
       var remiterCategryStr = "I"
    
       var politicalScope = Global.shared.acntPoliticalLocalTxt
       var areYouRelative = "no"
       var degreOfReltn = ""
    
    var countMy = ""
    var valueMy = ""
    func assigningLabels() {
        
        let formatter = DateFormatter()
        let todaysDate = NSDate()
        formatter.dateFormat = "dd/MM/yyyy"
        let idExpiredt = formatter.date(from: ProfileDetails.shared.identityExpireDate)
        self.idExpireDateField.text = formatter.string(from: idExpiredt ?? todaysDate as Date)
        formatter.dateFormat = "yyyy-MM-dd"
        self.identityExpire = formatter.string(from: idExpiredt ?? todaysDate as Date)
        
        
        formatter.dateFormat = "dd/MM/yyyy"
        let idIssueDt = formatter.date(from: ProfileDetails.shared.identityIssueDate)
        self.idIsueDateField.text = formatter.string(from: idIssueDt ?? todaysDate as Date)
        formatter.dateFormat = "yyyy-MM-dd"
        self.identityIsuue = formatter.string(from: idIssueDt ?? todaysDate as Date)
        
        
        let indexId = Global.shared.identityTypes.firstIndex(of:  ProfileDetails.shared.identityType)
        if indexId != nil{
           self.identityFieldd.text = Global.shared.civilIdNames[indexId ?? 0]
        }
        
        let indexThree = Global.shared.countryCodesData.firstIndex(of:  ProfileDetails.shared.identityCountryIsuue)
        if indexThree != nil {
            self.cntryOfIsueField.text = Global.shared.countryNameData[indexThree ?? 0]
            
        }
        else {
            self.cntryOfIsueField.text = ""
        }
        
      
        civilIdFieldd.text = ProfileDetails.shared.identityId ?? ""
       
        
        placeOfIsueField.text = ProfileDetails.shared.identityPlaceIsue ?? ""
        
        
        
        //  countryOfAnswerLbl.text = "KUWAIT"
        
        mobileNumbrField.text = ProfileDetails.shared.mobile
        telpnNumbrField.text = ProfileDetails.shared.telephone
        emailFieldd.text = ProfileDetails.shared.email
        
        
        identityTypeLbl.text = Global.shared.newCidentityTypeTxt
        civilIdLbl.text = Global.shared.newCidentityNumberTxt
        idIsueDateLbl.text = Global.shared.newCIdIssueDateTxt
        idExpireDateLbl.text = Global.shared.newCIdExpiryDateTxt
        countryOfIsueLbl.text = Global.shared.newCCountryOfIsueTxt
        placeOfIsueLbl.text = Global.shared.newCPlaceOfIsueTxt
        mobileNumberLbl.text = Global.shared.persnalMobileNumberTxt
        telephnNumbrLbl.text = Global.shared.persnalTelephnTxt
        emailLbl.text = Global.shared.persnalEmailIdTxt
        
        
        
        
        let formatterM = DateFormatter()
        let todaysDateM = NSDate()
        formatterM.dateFormat = "dd/MM/yyyy"
        let dateOfb = formatterM.date(from: ProfileDetails.shared.dob)
        self.dobField.text = formatterM.string(from: dateOfb ?? todaysDateM as Date)
        formatter.dateFormat = "yyyy-MM-dd"
        self.dob = formatter.string(from: dateOfb ?? todaysDateM as Date)
        
        genderStr =  ProfileDetails.shared.gender
        if genderStr == "M" {
            maleBtnOtlt.setImage(UIImage(named: "circleChecked"), for: .normal)
            femaleBtnOtlt.setImage(UIImage(named: "circleUnchecked"), for: .normal)
        }
        else if genderStr == "F"{
            femaleBtnOtlt.setImage(UIImage(named: "circleChecked"), for: .normal)
            maleBtnOtlt.setImage(UIImage(named: "circleUnchecked"), for: .normal)
        }
        else  {
            femaleBtnOtlt.setImage(UIImage(named: "circleUnchecked"), for: .normal)
            maleBtnOtlt.setImage(UIImage(named: "circleUnchecked"), for: .normal)
        }
        remiterCategryStr = ProfileDetails.shared.remitterCategry
        if  remiterCategryStr == "I" {
            individualBtnOtlt.setImage(UIImage(named: "circleChecked"), for: .normal)
            politcalExpsdBtnOtlt.setImage(UIImage(named: "circleUnchecked"), for: .normal)
        }
        else if remiterCategryStr == "P" {
            politcalExpsdBtnOtlt.setImage(UIImage(named: "circleChecked"), for: .normal)
            individualBtnOtlt.setImage(UIImage(named: "circleUnchecked"), for: .normal)
        }
        else {
            politcalExpsdBtnOtlt.setImage(UIImage(named: "circleUnchecked"), for: .normal)
            individualBtnOtlt.setImage(UIImage(named: "circleUnchecked"), for: .normal)
        }
        
       
        let indexIdA = Global.shared.languageValues.firstIndex(of:  ProfileDetails.shared.preferredLang)
        if indexIdA != nil {
            self.prefrdLangField.text = Global.shared.languageNames[indexIdA ?? 0]
        }
        else {
            self.prefrdLangField.text = Global.shared.languageNames[0]
            ProfileDetails.shared.preferredLang = Global.shared.languageValues[0]
        }
        
        let indexOne = Global.shared.salutationValues.firstIndex(of:  ProfileDetails.shared.salutation)
        if indexOne != nil {
            self.salutnField.text = Global.shared.salutationNames[indexOne ?? 0]
           // ProfileDetails.shared.salutation = Global.shared.salutationValues[0]
        }
        else {
            self.salutnField.text = Global.shared.salutationNames[indexOne ?? 0]
            ProfileDetails.shared.salutation = Global.shared.salutationValues[0]
        }
        
        
        let indexTwo = Global.shared.countryCodesData.firstIndex(of:  ProfileDetails.shared.nationality)
        if indexTwo != nil {
            self.nationalityField.text = Global.shared.countryNameData[indexTwo ?? 0]
           // let img = Global.shared.countryCodesData[indexTwo ?? 0]
            
            
         
           // ProfileDetails.shared.salutation = Global.shared.salutationValues[0]
        }
        else {
            self.nationalityField.text = Global.shared.countryNameData[0]
            ProfileDetails.shared.nationality = Global.shared.countryCodesData[0]
        }
       
        
        let indexThreeM = Global.shared.residentValues.firstIndex(of:  ProfileDetails.shared.residentType)
        if indexThreeM != nil {
            self.residentField.text = Global.shared.residentNames[indexThreeM ?? 0]
        }
        else {
            self.residentField.text = Global.shared.residentNames[indexThreeM ?? 0]
            ProfileDetails.shared.residentType = Global.shared.residentValues[0]
        }
        
        
        let indexFourA = Global.shared.countryCodesData.firstIndex(of:  ProfileDetails.shared.country)
        if indexFourA != nil {
            self.countryField.text = Global.shared.countryNameData[indexFourA ?? 0]
        }
        else {
            self.countryField.text = ""
            
        }
        
        
        
        firstNameField.text = ProfileDetails.shared.firstName ?? ""
        middleNameField.text = ProfileDetails.shared.middleName ?? ""
        lastNameField.text = ProfileDetails.shared.lastName ?? ""
        placeOfBirthField.text = ProfileDetails.shared.placeOfBirth ?? ""
        
       // let indexG = Global.shared.countryNameData.firstIndex(of: ProfileDetails.shared.placeOfBirth)

                       //  let countryCodeD = Global.shared.countryCodesData[indexG ?? 0]
                                   //  self.placeOfBirthImg.image = UIImage(named: dropDisplay)
     
        
        secndryEmailField.text = ProfileDetails.shared.secondryEmail ?? ""
        flatField.text = ProfileDetails.shared.flat ?? ""
        floorField.text = ProfileDetails.shared.floor ?? ""
        buildingField.text = ProfileDetails.shared.building ?? ""
        gadaField.text = ProfileDetails.shared.gada ?? ""
        streetField.text = ProfileDetails.shared.street ?? ""
        blockField.text = ProfileDetails.shared.block ?? ""
        cityFiled.text = ProfileDetails.shared.city ?? ""
        postalCodeField.text = ProfileDetails.shared.zipcode ?? ""
        stateField.text = ProfileDetails.shared.state ?? ""
       
        preferdLngLbl.text = Global.shared.preferLangTxt
        saluttionLbl.text = Global.shared.persnalSalutatnTxt
        firstNameLbl.text = Global.shared.persnalFirstNameTxt
        middleNameLbl.text = Global.shared.persnalmiddleNameTxt
        lastNameLbl.text = Global.shared.persnalLastNameTxt
        nationalityLbl.text = Global.shared.persnalNationlityTxt
        dobLbl.text = Global.shared.persnalDobTxt
        placeOfBirthLbl.text = Global.shared.persnalPobTxt
        secndryEmailLbl.text = Global.shared.persnalSecndryEmailTxt
        residentTypeLbl.text = Global.shared.acntResidentTypeTxt
        flatLbl.text = Global.shared.acntFlatTxt
        floorLbl.text = Global.shared.acntFloorTxt
        buildingLbl.text = Global.shared.acntBuildingTxt
        gadaLbl.text = Global.shared.acntGadaTxt
        streetLbl.text = Global.shared.acntStreetTxt
        blockLbl.text = Global.shared.acntblockTxt
        citylbl.text = Global.shared.acntAreaCityTxt
        postalCodeLbl.text = Global.shared.acntZipcodeTxt
        stateLbl.text = Global.shared.acntStateTxt
        countryLbl.text = Global.shared.acntCountryTxt
        
        genderLbl.text = Global.shared.persnalGenderTxt
        maleField.text = Global.shared.persnalMaleTxt
        femaleField.text = Global.shared.persnalFemaleTxt
       
        
        
        remiterCatgryLbl.text = Global.shared.acntRemiterCategryTxt
        individualTxt.text = Global.shared.acntRemitIndividualTxt
        politiclExpsdLbl.text = Global.shared.acntPoliticalScopeTxt
        
        self.ocuptnField.text = ProfileDetails.shared.occupation ?? ""
        
        
        
        emplyerNameField.text = ProfileDetails.shared.employerName ?? ""
        employIdField.text = ProfileDetails.shared.employeeID ?? ""
        employmntLoctnField.text = ProfileDetails.shared.employLocation ?? ""
        designtnField.text = ProfileDetails.shared.designation ?? ""
        salryField.text = ProfileDetails.shared.salary ?? ""
        otherIncomeField.text = ProfileDetails.shared.otherIncome ?? ""
        
        ocuptnLbl.text = Global.shared.ocuptnTxt
        employmntNameLbl.text = Global.shared.employNameTxt
        employIdLbl.text = Global.shared.employeIdTxt
        employmntLocatnLbl.text = Global.shared.employLoctn
        designtnLbl.text = Global.shared.designtnTxt
        salaryLbl.text = Global.shared.salaryEmploy
        otherIncomeLbl.text = Global.shared.otherIncome
        
        
        
        countMy =  ProfileDetails.shared.CountOfExpectedTxnMY ?? Global.shared.expectedTxnTypesValues[0]
        if countMy == Global.shared.expectedTxnTypesValues[0] {
            month1btnOtlt.setImage(UIImage(named: "circleChecked"), for: .normal)
            yearBtnOtlt.setImage(UIImage(named: "circleUnchecked"), for: .normal)
            countMy = Global.shared.expectedTxnTypesValues[0]
        }
        else if countMy == Global.shared.expectedTxnTypesValues[1]{
            yearBtnOtlt.setImage(UIImage(named: "circleChecked"), for: .normal)
            month1btnOtlt.setImage(UIImage(named: "circleUnchecked"), for: .normal)
            
        }
        else {
            yearBtnOtlt.setImage(UIImage(named: "circleUnchecked"), for: .normal)
            month1btnOtlt.setImage(UIImage(named: "circleUnchecked"), for: .normal)
        }
        
        
        valueMy =  ProfileDetails.shared.ValueForExpectedTxnMY ?? Global.shared.expectedTxnTypesValues[0]
        if valueMy == Global.shared.expectedTxnTypesValues[0] {
            month2BtnOtlt.setImage(UIImage(named: "circleChecked"), for: .normal)
            yerar2BtnOtlt.setImage(UIImage(named: "circleUnchecked"), for: .normal)
            valueMy = Global.shared.expectedTxnTypesValues[0]
        }
        else if valueMy == Global.shared.expectedTxnTypesValues[1] {
            yerar2BtnOtlt.setImage(UIImage(named: "circleChecked"), for: .normal)
            month2BtnOtlt.setImage(UIImage(named: "circleUnchecked"), for: .normal)
            valueMy = Global.shared.expectedTxnTypesValues[1]
        }
        else  {
            yerar2BtnOtlt.setImage(UIImage(named: "circleUnchecked"), for: .normal)
            month2BtnOtlt.setImage(UIImage(named: "circleUnchecked"), for: .normal)
            
        }
        
        
        
        let indexGa = Global.shared.typeServiceValues.firstIndex(of:  ProfileDetails.shared.serviceType)
        if indexGa != nil {
            self.typeOfServiceField.text = Global.shared.typeServiceNames[indexGa ?? 0]
        }
        else {
            self.typeOfServiceField.text = ""
         //   ProfileDetails.shared.serviceType =  Global.shared.typeServiceValues[0]
        }
       
        
        let indexP = Global.shared.purposeTransferValues.firstIndex(of:  ProfileDetails.shared.purpose)
        if indexP != nil {
            self.purposeOfTrnsfrField.text = Global.shared.purposeTransferNames[indexP ?? 0]
        }
        else {
            self.purposeOfTrnsfrField.text = ""
          //  ProfileDetails.shared.purpose =  Global.shared.purposeTransferValues[0]
        }
       
        
        let indexQ = Global.shared.sourceIncomeValues.firstIndex(of:  ProfileDetails.shared.incomeSource)
        if indexQ != nil {
            self.sourceOfIncomeField.text = Global.shared.sourceIncomeNames[indexQ ?? 0]
        }
        else {
            self.sourceOfIncomeField.text = ""
         //   ProfileDetails.shared.incomeSource = Global.shared.sourceIncomeValues[0]
        }
       
       
        
        
        avgYearIncomeField.text = ProfileDetails.shared.averageIncome ?? ""
        expctdTrnsctnField.text = ProfileDetails.shared.CountOfExpectedTxn ?? ""
        expctdtrnsctnValueField.text = ProfileDetails.shared.ValueForExpectedTxn ?? ""
       
        purposeOfTrnsferLbl.text = Global.shared.remitPurposeTransferTxt
        typeOfServiceLbl.text = Global.shared.remitTypeOfServiceTxt
        sourceOfIncomeLbl.text = Global.shared.remitSourceOfIncomeTxt
        avgYearlyIncomeLbl.text = Global.shared.remitAvgYearlyIncomeTxt
        expctdTrnsctnCountLbl.text = Global.shared.transExpectedCount
        expctdTrnsctnValueLbl.text = Global.shared.transExpectedValue
        
        trnsctnCountPerLbl.text = Global.shared.transExpectedCountMy
        trnsctnValuePerLbl.text = Global.shared.transExpectedValueMy
        
        month1Lbl.text = Global.shared.expectedTxnTypesNames[0]
        year1Lbl.text = Global.shared.expectedTxnTypesNames[1]
        
        month2lbl.text = Global.shared.expectedTxnTypesNames[0]
        year2Lbl.text = Global.shared.expectedTxnTypesNames[1]
    }
    
    
    
    @IBAction func firstExpandActn(_ sender: Any) {
        if(expandOneClick == true) {
            
            self.identityDetlsVieww.isHidden = false
            self.identyHeightConstrt.constant = 600
            
        } else {
            self.identityDetlsVieww.isHidden = true
            self.identyHeightConstrt.constant = 0
            
        }
        
        expandOneClick = !expandOneClick
    }
    
    @IBAction func secndExpandActn(_ sender: Any) {
        if(expandTwoClick == true) {
            
            self.persnalDetlsExpandView.isHidden = false
            self.persnlDetlsHeightConstrt.constant = 730
            
        } else {
            self.persnalDetlsExpandView.isHidden = true
            self.persnlDetlsHeightConstrt.constant = 0
            
        }
        
        expandTwoClick = !expandTwoClick
    }
    
    @IBAction func thirdExpndActn(_ sender: Any) {
        if(expandThreeClick == true) {
            
            self.adresExpandView.isHidden = false
            self.adresHeightConstrt.constant = 730
            
        } else {
            self.adresExpandView.isHidden = true
            self.adresHeightConstrt.constant = 0
            
        }
        
        expandThreeClick = !expandThreeClick
    }
    
    
    @IBAction func fourthExpndActn(_ sender: Any) {
        if(expandFourClick == true) {
            
            self.employmntDetlExpandView.isHidden = false
            self.employmntDetlsHeightConstrt.constant = 475
            
        } else {
            self.employmntDetlExpandView.isHidden = true
            self.employmntDetlsHeightConstrt.constant = 0
            
        }
        
        expandFourClick = !expandFourClick
    }
    
    
    @IBAction func fifthExpandActn(_ sender: Any) {
        if(expandFiveClick == true) {
            
            self.remiitanceExpndVieww.isHidden = false
            self.remitanceHeightConstrt.constant = 280
            
        } else {
            self.remiitanceExpndVieww.isHidden = true
            self.remitanceHeightConstrt.constant = 0
            
        }
        
        expandFiveClick = !expandFiveClick
    }
    
    @IBAction func sixthBtnActn(_ sender: Any) {
        if(expandSixClick == true) {
            
            self.trnsctnnReltdDetlsExpandView.isHidden = false
            self.trnsctnReltdHeigtConstrt.constant = 310
            
        } else {
            self.trnsctnnReltdDetlsExpandView.isHidden = true
            self.trnsctnReltdHeigtConstrt.constant = 0
            
        }
        
        expandSixClick = !expandSixClick
    }
 
    
}

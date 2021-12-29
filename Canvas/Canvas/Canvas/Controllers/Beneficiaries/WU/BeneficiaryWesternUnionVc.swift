//
//  BeneficiaryWesternUnionVc.swift
//  Canvas
//
//  Created by urmila reddy on 27/08/20.
//  Copyright © 2020 urmila reddy. All rights reserved.
//

import UIKit
import Alamofire

class BeneficiaryWesternUnionVc: UIViewController, UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIPopoverControllerDelegate, UIDropDownCountryDelegateM {
    
 
    
    @IBOutlet weak var submitBtnOtlt: UIButton!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var firstView: UIView!
    
    @IBOutlet weak var firstName: UILabel!
    
    @IBOutlet weak var firstField: CustomTextField!
    
    @IBOutlet weak var secondView: UIView!
    
    @IBOutlet weak var lastName: UILabel!
    
    @IBOutlet weak var lastField: CustomTextField!
    
    @IBOutlet weak var thirdView: UIView!
    
    @IBOutlet weak var middleName: UILabel!
    
    @IBOutlet weak var middleField: CustomTextField!
    
    @IBOutlet weak var sixthView: UIView!
    
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var cityField: UITextField!
    
    @IBOutlet weak var seventhView: UIView!
    
    @IBOutlet weak var stateLbl: UILabel!
    
    @IBOutlet weak var stateField: UITextField!
    
    
    @IBOutlet weak var ninthView: UIView!
    
    @IBOutlet weak var countryLbl: UILabel!
    
    @IBOutlet weak var countryField: UILabel!
    
    
    @IBOutlet weak var tenthView: UIView!
    
    @IBOutlet weak var currencyLbl: UILabel!
    
    @IBOutlet weak var curencyField: UITextField!
    
    @IBOutlet weak var expandOneView: UIView!
    
    
    @IBOutlet weak var firstNameReqLbl: UILabel!
    
    @IBOutlet weak var lastNameReqLbl: UILabel!
    
    @IBOutlet weak var middleNameReqLbl: UILabel!
    
    @IBOutlet weak var cityReqLbl: UILabel!
    
    @IBOutlet weak var stateReqLbl: UILabel!
    
    
    @IBOutlet weak var countryReqLbl: UILabel!
    
    @IBOutlet weak var currencyReqLbl: UILabel!
    
    @IBOutlet weak var stateBtnOtlt: UIButton!
    
    
    @IBOutlet weak var cityBtnOtlt: UIButton!
    
    
    @IBOutlet weak var profileImg: UIImageView!
    
    
    @IBOutlet weak var countryDrpImg: UIImageView!
    
    
    
    var pickerImg:UIImagePickerController?=UIImagePickerController()
       
       var imgeXX:String = ""
       
       var popover:UIPopoverController?=nil
    
    
    var countryCodeSelected = ""
    var stateSelected = ""
    var citySelected = ""
    
    
    var stateNameData = [String]()
    var stateCodeData = [String]()
    
    var cityNameData = [String]()
    var cityCodeData = [String]()
    
    var pickerResponseStateData = [[String: String]]()
    var pickerResponseCityData = [[String: String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        firstNameReqLbl.font = Global.shared.fontReqLbl
        firstNameReqLbl.textColor = ColorCodes.newAppRed
        
        lastNameReqLbl.font = Global.shared.fontReqLbl
        lastNameReqLbl.textColor = ColorCodes.newAppRed
        
        middleNameReqLbl.font = Global.shared.fontReqLbl
        middleNameReqLbl.textColor = ColorCodes.newAppRed
        
        cityReqLbl.font = Global.shared.fontReqLbl
        cityReqLbl.textColor = ColorCodes.newAppRed
        
        stateReqLbl.font = Global.shared.fontReqLbl
        stateReqLbl.textColor = ColorCodes.newAppRed
        
        countryReqLbl.font = Global.shared.fontReqLbl
        countryReqLbl.textColor = ColorCodes.newAppRed
        
        currencyReqLbl.font = Global.shared.fontReqLbl
        currencyReqLbl.textColor = ColorCodes.newAppRed
        
        
        
         profileImg.setRounded()
        pickerImg!.delegate=self as UIImagePickerControllerDelegate & UINavigationControllerDelegate
               imageGesture()
        
        firstField.delegate = self
        lastField.delegate = self
        middleField.delegate = self
        cityField.delegate = self
        stateField.delegate = self
        
        firstView.layer.cornerRadius = 5
        secondView.layer.cornerRadius = 5
        thirdView.layer.cornerRadius = 5
        sixthView.layer.cornerRadius = 5
        seventhView.layer.cornerRadius = 5
        ninthView.layer.cornerRadius = 5
        tenthView.layer.cornerRadius = 5
        submitBtnOtlt.layer.cornerRadius = 5
        
        self.stateField.isUserInteractionEnabled = true
        self.stateBtnOtlt.isHidden = true
        self.cityField.isUserInteractionEnabled = true
        self.cityBtnOtlt.isHidden = true
        
        assigingLabels()
    }
    
    func assigingLabels() {
        submitBtnOtlt.setTitle(Global.shared.submitBtnTxt, for: .normal)
       
        if BeneficiaryDetails.shared.wu_FirstName_is_required == true {
            firstName.text = Global.shared.firstNameb + "*"
        }
        else {
            firstName.text = Global.shared.firstNameb
        }
        if BeneficiaryDetails.shared.wu_LastName_is_required == true {
            lastName.text = Global.shared.lastNameb + "*"
        }
        else {
            lastName.text = Global.shared.lastNameb
        }
        if BeneficiaryDetails.shared.wu_MiddleName_is_required == true {
            middleName.text = Global.shared.middleNameb + "*"
        }
        else {
            middleName.text = Global.shared.middleNameb
        }
        if BeneficiaryDetails.shared.wu_City_is_required == true {
            cityLabel.text = Global.shared.cityb + "*"
        }
        else {
            cityLabel.text = Global.shared.cityb
        }
        if BeneficiaryDetails.shared.wu_State_is_required == true {
            stateLbl.text = Global.shared.stateb + "*"
        }
        else {
            stateLbl.text = Global.shared.stateb
        }
        if BeneficiaryDetails.shared.wu_Country_is_required == true {
            countryLbl.text = Global.shared.countryb + "*"
        }
        else {
            countryLbl.text = Global.shared.countryb
        }
        if BeneficiaryDetails.shared.wu_Currency_is_required == true {
            currencyLbl.text = Global.shared.currencyb + "*"
        }
        else {
            currencyLbl.text = Global.shared.currencyb
        }
      
        firstNameReqLbl.text = Global.shared.firstNameb + " " + Global.shared.errorTxtRequired.lowercased()
        lastNameReqLbl.text =  Global.shared.lastNameb + " " + Global.shared.errorTxtRequired.lowercased()
        middleNameReqLbl.text =  Global.shared.middleNameb + " " + Global.shared.errorTxtRequired.lowercased()
        cityReqLbl.text = Global.shared.cityb + " " + Global.shared.errorTxtRequired.lowercased()
        stateReqLbl.text = Global.shared.stateb + " " + Global.shared.errorTxtRequired.lowercased()
        countryReqLbl.text = Global.shared.countryb + " " + Global.shared.errorTxtRequired.lowercased()
        currencyReqLbl.text = Global.shared.currencyb + " " + Global.shared.errorTxtRequired.lowercased()
       
        
        firstField.maxLength = BeneficiaryDetails.shared.wu_FirstName_max_length
        lastField.maxLength = BeneficiaryDetails.shared.wu_LastName_max_length
        middleField.maxLength = BeneficiaryDetails.shared.wu_MiddleName_max_length
        
        firstField.keyboardType = .asciiCapable
        lastField.keyboardType = .asciiCapable
        middleField.keyboardType = .asciiCapable
        
        firstField.valueType = Global.shared.getFieldType(text: BeneficiaryDetails.shared.wu_FirstName_field_accept)
        lastField.valueType = Global.shared.getFieldType(text: BeneficiaryDetails.shared.wu_LastName_field_accept)
        middleField.valueType = Global.shared.getFieldType(text: BeneficiaryDetails.shared.wu_MiddleName_field_accept)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    
   
    
    @IBAction func submitBtnActn(_ sender: Any) {
        
        
        self.showSpinner(onView: self.view)
        if BeneficiaryDetails.shared.wu_FirstName_is_required == true && firstField.text == "" {
            firstNameReqLbl.isHidden = false
            self.removeSpinner()
        }
        else if BeneficiaryDetails.shared.wu_LastName_is_required == true && lastField.text == "" {
            lastNameReqLbl.isHidden = false
            self.removeSpinner()
        }
        else  if BeneficiaryDetails.shared.wu_MiddleName_is_required == true && middleField.text == "" {
            middleNameReqLbl.isHidden = false
            self.removeSpinner()
        }
        else  if BeneficiaryDetails.shared.wu_City_is_required == true && cityField.text == "" {
            cityReqLbl.isHidden = false
            self.removeSpinner()
        }
        else  if BeneficiaryDetails.shared.wu_State_is_required == true && stateField.text == "" {
            stateReqLbl.isHidden = false
            self.removeSpinner()
        }
        else  if BeneficiaryDetails.shared.wu_Country_is_required == true && countryField.text == "" {
            countryReqLbl.isHidden = false
            self.removeSpinner()
        }
        else  if BeneficiaryDetails.shared.wu_Currency_is_required == true && curencyField.text == "" {
            currencyReqLbl.isHidden = false
            self.removeSpinner()
        }
        else {
            self.submitBtnOtlt.isEnabled = false
            generateOTP()
        }
        
    }
    
    
  /*  @IBAction func countryDrpDwnActn(_ sender: Any) {
        
        let pickerData = Global.shared.pickerResponseCountryData
        PickerDialog().show(title: "", options: pickerData , selected: "") {
            (value) -> Void in
            self.countryField.text = "\(value)"
            let indexS = Global.shared.countryNameData.firstIndex(of: "\(value)")
            self.countryCodeSelected   = Global.shared.countryCodesData[indexS ?? 0]
            self.curencyField.text = Global.shared.currencyCodesData[indexS ?? 0]
            
            self.countryReqLbl.isHidden = true
            self.currencyReqLbl.isHidden = true
            
            
            self.stateSelected = ""
            self.citySelected = ""
            self.stateField.text = ""
            self.cityField.text = ""
            
            self.downloadStateConfig()
        }
    }*/
    
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
         
         func dropValuesCountryChanged(dropDisplay: String) {
               
             
                self.countryField.text = "\(dropDisplay)"
                           let indexS = Global.shared.countryNameData.firstIndex(of: "\(dropDisplay)")
                           self.countryCodeSelected   = Global.shared.countryCodesData[indexS ?? 0]
                           self.curencyField.text = Global.shared.currencyCodesData[indexS ?? 0]
                           
                           self.countryReqLbl.isHidden = true
                           self.currencyReqLbl.isHidden = true
                           
                           
                           self.stateSelected = ""
                           self.citySelected = ""
                           self.stateField.text = ""
                           self.cityField.text = ""
                           
                           self.downloadStateConfig()
            
            let indexG = Global.shared.countryNameData.firstIndex(of: "\(dropDisplay)")


                             let countryCodeD = Global.shared.countryCodesData[indexG ?? 0]
                                       //  self.placeOfBirthImg.image = UIImage(named: dropDisplay)
            self.countryDrpImg.image = UIImage(named:  countryCodeD.lowercased())
                 
            //      self.countryDrpImg.image = UIImage(named: dropDisplay)
                              
                                  self.countryReqLbl.isHidden = true
                                             self.currencyReqLbl.isHidden = true
              
           }
        
    
    
    @IBAction func stateActn(_ sender: Any) {
        let pickerData = self.pickerResponseStateData
        PickerDialog().show(title: "", options: pickerData , selected: "") {
            (value) -> Void in
            self.stateSelected = "\(value)"
            let indexS = self.stateCodeData.firstIndex(of: "\(value)")
            self.stateField.text = self.stateNameData[indexS ?? 0]
            self.stateReqLbl.isHidden = true
            
            
            self.citySelected = ""
            self.cityField.text = ""
            
            self.downloadCitiConfig()
        }
    }
    
    
    @IBAction func cityActn(_ sender: Any) {
        let pickerData = self.pickerResponseCityData
        PickerDialog().show(title: "", options: pickerData , selected: "") {
            (value) -> Void in
            self.citySelected = "\(value)"
            let indexS = self.cityCodeData.firstIndex(of: "\(value)")
            self.cityField.text = self.cityNameData[indexS ?? 0]
            self.cityReqLbl.isHidden = true
            
            
            
        }
    }
    
    @IBAction func bckBtnActn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    // Mark: Getting states data
    
    func downloadStateConfig() {
        
        self.pickerResponseStateData.removeAll()
        self.stateNameData.removeAll()
        self.stateCodeData.removeAll()
        
        let paramaterPasing: [String:Any] = ["countryCode": self.countryCodeSelected]
        
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        NetWorkDataManager.sharedInstance.stateListImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            
            if errorString == nil
            {
                
                print(resonseTal!)
                if let statusCode = resonseTal?.value(forKey: "statusCodes") as? Int {
                    
                    print(statusCode)
                    if(statusCode == 200) {
                        self.stateField.isUserInteractionEnabled = false
                        self.stateBtnOtlt.isHidden = false
                        self.cityField.isUserInteractionEnabled = false
                        self.cityBtnOtlt.isHidden = false
                        
                        if let countries = resonseTal?.value(forKey: "statesList") as? NSArray {
                            print(countries)
                            if let stateName = countries.value(forKey: "stateName") as? [String] {
                                self.stateNameData = stateName
                                
                            }
                            if let stateCode = countries.value(forKey: "stateCode") as? [String] {
                                print(stateCode)
                                self.stateCodeData = stateCode
                                
                            }
                            
                        }
                        
                        
                        for i in 0..<self.stateNameData.count {
                            self.pickerResponseStateData.append(["value": self.stateCodeData[i], "display": self.stateNameData[i]])
                        }
                        
                        
                    }
                    else {
                        self.stateField.isUserInteractionEnabled = true
                        self.stateBtnOtlt.isHidden = true
                        self.cityField.isUserInteractionEnabled = true
                        self.cityBtnOtlt.isHidden = true
                        
                    }
                }
                
                
                print(self.pickerResponseStateData)
                
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
    
    // Mark: Downloading cities based on states
    func downloadCitiConfig() {
        
        self.pickerResponseCityData.removeAll()
        self.cityNameData.removeAll()
        self.cityCodeData.removeAll()
        
        let paramaterPasing: [String:Any] = ["stateCode": stateSelected]
        
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        NetWorkDataManager.sharedInstance.cityListImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            
            if errorString == nil
            {
                
                print(resonseTal!)
                if let statusCode = resonseTal?.value(forKey: "statusCodes") as? Int {
                    
                    print(statusCode)
                    if(statusCode == 200) {
                       
                        self.stateField.isUserInteractionEnabled = false
                        self.stateBtnOtlt.isHidden = false
                        self.cityField.isUserInteractionEnabled = false
                        self.cityBtnOtlt.isHidden = false
                        
                        if let cityList = resonseTal?.value(forKey: "cityList") as? NSArray {
                            print(cityList)
                            if let cityName = cityList.value(forKey: "cityName") as? [String] {
                                
                                self.cityNameData = cityName
                            }
                            if let cityCode = cityList.value(forKey: "cityCode") as? [String] {
                                print(cityCode)
                                
                                self.cityCodeData = cityCode
                            }
                            
                        }
                        for i in 0..<self.cityNameData.count {
                            self.pickerResponseCityData.append(["value": self.cityCodeData[i], "display": self.cityNameData[i]])
                        }
                        
                        
                    }
                    else {
                        //  self.stateField.isUserInteractionEnabled = true
                        //  self.stateBtnOtlt.isHidden = true
                        self.cityField.isUserInteractionEnabled = true
                        self.cityBtnOtlt.isHidden = true
                        
                    }
                }
                
                
                print(self.pickerResponseCityData)
                
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
                //  print(resonseTal)
                self.removeSpinner()
                Global.shared.otpType = resonseTal?.value(forKey: "otpType") as? Int
                
                WesternUnion.shared.firstName = self.firstField.text ?? ""
                WesternUnion.shared.lastName =  self.lastField.text ?? ""
                WesternUnion.shared.middleName =  self.middleField.text ?? ""
                WesternUnion.shared.city =  self.cityField.text ?? ""
                WesternUnion.shared.state =  self.stateField.text ?? ""
                WesternUnion.shared.country =  self.countryCodeSelected
                WesternUnion.shared.currency =  self.curencyField.text ?? ""
                WesternUnion.shared.benefImg = self.imgeXX
                
                // submitTransfer()
                
                
                Global.shared.fromNewExistUser = "Benef3"
                self.removeSpinner()
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
            if BeneficiaryDetails.shared.wu_FirstName_is_required == true {
                if firstField.text!.count ==  0 {
                    firstNameReqLbl.isHidden = false
                }
                else {
                    firstNameReqLbl.isHidden = true
                }
            }
        } else  if textField == lastField{
            if BeneficiaryDetails.shared.wu_LastName_is_required == true {
                if lastField.text!.count ==  0 {
                    lastNameReqLbl.isHidden = false
                }
                else {
                    lastNameReqLbl.isHidden = true
                }
            }
        }
        else  if textField == middleField{
            if BeneficiaryDetails.shared.wu_MiddleName_is_required == true {
                if middleField.text!.count ==  0 {
                    middleNameReqLbl.isHidden = false
                }
                else {
                    middleNameReqLbl.isHidden = true
                }
            }
        }
        else  if textField == cityField{
            if cityField.text!.count ==  0 {
                cityReqLbl.isHidden = false
            }
            else {
                cityReqLbl.isHidden = true
            }
        }
        else  if textField == stateField {
            if stateField.text!.count ==  0 {
                stateReqLbl.isHidden = false
            }
            else {
                stateReqLbl.isHidden = true
            }
        }
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField == firstField {
            if BeneficiaryDetails.shared.wu_FirstName_is_required == true {
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
            if BeneficiaryDetails.shared.wu_LastName_is_required == true {
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
            if BeneficiaryDetails.shared.wu_MiddleName_is_required == true {
                if middleField.text!.count <= -1 {
                    middleNameReqLbl.isHidden = false
                }
                else {
                    middleNameReqLbl.isHidden = true
                }
            }
            return middleField.verifyFields(shouldChangeCharactersIn: range, replacementString: string)
        }
        else  if textField == cityField {
            if cityField.text!.count <= -1 {
                cityReqLbl.isHidden = false
            }
            else {
                cityReqLbl.isHidden = true
            }
        }
        else  if textField == stateField {
            if stateField.text!.count <= -1 {
                stateReqLbl.isHidden = false
            }
            else {
                stateReqLbl.isHidden = true
            }
        }
            
        return true
        
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
              let cancelAction = UIAlertAction(title: Global.shared.cancelTxt, style: UIAlertAction.Style.cancel)
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
              pickerImg!.sourceType = UIImagePickerController.SourceType.photoLibrary
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
    
    
    @IBAction func languageChangeActn(_ sender: Any) {
        Global.shared.languageChangeActn()
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

    



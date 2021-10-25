//
//  LoginVc.swift
//  Canvas
//
//  Created by urmila reddy on 05/08/20.
//  Copyright © 2020 urmila reddy. All rights reserved.
//

import UIKit
import Alamofire
import GoogleMaps
import GooglePlaces
import LocalAuthentication

let reuseIdentifier = "offerCell";
class LoginVc: UIViewController, UITextFieldDelegate, UICollectionViewDataSource, UICollectionViewDelegate{

    
    @IBOutlet weak var stackViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var collectionViewHeight: NSLayoutConstraint!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var versionLbl: UILabel!
    
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secndView: UIView!
    
    @IBOutlet weak var langugeChangeBtnOtlt: UIButton!
    
    //   @IBOutlet weak var loginToAccntLbl: UILabel!
    @IBOutlet weak var userNameLbl: UILabel!
    
    
    @IBOutlet weak var userTxtField: CustomTextField!
    
    @IBOutlet weak var paswdNameLbl: UILabel!
    
    @IBOutlet weak var pswdTxtField: CustomTextField!
    
    @IBOutlet weak var loginBtnOtlt: UIButton!
    
    
    @IBOutlet weak var signupBtnOtlt: UIButton!
    
    @IBOutlet weak var forgotUsernameOtlt: UIButton!
    
    @IBOutlet weak var forgotPswdOtlt: UIButton!
    
    @IBOutlet weak var eyeBtnOtlt: UIButton!
    
    
    @IBOutlet weak var userErrorText: UILabel!
    
    @IBOutlet weak var paswdErrorText: UILabel!
    
    @IBOutlet weak var aLmuzinLbl: UILabel!
    
    
    @IBOutlet weak var languageLbl: UILabel!
    
    
    @IBOutlet weak var branchLoctorBtnOtlt: UIButton!
    
    
    @IBOutlet weak var faceIdLockBtnOtlt: UIButton!
    
    
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var scrolVieww: UIScrollView!
    
    
    
    @IBOutlet weak var loginWithFaceIdLbl: UILabel!
    
    
    @IBOutlet weak var downContactUsLbl: UILabel!
    
    @IBOutlet weak var rateCalculatorLbl: UILabel!
    
    @IBOutlet weak var ourBranchesLbl: UILabel!
    
    @IBOutlet weak var faqLbl: UILabel!
    
    @IBOutlet weak var termsAndConditionsLbl: UILabel!
    
    var iconClick = true
    var image = UIImage()
    
    var languageNames = [String]()
    var languageCodes = [String]()
    var pickerResponseLanguge = [[String: String]]()
    var offerList = [[String: Any]]()
    var imgOfferList = [[String:Any]]()
    
    
    @IBOutlet weak var faceIdTopConstrt: NSLayoutConstraint!
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        DispatchQueue.main.async {
            var contentRect = CGRect.zero

            for _ in self.scrolVieww.subviews {
                contentRect = contentRect.union(self.mainView.frame)
            }

            self.scrolVieww.contentSize = contentRect.size
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
      
        startTimer()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // self.collectionView!.register(PreLoginOfferCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        let devicee = UIDevice.current.name
     //   self.faceIdTopConstrt.constant =  CGFloat(getHeightOfScreen(text: devicee))
        
        
        collectionViewHeight.constant = 0
        self.stackViewTopConstraint.constant = 50
        mainView.layoutIfNeeded()
       
        
//        let contentRect: CGRect = scrolVieww.subviews.reduce(into: .zero) { rect, view in
//            rect = rect.union(view.frame)
//        }
//        scrolVieww.contentSize = contentRect.size
       
        
        /* let button = UIButton(type: .roundedRect)
         button.frame = CGRect(x: 20, y: 50, width: 100, height: 30)
         button.setTitle("Crash", for: [])
         button.addTarget(self, action: #selector(self.crashButtonTapped(_:)), for: .touchUpInside)
         view.addSubview(button)*/
        
        Global.shared.countryNameData.removeAll()
        Global.shared.countryCodesData.removeAll()
        Global.shared.currencyCodesData.removeAll()
        Global.shared.currencyNameData.removeAll()
        Global.shared.phoneCodesData.removeAll()
        Global.shared.pickerResponseCountryData.removeAll()
        Global.shared.pickerResponseOnlyCurrencyData.removeAll()
        Global.shared.pickerResponseFullCurrencyNameData.removeAll()
        
        
        Global.shared.pickerResponseOnlyCurrencyData.removeAll()
        Global.shared.afterLoginSecurityQuestnsList.removeAll()
        Global.shared.afterLoginSecurityIdList.removeAll()
        Global.shared.afterLoginSecurityIdListString.removeAll()
        Global.shared.civilIdNames.removeAll()
        Global.shared.identityTypes.removeAll()
        Global.shared.pickerResponseCivilId.removeAll()
        Global.shared.languageNames.removeAll()
        Global.shared.languageValues.removeAll()
        Global.shared.pickerResponseLanguge.removeAll()
        Global.shared.residentNames.removeAll()
        
        Global.shared.residentValues.removeAll()
        Global.shared.pickerResponseResident.removeAll()
        Global.shared.salutationNames.removeAll()
        Global.shared.salutationValues.removeAll()
        Global.shared.pickerResponseSalutation.removeAll()
        Global.shared.occupationNames.removeAll()
        
        Global.shared.occupationValues.removeAll()
        Global.shared.pickerResponseOccupation.removeAll()
        Global.shared.typeServiceNames.removeAll()
        Global.shared.typeServiceValues.removeAll()
        Global.shared.pickerResponseTypeService.removeAll()
        Global.shared.purposeTransferNames.removeAll()
        
        Global.shared.purposeTransferValues.removeAll()
        Global.shared.pickerResponsePurposeTransfer.removeAll()
        Global.shared.sourceIncomeNames.removeAll()
        Global.shared.sourceIncomeValues.removeAll()
        Global.shared.pickerResponseSourceIncome.removeAll()
        Global.shared.expectedTxnTypesNames.removeAll()
        
        Global.shared.expectedTxnTypesValues.removeAll()
        Global.shared.pickerResponseexpectedTxnTypes.removeAll()
        Global.shared.expectedTxnTypesNames.removeAll()
        Global.shared.pickerResponseLangugeChange.removeAll()
        
        
        userTxtField.delegate = self
        pswdTxtField.delegate = self
      //  loginBtnOtlt.isEnabled = false
        
        
        
        //undo below to add validation back
        //    pswdTxtField.valueType = .password_Validation
        
        //  authenticationWithTouchID()
        
        // Do any additional setup after loading the view.
        //password_textfield.rightView = btnColor
        
        eyeBtnOtlt.setImage(Images.eyeOpen, for: .normal)
        
        
        
        //    self.scrolVieww.backgroundColor = UIColor(patternImage: UIImage(named: "AppBckgroundImg")!)
        //  self.scrollView.addSubview()
        //self.mainView.backgroundColor = UIColor(patternImage: UIImage(named: "AppBckgroundImg")!)
        
        firstView.layer.cornerRadius = 5
        secndView.layer.cornerRadius = 5
        loginBtnOtlt.layer.cornerRadius = 5
        signupBtnOtlt.layer.cornerRadius = 5
        
        if Connectivity.isConnectedToInternet {
            self.showSpinner(onView: self.view)
            DispatchQueue.main.async {
                self.getOfferList()
            }
            //  checkkHashing()
            checkVersionControl()
            dwldLanguageChange()
            downloadAccountConfig()
            downloadAccountConfigCountries()
            
            assignNewLanguages()
            print("Connected")
        } else {
            print("No Internet")
            self.view.isUserInteractionEnabled = false
            
            /*  if UIDevice.current.userInterfaceIdiom == .pad  || UIDevice.current.userInterfaceIdiom == .phone{
             let alert = ViewControllerManager.displayAlert(message:"Please check your internet", title:"Alert")
             self.present(alert, animated: true, completion: nil)
             }*/
            
            let alert = UIAlertController(title: "Alert", message: "The Internet connection appears to be offline.", preferredStyle: UIAlertController.Style.alert)
            // add an action (button)
            alert.view.tintColor = ColorCodes.newAppRed
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            // show the alert
            self.present(alert, animated: true, completion: nil)
            // }
            
            /* let alert = ViewControllerManager.displayAlert(message:"Please check your internet", title:"Alert")
             self.present(alert, animated: true, completion: nil)*/
            
            
        }
    }
    /*   @IBAction func crashButtonTapped(_ sender: AnyObject) {
     fatalError()
     }*/
    

    func getOfferList() {
       // self.showSpinner(onView: self.view)
        let paramaterPasing: [String:Any] = ["offerType":1,"DeviceType":3,"language":LocalizationSystem.sharedInstance.getLanguage(),"RegistrationId":""]
        
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        NetWorkDataManager.sharedInstance.preLoginOffer(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            
            if errorString == nil
            {
                
             //  print(resonseTal)
                if let offers = resonseTal?.value(forKey: "preLoginListOffersResponseModels") as? NSArray
                {
                    self.offerList = offers as! [[String : Any]]
                  //  print(self.offerList)
                    if self.offerList.count == 0 {
                        UIView.animate(withDuration: 0.2,
                        delay: 0.2,
                        options: UIView.AnimationOptions.curveEaseIn,
                        animations: {
                            self.collectionViewHeight.constant = 0
                            self.stackViewTopConstraint.constant = 50
                            self.mainView.layoutIfNeeded()
                        },completion: nil)
//                        self.view.layoutIfNeeded() // force any pending operations to finish
//
//                        UIView.animate(withDuration: 0.8, animations: { () -> Void in
//                            self.collectionViewHeight.constant = 0
//                            self.mainView.layoutIfNeeded()
//                       })
                       
                    }
                    else
                    {
                        self.view.layoutIfNeeded() // force any pending operations to finish

                        UIView.animate(withDuration: 0.9,
                        delay: 0.2,
                        options: UIView.AnimationOptions.transitionCurlDown,
                        animations: {
                            self.collectionViewHeight.constant = 180
                            self.stackViewTopConstraint.constant = 5
                            self.mainView.layoutIfNeeded()
                        },completion: nil)
                      //  self.collectionViewHeight.constant = 150
                       // self.mainView.layoutIfNeeded()
                    }
                    self.startTimer()
                    self.collectionView.reloadData()
                    
                }
              
            }
            else
            {
                print(errorString!)
                self.removeSpinner()
                let finalError = errorString?.components(separatedBy: ":")
                if finalError?.count == 2
                {
                   let alert = ViewControllerManager.displayAlert(message: finalError?[1] ?? "", title:APPLICATIONNAME)
                    self.present(alert, animated: true, completion: nil)
                }
                else
                {
                    let alert = ViewControllerManager.displayAlert(message: errorString ?? "", title:APPLICATIONNAME)
                    self.present(alert, animated: true, completion: nil)
                }
                
            }
        }
        
    }
    
    
   func checkVersionControl()
   {
    let paramaterPasing: [String:Any] = ["deviceTypeID":2]
    
    
    let headers: HTTPHeaders = [
        "Content-Type": "application/json"
    ]
    
    NetWorkDataManager.sharedInstance.appVersionControl(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
        
        if errorString == nil
        {
            
          // print(resonseTal)
           if let version = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as? String
           {
            let versionNumber = Float(version)
            //print(versionNumber)
            if let versionList = resonseTal?.value(forKey: "versionList") as? NSArray  {
                print(versionList[0])
                let versionValue = versionList[0] as? [String:Any]
                let versionVal = versionValue!["version"] as? String
                let val = Float(versionVal!)
               // print(val,versionNumber)
                if versionNumber! < val!
                {
                
                    if versionValue!["option"] as! Int == 1
                    {
                    let alert = UIAlertController(title: "", message: "New version is available, Do you want to update?", preferredStyle: .alert)

                    alert.addAction(UIAlertAction(title: "Update", style: .default, handler: {action in
                        
                        if let url = URL(string: "https://itunes.apple.com/in/app/al-muzaini/id1374929479") {
                              UIApplication.shared.open(url, options: [:], completionHandler: nil)
                           }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                              exit(0)
                             }

                        
                    }))
                    alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                    self.present(alert, animated: true)
                    }
                    
                   
                  if versionValue!["option"] as! Int == 2
                  {
                    let alert = UIAlertController(title: "", message: "New version is available, please update", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Update", style: .default, handler: {action in
                        
                        if let url = URL(string: "https://itunes.apple.com/in/app/al-muzaini/id1374929479") {
                              UIApplication.shared.open(url, options: [:], completionHandler: nil)
                           }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                              exit(0)
                             }
                        
                    }))
                    
                 
                    self.present(alert, animated: true)
                  }
              }
            }
         }
        }
        else
        {
            print(errorString!)
            self.removeSpinner()
            let finalError = errorString?.components(separatedBy: ":")
            if finalError?.count == 2
            {
               let alert = ViewControllerManager.displayAlert(message: finalError?[1] ?? "", title:APPLICATIONNAME)
                self.present(alert, animated: true, completion: nil)
            }
            else
            {
                let alert = ViewControllerManager.displayAlert(message: errorString ?? "", title:APPLICATIONNAME)
                self.present(alert, animated: true, completion: nil)
            }
//                let alert = ViewControllerManager.displayAlert(message: finalError?[1] ?? "", title:APPLICATIONNAME)
//                self.present(alert, animated: true, completion: nil)
            
        }
    }
   }
    
    
    
    public func getHeightOfScreen(text: String) -> Int {
        var heightValue:Int!
        switch text {
        case "iPhone XS":
            heightValue = 100
            break
        case "iPhone X":
            heightValue = 100
            break
        case "iPhone XS Max":
            heightValue = 100
            break
        case "iPhone XR":
            heightValue = 100
            break
        case "iPhone 11":
            heightValue = 100
            break
        case "iPhone 11 Pro ":
            heightValue =  100
            break
        case "iPhone 11 Pro Max":
            heightValue =  100
            break
        case "iPhone 12":
            heightValue =  100
            break
        case "iPhone 12 Pro":
            heightValue =  100
            break
        case "iPhone 12 Pro Max":
            heightValue =  100
            break
        default:
            heightValue = 32
            break
        }
        heightValue =  150
        return heightValue
        
    }
    
    
    // MARK: To get list of languages
    func assignNewLanguages() {
        let paramaterPasing: [String:Any] = ["":""]
        
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        NetWorkDataManager.sharedInstance.langugesListImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            
            if errorString == nil
            {
                
                if let languageList = resonseTal?.value(forKey: "languageList") as? NSArray {
                    //please check country
                    if let langName = languageList.value(forKey: "name") as? [String] {
                        Global.shared.langNamesList = langName
                    }
                    if let langValue = languageList.value(forKey: "value") as? [String] {
                        Global.shared.langValuesList = langValue
                    }
                    
                    
                    for i in 0..<Global.shared.langValuesList.count {
                        Global.shared.pickerResponseLangugeChange.append(["value":  Global.shared.langValuesList[i], "display":   Global.shared.langNamesList[i]])
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
    
    
    
    
    func assigninLanguageChangeContent() {
        
        
        Global.shared.pickerResponseLangugeChange =  [["value": "English" , "display": "English"], ["value": "Arabic" , "display": "عربى"]]
        
    }
    
    
    // MARK: Textfield Delegate methods
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        //doneAction()
        if textField == userTxtField{
            if userTxtField.text!.count ==  0 {
                userErrorText.isHidden = false
            }
            else {
                userErrorText.isHidden = true
            }
        }
        
        if textField == pswdTxtField{
            if pswdTxtField.text!.count ==  0 {
                paswdErrorText.isHidden = false
            }
            else {
                paswdErrorText.isHidden = true
            }
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        
        if textField == userTxtField {
            
            
            if userTxtField.text!.count <= -1 {
                userErrorText.isHidden = false
            }
            else {
                userErrorText.isHidden = true
            }
            //   return userTxtField.verifyFields(shouldChangeCharactersIn: range, replacementString: string)
            
        } else if textField == pswdTxtField {
            if pswdTxtField.text!.count <= -1 {
                paswdErrorText.isHidden = false
            }
            else {
                paswdErrorText.isHidden = true
            }
            // paswdErrorText.isHidden = true
            // return pswdTxtField.verifyFields(shouldChangeCharactersIn: range, replacementString: string)
        }
        
        return true
        
    }
    
    
    
    
    @IBAction func eyeBtnActn(_ sender: Any) {
        
        if(iconClick == true) {
            pswdTxtField.isSecureTextEntry = false
            let currentText: String = self.pswdTxtField.text!
            self.pswdTxtField.text = "";
            self.pswdTxtField.text = currentText
            
            eyeBtnOtlt.setImage(Images.eyeClose, for: .normal)
        } else {
            pswdTxtField.isSecureTextEntry = true
            eyeBtnOtlt.setImage(Images.eyeOpen, for: .normal)
        }
        
        iconClick = !iconClick
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        Global.shared.timeoUtOrNot = "no"
        Global.shared.logoutValue = 0
        navigationController?.setNavigationBarHidden(true, animated: animated)
         self.userTxtField.text = ""
         self.pswdTxtField.text = ""
        //  navigationController?.navigationBar.barStyle = .black
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @IBAction func langChangeBtnActn(_ sender: Any) {
        
        Global.shared.languageChangeActn()
        
        /*   let pickerData = Global.shared.pickerResponseLangugeChange
         PickerDialog().show(title: "", options: pickerData , selected: "") {
         (value) -> Void in
         let langcode = "\(value)"
         if langcode == "en" {
         LocalizationSystem.sharedInstance.setLanguage(languageCode: "en")
         UIView.appearance().semanticContentAttribute = .forceLeftToRight
         //  UITextField.appearance().semanticContentAttribute = UISemanticContentAttribute.forceLeftToRight
         //  self.languageLbl.text = "English"
         }
         else if langcode == "ar" {
         LocalizationSystem.sharedInstance.setLanguage(languageCode: "ar")
         UIView.appearance().semanticContentAttribute = .forceRightToLeft
         //    UITextField.appearance().semanticContentAttribute = UISemanticContentAttribute.forceRightToLeft
         // self.languageLbl.text = "عربى"
         }
         else if langcode == "hi" {
         LocalizationSystem.sharedInstance.setLanguage(languageCode: "hi")
         UIView.appearance().semanticContentAttribute = .forceLeftToRight
         //    UITextField.appearance().semanticContentAttribute = UISemanticContentAttribute.forceRightToLeft
         // self.languageLbl.text = "عربى"
         }
         else {
         print("no language")
         }
         
         
         //  UIApplication.shared.keyWindow?.rootViewController = self.storyboard?.instantiateInitialViewController()
         
         UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.rootViewController = self.storyboard?.instantiateInitialViewController()
         //  UIApplication.shared.keyWindow?.rootViewController = LoginVc()*/
        
        
        
        //  }*/
        
        //end
        
        
        /*   let pickerData = [["value": "English" , "display": "English"], ["value": "Arabic" , "display": "عربى"]]
         
         
         PickerDialog().show(title: "Select Language", options: pickerData , selected: "") {
         (value) -> Void in
         
         //  print("Unit selected: \(value)")
         //  self.purposeAnswerLbl.text = "\(value)"
         let langcode = "\(value)"
         if langcode == "English" {
         LocalizationSystem.sharedInstance.setLanguage(languageCode: "en")
         UIView.appearance().semanticContentAttribute = .forceLeftToRight
         self.languageLbl.text = "English"
         }
         else {
         LocalizationSystem.sharedInstance.setLanguage(languageCode: "ar")
         UIView.appearance().semanticContentAttribute = .forceRightToLeft
         self.languageLbl.text = "عربى"
         }
         UIApplication.shared.keyWindow?.rootViewController = self.storyboard?.instantiateInitialViewController()
         }*/
        
        /*      if LocalizationSystem.sharedInstance.getLanguage() == "ar" {
         
         LocalizationSystem.sharedInstance.setLanguage(languageCode: "en")
         UIView.appearance().semanticContentAttribute = .forceLeftToRight
         } else {
         LocalizationSystem.sharedInstance.setLanguage(languageCode: "ar")
         UIView.appearance().semanticContentAttribute = .forceRightToLeft
         }
         UIApplication.shared.keyWindow?.rootViewController = storyboard?.instantiateInitialViewController()*/
    }
    
    
    @IBAction func loginBtnActn(_ sender: Any) {
        
        if userTxtField.text == "" &&  pswdTxtField.text == "" {
            
            userErrorText.isHidden = false
            paswdErrorText.isHidden = false
           
        }
        else if userTxtField.text == "" {
            userErrorText.isHidden = false
           
        }
        
        else  if pswdTxtField.text == "" {
            paswdErrorText.isHidden = false
           
        }
        else {
            loginBtnOtlt.isEnabled = false
            self.showSpinner(onView: self.view)
            loginToAccount()
            
        }
        
    }
    
    
    @IBAction func signUpActn(_ sender: Any) {
        self.pushViewController(controller: ExistingCustomerVc.initiateController())
        
    }
    
    @IBAction func forgotUsernameActn(_ sender: Any) {
        self.pushViewController(controller: ForgotUsernamePopUp.initiateController())
    }
    
    @IBAction func forgotPswdActn(_ sender: Any) {
        self.pushViewController(controller: ForgotPaswdPopUp.initiateController())
    }
    
    
    
    
    // MARK: To get the language variables used through out the app
    func dwldLanguageChange() {
        
        let paramaterPasing: [String:Any] = ["languageCode":LocalizationSystem.sharedInstance.getLanguage()]
        
        //   let hmacResult2: String = Global.shared.publicKeyStr.hmac(algorithm: HMACAlgorithm.SHA512, key: Global.shared.privateKeyStr)
        
        //    let headersHmac: HTTPHeaders = ["x-publickey" : Global.shared.publicKeyStr, "x-client": hmacResult2, "x-hash" : ""]
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        NetWorkDataManager.sharedInstance.languageChangeImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            
            if errorString == nil
            {
               
                
                if let languageContent = resonseTal?.value(forKey: "languageContent") as? String {
                    
                    let dataObj = Global.shared.convertToDictionary(text: languageContent)
                    
                    if let dataDict = dataObj as NSDictionary? {
                        
                        if let apiMessageCodes = dataDict.value(forKey: "api_message_codes") as? NSDictionary {
                            Global.shared.messageCodeAry = apiMessageCodes
                        }
                        
                        if let commonNew = dataDict.value(forKey: "common_new") as? NSDictionary {
                            Global.shared.cancelleddTxt = commonNew["lbl_common_65"] as? String ?? ""
                            Global.shared.viewProfileTxt = commonNew["lbl_common_64"] as? String ?? ""
                            Global.shared.doneTxt = commonNew["lbl_common_61"] as? String ?? ""
                            Global.shared.failedTxt = commonNew["lbl_common_60"] as? String ?? ""
                            
                            Global.shared.viewOnGoogleMapTxt = commonNew["lbl_common_31"] as? String ?? ""
                            Global.shared.pendingTxt = commonNew["lbl_common_18"] as? String ?? ""
                            Global.shared.sucessTxt = commonNew["lbl_common_17"] as? String ?? ""
                            Global.shared.favTxtt = commonNew["lbl_common_23"] as? String ?? ""
                            Global.shared.editTxtt = commonNew["lbl_common_21"] as? String ?? ""
                            Global.shared.retailTxt = commonNew["lbl_common_25"] as? String ?? ""
                            
                            
                            Global.shared.oneMonthTxt = commonNew["lbl_common_32"] as? String ?? ""
                            Global.shared.threeMonthTxt = commonNew["lbl_common_33"] as? String ?? ""
                            Global.shared.sixMonthTxt = commonNew["lbl_common_34"] as? String ?? ""
                            Global.shared.oneYearTxt = commonNew["lbl_common_35"] as? String ?? ""
                            
                            Global.shared.cameraTxt = commonNew["lbl_common_30"] as? String ?? ""
                            Global.shared.galryTxt = commonNew["lbl_common_29"] as? String ?? ""
                            
                            Global.shared.youCantCreateAnthrQuestnTxt = commonNew["lbl_common_36"] as? String ?? ""
                            Global.shared.fileTxt = commonNew["lbl_common_37"] as? String ?? ""
                            Global.shared.selectOptionTxt = commonNew["lbl_common_38"] as? String ?? ""
                            Global.shared.alrdySelFrntBckFiles = commonNew["lbl_common_39"] as? String ?? ""
                            Global.shared.remveFrntImgToUpNewOne = commonNew["lbl_common_40"] as? String ?? ""
                            Global.shared.remveBckImgToUpNewOne = commonNew["lbl_common_41"] as? String ?? ""
                            Global.shared.alrdySelctdVideo = commonNew["lbl_common_42"] as? String ?? ""
                            Global.shared.benefDatNotAvailble = commonNew["lbl_common_43"] as? String ?? ""
                            Global.shared.changeLangSubTitleTxt = commonNew["lbl_common_44"] as? String ?? ""
                            
                        }
                        if let voucher = dataDict.value(forKey: "voucher") as? NSDictionary {
                            
                            Global.shared.mtcnn = voucher["mtcn"] as? String ?? ""
                            Global.shared.ttNumbr = voucher["tt_number"] as? String ?? ""
                            
                            Global.shared.serviceOpted = voucher["service_opted"] as? String ?? ""
                            
                            Global.shared.voucherNumber = voucher["voucher_number"] as? String ?? ""
                            Global.shared.accountNumberVoucher = voucher["account_number"] as? String ?? ""
                            
                            Global.shared.bankNameVoucher = voucher["bank_name"] as? String ?? ""
                            Global.shared.branchNameVoucher = voucher["branch_name"] as? String ?? ""
                            
                            Global.shared.statusVoucher = voucher["account_number"] as? String ?? ""
                        }
                        if let menuLabels = dataDict.value(forKey: "menu_labels") as? NSDictionary {
                            print(menuLabels)
                            
                            Global.shared.menuRateThisAppString = menuLabels["lbl_rate_this_app"] as? String ?? ""
                            
                            Global.shared.menuBeneficiary = menuLabels["lbl_benefeciaries"] as? String ?? ""
                            Global.shared.menuChangePaswd = menuLabels["lbl_change_password"] as? String ?? ""
                            Global.shared.menuContact = menuLabels["lbl_contact"] as? String ?? ""
                            Global.shared.menuDashboard = menuLabels["lbl_dashboard"] as? String ?? ""
                            Global.shared.menuFeedback = menuLabels["lbl_feedback"] as? String ?? ""
                            Global.shared.menuMessages = menuLabels["lbl_messages"] as? String ?? ""
                            Global.shared.menuProfile = menuLabels["lbl_profile"] as? String ?? ""
                            Global.shared.menuTransactions = menuLabels["lbl_transactions"] as? String ?? ""
                            Global.shared.menuRateAlert = menuLabels["lbl_rate_alert"] as? String ?? ""
                            Global.shared.menuOffer = menuLabels["lbl_offers"] as? String ?? ""
                        }
                        
                        if let footerContent = dataDict.value(forKey: "footer_content") as? NSDictionary {
                            
                            Global.shared.faqTxt = footerContent["faqs"] as? String ?? ""
                        }
                        
                        
                        if let common = dataDict.value(forKey: "common") as? NSDictionary {
                            
                           // print(common)
                            
                            Global.shared.onlyThresholdTxt = common["threshold"] as? String ?? ""
                            //  Global.shared.deleteTxt = common["delete"] as? String ?? ""
                            
                            Global.shared.deleteTxt = common["delete"] as? String ?? ""
                            
                            Global.shared.lowTxt = common["low"] as? String ?? ""
                            Global.shared.mediumTxt = common["medium"] as? String ?? ""
                            Global.shared.highTxt = common["high"] as? String ?? ""
                            Global.shared.strongTxt = common["strong"] as? String ?? ""
                            Global.shared.answerTxt = common["answer"] as? String ?? ""
                            
                            Global.shared.repeatTxt = common["repeat"] as? String ?? ""
                            Global.shared.repetFailedPendingTxt = common["repeat_availability"] as? String ?? ""
                            Global.shared.selectSecurityImg = common["sel_security_image"] as? String ?? ""
                            Global.shared.enterOtpTxt = common["otp_enter"] as? String ?? ""
                            Global.shared.thresholdValueTxt = common["threshold_value"] as? String ?? ""
                            Global.shared.transfersTxtTab = common["transfers"] as? String ?? "Transfers"
                            
                            Global.shared.createYourOwnQuestnTxt = common["lbl_create_question"] as? String ?? ""
                            Global.shared.selectedBenefDisabled = common["sel_ben_disabled"] as? String ?? ""
                            Global.shared.showLessTxt = common["show_less"] as? String ?? ""
                            Global.shared.securityVerfictnTxt = common["security_verification"] as? String ?? ""
                            
                            Global.shared.favBenfTxt = common["favorite"] as? String ?? ""
                            Global.shared.unfavBenefTxt = common["unfavourite"] as? String ?? ""
                            Global.shared.enableBenefTxt = common["enable"] as? String ?? ""
                            Global.shared.disableBenefTxt = common["disable"] as? String ?? ""
                            
                            Global.shared.foreignLcCurncyTxt = common["foreign_currency"] as? String ?? ""
                            Global.shared.localCurncyTxt = common["local_currency"] as? String ?? ""
                            
                            Global.shared.selectYourQuestnTxt = common["select_your_question"] as? String ?? ""
                            Global.shared.acceptTermsCondtnsAlert = common["proceed_tc"] as? String ?? ""
                            
                            Global.shared.versionLbl = common["version_name"] as? String ?? ""
                            
                            let version = Bundle.main.infoDictionary!["CFBundleShortVersionString"]!
                            let versionNumber = version as? String ?? ""
                            self.versionLbl.text = Global.shared.versionLbl + ":" + versionNumber
                            
                            Global.shared.smsTxt = common["delivery_type_sms"] as? String ?? ""
                            Global.shared.emailTxt = common["delivery_type_email"] as? String ?? ""
                            
                            Global.shared.foreignCurncyTxt = common["foreign_currency"] as? String ?? ""
                            Global.shared.plsContctAdminOtp = common["label_reset_otp"] as? String ?? ""
                            Global.shared.enterOtpAlrdyExists = common["label_reset_otp_enter"] as? String ?? ""
                            
                            Global.shared.resetTxt = common["reset"] as? String ?? ""
                            Global.shared.restQuestnsTxt = common["reset_questions"] as? String ?? ""
                            Global.shared.noRecordsFoundTxt = common["no_records_found"] as? String ?? ""
                            Global.shared.logoutHeaderTxt = common["logout"] as? String ?? ""
                            Global.shared.remiterInactiveDashboard = common["remitter_inactive"] as? String ?? ""
                            Global.shared.remiterInactiveBeneficiary = common["remitter_inactive_beneficiary"] as? String ?? ""
                            Global.shared.remiterInactiveTrnsctn = common["remitter_inactive_transaction"] as? String ?? ""
                            
                            Global.shared.sendEmailTxtt = common["share_email"] as? String ?? ""
                            Global.shared.yesTxt = common["yes"] as? String ?? ""
                            Global.shared.noTxt = common["no"] as? String ?? ""
                            
                            Global.shared.sendNowTxt = common["send_now"] as? String ?? ""
                            
                            Global.shared.monthTxtt = common["month"] as? String ?? ""
                            Global.shared.yearTxtt = common["year"] as? String ?? ""
                            
                            Global.shared.browseTxt = common["browse"] as? String ?? ""
                            Global.shared.backTxt = common["back"] as? String ?? ""
                            Global.shared.frontTxt = common["front"] as? String ?? ""
                            Global.shared.recordTxt = common["record"] as? String ?? ""
                            
                            
                            Global.shared.uploadCivildIdTxt = common["uplaod_civilid"] as? String ?? ""
                            
                            Global.shared.uploadSelfieVideTxt = common["upload_selfie_video"] as? String ?? ""
                            
                            
                            Global.shared.showMoreTxt = common["show_more"] as? String ?? ""
                            Global.shared.createUserNamePaswd = common["createuserpass_header"] as? String ?? ""
                            
                            Global.shared.proceedTermsCondtnAlertTxt = common["proceed_tc"] as? String ?? ""
                            Global.shared.okTxt = common["ok"] as? String ?? ""
                            Global.shared.logoutTxt = common["logout_confirm"] as? String ?? ""
                            Global.shared.lastLoginTxt = common["lastlogin"] as? String ?? ""
                            Global.shared.welcomeTxt = common["welcome"] as? String ?? ""
                            
                            Global.shared.cancelTxt = common["cancel"] as? String ?? ""
                            //  Global.shared.faqTxt = common["faq"] as? String ?? ""
                            Global.shared.termsConditionsShortTxt = common["signup"] as? String ?? ""
                            Global.shared.branchLoctrtLoginTxt = common["branch_locator"] as? String ?? ""
                            
                            Global.shared.loginBtnTxt = common["login"] as? String ?? ""
                            Global.shared.signUpBtnTxt = common["signup"] as? String ?? ""
                            Global.shared.orTxt = common["or"] as? String ?? ""
                            Global.shared.createQuestnBtnTxt = common["lbl_create_question"] as? String ?? ""
                            Global.shared.showMoreBtnTxt = common["show_more"] as? String ?? ""
                            Global.shared.backBtnTxt = common["back"] as? String ?? ""
                            Global.shared.submitBtnTxt = common["submit"] as? String ?? ""
                            Global.shared.verifctnConfirmBtnTxt = common["confirm"] as? String ?? ""
                            Global.shared.verifySubmitBtnTxt = common["submit"] as? String ?? ""
                            Global.shared.nxtBtnTxt = common["next"] as? String ?? ""
                            Global.shared.iHaveReadAgreeTxt = common["txt_terms_conds_label1"] as? String ?? ""
                            Global.shared.termsConditionBtnTxt = common["terms_conditions"] as? String ?? ""
                            Global.shared.almuzinBottomTxt = common["copyright"] as? String ?? ""
                            Global.shared.answerPlaceHolderTxt = common["answer"] as? String ?? ""
                            Global.shared.enterQuestnTxt = common["enter_question"] as? String ?? ""
                            Global.shared.commonMonth = common["month"] as? String ?? ""
                            Global.shared.commonYear = common["year"] as? String ?? ""
                            Global.shared.importContacts = common["import_from_contacts"] as? String ?? ""
                            
                            Global.shared.saveTxt = common["save"] as? String ?? ""
                            Global.shared.updateTxt = common["update"] as? String ?? ""
                            Global.shared.editTxt = common["edit"] as? String ?? ""
                            Global.shared.removeTxt = common["remove"] as? String ?? ""
                            Global.shared.goTxt = common["go"] as? String ?? ""
                            
                        }
                        
                        if let guidedTour = dataDict.value(forKey: "guided_tour") as? NSDictionary {
                            
                            Global.shared.guidedTour1 = guidedTour["guided_tour_1"] as? String ?? ""
                            Global.shared.guidedTour2 = guidedTour["guided_tour_2"] as? String ?? ""
                            Global.shared.guidedTour3 = guidedTour["guided_tour_3"] as? String ?? ""
                            Global.shared.guidedTour4 = guidedTour["guided_tour_4"] as? String ?? ""
                            Global.shared.guidedTour5 = guidedTour["guided_tour_5"] as? String ?? ""
                            Global.shared.guidedTour6 = guidedTour["guided_tour_6"] as? String ?? ""
                            Global.shared.guidedTour7 = guidedTour["guided_tour_7"] as? String ?? ""
                            Global.shared.guidedTour8 = guidedTour["guided_tour_8"] as? String ?? ""
                            Global.shared.guidedTour9 = guidedTour["guided_tour_9"] as? String ?? ""
                            Global.shared.guidedTour10 = guidedTour["guided_tour_10"] as? String ?? ""
                            Global.shared.guidedTour11 = guidedTour["guided_tour_11"] as? String ?? ""
                            Global.shared.guidedTour12 = guidedTour["guided_tour_12"] as? String ?? ""
                            Global.shared.guidedTour13 = guidedTour["guided_tour_13"] as? String ?? ""
                            Global.shared.guidedTour14 = guidedTour["guided_tour_14"] as? String ?? ""
                            Global.shared.guidedTour15 = guidedTour["guided_tour_15"] as? String ?? ""
                            Global.shared.guidedTour16 = guidedTour["guided_tour_16"] as? String ?? ""
                            Global.shared.guidedTour17 = guidedTour["guided_tour_17"] as? String ?? ""
                            Global.shared.guidedTour18 = guidedTour["guided_tour_18"] as? String ?? ""
                            Global.shared.guidedTour19 = guidedTour["guided_tour_19"] as? String ?? ""
                            Global.shared.guidedTour20 = guidedTour["guided_tour_20"] as? String ?? ""
                            Global.shared.guidedTour21 = guidedTour["guided_tour_21"] as? String ?? ""
                            Global.shared.guidedTour22 = guidedTour["guided_tour_22"] as? String ?? ""
                            Global.shared.guidedTour23 = guidedTour["guided_tour_23"] as? String ?? ""
                            Global.shared.guidedTour24 = guidedTour["guided_tour_24"] as? String ?? ""
                            Global.shared.guidedTour25 = guidedTour["guided_tour_25"] as? String ?? ""
                            Global.shared.guidedTour26 = guidedTour["guided_tour_26"] as? String ?? ""
                            Global.shared.guidedTour27 = guidedTour["guided_tour_27"] as? String ?? ""
                            Global.shared.guidedTour28 = guidedTour["guided_tour_28"] as? String ?? ""
                            
                        }
                        
                        if let alerts = dataDict.value(forKey: "alerts") as? NSDictionary {
                            
                            Global.shared.uscedfulMailAlert = alerts["forgot_api_success_message"] as? String ?? ""
                            Global.shared.selectVideoFileAlert = alerts["am101"] as? String ?? ""
                            Global.shared.selectFrontBackFilesAlert = alerts["am102"] as? String ?? ""
                            Global.shared.selectIdProfDocAlert = alerts["am103"] as? String ?? ""
                            Global.shared.paswdDoesntMatchAlert = alerts["am104"] as? String ?? ""
                            Global.shared.sizeLimitOnlyTxtAlert = alerts["am105"] as? String ?? ""
                            Global.shared.isueExpireSameAlert = alerts["am106"] as? String ?? ""
                            Global.shared.duplicateSecrtQuestnsAlert = alerts["am107"] as? String ?? ""
                            Global.shared.answer3QuestnsAlert = alerts["am108"] as? String ?? ""
                            Global.shared.invalidMobileNumberTxtAlert = alerts["am109"] as? String ?? ""
                            Global.shared.invalidEmailTxtAlert = alerts["am110"] as? String ?? ""
                            
                            Global.shared.pendingTrnsctnTxt = alerts["am120"] as? String ?? ""
                            Global.shared.failedTrnsctnTxt = alerts["am119"] as? String ?? ""
                            
                            Global.shared.newPswdConfrmSameTxt = alerts["am121"] as? String ?? ""
                            Global.shared.pswdConfrmSameTxt = alerts["am122"] as? String ?? ""
                            Global.shared.featureAddedSoonTxt = alerts["am123"] as? String ?? ""
                            Global.shared.sessionTimedOutTxt = alerts["am124"] as? String ?? ""
                            
                            Global.shared.sameFileUploadTxt = alerts["am116"] as? String ?? ""
                            
                        }
                        if let validations = dataDict.value(forKey: "form_validations") as? NSDictionary {
                            
                            Global.shared.alreadyExistsTxt = validations["usernameuse"] as? String ?? ""
                            Global.shared.isInvalidTxt = validations["invalidEmailAddress"] as? String ?? ""
                            Global.shared.securityAnswerTxt = validations["security_answer"] as? String ?? ""
                            Global.shared.hasNumber = validations["hasNumber"] as? String ?? ""
                            Global.shared.hasCapitalCase = validations["hasCapitalCase"] as? String ?? ""
                            Global.shared.hasSmallCase = validations["hasSmallCase"] as? String ?? ""
                            Global.shared.hasSpecialCharacters = validations["hasSpecialCharacters"] as? String ?? ""
                            
                            
                            Global.shared.errorTxtRequired = validations["required"] as? String ?? ""
                            Global.shared.minLengthTxtt = validations["minLength"] as? String ?? ""
                            Global.shared.invalidTxt = validations["invalid"] as? String ?? ""
                        }
                        
                        
                        
                        
                        if let userManagment = dataDict.value(forKey: "user_management") as? NSDictionary {
                            
                            
                            if let feedBackScreen = userManagment.value(forKey: "feed_back_screen") as? NSDictionary {
                                
                                
                                Global.shared.feedbckClear = feedBackScreen["clear"] as? String ?? ""
                                Global.shared.feedBckHeader = feedBackScreen["lbl_header"] as? String ?? ""
                                Global.shared.feedbckSubmit = feedBackScreen["submit"] as? String ?? ""
                                Global.shared.feedbckWriteYourFeedback = feedBackScreen["write_your_feedback"] as? String ?? ""
                                Global.shared.feedbckQuery = feedBackScreen["your_query"] as? String ?? ""
                                Global.shared.feedbackName = feedBackScreen["name"] as? String ?? ""
                                Global.shared.feedbackMobile = feedBackScreen["mobile"] as? String ?? ""
                                Global.shared.feedbackEmail = feedBackScreen["email"] as? String ?? ""
                            }
                            
                            //Beneficiary
                            if let adBeneficiary = userManagment.value(forKey: "add_beneficiary_form") as? NSDictionary {
                                
                                Global.shared.profileDetlsTxt = adBeneficiary["header_label1"] as? String ?? ""
                                Global.shared.bankDetlsTxt = adBeneficiary["header_label2"] as? String ?? ""
                                
                                Global.shared.remarksTxtt = adBeneficiary["remarks"] as? String ?? ""
                                Global.shared.mobileNumberBenfTxt = adBeneficiary["mobile"] as? String ?? ""
                                Global.shared.emailIdTxttLbl = adBeneficiary["email"] as? String ?? ""
                                Global.shared.telephneNumbrBenefTxt = adBeneficiary["telephone"] as? String ?? ""
                                Global.shared.nationalityBenefTxt = adBeneficiary["nationality"] as? String ?? ""
                                Global.shared.districtBenefTxt = adBeneficiary["district"] as? String ?? ""
                                
                                Global.shared.benefIdTypeTxtt = adBeneficiary["beneficiaryidtype"] as? String ?? ""
                                Global.shared.accounttypeTxt = adBeneficiary["accounttype"] as? String ?? ""
                                Global.shared.branchAddress1Txtt = adBeneficiary["branchaddress1"] as? String ?? ""
                                Global.shared.branchAddress2Txtt = adBeneficiary["branchaddress2"] as? String ?? ""
                                
                                
                                Global.shared.bankTabTxt = adBeneficiary["bank_name"] as? String ?? ""
                                Global.shared.wuTabTxt = adBeneficiary["wu_name"] as? String ?? ""
                                
                                
                                Global.shared.benSucesSubtitleTxt = adBeneficiary["ben_success"] as? String ?? ""
                                Global.shared.benAdded = adBeneficiary["ben_added"] as? String ?? ""
                                
                                Global.shared.firstNameb = adBeneficiary["firstname"] as? String ?? ""
                                Global.shared.lastNameb = adBeneficiary["lastname"] as? String ?? ""
                                Global.shared.middleNameb = adBeneficiary["middlename"] as? String ?? ""
                                Global.shared.address1b = adBeneficiary["addressline1"] as? String ?? ""
                                Global.shared.address2b = adBeneficiary["addressline2"] as? String ?? ""
                                Global.shared.cityb = adBeneficiary["city"] as? String ?? ""
                                Global.shared.stateb = adBeneficiary["state"] as? String ?? ""
                                Global.shared.postCodeb = adBeneficiary["postcode"] as? String ?? ""
                                Global.shared.countryb = adBeneficiary["country"] as? String ?? ""
                                Global.shared.currencyb = adBeneficiary["currency"] as? String ?? ""
                                Global.shared.mobileb = adBeneficiary["mobile"] as? String ?? ""
                                Global.shared.accountNumberb = adBeneficiary["accountnumber"] as? String ?? ""
                                Global.shared.bankCodeb = adBeneficiary["bankcode"] as? String ?? ""
                                Global.shared.bankNameb = adBeneficiary["bankname"] as? String ?? ""
                                Global.shared.branchCodeb = adBeneficiary["branchcode"] as? String ?? ""
                                Global.shared.branchNameb = adBeneficiary["branchname"] as? String ?? ""
                                Global.shared.ifscCodeb = adBeneficiary["ifsccode"] as? String ?? ""
                                Global.shared.swiftCodeb = adBeneficiary["swiftcode"] as? String ?? ""
                                Global.shared.ibanCodeb = adBeneficiary["ibancode"] as? String ?? ""
                                Global.shared.cnicnob = adBeneficiary["cnicno"] as? String ?? ""
                                
                                Global.shared.AddBenefNationality = adBeneficiary["nationality"] as? String ?? ""
                                Global.shared.AddBenefDistrict = adBeneficiary["district"] as? String ?? ""
                                Global.shared.AddBenefIDType = adBeneficiary["beneficiaryidtype"] as? String ?? ""
                                Global.shared.AddBenefIDNumber = adBeneficiary["beneficiaryidnumber"] as? String ?? ""
                                Global.shared.AddBenefRelationBeneficiary = adBeneficiary["beneficiaryrelation"] as? String ?? ""
                                Global.shared.AddBenefAccountType = adBeneficiary["accounttype"] as? String ?? ""
                                Global.shared.AddBenefBranchAddress1 = adBeneficiary["branchaddress1"] as? String ?? ""
                                Global.shared.AddBenefBranchAddress2 = adBeneficiary["branchaddress2"] as? String ?? ""
                                
                                
                            }
                            
                            //Beneficiary list
                            if let benefList = userManagment.value(forKey: "beneficiary_list") as? NSDictionary {
                                
                                Global.shared.addBeneficiaryTxt = benefList["add_benficiary"] as? String ?? ""
                                Global.shared.editBeneficiryTxt = benefList["edit_beneficiaries"] as? String ?? ""
                                
                                Global.shared.sourceAmntTxtt = benefList["source_amount"] as? String ?? ""
                                Global.shared.targetAmntTxtt = benefList["target_amount"] as? String ?? ""
                                
                                Global.shared.beneficiaryHeader = benefList["benificiary"] as? String ?? ""
                                Global.shared.beneficiriesHeader = benefList["beneficiaries"] as? String ?? ""
                                Global.shared.beneficiaryDetailsHeader = benefList["beneficiary_details"] as? String ?? ""
                                Global.shared.addBenfcryHeader = benefList["add_benficiary"] as? String ?? ""
                                Global.shared.selectBenefType = benefList["select_beneficiary_type"] as? String ?? ""
                                Global.shared.addBank = benefList["bank"] as? String ?? ""
                                Global.shared.addCash = benefList["cash"] as? String ?? ""
                                Global.shared.addWesternUnion = benefList["western_union"] as? String ?? ""
                                Global.shared.sendMoneyTxt = benefList["send_money"] as? String ?? ""
                                Global.shared.benefType = benefList["beneficiary_type"] as? String ?? ""
                                
                                Global.shared.benefListID = benefList["table_id"] as? String ?? ""
                                Global.shared.benefListName = benefList["table_name"] as? String ?? ""
                                Global.shared.benefListCountry = benefList["table_country"] as? String ?? ""
                                Global.shared.benefListMobile = benefList["table_mobile"] as? String ?? ""
                                Global.shared.benefListTransferMoney = benefList["transfer_money"] as? String ?? ""
                                Global.shared.benefListDiscount = benefList["discount"] as? String ?? ""
                                Global.shared.benefListRate = benefList["rate"] as? String ?? ""
                                Global.shared.benefListCommission = benefList["commission"] as? String ?? ""
                                Global.shared.benefListTaxCharges = benefList["tax_charges"] as? String ?? ""
                                Global.shared.benefListNetPayable = benefList["net_payable"] as? String ?? ""
                                Global.shared.benefLisTotalAmount = benefList["total_amount"] as? String ?? ""
                                Global.shared.benefListdetailsName = benefList["details_name"] as? String ?? ""
                                Global.shared.benefLisdetailsBankname = benefList["details_bankname"] as? String ?? ""
                                Global.shared.benefListDetailsAcno = benefList["details_acno"] as? String ?? ""
                                Global.shared.benefListDetailsBranch = benefList["details_branch"] as? String ?? ""
                                Global.shared.benefListDetailsCurrency = benefList["details_currency"] as? String ?? ""
                                Global.shared.benefListDetailsSourceOfIncome = benefList["details_sourceOfIncome"] as? String ?? ""
                                Global.shared.benefListDetailsDisbursalMode = benefList["details_disbursolMode"] as? String ?? ""
                                Global.shared.benefListDetailsPurposename = benefList["details_purposename"] as? String ?? ""
                                Global.shared.benefListDetailsPrincipalAmount = benefList["details_principalamount"] as? String ?? ""
                                Global.shared.benefListDetailsOrigPrincipalAmount = benefList["details_origprincipalamount"] as? String ?? ""
                                
                                Global.shared.favBenfDashboard = benefList["favourite_beneficiaries"] as? String ?? ""
                                
                                
                            }
                            
                            //Rate Calculator
                            if let profileReviewModal = userManagment.value(forKey: "profile_review_modal") as? NSDictionary {
                                Global.shared.profileReviewTitleLbl = profileReviewModal["lbl_header1"] as? String ?? ""
                                Global.shared.profileReviewSubTitleLbl = profileReviewModal["lbl_desc1"] as? String ?? ""
                            }
                            
                            //Rate Calculator
                            if let rateCalculator = userManagment.value(forKey: "rate_calculator_form") as? NSDictionary {
                                
                                Global.shared.youPauOnlyyTxt = rateCalculator["you_pay_only"] as? String ?? ""
                                Global.shared.indicativeRatesTxt = rateCalculator["indicative_rates_only"] as? String ?? ""
                                
                                Global.shared.rateCalculatorHeader = rateCalculator["rate_calculator"] as? String ?? ""
                                Global.shared.youSendTxt = rateCalculator["you_send"] as? String ?? ""
                                Global.shared.theyReceiveTxt = rateCalculator["you_recieve"] as? String ?? ""
                                Global.shared.convertTxt = rateCalculator["convert"] as? String ?? ""
                                Global.shared.transctnSumary = rateCalculator["transaction_summary"] as? String ?? ""
                                Global.shared.amntToBeReceived = rateCalculator["amount_to_be_received"] as? String ?? ""
                                Global.shared.conversnRate = rateCalculator["conversion_rate"] as? String ?? ""
                                Global.shared.lcAmnt = rateCalculator["lc_amount"] as? String ?? ""
                                Global.shared.ratetax = rateCalculator["tax"] as? String ?? ""
                                Global.shared.totalAmntPayable = rateCalculator["total_amount_payable"] as? String ?? ""
                                
                                Global.shared.ratesendReceiveDesc = rateCalculator["send_receive_desc"] as? String ?? ""
                                Global.shared.rateDetails = rateCalculator["rate_details"] as? String ?? ""
                                Global.shared.rateOriginatorAmount = rateCalculator["originator_amount"] as? String ?? ""
                                Global.shared.rateConversationDetails = rateCalculator["conversation_details"] as? String ?? ""
                                Global.shared.rateDestinationAmount = rateCalculator["destination_amount"] as? String ?? ""
                                Global.shared.rateSenderFee = rateCalculator["sender_fee"] as? String ?? ""
                                Global.shared.rateGrossTotalAmount = rateCalculator["gross_total_amount"] as? String ?? ""
                                
                            }
                            
                            //Rate Calculator
                            if let transactions = userManagment.value(forKey: "transactions") as? NSDictionary {
                                
                                Global.shared.transctionByPeriodTxt = transactions["transaction_by_period"] as? String ?? ""
                                Global.shared.transactionByDateTxt = transactions["transaction_by_date"] as? String ?? ""
                                
                                
                                Global.shared.transactionsShareVoucherTxt = transactions["share_voucher"] as? String ?? ""
                                Global.shared.transactionsTransferTxt = transactions["transfer"] as? String ?? ""
                                Global.shared.transactionsModeOfTrnsfrTxt = transactions["mode_of_transfer"] as? String ?? ""
                                
                                Global.shared.transactionsList = transactions["transactions_list"] as? String ?? ""
                                Global.shared.transactionsFilterBy = transactions["filter_by"] as? String ?? ""
                                Global.shared.transactionsFromDate = transactions["from_date"] as? String ?? ""
                                Global.shared.transactionsToDate = transactions["to_date"] as? String ?? ""
                                Global.shared.transactionsPeriod = transactions["transaction_period"] as? String ?? ""
                                Global.shared.transactionsApply = transactions["apply"] as? String ?? ""
                                Global.shared.transactionsPDFDownload = transactions["pdf_download"] as? String ?? ""
                                Global.shared.transactionsExcelDownload = transactions["xls_download"] as? String ?? ""
                                Global.shared.transactionsRefID = transactions["table_refId"] as? String ?? ""
                                Global.shared.transactionsBeneficiaryName = transactions["table_benName"] as? String ?? ""
                                Global.shared.transactionsStatus = transactions["table_status"] as? String ?? ""
                                Global.shared.transactionsSourceCurrency = transactions["table_sourceOfIncome"] as? String ?? ""
                                Global.shared.transactionsTargetCurrency = transactions["table_targentCurrency"] as? String ?? ""
                                Global.shared.transactionsTableTotalAmount = transactions["table_totalAmount"] as? String ?? ""
                                Global.shared.transactionsCreatedDate = transactions["table_createdDate"] as? String ?? ""
                                Global.shared.transactionsTxnRef = transactions["details_txnref"] as? String ?? ""
                                Global.shared.transactionsRate = transactions["details_rate"] as? String ?? ""
                                Global.shared.transactionsCommission = transactions["details_commission"] as? String ?? ""
                                Global.shared.transactionsFCAmount = transactions["details_fcAmount"] as? String ?? ""
                                Global.shared.transactionsLCAmount = transactions["details_lcAmount"] as? String ?? ""
                                Global.shared.transactionsCurrency = transactions["details_currency"] as? String ?? ""
                                Global.shared.transactionsDetailsTotalAmount = transactions["details_totalAmount"] as? String ?? ""
                                Global.shared.transactionsDownloadVoucher = transactions["download_voucher"] as? String ?? ""
                                Global.shared.transactionsQuickSend = transactions["quick_send"] as? String ?? ""
                                
                                Global.shared.recentTransctnsLbl = transactions["recent_transactions"] as? String ?? ""
                            }
                            
                            //login screen related
                            if let loginScreen = userManagment.value(forKey: "login_screen") as? NSDictionary {
                                
                                Global.shared.securityimglblOne = loginScreen["securityimglbl_1"] as? String ?? ""
                                Global.shared.securityimglblTwo = loginScreen["securityimglbl_2"] as? String ?? ""
                                Global.shared.securityimglblThree = loginScreen["securityimglbl_3"] as? String ?? ""
                                
                                
                                Global.shared.loginHeaderTxt = loginScreen["lbl_header"] as? String ?? ""
                                Global.shared.userNameTxt = loginScreen["username"] as? String ?? ""
                                Global.shared.paswdText = loginScreen["password"] as? String ?? ""
                                Global.shared.forgotUserNameTxt = loginScreen["label1"] as? String ?? ""
                                Global.shared.forgotPswdTxt = loginScreen["label2"] as? String ?? ""
                                Global.shared.tryAnotherQuestnTxt = loginScreen["try_another_question"] as? String ?? ""
                                Global.shared.verifySecurityImg = loginScreen["securityimglbl"] as? String ?? ""
                                Global.shared.verifyProceedAfterLogin = loginScreen["verify_and_proceed"] as? String ?? ""
                                Global.shared.loginWithFaceIDTxt = loginScreen["login_with_faceid"] as? String ?? ""
                                
                                Global.shared.loginChat = loginScreen["login_chat"] as? String ?? ""
                                Global.shared.ourBranches = loginScreen["login_branches"] as? String ?? ""
                                self.assigningLoginLabels()
                            }
                            
                            if let forgotUsername = userManagment.value(forKey: "forgot_username") as? NSDictionary {
                                Global.shared.confirmCivildIdTxt = forgotUsername["lbl_header1"] as? String ?? ""
                            }
                            
                            if let forgotPaswd = userManagment.value(forKey: "forgot_password") as? NSDictionary {
                                Global.shared.confrmUserToResetPaswd = forgotPaswd["lbl_header1"] as? String ?? ""
                            }
                            
                            //existing customer related
                            if let accountsetup = userManagment.value(forKey: "account_setup") as? NSDictionary {
                                
                                Global.shared.existingTopHeaderTxt = accountsetup["lbl_header"] as? String ?? ""
                                Global.shared.existingCustomrTxt = accountsetup["label1"] as? String ?? ""
                                let setUpOnline = accountsetup["label2"] as? String ?? ""
                               // let acnt = accountsetup["label3"] as? String ?? ""
                                Global.shared.setUpOnlineTxt = setUpOnline
                                Global.shared.newCustomerTxt = accountsetup["label4"] as? String ?? ""
                                Global.shared.registerWithAlMTxt = accountsetup["label5"] as? String ?? ""
                                
                            }
                            //existing accntSetup
                            if let existaccntsetup = userManagment.value(forKey: "exist_account_setup") as? NSDictionary {
                                
                                Global.shared.firstSecndTabHeaderTxt = existaccntsetup["lbl_header1"] as? String ?? ""
                                Global.shared.civilIdTxt = existaccntsetup["civil_id"] as? String ?? ""
                                Global.shared.mobileNumberTxt = existaccntsetup["mobile_number"] as? String ?? ""
                                Global.shared.emailIdTxt = existaccntsetup["email"] as? String ?? ""
                                Global.shared.firstNameTxt = existaccntsetup["first_name"] as? String ?? ""
                                Global.shared.lastNameTxt = existaccntsetup["last_name"] as? String ?? ""
                                Global.shared.middleNameTxt = existaccntsetup["middle_name"] as? String ?? ""
                                Global.shared.thirdTabHeaderTxt = existaccntsetup["lbl_header3"] as? String ?? ""
                                Global.shared.selectSecureImgTxt = existaccntsetup["lbl_header4"] as? String ?? ""
                                Global.shared.verifyBtnTxt = existaccntsetup["verify_btn"] as? String ?? ""
                                Global.shared.continueBtnTxt = existaccntsetup["looks_btn"] as? String ?? ""
                                
                                
                            }
                            //new accntSetup
                            if let newaccntsetup = userManagment.value(forKey: "new_account_setup") as? NSDictionary {
                                
                                Global.shared.editProfileTxt = newaccntsetup["edit_profile"] as? String ?? ""
                                Global.shared.employmntDetlsTxt = newaccntsetup["lbl_header9"] as? String ?? ""
                                Global.shared.identityDetlsTxt = newaccntsetup["lbl_header7"] as? String ?? ""
                                
                                Global.shared.uploadProfDocmntsTxt = newaccntsetup["upload_proof_documents"] as? String ?? ""
                                Global.shared.seeSampleVideoTxt = newaccntsetup["text2"] as? String ?? ""
                                
                                Global.shared.persnalDetlsLbl = newaccntsetup["lbl_header2"] as? String ?? ""
                                Global.shared.addresDetlsLbl = newaccntsetup["lbl_header8"] as? String ?? ""
                                Global.shared.remitanceDetlsLbl = newaccntsetup["lbl_header10"] as? String ?? ""
                                Global.shared.trnsctnReltdDetlsLbl = newaccntsetup["lbl_header11"] as? String ?? ""
                                
                                
                                
                                Global.shared.enableBiometricTxt = newaccntsetup["enable_biometric"] as? String ?? ""
                                
                                Global.shared.newSelectVideoTxt = newaccntsetup["text7"] as? String ?? ""
                                Global.shared.newPreviewVideoTxt = newaccntsetup["text8"] as? String ?? ""
                                Global.shared.newUplodFrntImgeTxt = newaccntsetup["upload_front_image"] as? String ?? ""
                                Global.shared.newUplodBckImgTxt = newaccntsetup["upload_back_image"] as? String ?? ""
                                Global.shared.newRecordVideoTxt = newaccntsetup["text1"] as? String ?? ""
                                
                                Global.shared.newCustomerHeader = newaccntsetup["lbl_header6"] as? String ?? ""
                                Global.shared.identityTabNameTxt = newaccntsetup["lbl_tab1"] as? String ?? ""
                                Global.shared.personalTabNameTxt = newaccntsetup["lbl_tab2"] as? String ?? ""
                                Global.shared.employmentTabNameTxt = newaccntsetup["lbl_tab3"] as? String ?? ""
                                Global.shared.remitanceTabNameTxt = newaccntsetup["lbl_tab4"] as? String ?? ""
                                
                                Global.shared.newCidentityTypeTxt = newaccntsetup["civil_id_type"] as? String ?? ""
                                Global.shared.newCidentityNumberTxt = newaccntsetup["civil_id_number"] as? String ?? ""
                                Global.shared.newCIdIssueDateTxt = newaccntsetup["civil_id_issue_date"] as? String ?? ""
                                Global.shared.newCIdExpiryDateTxt = newaccntsetup["civil_id_expiry_date"] as? String ?? ""
                                Global.shared.newCCountryOfIsueTxt = newaccntsetup["civil_id_countryofissue"] as? String ?? ""
                                Global.shared.newCPlaceOfIsueTxt = newaccntsetup["civil_id_placeofissue"] as? String ?? ""
                                
                                Global.shared.persnalSalutatnTxt = newaccntsetup["salutation"] as? String ?? ""
                                Global.shared.persnalFirstNameTxt = newaccntsetup["firstname"] as? String ?? ""
                                Global.shared.persnalmiddleNameTxt = newaccntsetup["middlename"] as? String ?? ""
                                Global.shared.persnalLastNameTxt = newaccntsetup["lastname"] as? String ?? ""
                                Global.shared.persnalGenderTxt = newaccntsetup["gender"] as? String ?? ""
                                Global.shared.persnalNationlityTxt = newaccntsetup["nationality"] as? String ?? ""
                                Global.shared.persnalDobTxt = newaccntsetup["dob"] as? String ?? ""
                                Global.shared.persnalPobTxt = newaccntsetup["birthplace"] as? String ?? ""
                                Global.shared.persnalMobileNumberTxt = newaccntsetup["mobile_number"] as? String ?? ""
                                Global.shared.persnalTelephnTxt = newaccntsetup["telephone"] as? String ?? ""
                                Global.shared.persnalEmailIdTxt = newaccntsetup["email"] as? String ?? ""
                                Global.shared.persnalSecndryEmailTxt = newaccntsetup["secondary_email"] as? String ?? ""
                                Global.shared.persnalMaleTxt = newaccntsetup["gender_lbl1"] as? String ?? ""
                                Global.shared.persnalFemaleTxt = newaccntsetup["gender_lbl2"] as? String ?? ""
                                Global.shared.persnalNeutralTxt = newaccntsetup["gender_lbl3"] as? String ?? ""
                                
                                Global.shared.acntResidentTypeTxt = newaccntsetup["resident_type"] as? String ?? ""
                                Global.shared.acntFlatTxt = newaccntsetup["flat"] as? String ?? ""
                                Global.shared.acntFloorTxt = newaccntsetup["floor"] as? String ?? ""
                                Global.shared.acntBuildingTxt = newaccntsetup["building"] as? String ?? ""
                                Global.shared.acntGadaTxt = newaccntsetup["gada"] as? String ?? ""
                                Global.shared.acntStreetTxt = newaccntsetup["street"] as? String ?? ""
                                Global.shared.acntblockTxt = newaccntsetup["block"] as? String ?? ""
                                Global.shared.acntAreaCityTxt = newaccntsetup["area_city"] as? String ?? ""
                                Global.shared.acntZipcodeTxt = newaccntsetup["zip_code"] as? String ?? ""
                                Global.shared.acntStateTxt = newaccntsetup["state"] as? String ?? ""
                                Global.shared.acntCountryTxt = newaccntsetup["country_code"] as? String ?? ""
                                
                                Global.shared.acntRemiterCategryTxt = newaccntsetup["rem_category"] as? String ?? ""
                                Global.shared.acntRemitIndividualTxt = newaccntsetup["rem_category1"] as? String ?? ""
                                Global.shared.acntRemitPoliticalTxt = newaccntsetup["rem_category2"] as? String ?? ""
                                
                                Global.shared.acntPoliticalScopeTxt = newaccntsetup["pepLocalORInternational"] as? String ?? ""
                                Global.shared.acntPoliticalLocalTxt = newaccntsetup["pep_lbl1_val1"] as? String ?? ""
                                Global.shared.acntPoliticalInterntnlTxt = newaccntsetup["pep_lbl1_val2"] as? String ?? ""
                                
                                Global.shared.acntAreYouRelativeTxt = newaccntsetup["pepRelative"] as? String ?? ""
                                Global.shared.acntRelativeYesTxt = newaccntsetup["pepRelative_val1"] as? String ?? ""
                                Global.shared.acntRelativeNoTxt = newaccntsetup["pepRelative_val2"] as? String ?? ""
                                
                                Global.shared.acntDegreOfReltnSHipTxt = newaccntsetup["pepDegreeOfRelationship"] as? String ?? ""
                                Global.shared.acntDegreCloseTxt = newaccntsetup["pep_lbl4_val1"] as? String ?? ""
                                Global.shared.acntDegreDistantTxt = newaccntsetup["pep_lbl4_val2"] as? String ?? ""
                                Global.shared.acntDegreNeutralsTxt = newaccntsetup["pep_lbl4_val3"] as? String ?? ""
                                Global.shared.pepPositionTxt = newaccntsetup["pepPosition"] as? String ?? ""
                                
                                
                                Global.shared.ocuptnTxt = newaccntsetup["employer_occupation"] as? String ?? ""
                                Global.shared.employNameTxt = newaccntsetup["employer_name"] as? String ?? ""
                                Global.shared.employeIdTxt = newaccntsetup["employee_id"] as? String ?? ""
                                Global.shared.employLoctn = newaccntsetup["employer_location"] as? String ?? ""
                                Global.shared.designtnTxt = newaccntsetup["employer_designation"] as? String ?? ""
                                Global.shared.salaryEmploy = newaccntsetup["salary"] as? String ?? ""
                                Global.shared.otherIncome = newaccntsetup["other_income"] as? String ?? ""
                                
                                Global.shared.remitTypeOfServiceTxt = newaccntsetup["type_of_service"] as? String ?? ""
                                Global.shared.remitPurposeTransferTxt = newaccntsetup["purpose_of_transfer"] as? String ?? ""
                                Global.shared.remitExpctedPerMonthTxt = newaccntsetup["trans_expected_per_month"] as? String ?? ""
                                Global.shared.remitExpctedPerYearTxt = newaccntsetup["trans_expected_per_year"] as? String ?? ""
                                Global.shared.remitTrnsctnValPerMonthTxt = newaccntsetup["trans_value_per_month"] as? String ?? ""
                                Global.shared.remitTrnsctnValPerYearTxt = newaccntsetup["trans_value_per_year"] as? String ?? ""
                                Global.shared.remitSourceOfIncomeTxt = newaccntsetup["source_of_income"] as? String ?? ""
                                Global.shared.remitAvgYearlyIncomeTxt = newaccntsetup["avg_year_income"] as? String ?? ""
                                
                                
                                Global.shared.preferLangTxt = newaccntsetup["pref_language"] as? String ?? ""
                                Global.shared.countryIsueDrpText = newaccntsetup["civil_id_countryofissue_val"] as? String ?? ""
                                Global.shared.placeIsueDrpTetx = newaccntsetup["civil_id_placeofissue_val"] as? String ?? ""
                                Global.shared.stateDrpTxt = newaccntsetup["source_of_income_lbl_val1"] as? String ?? ""
                                Global.shared.purposeOfTrnsferDrpTxt = newaccntsetup["purpose_of_transfer_lbl_val1"] as? String ?? ""
                                Global.shared.typeOfServiceDrpTxt = newaccntsetup["type_of_service_lbl_val1"] as? String ?? ""
                                Global.shared.sourceOfIncomeDrpTxt = newaccntsetup["source_of_income_lbl_val1"] as? String ?? ""
                                Global.shared.occuptnDrpTxt = newaccntsetup["occupation_lbl_val1"] as? String ?? ""
                                Global.shared.recordSelfieVideoTxt = newaccntsetup["text1"] as? String ?? ""
                                
                                Global.shared.transExpectedCount = newaccntsetup["trans_expected_count"] as? String ?? ""
                                Global.shared.transExpectedCountMy = newaccntsetup["trans_expected_count_my"] as? String ?? ""
                                Global.shared.transExpectedValue = newaccntsetup["trans_expected_value"] as? String ?? ""
                                Global.shared.transExpectedValueMy = newaccntsetup["trans_expected_value_my"] as? String ?? ""
                                
                                
                                
                            }
                            //Profile
                            if let profile = userManagment.value(forKey: "profile") as? NSDictionary {
                                
                                Global.shared.faceIdLockTxt = profile["faceid_lock"] as? String ?? ""
                                Global.shared.profileTab = profile["profile_tab"] as? String ?? ""
                                
                            }
                            
                            //Profile
                            if let dashboard = userManagment.value(forKey: "dashboard") as? NSDictionary {
                                
                                Global.shared.transactnInsight = dashboard["transacton_insights"] as? String ?? ""
                                Global.shared.ratePaternDashboard = dashboard["rate_pattern_header"] as? String ?? ""
                                Global.shared.setAlertDashboard = dashboard["set_alert"] as? String ?? ""
                                
                            }
                            
                            //verify otp popup
                            if let verifyOtpPopUp = userManagment.value(forKey: "verify_otp_modal") as? NSDictionary {
                                
                                Global.shared.verificationHeaderTxt = verifyOtpPopUp["lbl_header1"] as? String ?? ""
                                Global.shared.verfiCtnSubTitleTxt = verifyOtpPopUp["lbl_desc1"] as? String ?? ""
                                Global.shared.codeExpiresTxt = verifyOtpPopUp["expire_tag"] as? String ?? ""
                                
                                
                            }
                            
                            //verify account changePswd
                            if let changePswdScreen = userManagment.value(forKey: "change_password_screen") as? NSDictionary {
                                
                                Global.shared.verifyOnlineHeaderTxt = changePswdScreen["lbl_header"] as? String ?? ""
                                Global.shared.verifyUsernameTxt = changePswdScreen["username"] as? String ?? ""
                                Global.shared.verifyPaswdTxt = changePswdScreen["password"] as? String ?? ""
                                Global.shared.verifyConfirmPswdTxt = changePswdScreen["confirm_password"] as? String ?? ""
                                Global.shared.changeOldPassword = changePswdScreen["old_password"] as? String ?? ""
                                Global.shared.changeNewPassword = changePswdScreen["new_password"] as? String ?? ""
                                
                            }
                            
                        }
                    }
                    
                    
                }
                
            }
            else
            {
                print(errorString ?? "abc")
                self.removeSpinner()
                let finalError = errorString?.components(separatedBy: ":")
                if finalError?.count == 2
                {
                   let alert = ViewControllerManager.displayAlert(message: finalError?[1] ?? "", title:APPLICATIONNAME)
                    self.present(alert, animated: true, completion: nil)
                }
                else
                {
                    let alert = ViewControllerManager.displayAlert(message: errorString ?? "", title:APPLICATIONNAME)
                    self.present(alert, animated: true, completion: nil)
                }
                
                
            }
        }
        
    }
    
    func assigningLoginLabels() {
        if LocalizationSystem.sharedInstance.getLanguage() == "en"{
            langugeChangeBtnOtlt.setTitle("English", for: .normal)
        }
        else {
            langugeChangeBtnOtlt.setTitle("عربى", for: .normal)
        }
        
        
        //     loginToAccntLbl.text = Global.shared.loginHeaderTxt
        userNameLbl.text = Global.shared.userNameTxt + "*"
        paswdNameLbl.text =  Global.shared.paswdText + "*"
        loginBtnOtlt.setTitle(Global.shared.loginBtnTxt, for: .normal)
        signupBtnOtlt.setTitle(Global.shared.signUpBtnTxt, for: .normal)
        //   loginBtnOtlt.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "login_text", comment: ""), for: .normal)
        //   orBtnOtlt.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "or_text", comment: "")
        //   signupBtnOtlt.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "signup_text", comment: ""), for: .normal)
        
        forgotUsernameOtlt.makeButtonFitToContent(buttonTitle: forgotUsernameOtlt)
        forgotPswdOtlt.makeButtonFitToContent(buttonTitle: forgotPswdOtlt)
        
        forgotUsernameOtlt.setTitle(Global.shared.forgotUserNameTxt, for: .normal)
        forgotPswdOtlt.setTitle(Global.shared.forgotPswdTxt, for: .normal)
        aLmuzinLbl.textAlignment = .left
        aLmuzinLbl.text = Global.shared.almuzinBottomTxt
        userErrorText.text = Global.shared.userNameTxt + " " + Global.shared.errorTxtRequired.lowercased()
        paswdErrorText.text = Global.shared.paswdText + " " + Global.shared.errorTxtRequired.lowercased()
        //  branchLoctorBtnOtlt.setTitle(Global.shared.branchLoctrtLoginTxt, for: .normal)
        //   faqBtnOtlt.setTitle(Global.shared.faqTxt, for: .normal)
        loginWithFaceIdLbl.text = Global.shared.loginWithFaceIDTxt
        //   termsNconditionsBtnOtlt.setTitle("T&C", for: .normal)
        
        
        
        self.termsAndConditionsLbl.text =  Global.shared.termsConditionBtnTxt
        self.faqLbl.text = Global.shared.faqTxt
        self.ourBranchesLbl.text = Global.shared.ourBranches
        self.rateCalculatorLbl.text = Global.shared.rateCalculatorHeader
        self.downContactUsLbl.text = Global.shared.menuContact
        
        self.removeSpinner()
        
    }
    
    
    
    
    
    
    
    func jsonToString(json: AnyObject){
        do {
            let data1 =  try JSONSerialization.data(withJSONObject: json, options: JSONSerialization.WritingOptions.prettyPrinted) // first of all convert json to the data
            let convertedString = String(data: data1, encoding: String.Encoding.utf8) // the data will be converted to the string
            print(convertedString ?? "defaultvalue")
        } catch let myJSONError {
            print(myJSONError)
        }
        
    }
    
    // MARK: For login
    func loginToAccount() {
        
        
        let paramaterPasing: [String:Any] = ["username": userTxtField.text ?? "",
                                             "password": pswdTxtField.text ?? ""]
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        NetWorkDataManager.sharedInstance.loginImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { [self] resonseTal , errorString in
            self.loginBtnOtlt.isEnabled = true
            if errorString == nil
            {
                self.loginBtnOtlt.isEnabled = true
                
                Global.shared.biometricNormalLogin = "Login"
                Global.shared.afterLoginSecurityImg = resonseTal?["securityImage"] as? String ?? ""
                Global.shared.afterLoginRegistrtnId = resonseTal?["registrationId"] as? String ?? ""
                
                if let securityQuestionsData = resonseTal?.value(forKey: "securityQuestionsList") as? NSArray {
                    if let securityQuestion = securityQuestionsData.value(forKey: "securityQuestion") as? [String] {
                        Global.shared.afterLoginSecurityQuestnsList = securityQuestion
                    }
                    if let securityQuestionId = securityQuestionsData.value(forKey: "securityQuestionId") as? [Int] {
                        Global.shared.afterLoginSecurityIdList = securityQuestionId
                        Global.shared.afterLoginSecurityIdListString = Global.shared.afterLoginSecurityIdList.map(String.init)
                    }
                    
                }
                
                if let statusCode = resonseTal?.value(forKey: "statusCodes") as? Int {
                    
                    if(statusCode == 200) {
                        
                        
                        Global.shared.afterLoginUserName = self.userTxtField.text
                        Global.shared.afterLoginPaswd = self.pswdTxtField.text
                        self.pushViewController(controller: AfterLoginVerificationVc.initiateController())
                    }
                    
                    else {
                        let statusMsg = resonseTal?.value(forKey: "statusMessage") as? String ?? ""
                        let mesageCode = resonseTal?.value(forKey: "messageCode") as? String ?? statusMsg
                        self.removeSpinner()
                        let alert = ViewControllerManager.displayAlert(message: Global.shared.messageCodeType(text: mesageCode), title:APPLICATIONNAME)
                        self.present(alert, animated: true, completion: nil)
                        
                    }
                    
                }
                
            }
            
            else
            {
                self.loginBtnOtlt.isEnabled = true
                print(errorString!)
                self.removeSpinner()
                let finalError = errorString?.components(separatedBy: ":")
                if finalError?.count == 2
                {
                   let alert = ViewControllerManager.displayAlert(message: finalError?[1] ?? "", title:APPLICATIONNAME)
                    self.present(alert, animated: true, completion: nil)
                }
                else
                {
                    let alert = ViewControllerManager.displayAlert(message: errorString ?? "", title:APPLICATIONNAME)
                    self.present(alert, animated: true, completion: nil)
                }
//                let alert = ViewControllerManager.displayAlert(message: finalError?[1] ?? "", title:APPLICATIONNAME)
//                self.present(alert, animated: true, completion: nil)
                
            }
        }
        
    }
    
    
    
    @IBAction func termsCondtnBtnActn(_ sender: Any) {
        //TermsAndConditionsVc
        self.pushViewController(controller: TermsAndConditionsVc.initiateController())
        //  authenticationWithTouchID()
        // openGoogleMaps()
        //   ChartsVc
    }
    
    @IBAction func faqBtnActn(_ sender: Any) {
        self.pushViewController(controller: FaqVc.initiateController())
    }
    
    // MARK: Configuarations
    func downloadAccountConfig() {
        
        let paramaterPasing: [String:Any] = ["languageCode":LocalizationSystem.sharedInstance.getLanguage()]
        
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        NetWorkDataManager.sharedInstance.accountConfigsImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            
            if errorString == nil
            {
                
                if let allLanguages = resonseTal?.value(forKey: "allLanguages") as? String {
                    let newObj = Global.shared.convertToAryDictionary(text: allLanguages)
                    for dataObj in newObj! {
                        if let name = dataObj["name"] as? String{
                            //    self.languageNames.append(name)
                            Global.shared.languageNames.append(name)
                            
                        }
                        
                        if let valuess = dataObj["value"] as? String {
                            self.languageCodes.append(valuess)
                            Global.shared.languageValues.append(valuess)
                        }
                        
                    }
                }
                
                
                if let identityTypes = resonseTal?.value(forKey: "identityTypes") as? String {
                    let newObj = Global.shared.convertToAryDictionary(text: identityTypes)
                    for dataObj in newObj! {
                        if let name = dataObj["name"] as? String{
                            Global.shared.civilIdNames.append(name)
                        }
                        if let type = dataObj["value"] as? String{
                            Global.shared.identityTypes.append(type)
                        }
                    }
                }
                
                
                if let residentTypes = resonseTal?.value(forKey: "residentTypes") as? String {
                    let newObj = Global.shared.convertToAryDictionary(text: residentTypes)
                    for dataObj in newObj! {
                        if let name = dataObj["name"] as? String{
                            Global.shared.residentNames.append(name)
                        }
                        if let value = dataObj["value"] as? String{
                            Global.shared.residentValues.append(value)
                        }
                        
                    }
                }
                if let salutations = resonseTal?.value(forKey: "salutations") as? String {
                    let newObj = Global.shared.convertToAryDictionary(text: salutations)
                    for dataObj in newObj! {
                        if let name = dataObj["name"] as? String{
                            Global.shared.salutationNames.append(name)
                        }
                        if let value = dataObj["value"] as? String{
                            Global.shared.salutationValues.append(value)
                        }
                        
                    }
                }
                
                Global.shared.sampleVideoPathhhh = resonseTal?.value(forKey: "sampleVideoPath") as? String  ?? "https://almuzainiux.s3.ap-south-1.amazonaws.com/kycsample.mp4"
                if let occupations = resonseTal?.value(forKey: "occupations") as? String {
                    let newObj = Global.shared.convertToAryDictionary(text: occupations)
                    for dataObj in newObj! {
                        if let name = dataObj["name"] as? String{
                            Global.shared.occupationNames.append(name)
                        }
                        if let value = dataObj["value"] as? String{
                            Global.shared.occupationValues.append(value)
                        }
                        
                    }
                }
                if let serviceTypes = resonseTal?.value(forKey: "serviceTypes") as? String {
                    let newObj = Global.shared.convertToAryDictionary(text: serviceTypes)
                    for dataObj in newObj! {
                        if let name = dataObj["name"] as? String{
                            Global.shared.typeServiceNames.append(name)
                        }
                        if let value = dataObj["value"] as? String{
                            Global.shared.typeServiceValues.append(value)
                        }
                        
                    }
                }
                if let purposeOfTransfer = resonseTal?.value(forKey: "purposeOfTransfer") as? String {
                    let newObj = Global.shared.convertToAryDictionary(text: purposeOfTransfer)
                    for dataObj in newObj! {
                        if let name = dataObj["name"] as? String{
                            Global.shared.purposeTransferNames.append(name)
                        }
                        if let value = dataObj["value"] as? String{
                            Global.shared.purposeTransferValues.append(value)
                        }
                        
                    }
                }
                if let sourceOfIncome = resonseTal?.value(forKey: "sourceOfIncome") as? String {
                    let newObj = Global.shared.convertToAryDictionary(text: sourceOfIncome)
                    for dataObj in newObj! {
                        if let name = dataObj["name"] as? String{
                            Global.shared.sourceIncomeNames.append(name)
                        }
                        if let value = dataObj["value"] as? String{
                            Global.shared.sourceIncomeValues.append(value)
                        }
                        
                    }
                }
                
                if let expectedTxnTypes = resonseTal?.value(forKey: "expectedTxnTypes") as? String {
                    let newObj = Global.shared.convertToAryDictionary(text: expectedTxnTypes)
                    for dataObj in newObj! {
                        if let name = dataObj["name"] as? String{
                            Global.shared.expectedTxnTypesNames.append(name)
                        }
                        if let value = dataObj["value"] as? String{
                            Global.shared.expectedTxnTypesValues.append(value)
                        }
                        
                    }
                }
                
                
                for i in 0..<self.languageNames.count {
                    self.pickerResponseLanguge.append(["value": self.languageNames[i], "display": self.languageNames[i]])
                }
                
                for i in 0..<Global.shared.civilIdNames.count {
                    Global.shared.pickerResponseCivilId.append(["value": Global.shared.civilIdNames[i], "display": Global.shared.civilIdNames[i]])
                }
                
                /*     for i in 0..<Global.shared.countryNameData.count {
                 Global.shared.pickerResponseCountryData.append(["value": Global.shared.countryNameData[i], "display": Global.shared.countryNameData[i]])
                 }*/
                for i in 0..<Global.shared.languageNames.count {
                    Global.shared.pickerResponseLanguge.append(["value": Global.shared.languageNames[i], "display": Global.shared.languageNames[i]])
                }
                for i in 0..<Global.shared.residentNames.count {
                    Global.shared.pickerResponseResident.append(["value": Global.shared.residentNames[i], "display": Global.shared.residentNames[i]])
                }
                for i in 0..<Global.shared.salutationNames.count {
                    Global.shared.pickerResponseSalutation.append(["value": Global.shared.salutationNames[i], "display": Global.shared.salutationNames[i]])
                }
                for i in 0..<Global.shared.occupationNames.count {
                    Global.shared.pickerResponseOccupation.append(["value": Global.shared.occupationNames[i], "display": Global.shared.occupationNames[i]])
                }
                for i in 0..<Global.shared.typeServiceNames.count {
                    Global.shared.pickerResponseTypeService.append(["value": Global.shared.typeServiceNames[i], "display": Global.shared.typeServiceNames[i]])
                }
                for i in 0..<Global.shared.purposeTransferNames.count {
                    Global.shared.pickerResponsePurposeTransfer.append(["value": Global.shared.purposeTransferNames[i], "display": Global.shared.purposeTransferNames[i]])
                }
                for i in 0..<Global.shared.sourceIncomeNames.count {
                    Global.shared.pickerResponseSourceIncome.append(["value": Global.shared.sourceIncomeNames[i], "display": Global.shared.sourceIncomeNames[i]])
                }
                for i in 0..<Global.shared.expectedTxnTypesNames.count {
                    Global.shared.pickerResponseexpectedTxnTypes.append(["value": Global.shared.expectedTxnTypesNames[i], "display": Global.shared.expectedTxnTypesNames[i]])
                }
                if let fieldLengths = resonseTal?.value(forKey: "fieldLengths") as? String {
                    let newObj = Global.shared.convertToDictionary(text: fieldLengths)
                    if let dataDict = newObj as NSDictionary? {
                        
                        if let register = dataDict.value(forKey: "register") as? NSDictionary {
                            if let usernameF = register.value(forKey: "Username") as? NSDictionary {
                                
                                
                                Global.shared.username_is_required = usernameF["is_required"] as? Bool ?? false
                                Global.shared.username_field_accept = usernameF["field_accept"] as? String ?? "any"
                                Global.shared.username_max_length = usernameF["max_length"] as? Int ?? 0
                                Global.shared.username_min_length = usernameF["min_length"] as? Int ?? 0
                                Global.shared.username_toolTipTxt = usernameF["tooltip"] as? String ?? "any"
                                
                                
                            }
                            if let passwordData = register.value(forKey: "Password") as? NSDictionary {
                                
                                Global.shared.password_is_required = passwordData["is_required"] as? Bool ?? false
                                Global.shared.password_field_accept = passwordData["field_accept"] as? String ?? "any"
                                Global.shared.password_max_length = passwordData["max_length"] as? Int ?? 0
                                Global.shared.password_min_length = passwordData["min_length"] as? Int ?? 0
                                Global.shared.toolTipTxt = passwordData["tooltip"] as? String ?? "Password must contains min 8, max 20, one number, one special character and have a mixture of uppercase and lowercase letters."
                            }
                        }
                        if let existingUser = dataDict.value(forKey: "exist_account_setup") as? NSDictionary {
                            if let civilID = existingUser.value(forKey: "CivilID") as? NSDictionary {
                                
                                Global.shared.exist_civilID_is_required = civilID["is_required"] as? Bool ?? false
                                Global.shared.exist_civilID_field_accept = civilID["field_accept"] as? String ?? "any"
                                Global.shared.exist_civilID_max_length = civilID["max_length"] as? Int ?? 0
                                Global.shared.exist_civilID_min_length = civilID["min_length"] as? Int ?? 0
                                
                            }
                            if let mobile = existingUser.value(forKey: "Mobile") as? NSDictionary {
                                
                                Global.shared.exist_mobile_is_required = mobile["is_required"] as? Bool ?? false
                                Global.shared.exist_mobile_field_accept = mobile["field_accept"] as? String ?? "any"
                                Global.shared.exist_mobile_max_length = mobile["max_length"] as? Int ?? 0
                                Global.shared.exist_mobile_min_length = mobile["min_length"] as? Int ?? 0
                                
                            }
                            if let emailID = existingUser.value(forKey: "EmailID") as? NSDictionary {
                                Global.shared.exist_emailID_is_required = emailID["is_required"] as? Bool ?? false
                                Global.shared.exist_emailID_field_accept = emailID["field_accept"] as? String ?? "any"
                                Global.shared.exist_emailID_max_length = emailID["max_length"] as? Int ?? 0
                                Global.shared.exist_emailID_min_length = emailID["min_length"] as? Int ?? 0
                                
                            }
                            if let firstName = existingUser.value(forKey: "FirstName") as? NSDictionary {
                                Global.shared.exist_firstName_is_required = firstName["is_required"] as? Bool ?? false
                                Global.shared.exist_firstName_field_accept = firstName["field_accept"] as? String ?? "any"
                                Global.shared.exist_firstName_max_length = firstName["max_length"] as? Int ?? 0
                                Global.shared.exist_firstName_min_length = firstName["min_length"] as? Int ?? 0
                                
                            }
                            if let lastName = existingUser.value(forKey: "LastName") as? NSDictionary {
                                Global.shared.exist_lastName_is_required = lastName["is_required"] as? Bool ?? false
                                Global.shared.exist_lastName_field_accept = lastName["field_accept"] as? String ?? "any"
                                Global.shared.exist_lastName_max_length = lastName["max_length"] as? Int ?? 0
                                Global.shared.exist_lastName_min_length = lastName["min_length"] as? Int ?? 0
                                
                            }
                            if let middleName = existingUser.value(forKey: "MiddleName") as? NSDictionary {
                                Global.shared.exist_middleName_is_required = middleName["is_required"] as? Bool ?? false
                                Global.shared.exist_middleName_field_accept = middleName["field_accept"] as? String ?? "any"
                                Global.shared.exist_middleName_max_length = middleName["max_length"] as? Int ?? 0
                                Global.shared.exist_middleName_min_length = middleName["min_length"] as? Int ?? 0
                                
                            }
                            if let securityQuestion = existingUser.value(forKey: "SecurityQuestion") as? NSDictionary {
                                Global.shared.exist_securityQuestion_is_required = securityQuestion["is_required"] as? Bool ?? false
                                Global.shared.exist_securityQuestion_field_accept = securityQuestion["field_accept"] as? String ?? "any"
                                Global.shared.exist_securityQuestion_max_length = securityQuestion["max_length"] as? Int ?? 0
                                Global.shared.exist_securityQuestion_min_length = securityQuestion["min_length"] as? Int ?? 0
                                
                            }
                            if let answer = existingUser.value(forKey: "Answer") as? NSDictionary {
                                Global.shared.exist_answer_is_required = answer["is_required"] as? Bool ?? false
                                Global.shared.exist_answer_field_accept = answer["field_accept"] as? String ?? "any"
                                Global.shared.exist_answer_max_length = answer["max_length"] as? Int ?? 0
                                Global.shared.exist_answer_min_length = answer["min_length"] as? Int ?? 0
                                
                            }
                        }
                        
                        
                        if let newUser = dataDict.value(forKey: "new_account_setup") as? NSDictionary {
                            if let IdentityType = newUser.value(forKey: "IdentityType") as? NSDictionary {
                                Global.shared.new_identityType_is_required = IdentityType["is_required"] as? Bool ?? false
                                
                            }
                            if let IdentityId = newUser.value(forKey: "IdentityId") as? NSDictionary {
                                Global.shared.new_identityId_is_required = IdentityId["is_required"] as? Bool ?? false
                                Global.shared.new_identityId_field_accept = IdentityId["field_accept"] as? String ?? "any"
                                Global.shared.new_identityId_max_length = IdentityId["max_length"] as? Int ?? 0
                                Global.shared.new_identityId_min_length = IdentityId["min_length"] as? Int ?? 0
                                
                            }
                            if let IdentityIssueDate = newUser.value(forKey: "IdentityIssueDate") as? NSDictionary {
                                Global.shared.new_identityIssueDate_is_required = IdentityIssueDate["is_required"] as? Bool ?? false
                                
                            }
                            if let IdentityExpiryDate = newUser.value(forKey: "IdentityExpiryDate") as? NSDictionary {
                                Global.shared.new_identityExpiryDate_is_required = IdentityExpiryDate["is_required"] as? Bool ?? false
                                
                            }
                            if let IdentityCountryIssue = newUser.value(forKey: "IdentityCountryIssue") as? NSDictionary {
                                Global.shared.new_identityCountryIssue_is_required = IdentityCountryIssue["is_required"] as? Bool ?? false
                                
                            }
                            if let IdentityPlaseIssue = newUser.value(forKey: "IdentityPlaseIssue") as? NSDictionary {
                                Global.shared.new_identityPlaseIssue_is_required = IdentityPlaseIssue["is_required"] as? Bool ?? false
                                Global.shared.new_identityPlaseIssue_field_accept = IdentityPlaseIssue["field_accept"] as? String ?? "any"
                                Global.shared.new_identityPlaseIssue_max_length = IdentityPlaseIssue["max_length"] as? Int ?? 0
                                Global.shared.new_identityPlaseIssue_min_length = IdentityPlaseIssue["min_length"] as? Int ?? 0
                                
                            }
                            if let PreferredLanguage = newUser.value(forKey: "PreferredLanguage") as? NSDictionary {
                                Global.shared.new_preferredLanguage_is_required = PreferredLanguage["is_required"] as? Bool ?? false
                                
                            }
                            if let Salutation = newUser.value(forKey: "Answer") as? NSDictionary {
                                Global.shared.new_salutation_is_required = Salutation["is_required"] as? Bool ?? false
                                
                            }
                            if let FirstName = newUser.value(forKey: "FirstName") as? NSDictionary {
                                Global.shared.new_firstName_is_required = FirstName["is_required"] as? Bool ?? false
                                Global.shared.new_firstName_field_accept = FirstName["field_accept"] as? String ?? "any"
                                Global.shared.new_firstName_max_length = FirstName["max_length"] as? Int ?? 0
                                Global.shared.new_firstName_min_length = FirstName["min_length"] as? Int ?? 0
                                
                            }
                            if let MiddleName = newUser.value(forKey: "MiddleName") as? NSDictionary {
                                Global.shared.new_middleName_is_required = MiddleName["is_required"] as? Bool ?? false
                                Global.shared.new_middleName_field_accept = MiddleName["field_accept"] as? String ?? "any"
                                Global.shared.new_middleName_max_length = MiddleName["max_length"] as? Int ?? 0
                                Global.shared.new_middleName_min_length = MiddleName["min_length"] as? Int ?? 0
                                
                            }
                            if let LastName = newUser.value(forKey: "LastName") as? NSDictionary {
                                Global.shared.new_lastName_is_required = LastName["is_required"] as? Bool ?? false
                                Global.shared.new_lastName_field_accept = LastName["field_accept"] as? String ?? "any"
                                Global.shared.new_lastName_max_length = LastName["max_length"] as? Int ?? 0
                                Global.shared.new_lastName_min_length = LastName["min_length"] as? Int ?? 0
                                
                            }
                            if let Nationality = newUser.value(forKey: "Nationality") as? NSDictionary {
                                Global.shared.new_nationality_is_required = Nationality["is_required"] as? Bool ?? false
                                
                            }
                            if let DateOfBirth = newUser.value(forKey: "DateOfBirth") as? NSDictionary {
                                Global.shared.new_dob_is_required = DateOfBirth["is_required"] as? Bool ?? false
                                
                            }
                            if let PlaceOfBirth = newUser.value(forKey: "PlaceOfBirth") as? NSDictionary {
                                Global.shared.new_placeOfBirth_is_required = PlaceOfBirth["is_required"] as? Bool ?? false
                                Global.shared.new_placeOfBirth_field_accept = PlaceOfBirth["field_accept"] as? String ?? "any"
                                Global.shared.new_placeOfBirth_max_length = PlaceOfBirth["max_length"] as? Int ?? 0
                                Global.shared.new_placeOfBirth_min_length = PlaceOfBirth["min_length"] as? Int ?? 0
                                
                            }
                            if let Mobile = newUser.value(forKey: "Mobile") as? NSDictionary {
                                Global.shared.new_mobileNumber_is_required = Mobile["is_required"] as? Bool ?? false
                                Global.shared.new_mobileNumber_field_accept = Mobile["field_accept"] as? String ?? "any"
                                Global.shared.new_mobileNumber_max_length = Mobile["max_length"] as? Int ?? 0
                                Global.shared.new_mobileNumber_min_length = Mobile["min_length"] as? Int ?? 0
                                
                            }
                            if let Telephone = newUser.value(forKey: "Telephone") as? NSDictionary {
                                Global.shared.new_telephone_is_required = Telephone["is_required"] as? Bool ?? false
                                Global.shared.new_telephone_field_accept = Telephone["field_accept"] as? String ?? "any"
                                Global.shared.new_telephone_max_length = Telephone["max_length"] as? Int ?? 0
                                Global.shared.new_telephone_min_length = Telephone["min_length"] as? Int ?? 0
                                
                            }
                            if let emailID = newUser.value(forKey: "EmailID") as? NSDictionary {
                                Global.shared.new_emailId_is_required = emailID["is_required"] as? Bool ?? false
                                Global.shared.new_emailId_field_accept = emailID["field_accept"] as? String ?? "any"
                                Global.shared.new_emailId_max_length = emailID["max_length"] as? Int ?? 0
                                Global.shared.new_emailId_min_length = emailID["min_length"] as? Int ?? 0
                                
                            }
                            if let SecondaryEmail = newUser.value(forKey: "SecondaryEmail") as? NSDictionary {
                                Global.shared.new_secndryEmailId_is_required = SecondaryEmail["is_required"] as? Bool ?? false
                                Global.shared.new_secndryEmailId_field_accept = SecondaryEmail["field_accept"] as? String ?? "any"
                                Global.shared.new_secndryEmailId_max_length = SecondaryEmail["max_length"] as? Int ?? 0
                                Global.shared.new_secndryEmailId_min_length = SecondaryEmail["min_length"] as? Int ?? 0
                                
                            }
                            if let ResidentType = newUser.value(forKey: "ResidentType") as? NSDictionary {
                                Global.shared.new_residentType_is_required = ResidentType["is_required"] as? Bool ?? false
                                
                            }
                            if let Flat = newUser.value(forKey: "Flat") as? NSDictionary {
                                Global.shared.new_flat_is_required = Flat["is_required"] as? Bool ?? false
                                Global.shared.new_flat_field_accept = Flat["field_accept"] as? String ?? "any"
                                Global.shared.new_flat_max_length = Flat["max_length"] as? Int ?? 0
                                Global.shared.new_flat_min_length = Flat["min_length"] as? Int ?? 0
                                
                            }
                            if let Floor = newUser.value(forKey: "Floor") as? NSDictionary {
                                Global.shared.new_floor_is_required = Floor["is_required"] as? Bool ?? false
                                Global.shared.new_floor_field_accept = Floor["field_accept"] as? String ?? "any"
                                Global.shared.new_floor_max_length = Floor["max_length"] as? Int ?? 0
                                Global.shared.new_floor_min_length = Floor["min_length"] as? Int ?? 0
                                
                            }
                            if let Building = newUser.value(forKey: "Building") as? NSDictionary {
                                Global.shared.new_building_is_required = Building["is_required"] as? Bool ?? false
                                Global.shared.new_building_field_accept = Building["field_accept"] as? String ?? "any"
                                Global.shared.new_building_max_length = Building["max_length"] as? Int ?? 0
                                Global.shared.new_building_min_length = Building["min_length"] as? Int ?? 0
                                
                            }
                            if let Gada = newUser.value(forKey: "Gada") as? NSDictionary {
                                Global.shared.new_gada_is_required = Gada["is_required"] as? Bool ?? false
                                Global.shared.new_gada_field_accept = Gada["field_accept"] as? String ?? "any"
                                Global.shared.new_gada_max_length = Gada["max_length"] as? Int ?? 0
                                Global.shared.new_gada_min_length = Gada["min_length"] as? Int ?? 0
                                
                            }
                            if let Street = newUser.value(forKey: "Street") as? NSDictionary {
                                Global.shared.new_street_is_required = Street["is_required"] as? Bool ?? false
                                Global.shared.new_street_field_accept = Street["field_accept"] as? String ?? "any"
                                Global.shared.new_street_max_length = Street["max_length"] as? Int ?? 0
                                Global.shared.new_street_min_length = Street["min_length"] as? Int ?? 0
                                
                            }
                            if let Block = newUser.value(forKey: "Block") as? NSDictionary {
                                Global.shared.new_block_is_required = Block["is_required"] as? Bool ?? false
                                Global.shared.new_block_field_accept = Block["field_accept"] as? String ?? "any"
                                Global.shared.new_block_max_length = Block["max_length"] as? Int ?? 0
                                Global.shared.new_block_min_length = Block["min_length"] as? Int ?? 0
                                
                            }
                            if let City = newUser.value(forKey: "City") as? NSDictionary {
                                Global.shared.new_areaCity_is_required = City["is_required"] as? Bool ?? false
                                Global.shared.new_areaCity_field_accept = City["field_accept"] as? String ?? "any"
                                Global.shared.new_areaCity_max_length = City["max_length"] as? Int ?? 0
                                Global.shared.new_areaCity_min_length = City["min_length"] as? Int ?? 0
                                
                            }
                            if let ZipCode = newUser.value(forKey: "ZipCode") as? NSDictionary {
                                Global.shared.new_zipCode_is_required = ZipCode["is_required"] as? Bool ?? false
                                Global.shared.new_zipCode_field_accept = ZipCode["field_accept"] as? String ?? "any"
                                Global.shared.new_zipCode_max_length = ZipCode["max_length"] as? Int ?? 0
                                Global.shared.new_zipCode_min_length = ZipCode["min_length"] as? Int ?? 0
                                
                            }
                            if let State = newUser.value(forKey: "State") as? NSDictionary {
                                Global.shared.new_state_is_required = State["is_required"] as? Bool ?? false
                                Global.shared.new_state_field_accept = State["field_accept"] as? String ?? "any"
                                Global.shared.new_state_max_length = State["max_length"] as? Int ?? 0
                                Global.shared.new_state_min_length = State["min_length"] as? Int ?? 0
                                
                            }
                            if let Country = newUser.value(forKey: "Country") as? NSDictionary {
                                Global.shared.new_countryCode_is_required = Country["is_required"] as? Bool ?? false
                                
                            }
                            if let RemitterCategory = newUser.value(forKey: "RemitterCategory") as? NSDictionary {
                                Global.shared.new_remitterCategory_is_required = RemitterCategory["is_required"] as? Bool ?? false
                                Global.shared.aPolticalExposedToolTip = RemitterCategory["tooltip"] as? String ?? ""
                                
                            }
                            if let PoliticalScope = newUser.value(forKey: "PoliticalScope") as? NSDictionary {
                                Global.shared.new_politicalScope_is_required = PoliticalScope["is_required"] as? Bool ?? false
                                
                            }
                            if let PEPPosition = newUser.value(forKey: "PEPPosition") as? NSDictionary {
                                Global.shared.new_PEPPosition_is_required = PEPPosition["is_required"] as? Bool ?? false
                                Global.shared.new_PEPPosition_field_accept = PEPPosition["field_accept"] as? String ?? "any"
                                Global.shared.new_PEPPosition_max_length = PEPPosition["max_length"] as? Int ?? 0
                                Global.shared.new_PEPPosition_min_length = PEPPosition["min_length"] as? Int ?? 0
                                
                            }
                            /*  if let answer = newUser.value(forKey: "Answer") as? NSDictionary {
                             Global.shared.new_politicalExposedPerson_is_required = answer["is_required"] as? Bool ?? false
                             
                             }*/
                            if let IsPoliticallyExposed = newUser.value(forKey: "IsPoliticallyExposed") as? NSDictionary {
                                Global.shared.isPolticalExposedToolTip = IsPoliticallyExposed["tooltip"] as? String ?? ""
                                
                            }
                            
                            if let RelationshipPEP = newUser.value(forKey: "RelationshipPEP") as? NSDictionary {
                                Global.shared.new_RelationshipPEP_is_required = RelationshipPEP["is_required"] as? Bool ?? false
                                
                            }
                            if let Occupation = newUser.value(forKey: "Occupation") as? NSDictionary {
                                Global.shared.new_occupation_is_required = Occupation["is_required"] as? Bool ?? false
                                Global.shared.occupationToolTip = Occupation["tooltip"] as? String ?? ""
                                
                            }
                            if let EmployerName = newUser.value(forKey: "EmployerName") as? NSDictionary {
                                Global.shared.new_employerName_is_required = EmployerName["is_required"] as? Bool ?? false
                                Global.shared.new_employerName_field_accept = EmployerName["field_accept"] as? String ?? "any"
                                Global.shared.new_employerName_max_length = EmployerName["max_length"] as? Int ?? 0
                                Global.shared.new_employerName_min_length = EmployerName["min_length"] as? Int ?? 0
                                
                            }
                            if let EmployeeID = newUser.value(forKey: "EmployeeID") as? NSDictionary {
                                Global.shared.new_employerID_is_required = EmployeeID["is_required"] as? Bool ?? false
                                Global.shared.new_employerID_field_accept = EmployeeID["field_accept"] as? String ?? "any"
                                Global.shared.new_employerID_max_length = EmployeeID["max_length"] as? Int ?? 0
                                Global.shared.new_employerID_min_length = EmployeeID["min_length"] as? Int ?? 0
                                
                            }
                            if let EmployerLocation = newUser.value(forKey: "EmployerLocation") as? NSDictionary {
                                Global.shared.new_employerLocation_is_required = EmployerLocation["is_required"] as? Bool ?? false
                                Global.shared.new_employerLocation_field_accept = EmployerLocation["field_accept"] as? String ?? "any"
                                Global.shared.new_employerLocation_max_length = EmployerLocation["max_length"] as? Int ?? 0
                                Global.shared.new_employerLocation_min_length = EmployerLocation["min_length"] as? Int ?? 0
                                
                            }
                            if let Designation = newUser.value(forKey: "Designation") as? NSDictionary {
                                Global.shared.new_employerDesigntn_is_required = Designation["is_required"] as? Bool ?? false
                                Global.shared.new_employerDesigntn_field_accept = Designation["field_accept"] as? String ?? "any"
                                Global.shared.new_employerDesigntn_max_length = Designation["max_length"] as? Int ?? 0
                                Global.shared.new_employerDesigntn_min_length = Designation["min_length"] as? Int ?? 0
                                
                            }
                            if let Salary = newUser.value(forKey: "Salary") as? NSDictionary {
                                Global.shared.new_salary_is_required = Salary["is_required"] as? Bool ?? false
                                Global.shared.new_salary_field_accept = Salary["field_accept"] as? String ?? "any"
                                Global.shared.new_salary_max_length = Salary["max_length"] as? Int ?? 0
                                Global.shared.new_salary_min_length = Salary["min_length"] as? Int ?? 0
                                
                            }
                            if let OtherIncome = newUser.value(forKey: "OtherIncome") as? NSDictionary {
                                Global.shared.new_otherIncome_is_required = OtherIncome["is_required"] as? Bool ?? false
                                Global.shared.new_otherIncome_field_accept = OtherIncome["field_accept"] as? String ?? "any"
                                Global.shared.new_otherIncome_max_length = OtherIncome["max_length"] as? Int ?? 0
                                Global.shared.new_otherIncome_min_length = OtherIncome["min_length"] as? Int ?? 0
                                Global.shared.otherIncomeToolTip = OtherIncome["tooltip"] as? String ?? "any"
                            }
                            if let TypeOfService = newUser.value(forKey: "TypeOfService") as? NSDictionary {
                                Global.shared.new_typeOfService_is_required = TypeOfService["is_required"] as? Bool ?? false
                                
                            }
                            if let Purpose = newUser.value(forKey: "Purpose") as? NSDictionary {
                                Global.shared.new_purposeOfTransfer_is_required = Purpose["is_required"] as? Bool ?? false
                                
                            }
                            if let ExpectedTransationMonth = newUser.value(forKey: "ExpectedTransationMonth") as? NSDictionary {
                                Global.shared.new_expectedTransctnPerMonth_is_required = ExpectedTransationMonth["is_required"] as? Bool ?? false
                                Global.shared.new_expectedTransctnPerMonth_field_accept = ExpectedTransationMonth["field_accept"] as? String ?? "any"
                                Global.shared.new_expectedTransctnPerMonth_max_length = ExpectedTransationMonth["max_length"] as? Int ?? 0
                                Global.shared.new_expectedTransctnPerMonth_min_length = ExpectedTransationMonth["min_length"] as? Int ?? 0
                                
                            }
                            if let ExpectedTransationYear = newUser.value(forKey: "ExpectedTransationYear") as? NSDictionary {
                                Global.shared.new_expectedTransctnPerYear_is_required = ExpectedTransationYear["is_required"] as? Bool ?? false
                                Global.shared.new_expectedTransctnPerYear_field_accept = ExpectedTransationYear["field_accept"] as? String ?? "any"
                                Global.shared.new_expectedTransctnPerYear_max_length = ExpectedTransationYear["max_length"] as? Int ?? 0
                                Global.shared.new_expectedTransctnPerYear_min_length = ExpectedTransationYear["min_length"] as? Int ?? 0
                                
                            }
                            if let TransationValueMonth = newUser.value(forKey: "TransationValueMonth") as? NSDictionary {
                                Global.shared.new_trnsctnValuePerMonth_is_required = TransationValueMonth["is_required"] as? Bool ?? false
                                Global.shared.new_trnsctnValuePerMonth_field_accept = TransationValueMonth["field_accept"] as? String ?? "any"
                                Global.shared.new_trnsctnValuePerMonth_max_length = TransationValueMonth["max_length"] as? Int ?? 0
                                Global.shared.new_trnsctnValuePerMonth_min_length = TransationValueMonth["min_length"] as? Int ?? 0
                                
                            }
                            if let TransationValueYear = newUser.value(forKey: "TransationValueYear") as? NSDictionary {
                                Global.shared.new_trnsctnValuePerYear_is_required = TransationValueYear["is_required"] as? Bool ?? false
                                Global.shared.new_trnsctnValuePerYear_field_accept = TransationValueYear["field_accept"] as? String ?? "any"
                                Global.shared.new_trnsctnValuePerYear_max_length = TransationValueYear["max_length"] as? Int ?? 0
                                Global.shared.new_trnsctnValuePerYear_min_length = TransationValueYear["min_length"] as? Int ?? 0
                                
                            }
                            if let CountOfExpectedTxn = newUser.value(forKey: "CountOfExpectedTxn") as? NSDictionary {
                                Global.shared.new_CountOfExpectedTxn_is_required = CountOfExpectedTxn["is_required"] as? Bool ?? false
                                Global.shared.new_CountOfExpectedTxn_field_accept = CountOfExpectedTxn["field_accept"] as? String ?? "any"
                                Global.shared.new_CountOfExpectedTxn_max_length = CountOfExpectedTxn["max_length"] as? Int ?? 0
                                Global.shared.new_CountOfExpectedTxn_min_length = CountOfExpectedTxn["min_length"] as? Int ?? 0
                                Global.shared.countOfExpctdTrnsctnToolTip = CountOfExpectedTxn["tooltip"] as? String ?? "any"
                                
                            }
                            if let ValueForExpectedTxn = newUser.value(forKey: "ValueForExpectedTxn") as? NSDictionary {
                                Global.shared.new_ValueForExpectedTxn_is_required = ValueForExpectedTxn["is_required"] as? Bool ?? false
                                Global.shared.new_ValueForExpectedTxn_field_accept = ValueForExpectedTxn["field_accept"] as? String ?? "any"
                                Global.shared.new_ValueForExpectedTxn_max_length = ValueForExpectedTxn["max_length"] as? Int ?? 0
                                Global.shared.new_ValueForExpectedTxn_min_length = ValueForExpectedTxn["min_length"] as? Int ?? 0
                                Global.shared.valueOfEpctdTrnsctnToolTip = ValueForExpectedTxn["tooltip"] as? String ?? "any"
                            }
                            if let SourceOfIncome = newUser.value(forKey: "SourceOfIncome") as? NSDictionary {
                                Global.shared.new_sourceOfIncome_is_required = SourceOfIncome["is_required"] as? Bool ?? false
                                
                            }
                            if let AverageYearIncome = newUser.value(forKey: "AverageYearIncome") as? NSDictionary {
                                Global.shared.new_avgYearlyIncome_is_required = AverageYearIncome["is_required"] as? Bool ?? false
                                Global.shared.new_avgYearlyIncome_field_accept = AverageYearIncome["field_accept"] as? String ?? "any"
                                Global.shared.new_avgYearlyIncome_max_length = AverageYearIncome["max_length"] as? Int ?? 0
                                Global.shared.new_avgYearlyIncome_min_length = AverageYearIncome["min_length"] as? Int ?? 0
                                Global.shared.avgYearlyIncomeToolTip = AverageYearIncome["tooltip"] as? String ?? "any"
                                
                            }
                            if let VideoFile = newUser.value(forKey: "VideoFile") as? NSDictionary {
                                Global.shared.videoFileToolTip = VideoFile["tooltip"] as? String ?? "any"
                            }
                            if let ImageFile = newUser.value(forKey: "ImageFile") as? NSDictionary {
                                Global.shared.imageFileToolTip = ImageFile["tooltip"] as? String ?? "any"
                            }
                        }
                        
                        
                        
                        
                    }
                }
                self.assigningTextfieldsProperties()
            }
            
            else
            {
                print(errorString!)
                self.removeSpinner()
                let finalError = errorString?.components(separatedBy: ":")
                if finalError?.count == 2
                {
                   let alert = ViewControllerManager.displayAlert(message: finalError?[1] ?? "", title:APPLICATIONNAME)
                    self.present(alert, animated: true, completion: nil)
                }
                else
                {
                    let alert = ViewControllerManager.displayAlert(message: errorString ?? "", title:APPLICATIONNAME)
                    self.present(alert, animated: true, completion: nil)
                }
//                let alert = ViewControllerManager.displayAlert(message: finalError?[1] ?? "", title:APPLICATIONNAME)
//                self.present(alert, animated: true, completion: nil)
                
            }
            
        }
        
    }
    
    func assigningTextfieldsProperties() {
        userTxtField.maxLength = 50
        pswdTxtField.maxLength = 50
        // userTxtField.minLegth = Global.shared.username_min_length
        // userTxtField.valueType = Global.shared.getFieldType(text: Global.shared.username_field_accept)
    }
    
    //branch
    @IBAction func branchLocatorBtnActn(_ sender: Any) {
        //RateCalculatorVc
        self.pushViewController(controller: BranchLocatorFirstVc.initiateController())
    }
    
    
    @IBAction func faceIdLockActn(_ sender: Any) {
        // authenticationWithTouchID()
        
        biometricStatus()
    }
    
    
    // MARK: To know biometric status, when we hit on face id button in login screen
    func biometricStatus() {
        
        let paramaterPasing: [String:Any] = ["identityId": UIDevice.current.identifierForVendor?.uuidString ?? " ",
                                             "loginSource": 3]
        
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        NetWorkDataManager.sharedInstance.checkBiometricEnabledStatusImplementation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            
            if errorString == nil
            {
                    
                let statusMsg = resonseTal?.value(forKey: "statusMessage") as? String ?? ""
                let mesageCode = resonseTal?.value(forKey: "messageCode") as? String ?? statusMsg
                if let statusCode = resonseTal?.value(forKey: "statusCodes") as? Int {
                    
                    if(statusCode == 200) {
                        
                        self.authenticationWithTouchID()
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
                if finalError?.count == 2
                {
                   let alert = ViewControllerManager.displayAlert(message: finalError?[1] ?? "", title:APPLICATIONNAME)
                    self.present(alert, animated: true, completion: nil)
                }
                else
                {
                    let alert = ViewControllerManager.displayAlert(message: errorString ?? "", title:APPLICATIONNAME)
                    self.present(alert, animated: true, completion: nil)
                }
//                let alert = ViewControllerManager.displayAlert(message: finalError?[1] ?? "", title:APPLICATIONNAME)
//                self.present(alert, animated: true, completion: nil)
                
            }
        }
        
    }
    
    
    
    // MARK: Face id, biometric, pattern authentication
    func authenticationWithTouchID() {
        let localAuthenticationContext = LAContext()
        localAuthenticationContext.localizedFallbackTitle = "Please use your Passcode"
        
        var authorizationError: NSError?
        let reason = "Authentication required to access the secure data"
        
        if localAuthenticationContext.canEvaluatePolicy(.deviceOwnerAuthentication, error: &authorizationError) {
            
            localAuthenticationContext.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason) { success, evaluateError in
                
                if success {
                    
                    self.biometricLogin()
                    
                } else {
                    // Failed to authenticate
                    guard let error = evaluateError else {
                        return
                    }
                    print(error)
                    
                }
            }
        } else {
            
            guard let error = authorizationError else {
                return
            }
            print(error)
        }
    }
    
    // MARK: For logging in through biometric/face- id/ pattern
    func biometricLogin() {
        
        let paramaterPasing: [String:Any] = ["identityId": UIDevice.current.identifierForVendor?.uuidString ?? " ",
                                             "loginSource": 3]
        
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        NetWorkDataManager.sharedInstance.loginWithBiometricImplementation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            
            
            if errorString == nil
            {
                
                Global.shared.biometricNormalLogin = "Biometric"
                Global.shared.afterLoginSecurityImg = resonseTal?["securityImage"] as? String ?? ""
                Global.shared.afterLoginRegistrtnId = resonseTal?["registrationId"] as? String ?? ""
                
                if let securityQuestionsData = resonseTal?.value(forKey: "securityQuestionsList") as? NSArray {
                    
                    if let securityQuestion = securityQuestionsData.value(forKey: "securityQuestion") as? [String] {
                        Global.shared.afterLoginSecurityQuestnsList = securityQuestion
                    }
                    if let securityQuestionId = securityQuestionsData.value(forKey: "securityQuestionId") as? [Int] {
                        Global.shared.afterLoginSecurityIdList = securityQuestionId
                        Global.shared.afterLoginSecurityIdListString = Global.shared.afterLoginSecurityIdList.map(String.init)
                    }
                    
                }
                
                let statusMsg = resonseTal?.value(forKey: "statusMessage") as? String ?? ""
                let mesageCode = resonseTal?.value(forKey: "messageCode") as? String ?? statusMsg
                
                if let statusCode = resonseTal?.value(forKey: "statusCodes") as? Int {
                    
                    if(statusCode == 200) {
                        
                        Global.shared.afterLoginUserName = self.userTxtField.text
                        Global.shared.afterLoginPaswd = self.pswdTxtField.text
                        self.pushViewController(controller: AfterLoginVerificationVc.initiateController())
                    }
                    
                    else {
                        
                        self.removeSpinner()
                        let alert = ViewControllerManager.displayAlert(message:Global.shared.messageCodeType(text: mesageCode), title:APPLICATIONNAME)
                        //   let alert = ViewControllerManager.displayAlert(message: statusMsg, title:APPLICATIONNAME)
                        self.present(alert, animated: true, completion: nil)
                        
                    }
                    
                }
                
            }
            else
            {
                print(errorString!)
                self.removeSpinner()
                let finalError = errorString?.components(separatedBy: ":")
                if finalError?.count == 2
                {
                   let alert = ViewControllerManager.displayAlert(message: finalError?[1] ?? "", title:APPLICATIONNAME)
                    self.present(alert, animated: true, completion: nil)
                }
                else
                {
                    let alert = ViewControllerManager.displayAlert(message: errorString ?? "", title:APPLICATIONNAME)
                    self.present(alert, animated: true, completion: nil)
                }
//                let alert = ViewControllerManager.displayAlert(message: finalError?[1] ?? "", title:APPLICATIONNAME)
//                self.present(alert, animated: true, completion: nil)
                
            }
        }
        
    }
    
    // MARK: To download the countries list used in signup
    func downloadAccountConfigCountries() {
        
        let paramaterPasing: [String:Any] = ["languageCode":LocalizationSystem.sharedInstance.getLanguage(),
                                             "type": 0]
        
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        NetWorkDataManager.sharedInstance.countryListImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            
            if errorString == nil
            {
                
                if let countres = resonseTal?.value(forKey: "countriesList") as? [[String: Any]] {
                    Global.shared.countris = Country.getCountries(countres)
                    Global.shared.countrisAll = countres
                }
                if let countries = resonseTal?.value(forKey: "countriesList") as? NSArray {
                    
                    if let countryName = countries.value(forKey: "countryName") as? [String] {
                        Global.shared.countryNameData = countryName
                        Global.shared.countryNameDataAll = countryName
                    }
                    if let countryCode = countries.value(forKey: "countryCode") as? [String] {
                        Global.shared.countryCodesData = countryCode
                        Global.shared.countryCodesDataAll = countryCode
                    }
                    if let currency = countries.value(forKey: "countryCurrency") as? [String] {
                        Global.shared.currencyCodesData = currency
                        Global.shared.currencyCodesDataAll = currency
                    }
                    if let currencyNames = countries.value(forKey: "currencyName") as? [String] {
                        Global.shared.currencyNameData = currencyNames
                        Global.shared.currencyNameDataAll = currencyNames
                    }
                    
                    if let phoneCodes = countries.value(forKey: "phoneCode") as? [String] {
                        Global.shared.phoneCodesData = phoneCodes
                        Global.shared.phoneCodesDataAll = phoneCodes
                    }
                    
                    for i in 0..<Global.shared.currencyCodesData.count {
                        Global.shared.pickerResponseOnlyCurrencyData.append(["value":  Global.shared.currencyCodesData[i], "display":  Global.shared.currencyCodesData[i]])
                    }
                    for i in 0..<Global.shared.currencyCodesDataAll.count {
                        Global.shared.pickerResponseOnlyCurrencyDataAll.append(["value":  Global.shared.currencyCodesDataAll[i], "display":  Global.shared.currencyCodesDataAll[i]])
                    }
                    
                    for i in 0..<Global.shared.currencyNameData.count {
                        Global.shared.pickerResponseFullCurrencyNameData.append(["value":  Global.shared.currencyNameData[i], "display":  Global.shared.currencyNameData[i]])
                    }
                    for i in 0..<Global.shared.currencyNameDataAll.count {
                        Global.shared.pickerResponseFullCurrencyNameDataAll.append(["value":  Global.shared.currencyNameDataAll[i], "display":  Global.shared.currencyNameDataAll[i]])
                    }
                    
                    
                    for i in 0..<Global.shared.countryNameData.count {
                        Global.shared.pickerResponseCountryData.append(["value": Global.shared.countryNameData[i], "display": Global.shared.countryNameData[i]])
                    }
                    for i in 0..<Global.shared.countryNameDataAll.count {
                        Global.shared.pickerResponseCountryDataAll.append(["value": Global.shared.countryNameDataAll[i], "display": Global.shared.countryNameDataAll[i]])
                    }
                    
                }
                
            }
            
            else
            {
                print(errorString!)
                self.removeSpinner()
                let finalError = errorString?.components(separatedBy: ":")
                if finalError?.count == 2
                {
                   let alert = ViewControllerManager.displayAlert(message: finalError?[1] ?? "", title:APPLICATIONNAME)
                    self.present(alert, animated: true, completion: nil)
                }
                else
                {
                    let alert = ViewControllerManager.displayAlert(message: errorString ?? "", title:APPLICATIONNAME)
                    self.present(alert, animated: true, completion: nil)
                }
//                let alert = ViewControllerManager.displayAlert(message: finalError?[1] ?? "", title:APPLICATIONNAME)
//                self.present(alert, animated: true, completion: nil)
                
            }
        }
        
    }
    
    @IBAction func contactUsActn(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ContactUsVc") as! ContactUsVc
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    
    @IBAction func rateCalculatorActn(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "RateTabsCalculatorVc") as! RateTabsCalculatorVc
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //UICollectionViewDatasource methods
        func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
            
            return 1
        }
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       // print(offerList.count)
        return self.offerList.count
        }
   
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PreLoginOfferCell
       
        
        let offers = offerList[indexPath.row]
        let imageStr = offers["image"] as? String ?? ""
   
        let image1 = imageStr.base64ToImage()
      //  print(image1!)
       // let newImg =  image1!.resize(800)
//        let newImg = resizeImage(image: image1!, targetSize: CGSize(width: self.view.frame.width, height: self.view.frame.width-100))
//        let data = image1?.pngData()
//        let image2 = UIImage(data: data!)
//        print("data is", data)
//        print(newImg)
      
        cell.img_offer.contentMode = .scaleToFill
        if image1 != nil
        {
            imgOfferList.append(offers)
//            let widthInPixels = cell.img_offer.frame.width * UIScreen.main.scale
//            let heightInPixels = cell.img_offer.frame.height * UIScreen.main.scale
//
          //  let widthInPixels = image1!.size.width * image1!.scale
          //  let heightInPixels = image1!.size.height * image1!.scale
          //  print("height",heightInPixels)
           // print("width",widthInPixels)
            cell.img_offer.image = image1
        }
     //   img.image = image1
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let offers = imgOfferList[indexPath.row]
        let imageUrl = offers["externalUrl"] as? String ?? ""
        if imageUrl != "null" && imageUrl != ""
        {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "OfferWebController") as! OfferWebController
        vc.str_url = imageUrl
        self.navigationController?.pushViewController(vc, animated: true)
        }
        print(imageUrl)
       
    }
 
    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage? {
        let size = image.size
        
        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio, height: size.height * widthRatio)
        }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(origin: .zero, size: newSize)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
    var carousalTimer: Timer?
    var newOffsetX: CGFloat = 0.0
      func startTimer() {

//        carousalTimer = Timer(fire: Date(), interval: 0.015, repeats: true) { (timer) in
//
//            let initailPoint = CGPoint(x: self.newOffsetX,y :0)
//
//            if __CGPointEqualToPoint(initailPoint, self.collectionView.contentOffset) {
//
//                if self.newOffsetX < self.collectionView.contentSize.width {
//                    self.newOffsetX += 0.75
//                }
//                if self.newOffsetX > self.collectionView.contentSize.width - self.collectionView.frame.size.width {
//                    self.newOffsetX = 0
//                }
//
//                self.collectionView.contentOffset = CGPoint(x: self.newOffsetX,y :0)
//
//            } else {
//                self.newOffsetX = self.collectionView.contentOffset.x
//            }
//        }
//
//        RunLoop.current.add(carousalTimer!, forMode: .common)
        

        self.removeSpinner()
          if offerList.count != 0
          {
             Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(self.scrollAutomatically), userInfo: nil, repeats: true)
          }
      }
         var x = 1
          @objc func scrollAutomatically(_ timer1: Timer) {
           
    
             if self.x < self.offerList.count {
                let indexPath = IndexPath(item: x, section: 0)
                self.collectionView.scrollToItem(at: indexPath, at: .left, animated: true)
                self.x = self.x + 1
              }else{
                self.x = 0
                self.collectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .left, animated: true)
              }
          }


  
 
}
extension UIImage {
    func resize(_ max_size: CGFloat) -> UIImage {
        // adjust for device pixel density
        let max_size_pixels = max_size / UIScreen.main.scale
        // work out aspect ratio
        let aspectRatio =  size.width/size.height
        // variables for storing calculated data
        var width: CGFloat
        var height: CGFloat
        var newImage: UIImage
        if aspectRatio > 1 {
            // landscape
            width = max_size_pixels
            height = max_size_pixels / aspectRatio
        } else {
            // portrait
            height = max_size_pixels
            width = max_size_pixels * aspectRatio
        }
        // create an image renderer of the correct size
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: width, height: height), format: UIGraphicsImageRendererFormat.default())
        // render the image
        newImage = renderer.image {
            (context) in
            self.draw(in: CGRect(x: 0, y: 0, width: width, height: height))
        }
        // return the image
        return newImage
    }
}
extension LoginVc: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 175, height: 175)
    }
}



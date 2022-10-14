//
//  ProfileVc.swift
//  Canvas
//
//  Created by urmila reddy on 07/09/20.
//  Copyright © 2020 urmila reddy. All rights reserved.
//

import UIKit
import Alamofire
import MaterialShowcase
import Firebase
class ProfileVc: BaseViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIPopoverControllerDelegate, XMSegmentedControlDelegate, navigateToDiffrentScreenDelegate  {
    @IBOutlet weak var btn_tips: UIButton!
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
  var sequence = MaterialShowcaseSequence()
  lazy var guideView_1 =  MaterialShowcase()
  lazy var guideView_2 =  MaterialShowcase()
  lazy var guideView_3 =  MaterialShowcase()
    
    var helpVideoList = [[String: Any]]()
    
      @IBOutlet weak var navHeaderLbl: UILabel!

    @IBOutlet weak var profileImg: UIImageView!
    
    @IBOutlet weak var switchBtnOtlt: UISwitch!
    
    @IBOutlet weak var enableFaceIdLbl: UILabel!
    
  
    @IBOutlet weak var editProfileBtnOtlt: UIButton!
    
    
    @IBOutlet weak var seg: XMSegmentedControl!
    
    @IBOutlet weak var firstView: UIView!
    
  lazy var hightlighLabel:UILabel = {
    let label = UILabel()
    label.textColor = .white
    label.text = ""
    label.translatesAutoresizingMaskIntoConstraints = false
    label.isHidden = true
    self.view.addSubview(label)
    return label
  }()
    
    @IBOutlet weak var secndView: UIView!
    
    @IBOutlet weak var imgNameLbl: UILabel!
    
    var pickerImg:UIImagePickerController?=UIImagePickerController()
    
    var imgeXX:String = ""
    
    var popover:UIPopoverController?=nil
    
    
     public var menuPopUp: MenuViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        self.navHeaderLbl.text = Global.shared.profileTab
     /*   self.showSpinner(onView: self.view)
        profileImg.setRounded()
        
        menuItemsData()
      //  updateBtnOtlt.setTitle(Global.shared.updateTxt, for: .normal)
        enableFaceIdLbl.text = Global.shared.faceIdLockTxt
        
        
        // Do any additional setup after loading the view.
        if UserDefaults.exists(key: "biometricEnabled") {
            if UserDefaults.standard.string(forKey: "biometricEnabled")! == "true" {
                switchBtnOtlt.isOn = true
            }
            else {
                switchBtnOtlt.isOn = false
            }
        }
        else {
            switchBtnOtlt.isOn = false
        }
        
        
        
        pickerImg!.delegate=self as UIImagePickerControllerDelegate & UINavigationControllerDelegate
        imageGesture()
        imageGestureTwo()
        
        getProfileDetails()*/
        btn_tips.isHidden = true
        getHelpList()
        toLoadImage()
    }
    
    func toLoadImage() {
        self.imgNameLbl.text =  UserDefaults.standard.string(forKey: "imageName")!
        self.imgNameLbl.layer.cornerRadius = self.imgNameLbl.frame.size.width / 2;
        self.imgNameLbl.clipsToBounds = true
        let randomColr = UserDefaults.standard.string(forKey: "randomColour")!
        let colorrs = randomColr.components(separatedBy: "-")
        let firstColr = colorrs[0]
        let secndColr = colorrs[1]
        let newColorLbl = UIColor.colorFrom(hexString: firstColr)
        self.imgNameLbl.borderColor = newColorLbl
        self.imgNameLbl.textColor = newColorLbl
        self.imgNameLbl.backgroundColor = UIColor.colorFrom(hexString: secndColr)
        
        
        
        let profileImage = UserDefaults.standard.string(forKey: "profileImage")!
        if profileImage == "" {
            self.imgNameLbl.isHidden = false
            self.profileImg.isHidden = true
        }
    
        else  if let decodedImageData = Data(base64Encoded: profileImage , options: .ignoreUnknownCharacters) {
            let image2 = UIImage(data: decodedImageData)
            if image2 != nil {
                self.profileImg.image = image2
                self.profileImg.isHidden = false
                self.imgNameLbl.isHidden = true
            }
            else if profileImage != "" {
                let image1 = profileImage.base64ToImage()
                       self.profileImg.image = image1
                self.profileImg.isHidden = false
                self.imgNameLbl.isHidden = true
            }
            else {
                self.imgNameLbl.isHidden = false
                self.profileImg.isHidden = true
            }
           
        }
    }
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
      Analytics.logEvent("ios_Profile", parameters: nil)
    Global.shared.timeoUtOrNot = "yes"
    observeTimeout()
    addGuideViews()
  }
    
    
   func navigateToDiffrentScreenDelegate(toWhichScreenWeAreNaviagting : String)
       {
           print(toWhichScreenWeAreNaviagting)
          if toWhichScreenWeAreNaviagting == Global.shared.menuProfile{
          
           }
          else{
              MenuScreenShow(screen:toWhichScreenWeAreNaviagting)
          }
       }
    
    
    //MARK:- Profile Pic Gesture Methods
//    func imageGesture()
//    {
//        let tap = UITapGestureRecognizer(target: self, action: #selector(ProfileVc.tappedMe))
//        profileImg.addGestureRecognizer(tap)
//        profileImg.isUserInteractionEnabled = true
//    }
//    func imageGestureTwo()
//      {
//          let tap = UITapGestureRecognizer(target: self, action: #selector(ProfileVc.tappedMe))
//          imgNameLbl.addGestureRecognizer(tap)
//          imgNameLbl.isUserInteractionEnabled = true
//      }
    
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
            self.present(pickerImg!, animated: true, completion: nil)
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
    //    pickerImg!.sourceType = UIImagePickerController.SourceType.photoLibrary
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
    
    override func viewWillAppear(_ animated: Bool) {
      
        
        
        Global.shared.countrysChangeAccordingly = "Any"
        Global.shared.countris = Country.getCountries(Global.shared.countrisAll)
     //   self.showSpinner(onView: self.view)
        profileImg.setRounded()
        
        menuItemsData()
      //  updateBtnOtlt.setTitle(Global.shared.updateTxt, for: .normal)
        enableFaceIdLbl.text = Global.shared.faceIdLockTxt
        
        
        // Do any additional setup after loading the view.
        if UserDefaults.exists(key: "biometricEnabled") {
            if UserDefaults.standard.string(forKey: "biometricEnabled")! == "true" {
                switchBtnOtlt.isOn = true
            }
            else {
                switchBtnOtlt.isOn = false
            }
        }
        else {
            switchBtnOtlt.isOn = false
        }
        
        
        
        pickerImg!.delegate=self as UIImagePickerControllerDelegate & UINavigationControllerDelegate
//        imageGesture()
//        imageGestureTwo()
        
      //  getProfileDetails()
           super.viewWillAppear(animated)
           navigationController?.setNavigationBarHidden(true, animated: animated)
       }
       
       override func viewWillDisappear(_ animated: Bool) {
           super.viewWillDisappear(animated)
           navigationController?.setNavigationBarHidden(false, animated: animated)
       }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController)
    {
        print("picker cancel.")
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func deleteProfileBtnActn(_ sender: Any) {
       
    }
   
    @IBAction func onClicktipBtn(_ sender: Any) {
        if let viewController = self.storyboard?.instantiateViewController(withIdentifier: "ToolTipListController") as? ToolTipListController {
            viewController.helpVideoList = helpVideoList
            var index = 0
            var height = 0
            while index < helpVideoList.count {
               print( "Value of index is \(index)")
                if index == 0
                {
                    height = height + 40
                }
                else {
                    height = height + 60
                }
              
               index = index + 1
            }
            viewController.preferredContentSize = CGSize(width: 300, height: height)
                let navController = UINavigationController(rootViewController: viewController)
                navController.modalPresentationStyle = .popover

                if let pctrl = navController.popoverPresentationController {
                    pctrl.delegate = self

                    pctrl.sourceView = (sender as! UIView)
                    pctrl.sourceRect = (sender as! UIView).bounds

                    self.present(navController, animated: true, completion: nil)
                }
            }
    }
    
    func updateProfileImage() {
        let paramaterPasing: [String:Any] = [
            "registrationId": UserDefaults.standard.string(forKey: "registrationId")!,
            "profileImage": imgeXX
        ]
        
        let headers: HTTPHeaders = [.authorization(bearerToken: UserDefaults.standard.string(forKey: "token")!)]
        
        
        NetWorkDataManager.sharedInstance.profilePicytureImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            
            if errorString == nil
            {
                
                print(resonseTal!)
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
                                self.imgNameLbl.isHidden = false
                                self.profileImg.isHidden = true
                            /*  self.profileImg.image = Images.person
                                self.profileImg.tintColor = .darkGray*/
                            }
                            else {
                                self.imgNameLbl.isHidden = true
                                self.profileImg.isHidden = false
                                print("image there")
                            }
                            
                        }
                        
                        alert6.addAction(OKAction)
                        self.present(alert6, animated: true, completion: nil)
                        
                    }
                    else if statusCode == 400
                    {
                        if mesageCode == "E110042"
                        {
                            self.showAlert(withTitle: "", withMessage: resonseTal?["statusMessage"] as? String ?? "")
//                            Global.shared.timeoUtOrNot = "no"
//                            self.showAlertForTimer(titulo: "", mensagem: Global.shared.sessionTimedOutTxt, vc: self)
                        }
                        
                        if mesageCode == "E110043"
                        {
                            let alert = ViewControllerManager.displayAlert(message:Global.shared.messageCodeType(text: "am132"), title:APPLICATIONNAME)
                            self.present(alert, animated: true, completion: nil)
                        }
                        else{
                            
                        let alert = ViewControllerManager.displayAlert(message: resonseTal?["statusMessage"] as? String ?? "", title:APPLICATIONNAME)
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
                            self.removeLoader()
                            self.removeSpinner()
                          /*  let finalError = errorString?.components(separatedBy: ":")
                            let alert = ViewControllerManager.displayAlert(message: finalError?[1] ?? "", title:APPLICATIONNAME)
                            self.present(alert, animated: true, completion: nil)*/
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
    
    //profile details
    func getProfileDetails() {
      //  self.showLoader()
        let paramaterPasing: [String:Any] = [
            "registrationId": UserDefaults.standard.string(forKey: "registrationId")!
        ]
        
        let headers: HTTPHeaders = [.authorization(bearerToken: UserDefaults.standard.string(forKey: "token")!)]
        
        
        NetWorkDataManager.sharedInstance.profileDetailsImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            
            if errorString == nil
            {
                
                print(resonseTal!)
                
                if let statusCode = resonseTal?.value(forKey: "statusCodes") as? Int {
                    
                    print(statusCode)
                    let statusMsg = resonseTal?.value(forKey: "statusMessage") as? String ?? ""
                    let mesageCode = resonseTal?.value(forKey: "messageCode") as? String ?? statusMsg
                    if(statusCode == 200) {
                        self.removeLoader()
                        
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
                        
                        self.imgNameLbl.text = resonseTal?.value(forKey: "imageName") as? String
                        self.imgNameLbl.layer.cornerRadius = self.imgNameLbl.frame.size.width / 2;
                        self.imgNameLbl.clipsToBounds = true
                        let randomColr = UserDefaults.standard.string(forKey: "randomColour")!
                        let colorrs = randomColr.components(separatedBy: "-")
                        let firstColr = colorrs[0]
                        let secndColr = colorrs[1]
                        let newColorLbl = UIColor.colorFrom(hexString: firstColr)
                        self.imgNameLbl.borderColor = newColorLbl
                        self.imgNameLbl.textColor = newColorLbl
                        self.imgNameLbl.backgroundColor = UIColor.colorFrom(hexString: secndColr)
                        
                        
                        
                        let profileImage = resonseTal?.value(forKey: "profileImage") as? String
                        if profileImage == "" {
                            self.imgNameLbl.isHidden = false
                            self.profileImg.isHidden = true
                        }
                    
                      else  if let decodedImageData = Data(base64Encoded: profileImage ?? "", options: .ignoreUnknownCharacters) {
                            let image2 = UIImage(data: decodedImageData)
                            if image2 != nil {
                                self.profileImg.image = image2
                                self.profileImg.isHidden = false
                                self.imgNameLbl.isHidden = true
                            }
                            else if profileImage != nil {
                                let image1 = profileImage?.base64ToImage()
                                       self.profileImg.image = image1
                                self.profileImg.isHidden = false
                                self.imgNameLbl.isHidden = true
                            }
                            else {
                                self.imgNameLbl.isHidden = false
                                self.profileImg.isHidden = true
                            }
                           
                        }
                    }
                    if statusCode == 400
                    {
                        if mesageCode == "E110042"
                        {
                            self.showAlert(withTitle: "", withMessage: resonseTal?["statusMessage"] as? String ?? "")
//                            Global.shared.timeoUtOrNot = "no"
//                            self.showAlertForTimer(titulo: "", mensagem: statusMsg, vc: self)
                        }
                        else{
                        let alert = ViewControllerManager.displayAlert(message: resonseTal?["statusMessage"] as? String ?? "", title:APPLICATIONNAME)
                        self.present(alert, animated: true, completion: nil)
                        }
                    }
                    
                 //   self.menuItemsData()
                }
                self.removeLoader()
                
              //  self.removeSpinner()
            }
                
                
            else
            {
                            print(errorString!)
                         //   self.removeLoader()
                            self.removeSpinner()
                          /*  let finalError = errorString?.components(separatedBy: ":")
                            let alert = ViewControllerManager.displayAlert(message: finalError?[1] ?? "", title:APPLICATIONNAME)
                            self.present(alert, animated: true, completion: nil)*/
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
    
    
    
    @IBAction func switchBtnActn(_ sender: Any) {
        if ((sender as AnyObject).isOn == true){
            print("UISwitch state is now ON")
            
            UserDefaults.standard.set("true", forKey: "biometricEnabled")
            enableBiometric()
            
        }
        else{
            print("UISwitch state is now Off")
            UserDefaults.standard.set("false", forKey: "biometricEnabled")
            disableBiometric()
        }
    }
    
    func enableBiometric() {
        
        let paramaterPasing: [String:Any] = ["registrationId": UserDefaults.standard.string(forKey: "registrationId")!,
                                             "identityId": UIDevice.current.identifierForVendor?.uuidString ?? " ",
                                             "loginSource": 3,
                                             "biometricStatus": true]
        
        
      /*  let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        */
        
        let headers: HTTPHeaders = [.authorization(bearerToken: UserDefaults.standard.string(forKey: "token")!)]

        NetWorkDataManager.sharedInstance.enableFaceidInProfileImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            
            if errorString == nil
            {
                
               // print(resonseTal)
                if let statusCode = resonseTal?.value(forKey: "statusCodes") as? Int {
                    
                    print(statusCode)
                    let statusMsg = resonseTal?.value(forKey: "statusMessage") as? String ?? ""
                    let mesageCode = resonseTal?.value(forKey: "messageCode") as? String ?? statusMsg
                if statusCode == 400
                {
                    if mesageCode == "E110042"
                    {
                        self.showAlert(withTitle: "", withMessage: resonseTal?["statusMessage"] as? String ?? "")
//                        Global.shared.timeoUtOrNot = "no"
//                        self.showAlertForTimer(titulo: "", mensagem: statusMsg, vc: self)
                    }
                    else{
                    let alert = ViewControllerManager.displayAlert(message: resonseTal?["statusMessage"] as? String ?? "", title:APPLICATIONNAME)
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
    
    
    func disableBiometric() {
        
        let paramaterPasing: [String:Any] = ["registrationId": UserDefaults.standard.string(forKey: "registrationId")!,
                                             "identityId": UIDevice.current.identifierForVendor?.uuidString ?? " ",
                                             "loginSource": 3,
                                             "biometricStatus": false]
        
        /*
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]*/
        
        let headers: HTTPHeaders = [.authorization(bearerToken: UserDefaults.standard.string(forKey: "token")!)]

        
        NetWorkDataManager.sharedInstance.enableFaceidInProfileImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            
            if errorString == nil
            {
                
                
              //  print(resonseTal)
                if let statusCode = resonseTal?.value(forKey: "statusCodes") as? Int {
                    
                    print(statusCode)
                    let statusMsg = resonseTal?.value(forKey: "statusMessage") as? String ?? ""
                    let mesageCode = resonseTal?.value(forKey: "messageCode") as? String ?? statusMsg
                if statusCode == 400
                {
                    if mesageCode == "E110042"
                    {
                        self.showAlert(withTitle: "", withMessage: resonseTal?["statusMessage"] as? String ?? "")
//                        Global.shared.timeoUtOrNot = "no"
//                        self.showAlertForTimer(titulo: "", mensagem: statusMsg, vc: self)
                    }
                    else{
                    let alert = ViewControllerManager.displayAlert(message: resonseTal?["statusMessage"] as? String ?? "", title:APPLICATIONNAME)
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
    
    
  
    
    
    
    @IBAction func menuActn(_ sender: Any) {
        
        menuPopUp = self.storyboard?.instantiateViewController(withIdentifier: "MenuViewController") as? MenuViewController
               
               menuPopUp.delegateObj = self
               self.addChild(menuPopUp)
               menuPopUp.view.frame = self.view.frame
               self.view.addSubview(menuPopUp.view)
               menuPopUp.didMove(toParent: self)
    }
    
    @IBAction func logoutActn(_ sender: Any) {
        logout()
//        let refreshAlert = UIAlertController(title: Global.shared.logoutHeaderTxt, message: Global.shared.logoutTxt, preferredStyle: UIAlertController.Style.alert)
//        refreshAlert.view.tintColor = ColorCodes.newAppRed
//        refreshAlert.addAction(UIAlertAction(title: Global.shared.yesTxt, style: .default, handler: { (action: UIAlertAction!) in
//           self.pushViewController(controller: LoginVc.initiateController())
//        }))
//
//        refreshAlert.addAction(UIAlertAction(title: Global.shared.noTxt, style: .default, handler: { (action: UIAlertAction!) in
//            print("Handle Cancel Logic here")
//              refreshAlert.dismiss(animated: true, completion: nil)
//
//        }))
//
//        present(refreshAlert, animated: true, completion: nil)
    }
    
    @IBAction func languageChangeActn(_ sender: Any) {
        Global.shared.languageChangeActn()
    }
    
    
    func menuItemsData()  {
             self.removeSpinner()
             let titles = [Global.shared.profileTab! ,Global.shared.menuChangePaswd!]
            
                self.seg.delegate = self
                self.seg.segmentTitle = titles
          
                self.seg.selectedItemHighlightStyle=XMSelectedItemHighlightStyle.bottomEdge
                self.seg.backgroundColor = UIColor.white
                self.seg.highlightColor = UIColor.red
                // self.seg.tint = ColorCodes.DarkCement
                self.seg.tint = UIColor.gray
                self.seg.highlightTint = UIColor.red
                self.seg.font = UIFont.boldSystemFont(ofSize: 14)
               if appDelegate.helpScreen == 1
               {
                   seg.selectedSegment = 1
                   firstView.isHidden = true
                   secndView.isHidden = false
                   appDelegate.helpScreen = 0
               }
              else
              {
                  seg.selectedSegment = 0
                  firstView.isHidden = false
                  secndView.isHidden = true
                  appDelegate.helpScreen = 0
              }
               
              self.removeSpinner()
            }
            
            
            //MARK:- SLIDE TO CHANGHE SEGMENT METHODS
            func xmSegmentedControl(_ xmSegmentedControl: XMSegmentedControl, selectedSegment: Int) {
                
                if xmSegmentedControl == seg {
                    print("SegmentedControl1 Selected Segment: \(selectedSegment)")
                   
                    switch selectedSegment {
                    case 0:
       
                        firstView.isHidden = false
                        secndView.isHidden = true
                     
                    case 1:
                        
                        firstView.isHidden = true
                        secndView.isHidden = false
                       
                    default:
                        
                        break
                    }
                }
            }
    
    
    @IBAction func editBtnActn(_ sender: Any) {
      self.pushViewController(controller: ProfileIdentityVc.initiateController(), animated: true)
    }
    func getHelpList() {
        let paramaterPasing: [String:Any] = [
              "helpTypes": 3,
              "language": LocalizationSystem.sharedInstance.getLanguage(),
              "screen": 4,
              "registrationId": Global.shared.afterLoginRegistrtnId!
            
          ]
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
       // self.showSpinner(onView: self.view)
        NetWorkDataManager.sharedInstance.getHelpAndTips(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            
            if errorString == nil
            {
               print(resonseTal)
                self.removeSpinner()
                if let helpVideoList = resonseTal?.value(forKey: "helpAndTipsResponseList") as? NSArray
                {
                    self.helpVideoList = helpVideoList as! [[String : Any]]
                    
                    print("helpAction1",self.helpVideoList)
                    if self.helpVideoList.count != 0
                    {
                        self.btn_tips.isHidden = false
                    }
                    else
                    {
                        self.btn_tips.isHidden = true
                    }

                        self.removeSpinner()
                    
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
    
    
    
    
}


extension ProfileVc {
  
  func setGuideView(with title: String, subTitle: String, guideView: MaterialShowcase, targetView: UIView) {
    guideView.setTargetView(view: targetView)
    guideView.primaryText = title
    guideView.targetHolderRadius = 80
    guideView.secondaryText = subTitle
    guideView.backgroundPromptColor = ColorCodes.newAppRed
    guideView.delegate = self

  }
  func addConstraints() {
    hightlighLabel.isHidden = false
    hightlighLabel.centerXAnchor.constraint(equalToSystemSpacingAfter: seg.centerXAnchor, multiplier: 1).isActive = true
    hightlighLabel.centerYAnchor.constraint(equalToSystemSpacingBelow: seg.centerYAnchor, multiplier: 1).isActive = true
    hightlighLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
    hightlighLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
  }
    func getSegmentedView() -> UIButton? {
      var button: UIButton?
         seg.subviews.forEach { (view) in
           if view is UIButton {
             let btn = view as! UIButton
             if  btn.titleLabel?.text == Global.shared.menuChangePaswd ?? "" {
               button = btn
             }
             
           }
         }
      return button
    }
      
func addGuideViews() {
 guard  !Global.profileGuideView else {return}

  addConstraints()

    let titles = [Global.shared.guidedTour9!, Global.shared.guidedTour11!]
    let subTitles = [Global.shared.guidedTour10!, Global.shared.guidedTour12!]
    if LocalizationSystem.sharedInstance.getLanguage() == "ar" {
        guideView_1.backgroundRadius = 250
        guideView_1.targetHolderRadius = 40
    }
    else {
        guideView_1.backgroundRadius = 320
        guideView_1.targetHolderRadius = 40
    }
  
    guideView_2.setTargetView(view: getSegmentedView() ?? seg)
    
    
//  guard let editButton = self.view.viewWithTag(10) else {return}
  switchBtnOtlt.tintColor = ColorCodes.newAppRed
  // let targetnilViews = [switchBtnOtlt, hightlighLabel, editButton]
    let targetnilViews = [switchBtnOtlt, getSegmentedView() ?? seg] as [Any]
  let targetViews = targetnilViews.compactMap { $0 }
  //  for (index, view) in [guideView_1,guideView_2, guideView_3].enumerated() {
  for (index, view) in [guideView_1,guideView_2].enumerated() {
      setGuideView(with: titles[index], subTitle: subTitles[index], guideView: view, targetView: targetViews[index] as! UIView)
  }
    
 /*   let oneTimeKey = UUID().uuidString
    sequence.temp(guideView_1).temp(guideView_2).temp(guideView_3
    ).setKey(key: oneTimeKey).start()*/
  let oneTimeKey = UUID().uuidString
  sequence.temp(guideView_1).temp(guideView_2).setKey(key: oneTimeKey).start()
}
}
extension ProfileVc: MaterialShowcaseDelegate {
  
  
   func showCaseWillDismiss(showcase: MaterialShowcase, didTapTarget:Bool) {
    if showcase == guideView_1  {
      hightlighLabel.isHidden = true
    }
  }
  func showCaseDidDismiss(showcase: MaterialShowcase, didTapTarget: Bool) {
    sequence.showCaseWillDismis()

    if showcase == guideView_2 {
      Global.profileGuideView = true
    }
  /*  if showcase == guideView_3 {
      Global.profileGuideView = true
    }*/
  
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
extension UserDefaults {
    
    static func exists(key: String) -> Bool {
        return UserDefaults.standard.object(forKey: key) != nil
    }
    
}
extension UIImageView {
    
    func setRounded() {
      /*  let radius = self.frame.width / 2
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
        self.clipsToBounds = true*/
        
        self.layer.borderWidth = 1
        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.cornerRadius = self.frame.height/2
        self.clipsToBounds = true
        
    }
}

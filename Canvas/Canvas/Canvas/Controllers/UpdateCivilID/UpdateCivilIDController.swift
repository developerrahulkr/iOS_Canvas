//
//  UpdateCivilIDController.swift
//  Canvas
//
//  Created by RAC on 15/09/21.
//  Copyright © 2021 urmila reddy. All rights reserved.
//

import UIKit
import Alamofire
import MobileCoreServices
import AVFoundation
import AVKit
import CoreMedia
import Photos

class UpdateCivilIDController: BaseViewController,UINavigationControllerDelegate,UIPopoverControllerDelegate,UIDocumentPickerDelegate, UIImagePickerControllerDelegate {
    @IBOutlet weak var civilIDViewHeight: NSLayoutConstraint!
    @IBOutlet weak var btn_cancelBackImg: UIButton!
    @IBOutlet weak var btn_cancelFirstImg: UIButton!
    @IBOutlet weak var secondPDFLine: UIView!
    @IBOutlet weak var backImgViewHeight: NSLayoutConstraint!
   
    @IBOutlet weak var firstPDFLine: UIView!
    @IBOutlet weak var frontImgViewHeight: NSLayoutConstraint!
    @IBOutlet weak var btn_submit: UIButton!
    @IBOutlet weak var btn_cancel: UIButton!
    @IBOutlet weak var lbl_showBackImgValue: UILabel!
    @IBOutlet weak var img_showBack: UIImageView!
    @IBOutlet weak var view_showBackImg: UIView!
    @IBOutlet weak var lbl_showFrontImgValue: UILabel!
    @IBOutlet weak var img_showFront: UIImageView!
    @IBOutlet weak var view_showFrontImg: UIView!
    @IBOutlet weak var img_back: UIImageView!
    @IBOutlet weak var lbl_backImg: UILabel!
    @IBOutlet weak var View_backImg: UIView!
    @IBOutlet weak var img_front: UIImageView!
    @IBOutlet weak var lbl_front: UILabel!
    @IBOutlet weak var View_frontImg: UIView!
    @IBOutlet weak var lbl_uploadCivilId: UILabel!
    @IBOutlet weak var view_uploadCivilId: UIView!
    @IBOutlet weak var lbl_placeValdation: UILabel!
    @IBOutlet weak var txt_issuePlace: CustomTextField!
    @IBOutlet weak var lbl_placeHeader: UILabel!
    @IBOutlet weak var view_issuePlace: UIView!
    @IBOutlet weak var lbl_countryValidation: UILabel!
    @IBOutlet weak var lbl_countryValue: UILabel!
    @IBOutlet weak var lbl_countryHeader: UILabel!
    @IBOutlet weak var viewCountryIssue: UIView!
    @IBOutlet weak var lbl_expDateValidation: UILabel!
    @IBOutlet weak var lbl_expDateValue: UILabel!
    @IBOutlet weak var lbl_expDateHeader: UILabel!
    @IBOutlet weak var View_expDate: UIView!
    @IBOutlet weak var lbl_issueDateValidation: UILabel!
    @IBOutlet weak var lbl_issueDateValue: UILabel!
    @IBOutlet weak var lbl_IssueDateHeader: UILabel!
    @IBOutlet weak var view_issueDate: UIView!
    @IBOutlet weak var lbl_idNumValidation: UILabel!
    @IBOutlet weak var View_ID: UIView!
    @IBOutlet weak var txt_idNumber: CustomTextField!
    @IBOutlet weak var lbl_idHeader: UILabel!
    @IBOutlet weak var lbl_identityValidation: UILabel!
    @IBOutlet weak var lbl_identityValue: UILabel!
    @IBOutlet weak var lbl_identityHeader: UILabel!
    @IBOutlet weak var view_identityType: UIView!
    @IBOutlet weak var img_backGround: UIImageView!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var MainView: UIView!
    @IBOutlet weak var lbl_fieldEdit: UILabel!
    
    @IBOutlet weak var lbl_updateId: UILabel!
    
    var identityIsuue = ""
    var identityExpire = ""
    var pdf1Base64String:String = ""
    var pdf2Base64String:String = ""
    var frontOrBck = ""
    var selectedImage: UIImage?
    var pdfImg: UIImage?
    var imagSize:String = ""
    var pdfSize:String = ""
    var pickerImg:UIImagePickerController?=UIImagePickerController()
    var popover:UIPopoverController?=nil
    var videoRecOrselect: String!
    var easyTipView : EasyTipView!
    var frontSideExtn:String!
    var backSideExtn: String!
    override func viewDidLoad() {
        super.viewDidLoad()
       pdfImg = nil
        // Do any additional setup after loading the view.
        frontSideExtn = ".png"
        backSideExtn = ".png"
        self.scrollView.backgroundColor = UIColor(patternImage: UIImage(named: "AppBckgroundImg")!)
        self.scrollView.backgroundColor = UIColor(patternImage: UIImage(named: "AppBckgroundImg")!)
        self.civilIDViewHeight.constant = 120
        self.frontImgViewHeight.constant = 0
        self.backImgViewHeight.constant = 0
        self.view_uploadCivilId.layoutIfNeeded()
        self.view_showFrontImg.layoutIfNeeded()
        self.view_showBackImg.layoutIfNeeded()
        view_showFrontImg.isHidden = false
        view_showBackImg.isHidden = false
        img_showFront.isHidden = true
        img_showBack.isHidden = true
        lbl_showBackImgValue.isHidden = true
        lbl_showFrontImgValue.isHidden = true
        btn_cancelBackImg.isHidden = true
        btn_cancelFirstImg.isHidden = true
        firstPDFLine.isHidden = true
        secondPDFLine.isHidden = true
        
    //    assignLabels()
        
        // For front image
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.touchFrontImg(_:)))
        img_showFront.addGestureRecognizer(tap)
        img_showFront.isUserInteractionEnabled = true
        // For back image
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(self.touchBackImg(_:)))
        img_showBack.addGestureRecognizer(tap1)
        img_showBack.isUserInteractionEnabled = true
        
        lbl_updateId.text = Global.shared.CivilIDUpdate
        getProfileDetails()
    }
    @objc func touchFrontImg(_ sender: UITapGestureRecognizer) {
        print("Hello Dear you are here")
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ShowImageController") as! ShowImageController
        vc.image = img_showFront.image
        self.present(vc, animated: false, completion: nil)
        
//        let vc = ShowImageController()
//        vc.modalPresentationStyle = .overCurrentContext
//        vc.modalTransitionStyle = .crossDissolve
//        present(vc, animated: true, completion: nil)
    }
    @objc func touchBackImg(_ sender: UITapGestureRecognizer) {
        print("Hello Dear you are here")
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ShowImageController") as! ShowImageController
        vc.image = img_showBack.image
        self.present(vc, animated: false, completion: nil)
        
//        let vc = ShowImageController()
//        vc.modalPresentationStyle = .overCurrentContext
//        vc.modalTransitionStyle = .crossDissolve
//        present(vc, animated: true, completion: nil)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
      //  scrollView.contentSize = CGSize(width: self.view.frame.size.width, height: MainView.frame.size.height+50)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    func assignLabels() {
        lbl_fieldEdit.isHidden = true
        View_ID.layer.cornerRadius = 5
        view_issueDate.layer.cornerRadius = 5
        view_issuePlace.layer.cornerRadius = 5
        View_expDate.layer.cornerRadius = 5
        view_identityType.layer.cornerRadius = 5
        viewCountryIssue.layer.cornerRadius = 5
        view_uploadCivilId.layer.cornerRadius = 5
        View_frontImg.layer.cornerRadius = 5
        View_backImg.layer.cornerRadius = 5
        btn_submit.layer.cornerRadius = 5
        btn_cancel.layer.cornerRadius = 5
        
       // headerLbl.text = Global.shared.newCustomerHeader
        
        lbl_expDateValidation.font = Global.shared.fontReqLbl
        lbl_expDateValidation.textColor = ColorCodes.newAppRed
        
        lbl_identityHeader.font = Global.shared.fontTopLbl
        lbl_identityHeader.textColor = ColorCodes.topTitleColor
        
        lbl_identityValue.font = Global.shared.fontBottomLbl
        lbl_identityValue.textColor = ColorCodes.bottomTitleColor
        
        lbl_idHeader.font = Global.shared.fontTopLbl
        lbl_idHeader.textColor = ColorCodes.topTitleColor
        
        txt_idNumber.font = Global.shared.fontBottomLbl
        txt_idNumber.textColor = ColorCodes.bottomTitleColor
        
        lbl_IssueDateHeader.font = Global.shared.fontTopLbl
        lbl_IssueDateHeader.textColor = ColorCodes.topTitleColor
        
        lbl_issueDateValue.font = Global.shared.fontBottomLbl
        lbl_issueDateValue.textColor = ColorCodes.bottomTitleColor
        
        lbl_expDateHeader.font = Global.shared.fontTopLbl
        lbl_expDateHeader.textColor = ColorCodes.topTitleColor
        
        lbl_expDateValue.font = Global.shared.fontBottomLbl
        lbl_expDateValue.textColor = ColorCodes.bottomTitleColor
        
        lbl_countryHeader.font = Global.shared.fontTopLbl
        lbl_countryHeader.textColor = ColorCodes.topTitleColor
        
        lbl_countryValue.font = Global.shared.fontBottomLbl
        lbl_countryValue.textColor = ColorCodes.bottomTitleColor
        
        lbl_placeHeader.font = Global.shared.fontTopLbl
        lbl_placeHeader.textColor = ColorCodes.topTitleColor
        
        txt_issuePlace.font = Global.shared.fontBottomLbl
        txt_issuePlace.textColor = ColorCodes.bottomTitleColor
        
        lbl_placeHeader.font = Global.shared.fontTopLbl
        lbl_placeHeader.textColor = ColorCodes.topTitleColor
        
        lbl_uploadCivilId.text = Global.shared.uploadProfDocmntsTxt
        
        lbl_front.font = Global.shared.fontBottomLbl
        lbl_front.textColor = ColorCodes.bottomTitleColor
        lbl_front.text = Global.shared.frontTxt
       // lbl_front.textAlignment = .center
        
        lbl_backImg.font = Global.shared.fontBottomLbl
        lbl_backImg.textColor = ColorCodes.bottomTitleColor
        lbl_backImg.text = Global.shared.backTxt
       // lbl_backImg.textAlignment = .center
        
        if Global.shared.new_identityType_is_required == true {
            lbl_identityHeader.text = Global.shared.newCidentityTypeTxt + "*"
        }
        else {
            lbl_identityHeader.text = Global.shared.newCidentityTypeTxt
        }
        if Global.shared.new_identityId_is_required == true {
            lbl_idHeader.text = Global.shared.newCidentityNumberTxt + "*"
        }
        else {
            lbl_idHeader.text = Global.shared.newCidentityNumberTxt
        }
        if Global.shared.new_identityIssueDate_is_required == true {
            lbl_IssueDateHeader.text = Global.shared.newCIdIssueDateTxt + "*"
        }
        else {
            lbl_IssueDateHeader.text = Global.shared.newCIdIssueDateTxt
        }
        if Global.shared.new_identityExpiryDate_is_required == true {
            lbl_expDateHeader.text = Global.shared.newCIdExpiryDateTxt + "*"
        }
        else {
            lbl_expDateHeader.text = Global.shared.newCIdExpiryDateTxt
        }
        if Global.shared.new_identityCountryIssue_is_required == true {
            lbl_countryHeader.text = Global.shared.newCCountryOfIsueTxt + "*"
        }
        else {
            lbl_countryHeader.text = Global.shared.newCCountryOfIsueTxt
        }
        if Global.shared.new_identityPlaseIssue_is_required == true {
            lbl_placeHeader.text = Global.shared.newCPlaceOfIsueTxt + "*"
        }
        else {
            lbl_placeHeader.text = Global.shared.newCPlaceOfIsueTxt
        }
       
        
      
        btn_submit.setTitle(Global.shared.submitBtnTxt, for: .normal)
        btn_cancel.setTitle(Global.shared.cancelTxt, for: .normal)
        
        
        
        let formatter = DateFormatter()
        let todaysDate = NSDate()
        formatter.dateFormat = "dd/MM/yyyy"
        let idExpiredt = formatter.date(from: ProfileDetails.shared.identityExpireDate)
        self.lbl_expDateValue.text = formatter.string(from: idExpiredt ?? todaysDate as Date)
        formatter.dateFormat = "yyyy-MM-dd"
        self.identityExpire = formatter.string(from: idExpiredt ?? todaysDate as Date)
        
//
//            let formatter1 = DateFormatter()
//         formatter1.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
//         formatter1.timeZone = NSTimeZone(forSecondsFromGMT: 0) as TimeZone
//        self.identityExpire = formatter.string(from: idExpiredt!)
        
        
        
        
        formatter.dateFormat = "dd/MM/yyyy"
        let idIssueDt = formatter.date(from: ProfileDetails.shared.identityIssueDate)
        self.lbl_issueDateValue.text = formatter.string(from: idIssueDt ?? todaysDate as Date)
        formatter.dateFormat = "yyyy-MM-dd"
        self.identityIsuue = formatter.string(from: idIssueDt ?? todaysDate as Date)
        
        
        let indexId = Global.shared.identityTypes.firstIndex(of:  ProfileDetails.shared.identityType)
        if indexId != nil{
           self.lbl_identityValue.text = Global.shared.civilIdNames[indexId ?? 0]
        }
        
        let indexThree = Global.shared.countryCodesData.firstIndex(of:  ProfileDetails.shared.identityCountryIsuue)
        if indexThree != nil {
            self.lbl_countryValue.text = Global.shared.countryNameData[indexThree ?? 0]
            
        }
        else {
            self.lbl_countryValue.text = ""
        }
        txt_idNumber.text = ProfileDetails.shared.identityId ?? ""
        txt_issuePlace.text = ProfileDetails.shared.identityPlaceIsue ?? ""
        
    }
    // Mark: For getting profile details
    func getProfileDetails() {
        self.showSpinner(onView: self.view)
           let paramaterPasing: [String:Any] = [
               "registrationId": UserDefaults.standard.string(forKey: "registrationId")!
           ]
           
           let headers: HTTPHeaders = [.authorization(bearerToken: UserDefaults.standard.string(forKey: "token")!)]
           
           
           NetWorkDataManager.sharedInstance.civilIdDetailsImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
          
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
                          
                        DispatchQueue.main.async {
                            self.assignLabels()
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

                               }
                               
                               else {
                                   let alert = ViewControllerManager.displayAlert(message: errorString ?? "", title:APPLICATIONNAME)
                                   self.present(alert, animated: true, completion: nil)
                               }
                              
                               
                           }

               
           }
       }
    func showSimpleAlert(msg:String) {
        let alert = UIAlertController(title: "", message: msg,preferredStyle:UIAlertController.Style.alert)
        alert.view.tintColor = ColorCodes.newAppRed
          alert.addAction(UIAlertAction(title: Global.shared.okTxt,
                                        style: UIAlertAction.Style.default,
                                        handler: {(_: UIAlertAction!) in
            self.navigationController?.popViewController(animated: true)
          }))
          self.present(alert, animated: true, completion: nil)
      }
    @IBAction func onClickBackBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func onClickLangChange(_ sender: Any) {
        Global.shared.languageChangeActn()
    }
    @IBAction func onClickIdentity(_ sender: Any) {
    }
    @IBAction func onClickExpDate(_ sender: Any) {
        let today = Date()
        print(today)
        
        let formatter = DateFormatter()
        
        formatter.dateFormat = "dd/MM/yyyy"
        let idExpiredt = formatter.date(from: ProfileDetails.shared.identityExpireDate)
       // self.lbl_expDateValue.text = formatter.string(from: idExpiredt ?? todaysDate as Date)
       // print(idExpiredt)
        
        if Date() < idExpiredt!
        {
            let alert = ViewControllerManager.displayAlert(message: Global.shared.IDExpiryValidation, title:APPLICATIONNAME)
            self.present(alert, animated: true, completion: nil)
        }
        else{
            
        DatePickerDialog().show(Global.shared.newCIdExpiryDateTxt, doneButtonTitle: "Done", cancelButtonTitle: "Cancel", minimumDate: Calendar.current.date(byAdding: .day, value: 1, to: today)!, datePickerMode: .date) {
              (date) -> Void in
            if let dt = date {
                let formatter = DateFormatter()
                formatter.locale = Locale(identifier: "en_US_POSIX")
                formatter.dateFormat = "dd/MM/yyyy"
                self.lbl_expDateValue.text = formatter.string(from: dt)
                    let formatter1 = DateFormatter()
                 formatter1.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
                 formatter1.timeZone = NSTimeZone(forSecondsFromGMT: 0) as TimeZone
                 self.identityExpire = formatter.string(from: dt)
                
                formatter.dateFormat = "yyyy-MM-dd"
                self.identityExpire = formatter.string(from: dt)
                
                if Global.shared.new_identityExpiryDate_is_required == true {
                    self.lbl_expDateValidation.isHidden = true
                }
                
            }
        }
        }
    }
    @IBAction func onCickLogOut(_ sender: Any) {
        logout()
    }
    @IBAction func onClickIssueDate(_ sender: Any) {
    }
    @IBAction func onClickCountryBtn(_ sender: Any) {
    }
    @IBAction func uploadFrontImg(_ sender: Any) {
        if pdf1Base64String == "" &&  pdf2Base64String == ""{
            img_showFront.image = nil
            img_showBack.image = nil

        }
//
        frontOrBck = "front"
        if img_showFront.image != nil
        {
            let alert = ViewControllerManager.displayAlert(message: Global.shared.remveFrntImgToUpNewOne , title:APPLICATIONNAME)
                self.present(alert, animated: true, completion: nil)
        }
//        if img_showFront.image == UIImage(named: "backOneImg") || img_showBack.image == UIImage(named: "backOneImg") {
//
//        }
        else {
            
            tappedMe()
       }
    }
    @IBAction func uploadBackImg(_ sender: Any) {
        if pdf1Base64String == "" &&  pdf2Base64String == ""{
            img_showFront.image = nil
            img_showBack.image = nil

        }
        
        frontOrBck = "back"
        if img_showBack.image != nil{
            let alert = ViewControllerManager.displayAlert(message: Global.shared.remveBckImgToUpNewOne , title:APPLICATIONNAME)
                self.present(alert, animated: true, completion: nil)
            
        }
//        if img_showFront.image == UIImage(named: "backOneImg") || img_showBack.image == UIImage(named: "backOneImg") {
//
//        }
        else {
            
            tappedMe()
        }
    }
    @IBAction func firstPDFCBtnClick(_ sender: Any) {
        if pdf2Base64String == ""
        {
            self.civilIDViewHeight.constant = 120
            secondPDFLine.isHidden = true
            btn_cancelFirstImg.isHidden = true
        }
        else
        {
            self.civilIDViewHeight.constant = 150
        }
        pdf1Base64String = ""
        lbl_showFrontImgValue.text = ""
        img_showFront.image = nil
     //   self.backImgViewHeight.constant = 0
        self.frontImgViewHeight.constant = 0
        self.view_uploadCivilId.layoutIfNeeded()
        img_showFront.isHidden = true
      //  img_showBack.isHidden = true
      //  lbl_showBackImgValue.isHidden = false
        lbl_showFrontImgValue.isHidden = true
        
       
        self.frontImgViewHeight.constant = 0
      //  self.backImgViewHeight.constant = 50
      
        self.view_showFrontImg.layoutIfNeeded()
      //  self.view_showBackImg.layoutIfNeeded()
       // btn_cancelBackImg.isHidden = true
        btn_cancelFirstImg.isHidden = true
        firstPDFLine.isHidden = true
      //  secondPDFLine.isHidden = false
        if  pdf2Base64String == "" && pdf1Base64String == "" {
            selectedImage = nil
            pdfImg = nil
        }
       
        
    }
    @IBAction func secondPDFBtnClick(_ sender: Any) {
      //  img_showFront.isHidden = false
        if pdf1Base64String == ""
        {
            self.civilIDViewHeight.constant = 120
            firstPDFLine.isHidden = true
            btn_cancelFirstImg.isHidden = true
           
        }
        else{
            self.civilIDViewHeight.constant = 150
        }
        pdf2Base64String = ""
        img_showBack.isHidden = true
        img_showBack.image = nil
        lbl_showBackImgValue.text = ""
        self.view_uploadCivilId.layoutIfNeeded()
        lbl_showBackImgValue.isHidden = true
        self.backImgViewHeight.constant = 0
       // self.view_showFrontImg.layoutIfNeeded()
        self.view_showBackImg.layoutIfNeeded()
        btn_cancelBackImg.isHidden = true
 
        secondPDFLine.isHidden = true
 
        secondPDFLine.isHidden = true
        if  pdf2Base64String == "" && pdf1Base64String == "" {
            selectedImage = nil
            pdfImg = nil
        }
        
        
    }
    @IBAction func civilIDTipActn(_ sender: Any) {
        var preferences = EasyTipView.Preferences()
        preferences.drawing.font = UIFont(name: "Futura-Medium", size: 13)!
        preferences.drawing.foregroundColor = UIColor.white
        preferences.drawing.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        preferences.drawing.arrowPosition = EasyTipView.ArrowPosition.top
        
        EasyTipView.globalPreferences = preferences
        
        
        
        if self.easyTipView == nil
        {
            self.easyTipView = EasyTipView(text: Global.shared.imageFileToolTip)
            self.easyTipView.show(animated: true, forView: sender as! UIView, withinSuperview: nil)
        }
        else
        {
            self.easyTipView.dismiss()
            self.easyTipView = nil
        }
    }
    @IBAction func onClickCancelBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func onClickSubmitBtn(_ sender: Any) {
        let formatter = DateFormatter()
        
        formatter.dateFormat = "dd/MM/yyyy"
        let idExpiredt = formatter.date(from: ProfileDetails.shared.identityExpireDate)
       // self.lbl_expDateValue.text = formatter.string(from: idExpiredt ?? todaysDate as Date)
       // print(idExpiredt)
        
        if Date() < idExpiredt!
        {
            let alert = ViewControllerManager.displayAlert(message: Global.shared.IDExpiryValidation, title:APPLICATIONNAME)
            self.present(alert, animated: true, completion: nil)
        }
        
        else if Date() >= formatter.date(from:self.lbl_expDateValue.text!)!  {
            let alert = ViewControllerManager.displayAlert(message: Global.shared.dateShouldGreater, title:APPLICATIONNAME)
            self.present(alert, animated: true, completion: nil)
        }
       else if pdf1Base64String == "" || pdf2Base64String == "" {
            let alert = ViewControllerManager.displayAlert(message: Global.shared.selectFrontBackFilesAlert, title:APPLICATIONNAME)
            self.present(alert, animated: true, completion: nil)
        }
        

        else
        {
            UpdateCivilID()
        }
        
        
    }
    func UpdateCivilID()  {
        
        print(identityExpire)
        self.showSpinner(onView: self.view)
        let ipAddress = try? String(contentsOf: URL(string: "https://api.ipify.org")!, encoding: .utf8)
             //  print(ipAddress)
       // print(identityExpire)
        let newIpAdress = ipAddress ?? ""
        let paramaterPasing: [String:Any] = [
              "registrationId": UserDefaults.standard.string(forKey: "registrationId")!,
              "civilIDExpiry": self.identityExpire,
              "frontImage":  pdf1Base64String,
              "frontImageExtension": frontSideExtn!,
              "backImage":  pdf2Base64String,
              "backImageExtension": backSideExtn!,
              "ipAddress": newIpAdress
            
        ]
      //  print(paramaterPasing)
        let headers: HTTPHeaders = [.authorization(bearerToken: UserDefaults.standard.string(forKey: "token")!)]
        
        
        NetWorkDataManager.sharedInstance.civilIdUpdateImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
       
            if errorString == nil
            {
             
              self.removeSpinner()
              self.removeLoader()
                print(resonseTal!)
                if let statusCode = resonseTal?.value(forKey: "statusCodes") as? Int {
                    
                    print(statusCode)
                    if(statusCode == 200) {
                        let statusMsg = resonseTal?.value(forKey: "statusMessage") as? String ?? ""
                        let mesageCode = resonseTal?.value(forKey: "messageCode") as? String ?? statusMsg
                      //  let resMsg = resonseTal?.value(forKey: "statusMessage") as? String
                           //  self.showSimpleAlert(msg:  resMsg!)
                        DispatchQueue.main.async {
                            
                            if mesageCode == "I220034"
                            {
                                  self.showSimpleAlert(msg: Global.shared.IDUnderReview)
//                                continueBtnOtlt.setTitle(Global.shared.okTxt, for: .normal)
//                                titleLbl.text = Global.shared.civilIDReviewTitleLbl
//                                subTitleLbl.text = Global.shared.civilIDReviewSubTitle1
                            }
                            else{
                       
                                let popOverVC = self.storyboard?.instantiateViewController(withIdentifier: "ProfileUnderReviewPopUp") as! ProfileUnderReviewPopUp
                                popOverVC.messageCode = mesageCode
                                self.addChild(popOverVC)
                                popOverVC.view.frame = self.view.frame
                                self.view.addSubview(popOverVC.view)
                                popOverVC.didMove(toParent: self)
                            }
                       /*     }
                            
                            alert6.addAction(OKAction)
                            self.present(alert6, animated: true, completion: nil)*/
                        }
                        
                    }
                 else if statusCode == 400
                 {
                     let alert = ViewControllerManager.displayAlert(message: resonseTal?["statusMessage"] as? String ?? "", title:APPLICATIONNAME)
                     self.present(alert, animated: true, completion: nil)
                 }
                else{
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

                            }
                            
                            else {
                                let alert = ViewControllerManager.displayAlert(message: errorString ?? "", title:APPLICATIONNAME)
                                self.present(alert, animated: true, completion: nil)
                            }
                           
                            
                        }

            
        }
    }
    @objc func tappedMe()
    {
        if pdf1Base64String == "" || pdf2Base64String == ""{
            
            let alert:UIAlertController=UIAlertController(title: Global.shared.selectOptionTxt, message: nil, preferredStyle: UIAlertController.Style.actionSheet)
            
            let cameraAction = UIAlertAction(title: Global.shared.fileTxt, style: UIAlertAction.Style.default)
            {
                UIAlertAction in
                if  self.frontOrBck == "front" {
                  //  self.frontImageUpdate()
                }
                else {
                 //   self.backImageUpdate()
                }
                //   self.openCamera()
                self.clickFunction()
            }
            let camera1Action = UIAlertAction(title: Global.shared.cameraTxt, style: UIAlertAction.Style.default)
            {
                UIAlertAction in
                if  self.frontOrBck == "front" {
                  //  self.frontImageUpdate()
                }
                else {
                  //  self.backImageUpdate()
                }
                
                self.openCamera()
                //  self.clickFunction()
            }
            let gallaryAction = UIAlertAction(title: Global.shared.galryTxt, style: UIAlertAction.Style.default)
            {
                UIAlertAction in
                
                if  self.frontOrBck == "front" {
                  //  self.frontImageUpdate()
                }
                else {
                  //  self.backImageUpdate()
                }
                
                
                self.openGallary()
            }
            let cancelAction = UIAlertAction(title: Global.shared.cancelTxt, style: UIAlertAction.Style.cancel)
            {
                UIAlertAction in
            }
            
            // Add the actions
            pickerImg?.delegate = self
            alert.addAction(cameraAction)
            alert.addAction(camera1Action)
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
            }
        }
        else {
            let alert = ViewControllerManager.displayAlert(message: Global.shared.alrdySelFrntBckFiles, title:APPLICATIONNAME)
            self.present(alert, animated: true, completion: nil)
            
        }
        
        
    }
    func drawPDFfromURL(url: URL) -> UIImage? {
        guard let document = CGPDFDocument(url as CFURL) else { return nil }
        guard let page = document.page(at: 1) else { return nil }

        let pageRect = page.getBoxRect(.mediaBox)
        let renderer = UIGraphicsImageRenderer(size: pageRect.size)
        let img = renderer.image { ctx in
            UIColor.white.set()
            ctx.fill(pageRect)

            ctx.cgContext.translateBy(x: 0.0, y: pageRect.size.height)
            ctx.cgContext.scaleBy(x: 1.0, y: -1.0)

            ctx.cgContext.drawPDFPage(page)
        }

        return img
    }
    
    // for pdf
    public func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        guard let myURL = urls.first else {
            return
        }
        print("import result : \(myURL)")
      let  newPdfImg = drawPDFfromURL(url: myURL)

        let fileData = NSData(contentsOf: myURL as URL)!
        print(fileData)

        let filename =  myURL.deletingPathExtension().lastPathComponent

        let  mbsize = Double(fileData.count) / 1024 / 1024
        print(mbsize)
        
        if Int(mbsize) > Int(pdfSize) ?? 0 {

            let alert = ViewControllerManager.displayAlert(message:"pdf/image cannot exceed more than 5MB", title:APPLICATIONNAME)
            self.present(alert, animated: true, completion: nil)

        }
    
        
        
        else {
            
            if chekPDFImagesorEqual(newPdfImg!) {
               print("true")
               //print alert here
               //  picker .dismiss(animated: true, completion: nil)
                 let alert = ViewControllerManager.displayAlert(message: Global.shared.sameFileUploadTxt, title:APPLICATIONNAME)
                 self.present(alert, animated: true, completion: nil)
                 
               return
             }
            let base64String = fileData.base64EncodedString(options: .lineLength64Characters)
            print(base64String)
            if  self.frontOrBck == "front" {
               // self.frontImageUpdate()
                img_showFront.image = newPdfImg
            }
            else {
                //self.backImageUpdate()
                img_showBack.image = newPdfImg
            }
             pdfImg = newPdfImg
            if pdf1Base64String == "" && pdf2Base64String == ""{
               
                if  self.frontOrBck == "front" {
                    frontSideExtn = ".pdf"
                //    pdf1Base64String = strBjj
                    print(pdf1Base64String)
                    pdf1Base64String = base64String
                    lbl_showFrontImgValue.text = filename
                    self.civilIDViewHeight.constant = 150
                    self.view_uploadCivilId.layoutIfNeeded()
                    img_showFront.isHidden = false
                    img_showBack.isHidden = true
                   // lbl_showBackImgValue.isHidden = false
                    lbl_showFrontImgValue.isHidden = false
                    
                    
                    self.frontImgViewHeight.constant = 50
                    self.backImgViewHeight.constant = 0
                    self.view_showFrontImg.layoutIfNeeded()
                    self.view_showBackImg.layoutIfNeeded()
                    
                   // btn_cancelBackImg.isHidden = true
                    btn_cancelFirstImg.isHidden = false
                    firstPDFLine.isHidden = false
                  //  secondPDFLine.isHidden = true
                }
                else{
                    pdf2Base64String = base64String
                    print(pdf2Base64String)
                    backSideExtn = ".pdf"

                    img_showFront.isHidden = true
                    img_showBack.isHidden = false
                    
                      lbl_showBackImgValue.text = filename
                      self.civilIDViewHeight.constant = 150
                      self.view_uploadCivilId.layoutIfNeeded()
                      lbl_showBackImgValue.isHidden = false
                      lbl_showFrontImgValue.isHidden = false
                    
                   
                    self.frontImgViewHeight.constant = 0
                    self.backImgViewHeight.constant = 50
                   
                    self.view_showFrontImg.layoutIfNeeded()
                    self.view_showBackImg.layoutIfNeeded()
                    
                    btn_cancelBackImg.isHidden = false
                    btn_cancelFirstImg.isHidden = false
                    firstPDFLine.isHidden = false
                    secondPDFLine.isHidden = false
                    
                }

             
            }
            else if pdf1Base64String == "" {
                pdf1Base64String = base64String
                print(pdf1Base64String)
                frontSideExtn = ".pdf"
                
                lbl_showFrontImgValue.text = filename
                
                self.view_uploadCivilId.layoutIfNeeded()
                if pdf2Base64String != ""
                {
                    img_showBack.isHidden = false
                    self.civilIDViewHeight.constant = 200
                }
                else{
                    img_showBack.isHidden = true
                    self.civilIDViewHeight.constant = 200
                }
                img_showFront.isHidden = false
                
                lbl_showBackImgValue.isHidden = false
                lbl_showFrontImgValue.isHidden = false
                
               
                self.frontImgViewHeight.constant = 50
                self.backImgViewHeight.constant = 50
              
                self.view_showFrontImg.layoutIfNeeded()
                self.view_showBackImg.layoutIfNeeded()
                btn_cancelBackImg.isHidden = false
                btn_cancelFirstImg.isHidden = false
                firstPDFLine.isHidden = false
                secondPDFLine.isHidden = false

            }
            else {
                pdf2Base64String = base64String
                print(pdf2Base64String)
                
              
                
               // NewUser.shared.DocumentBackSide = pdf2Base64String
                 backSideExtn = ".pdf"
                if pdf1Base64String != ""
                {
                     img_showFront.isHidden = false
                     self.civilIDViewHeight.constant = 200
                }
                else{
                    img_showFront.isHidden = true
                    self.civilIDViewHeight.constant = 150
                }
                img_showBack.isHidden = false
                
                  lbl_showBackImgValue.text = filename
                 
                  self.view_uploadCivilId.layoutIfNeeded()
                  lbl_showBackImgValue.isHidden = false
                  lbl_showFrontImgValue.isHidden = false
                
               
                self.frontImgViewHeight.constant = 50
                self.backImgViewHeight.constant = 50
               
                self.view_showFrontImg.layoutIfNeeded()
                self.view_showBackImg.layoutIfNeeded()
                
                btn_cancelBackImg.isHidden = false
                btn_cancelFirstImg.isHidden = false
                firstPDFLine.isHidden = false
                secondPDFLine.isHidden = false

               // secndPdfPathLbl.text = filename

//                NewUser.shared.DocumentBackSide = pdf2Base64String
//                NewUser.shared.DocumentBackSideExtension = ".pdf"

               
            }
        }

    }


    public func documentMenu(_ documentMenu:UIDocumentPickerViewController, didPickDocumentPicker documentPicker: UIDocumentPickerViewController) {
        documentPicker.delegate = self
        present(documentPicker, animated: true, completion: nil)
    }


    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        print("view was cancelled")
       // self.presentingViewController?.dismiss(animated: false, completion:nil)
    }
    func clickFunction(){
        
        let importMenu = UIDocumentPickerViewController(documentTypes: [String(kUTTypePDF)], in: .import)
        importMenu.delegate = self
        if #available(iOS 11.0, *) {
            UINavigationBar.appearance(whenContainedInInstancesOf: [UIDocumentBrowserViewController.self]).tintColor = nil
        }
      //  importMenu.navigationController?.navigationBar.tintColor = ColorCodes.newAppRed
        importMenu.modalPresentationStyle = .formSheet
        self.present(importMenu, animated: true, completion: nil)
    }
    func openCamera()
    {
        //    self.imgeXX.removeAll()
        self.videoRecOrselect = "select photo"
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
        
        self.videoRecOrselect = "select photo"
        //  pickerImg!.sourceType = UIImagePickerController.SourceType.photoLibrary
        pickerImg!.sourceType = .photoLibrary
        pickerImg!.mediaTypes = [kUTTypeImage as String]
        if UIDevice.current.userInterfaceIdiom == .phone
        {
            self.present(pickerImg!, animated: true, completion: nil)
        }
        else
        {
            popover=UIPopoverController(contentViewController: pickerImg!)
            
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        
        if(self.videoRecOrselect == "select photo") {
            var fileName = "image"
            
            if let pickedImage = info[UIImagePickerController.InfoKey(rawValue: convertFromUIImagePickerControllerInfoKey(UIImagePickerController.InfoKey.originalImage))] as? UIImage
            {
                let fileUrl = info[UIImagePickerController.InfoKey.imageURL] as? URL
                
                if fileUrl != nil {
                    fileName = (fileUrl?.deletingPathExtension().lastPathComponent)!
                }
                else {
                    fileName = "image.png"
                }
                
               
                    if chekImagesorEqual(pickedImage) {
                      print("true")
                      //print alert here
                        picker .dismiss(animated: true, completion: nil)
                        let alert = ViewControllerManager.displayAlert(message: Global.shared.sameFileUploadTxt, title:APPLICATIONNAME)
                        self.present(alert, animated: true, completion: nil)
                        
                      return
                    }
                if  self.frontOrBck == "front" {
                    img_showFront.image = pickedImage
                   // self.frontImageUpdate()
                }
                else {
                    img_showBack.image = pickedImage
                 //   self.backImageUpdate()
                }
                
                selectedImage = pickedImage
                picker .dismiss(animated: true, completion: nil)
                let imgeeDattta = pickedImage.jpegData(compressionQuality: 0.1)
                let strBjj:String = imgeeDattta!.base64EncodedString(options: .lineLength64Characters)
                print(strBjj)
                
                if pdf1Base64String == "" && pdf2Base64String == ""{
                    
                    if  self.frontOrBck == "front" {
                        pdf1Base64String = strBjj
                        frontSideExtn = ".jpeg"
                        print(pdf1Base64String)
                        lbl_showFrontImgValue.text = fileName
                        self.civilIDViewHeight.constant = 150
                        self.view_uploadCivilId.layoutIfNeeded()
                        img_showFront.isHidden = false
                        img_showBack.isHidden = true
                       // lbl_showBackImgValue.isHidden = false
                        lbl_showFrontImgValue.isHidden = false
                        
                        
                        self.frontImgViewHeight.constant = 50
                        self.backImgViewHeight.constant = 0
                        self.view_showFrontImg.layoutIfNeeded()
                        self.view_showBackImg.layoutIfNeeded()
                        
                       // btn_cancelBackImg.isHidden = true
                        btn_cancelFirstImg.isHidden = false
                        firstPDFLine.isHidden = false
                      //  secondPDFLine.isHidden = true
                    }
                    else{
                        pdf2Base64String = strBjj
                        print(pdf2Base64String)
                        
                       // NewUser.shared.DocumentBackSide = pdf2Base64String
                        backSideExtn = ".jpeg"
                        img_showFront.isHidden = true
                        img_showBack.isHidden = false
                        
                          lbl_showBackImgValue.text = fileName
                          self.civilIDViewHeight.constant = 150
                          self.view_uploadCivilId.layoutIfNeeded()
                          lbl_showBackImgValue.isHidden = false
                          lbl_showFrontImgValue.isHidden = false
                        
                       
                        self.frontImgViewHeight.constant = 0
                        self.backImgViewHeight.constant = 50
                       
                        self.view_showFrontImg.layoutIfNeeded()
                        self.view_showBackImg.layoutIfNeeded()
                        
                        btn_cancelBackImg.isHidden = false
                        btn_cancelFirstImg.isHidden = false
                        firstPDFLine.isHidden = false
                        secondPDFLine.isHidden = false
                        
                    }
              
                }
                else if pdf1Base64String == "" {
                    pdf1Base64String = strBjj
                    print(pdf1Base64String)
                    
                  //  NewUser.shared.DocumentFrontSide = pdf1Base64String
                    frontSideExtn = ".jpeg"
                    
                    lbl_showFrontImgValue.text = fileName
                    
                    self.view_uploadCivilId.layoutIfNeeded()
                    if pdf2Base64String != ""
                    {
                        img_showBack.isHidden = false
                        self.civilIDViewHeight.constant = 200
                    }
                    else{
                        img_showBack.isHidden = true
                        self.civilIDViewHeight.constant = 200
                    }
                    img_showFront.isHidden = false
                    
                    lbl_showBackImgValue.isHidden = false
                    lbl_showFrontImgValue.isHidden = false
                    
                   
                    self.frontImgViewHeight.constant = 50
                    self.backImgViewHeight.constant = 50
                  
                    self.view_showFrontImg.layoutIfNeeded()
                    self.view_showBackImg.layoutIfNeeded()
                    btn_cancelBackImg.isHidden = false
                    btn_cancelFirstImg.isHidden = false
                    firstPDFLine.isHidden = false
                    secondPDFLine.isHidden = false

                }
                else {
                    pdf2Base64String = strBjj
                    print(pdf2Base64String)
                    
                   // NewUser.shared.DocumentBackSide = pdf2Base64String
                     backSideExtn = ".jpeg"
                    if pdf1Base64String != ""
                    {
                         img_showFront.isHidden = false
                         self.civilIDViewHeight.constant = 200
                    }
                    else{
                        img_showFront.isHidden = true
                        self.civilIDViewHeight.constant = 150
                    }
                    img_showBack.isHidden = false
                    
                      lbl_showBackImgValue.text = fileName
                     
                      self.view_uploadCivilId.layoutIfNeeded()
                      lbl_showBackImgValue.isHidden = false
                      lbl_showFrontImgValue.isHidden = false
                    
                   
                    self.frontImgViewHeight.constant = 50
                    self.backImgViewHeight.constant = 50
                   
                    self.view_showFrontImg.layoutIfNeeded()
                    self.view_showBackImg.layoutIfNeeded()
                    
                    btn_cancelBackImg.isHidden = false
                    btn_cancelFirstImg.isHidden = false
                    firstPDFLine.isHidden = false
                    secondPDFLine.isHidden = false

                }
                
            }
        }
        else {
            
            print("nothing")
            picker .dismiss(animated: true, completion: nil)
            
        }
        
    }
    func chekImagesorEqual(_ image: UIImage) -> Bool {
      return selectedImage?.pngData() == image.pngData()

    }
    func chekPDFImagesorEqual(_ image: UIImage) -> Bool {
       return pdfImg?.pngData() == image.pngData()
    
    }
    
    func frontImageUpdate() {
        if pdf1Base64String == "" &&  pdf2Base64String == ""{
            img_showFront.image = UIImage(named: "frontOneImg")
            
        }
            
        else {
            img_showBack.image = UIImage(named: "frontOneImg")
            
        }
        
    }
    
    func backImageUpdate() {
        if pdf1Base64String == "" &&  pdf2Base64String == ""{
            img_showFront.image = UIImage(named: "backOneImg")
            
        }
            
        else {
            img_showFront.image = UIImage(named: "backOneImg")
            
        }
    
        
    }
    fileprivate func convertFromUIImagePickerControllerInfoKeyDictionary(_ input: [UIImagePickerController.InfoKey: Any]) -> [String: Any] {
        return Dictionary(uniqueKeysWithValues: input.map {key, value in (key.rawValue, value)})
    }

    // Helper function inserted by Swift 4.2 migrator.
    fileprivate func convertFromUIImagePickerControllerInfoKey(_ input: UIImagePickerController.InfoKey) -> String {
        return input.rawValue
    }
}

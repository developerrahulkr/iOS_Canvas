//
//  VerifyAccountFirstVc.swift
//  Canvas
//
//  Created by urmila reddy on 06/08/20.
//  Copyright © 2020 urmila reddy. All rights reserved.
//

import UIKit
import Alamofire

class VerifyAccountFirstVc: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var headerLbl: UILabel!
    
    @IBOutlet weak var civilIdLbl: UILabel!
    
    
    @IBOutlet weak var civilIdTxtField: CustomTextField!
    
    @IBOutlet weak var mobileNumberLbl: UILabel!
    
    
    @IBOutlet weak var mobileNumberField: CustomTextField!
   
    @IBOutlet weak var verifyBtnOtl: UIButton!
    
    @IBOutlet weak var bckBtnOtlt: UIButton!
    
    
    @IBOutlet weak var tabLblOne: UILabel!
    
    
    @IBOutlet weak var tabLblTwo: UILabel!
    
    
    @IBOutlet weak var tabLblThree: UILabel!
    
    
    @IBOutlet weak var tabLblFour: UILabel!
    
    @IBOutlet weak var firstView: UIView!
    
    @IBOutlet weak var secndView: UIView!
    
   
    @IBOutlet weak var civilIdRequiredTxt: UILabel!
    
    @IBOutlet weak var mobileNumRequiredTxt: UILabel!
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        civilIdRequiredTxt.font = Global.shared.fontReqLbl
        civilIdRequiredTxt.textColor = ColorCodes.newAppRed
        
        mobileNumRequiredTxt.font = Global.shared.fontReqLbl
        mobileNumRequiredTxt.textColor = ColorCodes.newAppRed
        
        civilIdLbl.font = Global.shared.fontTopLbl
        civilIdLbl.textColor = ColorCodes.topTitleColor
        
        civilIdTxtField.font = Global.shared.fontBottomLbl
        civilIdTxtField.textColor = ColorCodes.bottomTitleColor
        
        mobileNumberLbl.font = Global.shared.fontTopLbl
        mobileNumberLbl.textColor = ColorCodes.topTitleColor
        
        mobileNumberField.font = Global.shared.fontBottomLbl
        mobileNumberField.textColor = ColorCodes.bottomTitleColor
        
       
      /*  civilIdTxtField.text = "286021807053"
        mobileNumberField.text = "65519350"*/
        
        
        
        
        firstView.layer.cornerRadius = 5
        secndView.layer.cornerRadius = 5
      
        verifyBtnOtl.layer.cornerRadius = 5
        bckBtnOtlt.layer.cornerRadius = 5
        
        
        
        civilIdTxtField.delegate = self
        mobileNumberField.delegate = self
       
        civilIdTxtField.valueType = .numbers
        
        self.tabLblOne.layer.cornerRadius = self.tabLblOne.frame.size.width / 2;
        self.tabLblOne.clipsToBounds = true
        
        self.tabLblTwo.layer.cornerRadius = self.tabLblTwo.frame.size.width / 2;
        self.tabLblTwo.clipsToBounds = true
        
        self.tabLblThree.layer.cornerRadius = self.tabLblThree.frame.size.width / 2;
        self.tabLblThree.clipsToBounds = true
        
        self.tabLblFour.layer.cornerRadius = self.tabLblFour.frame.size.width / 2;
        self.tabLblFour.clipsToBounds = true
      //  DispatchQueue.main.async {
            self.assignLabelsAndFieldsLength()
      //  }
        
    }
    
    
    // MARK: To verify account
    func verifyAccount() {
    
        let paramaterPasing: [String:Any] =
            ["civilID": civilIdTxtField.text ?? "","mobile": mobileNumberField.text ?? ""]
        print(paramaterPasing)
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        NetWorkDataManager.sharedInstance.verifyAccountImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { canvasResponse , errorString in
            
            if errorString == nil
            {
                
                self.removeSpinner()
               // print(canvasResponse)
                
                let statusMsg = canvasResponse?.value(forKey: "statusMessage") as? String
              
                if let statusCode = canvasResponse?.value(forKey: "statusCodes") as? Int {
                    if(statusCode == 200) {
                        self.generateOTP()
                    }
                    
                    else {
                        let alert = ViewControllerManager.displayAlert(message: statusMsg ?? "", title:APPLICATIONNAME)
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
    
    func assignLabelsAndFieldsLength() {
        
        headerLbl.text = Global.shared.firstSecndTabHeaderTxt
        verifyBtnOtl.setTitle(Global.shared.verifyBtnTxt, for: .normal)
        bckBtnOtlt.setTitle(Global.shared.backBtnTxt, for: .normal)
        
        
        civilIdRequiredTxt.text = Global.shared.civilIdTxt + " " + Global.shared.errorTxtRequired.lowercased()
        mobileNumRequiredTxt.text = Global.shared.mobileNumberTxt + " " + Global.shared.errorTxtRequired.lowercased()
       
        if Global.shared.exist_civilID_is_required == true {
            civilIdLbl.text = Global.shared.civilIdTxt + "*"
        }
        else {
            civilIdLbl.text = Global.shared.civilIdTxt
        }
        if Global.shared.exist_mobile_is_required == true {
            mobileNumberLbl.text = Global.shared.mobileNumberTxt + "*"
        }
        else {
            mobileNumberLbl.text = Global.shared.mobileNumberTxt
        }
       
        civilIdTxtField.maxLength = Global.shared.exist_civilID_max_length
        mobileNumberField.maxLength = Global.shared.exist_mobile_max_length
       
        
        civilIdTxtField.valueType = Global.shared.getFieldType(text: Global.shared.exist_civilID_field_accept)
        mobileNumberField.valueType = Global.shared.getFieldType(text: Global.shared.exist_mobile_field_accept)
      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @IBAction func verifyBtnActn(_ sender: Any) {
        if civilIdTxtField.text!.count < 12 {
            civilIdRequiredTxt.text = "Invalid Civil ID"
            civilIdRequiredTxt.isHidden = false
        }
        
      else  if Global.shared.exist_civilID_is_required == true  && civilIdTxtField.text == ""{
            
            civilIdRequiredTxt.isHidden = false
        }
            
        else if Global.shared.exist_mobile_is_required == true  && mobileNumberField.text == ""{
            
            mobileNumRequiredTxt.isHidden = false
        }
     
        
            /*  else  if mobileNumRequiredTxt.isHidden == false {
             self.mobileNumRequiredTxt.text = "Mobile Number exist"
             }*/
        else {
            Global.shared.fromNewExistUser = "Exist User"
            self.showSpinner(onView: self.view)
            
            verifyAccount()
         //   generateOTP()
            
        }
        
    }
    
    // MARK: Generating otp
    func generateOTP() {
        
        ExistingUser.shared.civilidExtCustApi = civilIdTxtField.text ?? ""
        ExistingUser.shared.mobileNumbExtCustApi = mobileNumberField.text ?? ""
       
        
        let paramaterPasing: [String:Any] =
            ["mobile": mobileNumberField.text ?? ""]
        
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        //just checking
        
        NetWorkDataManager.sharedInstance.generateOtpImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            
            if errorString == nil
            {
                //   print(resonseTal)
                
                self.removeSpinner()
                
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
                let finalError = errorString?.components(separatedBy: ":")
                let alert = ViewControllerManager.displayAlert(message: finalError?[1] ?? "", title:APPLICATIONNAME)
                self.present(alert, animated: true, completion: nil)
                
            }
        }
        
    }
    /*  func verifyEmail() {
     
     let paramaterPasing: [String:Any] =
     ["email": emailIdField.text ?? ""]
     
     
     let headers: HTTPHeaders = [
     "Content-Type": "application/json"
     ]
     
     NetWorkDataManager.sharedInstance.verifyEmailImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
     
     if errorString == nil
     {
     print(resonseTal)
     
     
     }
     else
     {
     print(errorString!)
     
     }
     }
     
     }
     
     func verifyMobile() {
     
     let paramaterPasing: [String:Any] =
     ["mobile": mobileNumberField.text ?? ""]
     
     
     let headers: HTTPHeaders = [
     "Content-Type": "application/json"
     ]
     
     NetWorkDataManager.sharedInstance.verifyMobileImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
     
     if errorString == nil
     {
     print(resonseTal)
     if let statusCode = resonseTal?.value(forKey: "statusCodes") as? Int {
     
     print(statusCode)
     if(statusCode == 200) {
     
     self.mobileNumRequiredTxt.text = "Mobile Number exist"
     self.mobileNumRequiredTxt.isHidden = false
     
     }
     else {
     
     self.mobileNumRequiredTxt.isHidden = true
     }
     
     }
     
     }
     else
     {
     print(errorString!)
     
     }
     }
     
     }*/
    
    
    @IBAction func bckBtnActn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    //on done button clicked
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        //doneAction()
        if textField == civilIdTxtField{
            if Global.shared.exist_civilID_is_required == true {
                civilIdRequiredTxt.text = Global.shared.civilIdTxt + " " + Global.shared.errorTxtRequired.lowercased()
                if civilIdTxtField.text!.count ==  0 {
                    civilIdRequiredTxt.isHidden = false
                }
                else {
                    civilIdRequiredTxt.isHidden = true
                }
            }
        }
            
        else  if textField == mobileNumberField{
            //  verifyMobile()
            if Global.shared.exist_mobile_is_required == true {
                if mobileNumberField.text!.count ==  0 {
                    mobileNumRequiredTxt.isHidden = false
                }
                else {
                    mobileNumRequiredTxt.isHidden = true
                }
            }
        }
      
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField == civilIdTxtField {
            
            if Global.shared.exist_civilID_is_required == true {
                civilIdRequiredTxt.text = Global.shared.civilIdTxt + " " + Global.shared.errorTxtRequired.lowercased()
                if civilIdTxtField.text!.count <= -1 {
                    civilIdRequiredTxt.isHidden = false
                }
                else {
                    civilIdRequiredTxt.isHidden = true
                }
            }
            return civilIdTxtField.verifyFields(shouldChangeCharactersIn: range, replacementString: string)
        } else if textField == mobileNumberField {
            if Global.shared.exist_mobile_is_required == true {
                if mobileNumberField.text!.count <= -1 {
                    mobileNumRequiredTxt.isHidden = false
                }
                else {
                    mobileNumRequiredTxt.isHidden = true
                }
            }
            return mobileNumberField.verifyFields(shouldChangeCharactersIn: range, replacementString: string)
            
        }
        
        return true
        
    }
    
    
    
    @IBAction func languageChangeActn(_ sender: Any) {
       // Global.shared.languageChangeActn()
        
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

//
//  SecurityQuestnOtpPopUp.swift
//  Canvas
//
//  Created by urmila reddy on 03/01/21.
//  Copyright © 2021 urmila reddy. All rights reserved.
//

import UIKit
import Alamofire

class SecurityQuestnOtpPopUp: UIViewController, UITextFieldDelegate  {
    
    @IBOutlet weak var popUpVieww: UIView!
    
    @IBOutlet weak var headerLbl: UILabel!
    
    @IBOutlet weak var subTitleLbl: UILabel!
    
    @IBOutlet weak var confirmBtnOtlt: UIButton!
    
    @IBOutlet weak var otpStatckk: UIStackView!
    
    @IBOutlet weak var otp1: UITextField!
    
    @IBOutlet weak var otp2: UITextField!
    
    @IBOutlet weak var otp3: UITextField!
    
    @IBOutlet weak var otp4: UITextField!
    
    @IBOutlet weak var invalidOtpTxt: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        otp1.delegate = self
        otp2.delegate = self
        otp3.delegate = self
        otp4.delegate = self
        
        if LocalizationSystem.sharedInstance.getLanguage() == "ar" {
            //    if textAlignment == .natural {
            otpStatckk.semanticContentAttribute = .forceLeftToRight
         //   adresDetlsLbl.textAlignment = .right
            //   }
            
        }
        
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        
        popUpVieww.layer.cornerRadius = 5
        confirmBtnOtlt.layer.cornerRadius = 5
        
        otp1.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        otp2.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        otp3.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        otp4.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        
        otp1.textAlignment = .center
        otp2.textAlignment = .center
        otp3.textAlignment = .center
        otp4.textAlignment = .center
        
      
        
        
        self.showAnimate()
        
        self.removeSpinner()
        assignLabels()
    }
 
    func assignLabels() {
        
        headerLbl.text = Global.shared.verificationHeaderTxt
        subTitleLbl.text = Global.shared.plsContctAdminOtp + "\n" + Global.shared.enterOtpAlrdyExists
      
        confirmBtnOtlt.setTitle(Global.shared.verifctnConfirmBtnTxt, for: .normal)
      
        
    }
    
    @IBAction func confirmBtnActn(_ sender: Any) {
        if otp1.text == "" || otp2.text == "" ||  otp3.text == "" || otp4.text == "" {
            let alert = ViewControllerManager.displayAlert(message:Global.shared.enterOtpTxt, title:APPLICATIONNAME)
            self.present(alert, animated: true, completion: nil)
        }
        
     else    {
        
        verifyOtp()
    
        }
    }
    
    // MARK: Verifying otp
    func verifyOtp() {
        
        let otpStr1 = otp1.text!  + otp2.text!
        let otpStr2 = otp3.text! + otp4.text!
        let otpStr = otpStr1 + otpStr2
        
        let paramaterPasing: [String:Any] =
            ["registrationId":  Global.shared.afterLoginRegistrtnId ?? "",
             "otp":  otpStr]
        
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        NetWorkDataManager.sharedInstance.verifySecurityQuestnsOtpImplementation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            
            if errorString == nil
            {
                self.removeSpinner()
                  // print(resonseTal)
               // let mesageCode = resonseTal?.value(forKey: "messageCode") as? String
                if let statusCode = resonseTal?.value(forKey: "statusCodes") as? Int {
                    
                    print(statusCode)
                    if(statusCode == 200) {
                     //   self.removeAnimate()
                    //    self.verifyAccount()
                        Global.shared.securityQuestnsReset = "reset"
                       self.pushViewController(controller: VerifyAcntThirdVc.initiateController(),isGestureEnable: false, animated: false)
                        
                    }
                        
                    else {
                        self.removeSpinner()
                        self.otp1.text = ""
                        self.otp2.text = ""
                        self.otp3.text = ""
                        self.otp4.text = ""
                        self.invalidOtpTxt.isHidden = false
                        
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
    
    func showAnimate()
    {
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0;
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        });
    }
    
    func removeAnimate()
    {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0;
        }, completion:{(finished : Bool)  in
            if (finished)
            {
                self.view.removeFromSuperview()
            }
        });
    }
    
    @IBAction func closeBtnActn(_ sender: Any) {
        removeAnimate()
    }
    
    @objc func textFieldDidChange(textField: UITextField){
        let text = textField.text
        self.invalidOtpTxt.isHidden = true
        if  text?.count == 1 {
            switch textField{
            case otp1:
                otp2.becomeFirstResponder()
            case otp2:
                otp3.becomeFirstResponder()
            case otp3:
                otp4.becomeFirstResponder()
            case otp4:
                otp4.resignFirstResponder()
            default:
                break
            }
        }
        if  text?.count == 0 {
            switch textField{
            case otp1:
                otp1.becomeFirstResponder()
            case otp2:
                otp1.becomeFirstResponder()
            case otp3:
                otp2.becomeFirstResponder()
            case otp4:
                otp3.becomeFirstResponder()
            default:
                break
            }
        }
        else{
            
        }
    }

}

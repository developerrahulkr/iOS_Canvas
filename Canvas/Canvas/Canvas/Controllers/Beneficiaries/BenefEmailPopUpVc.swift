//
//  BenefEmailPopUpVc.swift
//  Canvas
//
//  Created by urmila reddy on 30/09/20.
//  Copyright © 2020 urmila reddy. All rights reserved.
//

import UIKit
import Alamofire

class BenefEmailPopUpVc: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var popUpView: UIView!
    
    @IBOutlet weak var headerLbl: UILabel!
    
    @IBOutlet weak var firstView: UIView!
    
    @IBOutlet weak var emailIdLbl: UILabel!
    
    @IBOutlet weak var emailIdField: UITextField!
    
    @IBOutlet weak var emailReqLbl: UILabel!
    
    @IBOutlet weak var submitBtnOtlt: UIButton!
    
    var isopenfromfx = false
    var bookingid = 0
    var trancationid = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        //
        emailReqLbl.font = Global.shared.fontReqLbl
        emailReqLbl.textColor = ColorCodes.newAppRed
        
        popUpView.layer.cornerRadius = 5
        firstView.layer.cornerRadius = 5
         self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        emailIdField.delegate = self
        emailIdField.text = BeneficiaryDetails.shared.remitterEmail
        self.showAnimate()
        assignLabels()
    }
    func assignLabels() {
        headerLbl.text = Global.shared.sendEmailTxtt
        emailIdLbl.text = Global.shared.emailIdTxttLbl + "*"
           submitBtnOtlt.setTitle("Submit", for: .normal)
           emailReqLbl.text = Global.shared.errorTxtRequired
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
    
    @IBAction func closeButtonActn(_ sender: Any) {
        self.removeAnimate()
    }
    
    @IBAction func submitBtnActn(_ sender: Any) {
        if emailIdField.text == "" {
            emailReqLbl.isHidden = false
        }
     else  if AlertsValidations.SharedInstanceOfSingleTon.validateEmail(emailid: emailIdField.text!) == false
       {
           let alert = ViewControllerManager.displayAlert(message:Global.shared.invalidEmailTxtAlert , title:APPLICATIONNAME)
           //  let alert = ViewControllerManager.displayAlert(message:"Please enter valid email", title:APPLICATIONNAME)
           self.present(alert, animated: true, completion: nil)
       }
        else {
            self.showSpinner(onView: self.view)
            if(isopenfromfx)
            {
                sendEmailIdDatafromFX()
            }
            else
            {
                sendEmailIdData()
            }
            
            
        }
    }
    
    // Mark: sending email
    func sendEmailIdData() {
        
        
        
        let paramaterPasing: [String:Any] = ["registrationId": UserDefaults.standard.string(forKey: "registrationId")!,
                                             "beneficiaryId": BeneficiaryDetails.shared.beneficiaryId ?? 0,
                                             "txnRefNo": BeneficiaryDetails.shared.txnRef ?? "",
                                             "languageCode": LocalizationSystem.sharedInstance.getLanguage(),
                                             "email": emailIdField.text ?? ""]
        
        
     /*   let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]*/
        
        let headers: HTTPHeaders = [.authorization(bearerToken: UserDefaults.standard.string(forKey: "token")!)]
        NetWorkDataManager.sharedInstance.benefVoucherSendEmailImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            
            if errorString == nil
            {
                self.removeSpinner()
                
                print(resonseTal!)
                
                let statusMsg = resonseTal?.value(forKey: "statusMessage") as? String ?? ""
                let mesageCode = resonseTal?.value(forKey: "messageCode") as? String ?? statusMsg
                if let statusCode = resonseTal?.value(forKey: "statusCodes") as? Int {
                    
                    print(statusCode)
                    if(statusCode == 200) {
                        
                        //let alert = ViewControllerManager.displayAlert(message: statusMsg, title:APPLICATIONNAME)
                        let alert =  ViewControllerManager.displayAlert(message:Global.shared.messageCodeType(text: mesageCode), title:APPLICATIONNAME)
                        self.present(alert, animated: true, completion: nil)
                        self.removeAnimate()
                        
                    }
                    else if statusCode ==  400 {
                        if mesageCode == "E110042"
                        {
                            self.showAlert(withTitle: "", withMessage: resonseTal?["statusMessage"] as? String ?? "")

                        }
                        else{
                           let alert = ViewControllerManager.displayAlert(message: statusMsg ?? "", title:APPLICATIONNAME)
                          self.present(alert, animated: true, completion: nil)
                        }
                        self.removeAnimate()
                    }
                    else {
                        let alert = ViewControllerManager.displayAlert(message: statusMsg, title:APPLICATIONNAME)
                        self.present(alert, animated: true, completion: nil)
                        self.removeAnimate()
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
    
    
    
    func sendEmailIdDatafromFX()
    {
        let paramaterPasing: [String:Any] = ["registrationId": UserDefaults.standard.string(forKey: "registrationId")!,
                                             "amfeBookingId": self.bookingid,
                                             "txnRefNo": self.trancationid,
                                             "languageCode": LocalizationSystem.sharedInstance.getLanguage(),
                                             "email": emailIdField.text ?? ""]
        
        
     /*   let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]*/
        
        let headers: HTTPHeaders = [.authorization(bearerToken: UserDefaults.standard.string(forKey: "token")!)]
        NetWorkDataManager.sharedInstance.fxvoucherSendEmailImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            
            if errorString == nil
            {
                self.removeSpinner()
                
                print(resonseTal!)
                
                let statusMsg = resonseTal?.value(forKey: "statusMessage") as? String ?? ""
                let mesageCode = resonseTal?.value(forKey: "messageCode") as? String ?? statusMsg
                if let statusCode = resonseTal?.value(forKey: "statusCodes") as? Int {
                    
                    print(statusCode)
                    if(statusCode == 200) {
                        
                        //let alert = ViewControllerManager.displayAlert(message: statusMsg, title:APPLICATIONNAME)
                        let alert =  ViewControllerManager.displayAlert(message:Global.shared.messageCodeType(text: mesageCode), title:APPLICATIONNAME)
                        self.present(alert, animated: true, completion: nil)
                        self.removeAnimate()
                        
                    }
                    else if statusCode ==  400 {
                        if mesageCode == "E110042"
                        {
                            self.showAlert(withTitle: "", withMessage: resonseTal?["statusMessage"] as? String ?? "")

                        }
                        else{
                           let alert = ViewControllerManager.displayAlert(message: statusMsg ?? "", title:APPLICATIONNAME)
                          self.present(alert, animated: true, completion: nil)
                        }
                        self.removeAnimate()
                    }
                    else {
                        let alert = ViewControllerManager.displayAlert(message: statusMsg, title:APPLICATIONNAME)
                        self.present(alert, animated: true, completion: nil)
                        self.removeAnimate()
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
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        //doneAction()
        if textField == emailIdField{
            if emailIdField.text!.count ==  0 {
                emailReqLbl.isHidden = false
            }
            else {
                emailReqLbl.isHidden = true
            }
        }
        
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField == emailIdField {
            if emailIdField.text!.count <= -1 {
                emailReqLbl.isHidden = false
            }
            else {
                emailReqLbl.isHidden = true
            }
        }
        
        return true
        
    }
    
}

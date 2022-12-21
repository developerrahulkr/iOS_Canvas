//
//  ContactUsVc.swift
//  Canvas
//
//  Created by urmila reddy on 28/09/20.
//  Copyright © 2020 urmila reddy. All rights reserved.
//

import UIKit
import Alamofire

class ContactUsVc: UIViewController
{
    @IBOutlet weak var navHeaderLbl: UILabel!
    @IBOutlet weak var ourCustomerLbl: UILabel!
    @IBOutlet weak var ourCustomerServiceValueBtnOtlt: UIButton!
    @IBOutlet weak var emailKeyLbl: UILabel!
    @IBOutlet weak var emailValueLbl: UIButton!
    @IBOutlet weak var almuzinHeadOfceLbl: UILabel!
    @IBOutlet weak var headOfceOneLbl: UILabel!
    @IBOutlet weak var headOfcTwoLbl: UILabel!
    @IBOutlet weak var mainPhneNumberKeyLbl: UILabel!
    @IBOutlet weak var phnNumberOtlt: UIButton!
    @IBOutlet weak var firsttView: UIView!
    @IBOutlet weak var secnddView: UIView!
    @IBOutlet weak var thirddView: UIView!
    @IBOutlet weak var fourthView: UIView!
    @IBOutlet weak var secenView: UIView!
    @IBOutlet weak var faxkeyLbl: UILabel!
    @IBOutlet weak var faxValueLbl: UILabel!
    @IBOutlet weak var alwaysNearYouLbl: UILabel!
    @IBOutlet weak var firstNewView: UIView!
    @IBOutlet weak var youCanRechUsLbl: UILabel!
    @IBOutlet weak var ourCustmerServceLbl: UILabel!
    
    var phnNumber = ""
    var customerServicePhnNumber = ""
    var contactUsDataSource : ContactUs!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.navHeaderLbl.text = Global.shared.menuContact
        firsttView.addDropShadowToView(targetView: firsttView)
        secnddView.addDropShadowToView(targetView: secnddView)
        thirddView.addDropShadowToView(targetView: thirddView)
        fourthView.addDropShadowToView(targetView: fourthView)
        secenView.addDropShadowToView(targetView: secenView)
        firstNewView.addDropShadowToView(targetView: firstNewView)
        setdata()
        downloadContactDetails()
    }
    
    func setdata()
    {
        if let contactdata = CDUtilityInfo.shared.getAllContactData()
        {
            if let dataDict = contactdata.taskobject as? NSDictionary?
            {
            self.alwaysNearYouLbl.text = dataDict?["main_heading"] as? String ?? ""
            self.youCanRechUsLbl.text = dataDict?["sub_heading"] as? String ?? ""
            self.ourCustmerServceLbl.text = dataDict?["main_paragraph"] as? String ?? ""
            self.faxkeyLbl.text = dataDict?["fax_text"] as? String ?? ""
            self.faxValueLbl.text = dataDict?["fax_content"] as? String ?? ""
            self.ourCustomerLbl.text = dataDict?["hotline_text"] as? String ?? ""
            let hotlineNumber = dataDict?["hotline_content"] as? String ?? ""
            self.customerServicePhnNumber = hotlineNumber
            self.ourCustomerServiceValueBtnOtlt.setTitle(hotlineNumber, for: .normal)
            self.emailKeyLbl.text = dataDict?["email_text"] as? String ?? ""
            self.emailValueLbl.setTitle(dataDict?["email_content"] as? String ?? "", for: .normal)
            self.almuzinHeadOfceLbl.text = dataDict?["office_address"] as? String ?? ""
            let adresOneLbl = dataDict?["address_1"] as? String ?? ""
            let adresTwoLbl = dataDict?["address_2"] as? String ?? ""
            let adresThreeLbl = dataDict?["address_3"] as? String ?? ""
            let adresFinalLbl = adresOneLbl + "\n" + adresTwoLbl + "\n" + adresThreeLbl
            self.headOfceOneLbl.adjustsFontSizeToFitWidth = true
            self.headOfceOneLbl.text = adresFinalLbl
            self.headOfcTwoLbl.text = dataDict?["address_4"] as? String ?? ""
            self.mainPhneNumberKeyLbl.text = dataDict?["phone_text"] as? String ?? ""
            let phnValue = dataDict?["phone_content"] as? String ?? ""
            self.phnNumber = phnValue
            self.phnNumberOtlt.setTitle(phnValue, for: .normal)
            }
        }
    }
    
    // Mark: For downloading contact details
    func downloadContactDetails()
    {
        let paramaterPasing: [String:Any] = ["languageCode":LocalizationSystem.sharedInstance.getLanguage()]
        let headers: HTTPHeaders = ["Content-Type": "application/json"]
        NetWorkDataManager.sharedInstance.contactUsImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
        if errorString == nil
        {
            if let contactusContent = resonseTal?.value(forKey: "contactusContent") as? String
            {
                let dataObj = Global.shared.convertToDictionary(text: contactusContent)
                let obj = dataObj! as NSObject
                CDUtilityInfo.shared.saveContactData(obj: obj)
                self.setdata()
            }
        }
        else
        {
//                print(errorString!)
//                self.removeSpinner()
//                let finalError = errorString?.components(separatedBy: ":")
//                let alert = ViewControllerManager.displayAlert(message: finalError?[1] ?? "", title:APPLICATIONNAME)
//                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func bckBtnActn(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func emailActn(_ sender: Any)
    {
        let email = emailValueLbl.titleLabel?.text ?? ""
        
        let appURL = URL(string:  "mailto:\(email)")!
        
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(appURL, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(appURL)
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
    
    
    @IBAction func languageChangeActn(_ sender: Any) {
        Global.shared.languageChangeActn()
    }
    
    
    @IBAction func phnNumberBtnActn(_ sender: Any)
    {
        self.phnNumber = phnNumber.replacingOccurrences(of: " ", with: "")
        self.phnNumber = phnNumber.replacingOccurrences(of: "+", with: "")
        if let url = NSURL(string: "tel://\(String(describing: self.phnNumber))"), UIApplication.shared.canOpenURL(url as URL)
        {
           // UIApplication.shared.openURL(url as URL)
        }
    //    callNumber(phoneNumber: String(phnNumber))
    }
   /* private func callNumber(phoneNumber: String) {
        guard let url = URL(string: "telprompt://\(phoneNumber)"),
            UIApplication.shared.canOpenURL(url) else {
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }*/
    
    
  /*  private func callNumber(phoneNumber:String) {
            // I add this line to make sure passed number wihthout space
            let CleanphoneNumber = phoneNumber.stringByReplacingOccurrencesOfString(" ", withString: "")
            if let phoneCallURL:NSURL = NSURL(string: "tel://\(phoneNumber)") {
                let application:UIApplication = UIApplication.shared
                if (application.canOpenURL(phoneCallURL as URL)) {
                    application.openURL(phoneCallURL as URL);
                }
            }
        }*/
    
    @IBAction func faceBukActn(_ sender: Any) {
        if let url = URL(string: "https://www.facebook.com/MuzainiExchange/") {
            UIApplication.shared.open(url)
        }
    }
    
    
    @IBAction func twitterActn(_ sender: Any) {
        if let url = URL(string: "https://twitter.com/muzaini_co?s=09") {
            UIApplication.shared.open(url)
        }
    }
    
    @IBAction func instaActnn(_ sender: Any) {
        if let url = URL(string: "https://www.instagram.com/muzainiexchange/") {
            UIApplication.shared.open(url)
        }
    }
    
    
    @IBAction func customerServceBtnActn(_ sender: Any) {
        self.customerServicePhnNumber = customerServicePhnNumber.replacingOccurrences(of: " ", with: "")
        self.customerServicePhnNumber = customerServicePhnNumber.replacingOccurrences(of: "+", with: "")
        
        if let url = NSURL(string: "tel://\(String(describing: self.customerServicePhnNumber))"), UIApplication.shared.canOpenURL(url as URL) {
            //UIApplication.shared.openURL(url as URL)
            UIApplication.shared.open(url as URL, options: [:],
            completionHandler: {
               (success) in
               print("Open \(url): \(success)")
             })
            
           // open(scheme: url)
        }
    }
 
    
}

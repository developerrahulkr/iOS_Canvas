//
//  ExistingCustomerVc.swift
//  Canvas
//
//  Created by urmila reddy on 06/08/20.
//  Copyright © 2020 urmila reddy. All rights reserved.
//

import UIKit
import Alamofire



class ExistingCustomerVc: UIViewController {
    
    @IBOutlet weak var topHeaderLbl: UILabel!
    
    
    @IBOutlet weak var existingCustomerLbl: UILabel!
    
    @IBOutlet weak var setUpOnlineAcntLbl: UILabel!
    
    
    @IBOutlet weak var newCustomerLbl: UILabel!
    
    
    @IBOutlet weak var registerWithAlmLbl: UILabel!
    
    @IBOutlet weak var firstView: UIView!
    
    
    @IBOutlet weak var secndView: UIView!
    
    
    @IBOutlet weak var firstBtn: UIButton!
    
    @IBOutlet weak var secndBtn: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        firstView.layer.cornerRadius = 5
        secndView.layer.cornerRadius = 5
        firstBtn.layer.cornerRadius = 5
        secndBtn.layer.cornerRadius = 5
        
        firstView.addDropShadowToView(targetView: firstView)
        secndView.addDropShadowToView(targetView: secndView)
        assignLabels()
        
    }
    func assignLabels() {
        topHeaderLbl.text = Global.shared.existingTopHeaderTxt
        existingCustomerLbl.text = Global.shared.existingCustomrTxt
        setUpOnlineAcntLbl.text = Global.shared.setUpOnlineTxt
        newCustomerLbl.text = Global.shared.newCustomerTxt
        registerWithAlmLbl.text = Global.shared.registerWithAlMTxt
    }
    override func viewWillAppear(_ animated: Bool) {
        Global.shared.countris = Country.getCountries(Global.shared.countrisAll)
        Global.shared.countrysChangeAccordingly = "Any"
      
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    //for testing pull and push
    
    
    @IBAction func existingCustmerBtnActn(_ sender: Any) {
      self.pushViewController(controller: VerifyAccountFirstVc.initiateController(), animated: false)
    }
   // var webView: WKWebView!
    @IBAction func newCustomerBtnActn(_ sender: Any) {
        self.pushViewController(controller: NewCustIdentityVc.initiateController(), animated: false)

     //   let vc = self.storyboard?.instantiateViewController(withIdentifier: "NewCustIdentityVc") as! NewCustIdentityVc
     //  let vc = self.storyboard?.instantiateViewController(identifier: "NewCustIdentityVc") as! NewCustIdentityVc
     //   self.navigationController?.pushViewController(vc, animated: false)
        
      //  checkkHashing()
        
   //     checkHashingWithKeyValuePair()
        
     
      /*  do {
            try savingPdf()
            
        } catch  {
            print("FAiled to load PDF")
        }*/

        
        
        
    /*    let urlRequest = URLRequest(url: pdfUrl as URL)
        webView = WKWebView(frame: self.view.frame)
                webView?.load(urlRequest)
               self.view.addSubview(webView)*/

        
    }
    
    
    @IBAction func bckBtnActn(_ sender: Any) {
    /*    do {
                   try savePdf()
                   loadPDFAndShare()
               } catch  {
                   print("FAiled to load PDF")
               }*/
        
        
    self.navigationController?.popViewController(animated: true)
    }
  
    
    @IBAction func languageChangeActn(_ sender: Any) {
        Global.shared.languageChangeActn()
       // checkkHashing()
    }
    
  /*  func checkkHashing() {
         let paramaterPasing: [String:Any] = ["status":true,
                                              "statusCodes":0,
                                              "statusMessage":"string",
                                              "messageCode":"string"]
        
        let orderedDictionary1: OrderedDictionary<String, String> = ["status":"true",
                                                                  "statusCodes":"0",
                                                                  "statusMessage":"string",
                                                                  "messageCode":"string"]
        let jsonEncoder = JSONEncoder()
        let jsonDataM = try! jsonEncoder.encode(orderedDictionary1)
        let jsonString = String(data: jsonDataM, encoding: .utf8)
        
        print(jsonString)
       
        
     let finalDictOrder = paramaterPasing.getOrderedDictionary()
     print(finalDictOrder)
         
         let newStr = paramaterPasing.queryString
         print(newStr)
         
         let jsonData = try! JSONSerialization.data(withJSONObject: paramaterPasing, options: [])
         
     //    let jsonString = NSString(data: jsonData, encoding: String.Encoding.utf8.rawValue)! as String
         
      //   print(jsonString)
        
        
       
         
     let hmacResult: String = finalDictOrder.hmac(algorithm: HMACAlgorithm.SHA512, key: "b286hhg485ea11859c37455b5dc0a0664103ef8b44309df57bc5197de8426159")
         
         print(hmacResult)
         
         let publicKeyStr = "iub286hhg485ea11859c37455b5dc0a0664103ef8b44309df57bc5197de8426159"
         
         let hmacResult2: String = publicKeyStr.hmac(algorithm: HMACAlgorithm.SHA512, key: "iib286hhg485ea11859c37455b5dc0a0664103ef8b44309df57bc5197de8426159")
         
         
         let headersHmac: HTTPHeaders = ["x-publickey" : publicKeyStr, "x-client": hmacResult2, "x-hash" : hmacResult]
         
         /*     let headers: HTTPHeaders = [
          "Content-Type": "application/json"
          ]*/
         
         NetWorkDataManager.sharedInstance.checkingHashImplementation(headersTobePassed: headersHmac, postParameters: paramaterPasing) { resonseTal , errorString in
             
             if errorString == nil
             {
                 print(resonseTal)
                 
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
     }*/
    
   
}

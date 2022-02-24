//
//  BiometricController.swift
//  Canvas
//
//  Created by RAC INFRA RENTAL LLP on 26/01/22.
//  Copyright © 2022 urmila reddy. All rights reserved.
//

import UIKit
import Alamofire

class BiometricController: UIViewController {

    @IBOutlet weak var btn_disable: UIButton!
    @IBOutlet weak var btn_enable: UIButton!
    @IBOutlet weak var lbl_biometricTxt: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onClickEnableBiomatric(_ sender: UIButton) {
        enableBiometric()
    }
    
    @IBAction func onClickDoItLater(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        
    }
    func enableBiometric() {
        UserDefaults.standard.set("true", forKey: "biometricEnabled")
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
                
                print(resonseTal)
                if let statusCode = resonseTal?.value(forKey: "statusCodes") as? Int {
                    
                    print(statusCode)
                    let statusMsg = resonseTal?.value(forKey: "statusMessage") as? String ?? ""
                    let mesageCode = resonseTal?.value(forKey: "messageCode") as? String ?? statusMsg
                    Global.shared.checkBiometric = 1
                    self.dismiss(animated: true, completion: nil)
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
    
}

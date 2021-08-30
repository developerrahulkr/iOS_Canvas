//
//  WuFirstTermsConditions.swift
//  Canvas
//
//  Created by urmila reddy on 26/11/20.
//  Copyright © 2020 urmila reddy. All rights reserved.
//

import UIKit
import Alamofire

class WuFirstTermsConditions: UIViewController {
    
    
    @IBOutlet weak var popUpView: UIView!
    
    @IBOutlet weak var titleLbl: UILabel!
    
    @IBOutlet weak var contentLbl: UILabel!
    
    
    @IBOutlet weak var okBtnOtlt: UIButton!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.removeSpinner()
        popUpView.layer.cornerRadius = 5
                  okBtnOtlt.layer.cornerRadius = 5
                  assignLabels()
                  
                  
                  self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
                  self.showAnimate()
        DispatchQueue.main.async {
            self.downloadTermsConditions()
        }
       
    }
    
    func assignLabels() {
        okBtnOtlt.setTitle(Global.shared.okTxt, for: .normal)
        
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
    
    func downloadTermsConditions() {
        
        let paramaterPasing: [String:Any] = ["languageCode":LocalizationSystem.sharedInstance.getLanguage(), "type": 601]
        
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        NetWorkDataManager.sharedInstance.termsConditionsImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            
            if errorString == nil
            {
                 self.removeSpinner()
                print(resonseTal!)
                if let termsAndConditions = resonseTal?.value(forKey: "termsAndConditions") as? NSArray {
                    print(termsAndConditions)
                    
                   
                 /*   let newObj = Global.shared.convertToAryDictionary(text: termsAndConditions)
                    self.termsConditionsResponse = newObj!*/
                    
                    let newv =  termsAndConditions[0] as! NSDictionary
                    print(newv)
                    
                     self.titleLbl.text = newv["header"] as? String
                    
                    let dataStr = newv["protectYourselfFromFraud"] as? String
                    let newObj = Global.shared.convertToAryDictionary(text: dataStr ?? "")
                 
                    
                    let eachObj = newObj?[0] as NSDictionary?
                              
                           let valueTxt = eachObj?.value(forKey: "value") as? String ?? ""
                           self.contentLbl.text = valueTxt
                  
                    
                /*    let finalV = newObj?["value"]
                   print(finalV)*/
                                       
               // self.termsConditionsResponse = termsAndConditions as! [Any]
                }
                
              //  self.termsConditionTbleView.reloadData()
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
    
    
    @IBAction func cancelActn(_ sender: Any) {
      //  Global.shared.fraudRemovePopUpWu = "AddEnable"
        removeAnimate()
    }
    

    @IBAction func okBtnActn(_ sender: Any) {
        removeAnimate()
        
        
        if   Global.shared.fraudPopUpDirectWu == "Direct" {
       
      self.pushViewController(controller: BenefWuDirectTransferVc.initiateController())
        }
        else {
            self.pushViewController(controller: BenefWuNewTrnsferVc.initiateController(),animated: true)
        }
    }
    
    
}

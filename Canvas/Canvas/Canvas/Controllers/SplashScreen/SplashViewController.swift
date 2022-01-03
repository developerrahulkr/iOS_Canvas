//
//  ViewController.swift
//  AnimatedGifLaunchScreen-Example
//
//  Created by Amer Hukic on 13/09/2018.
//  Copyright © 2018 Amer Hukic. All rights reserved.
//

import UIKit
import SwiftyGif
import Alamofire

class SplashViewController: BaseViewController {

    let logoAnimationView = LogoAnimationView()
    var dict = ["":""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logoAnimationView.isHidden = false
        view.addSubview(logoAnimationView)
        logoAnimationView.pinEdgesToSuperView()
        logoAnimationView.logoGifImageView.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        logoAnimationView.logoGifImageView.startAnimatingGif()
        
    }
  
    func navigateAppRootNavigationController() {
      let approotNavVC = self.storyboard?.instantiateViewController(withIdentifier: "AppRootNavgationCotroller") as! AppRootNavgationCotroller
      if #available(iOS 13.0, *) {
        SceneDelegate.shared?.window?.rootViewController = approotNavVC
      } else {
        AppDelegate.sharedInstance().window?.rootViewController = approotNavVC
        AppDelegate.sharedInstance().window?.makeKeyAndVisible()
        // Fallback on earlier versions
      }
   }
    
    func navigateAppSiteUnderMaintananceController() {
      let approotNavVC = self.storyboard?.instantiateViewController(withIdentifier: "SiteUnderMaintnanceController") as! SiteUnderMaintnanceController
        approotNavVC.dict_maintenance = dict
      if #available(iOS 13.0, *) {
        SceneDelegate.shared?.window?.rootViewController = approotNavVC
      } else {
        AppDelegate.sharedInstance().window?.rootViewController = approotNavVC
        AppDelegate.sharedInstance().window?.makeKeyAndVisible()
        // Fallback on earlier versions
      }
   }
    
    func callSiteUnderMencAPI()
    {
       // self.showSpinner(onView: self.view)
           let paramaterPasing: [String:Any] = [
               "channelName": "iOS"
           ]
           
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
           
           
           NetWorkDataManager.sharedInstance.SiteUnderMantImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
          
               if errorString == nil
               {
                   self.logoAnimationView.isHidden = true
            //    self.removeSpinner()
              //  self.removeLoader()
                   print(resonseTal!)
                   if let statusCode = resonseTal?.value(forKey: "statusCodes") as? Int {
                       
                       print(statusCode)
                       if(statusCode == 200) {
                         //  self.dict = resonseTal as! [String : String]
                           self.dict["titleAr"] =  resonseTal?.value(forKey: "titleAr") as? String
                           self.dict["descriptionEn"] =  resonseTal?.value(forKey: "descriptionEn") as? String
                           self.dict["descriptionAr"] =  resonseTal?.value(forKey: "descriptionAr") as? String
                           self.dict["titleEn"] =  resonseTal?.value(forKey: "titleEn") as? String
                           
                           let startDate = resonseTal?.value(forKey: "startDate") as? String
                           let endDate = resonseTal?.value(forKey: "endDate") as? String
                           // "2021-12-16T14:30:00"
                           let today = Date()
                           
                           let dateFormatter = DateFormatter()
                                  dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
                                  
                          //  let currentDate = dateFormatter.date(from: currentDateString)!
                           let start = dateFormatter.date(from: startDate ?? "")!
                           let end = dateFormatter.date(from: endDate ?? "")!
                           if start.compare(today) == .orderedAscending && end.compare(today) == .orderedDescending {
                               self.navigateAppSiteUnderMaintananceController()
                                  }
                           else
                           {
                               self.navigateAppSiteUnderMaintananceController()
                              // self.navigateAppRootNavigationController()
                           }
                           
                        
                       }
                    if statusCode == 400
                    {
                      //  let alert = ViewControllerManager.displayAlert(message: resonseTal?["statusMessage"] as? String ?? "", title:APPLICATIONNAME)
                      //  self.present(alert, animated: true, completion: nil)
                          self.navigateAppRootNavigationController()
                    }
                       
                    
                   }
                   
                  // self.removeSpinner()
               }
                   
                   
               else
               {
                   self.logoAnimationView.isHidden = true
                               print(errorString!)
                           //    self.removeLoader()
                           //    self.removeSpinner()
                           
                               if errorString == "Response could not be serialized, input data was nil or zero length." {
                                   self.navigateAppRootNavigationController()
                               // Global.shared.timeoUtOrNot = "no"
                               // self.showAlertForTimer(titulo: "", mensagem: Global.shared.sessionTimedOutTxt, vc: self)

                               }
                               
                               else {
//                                   let alert = ViewControllerManager.displayAlert(message: errorString ?? "", title:APPLICATIONNAME)
//                                   self.present(alert, animated: true, completion: nil)
                                   self.navigateAppRootNavigationController()
                               }
                              
                               
                           }

               
           }
        
    }

}

extension SplashViewController: SwiftyGifDelegate {
    func gifDidStop(sender: UIImageView) {
      //
        callSiteUnderMencAPI()
        
        
    }
    
}


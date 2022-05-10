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
                           
                           
                         
                           let startDate = resonseTal?.value(forKey: "startDate") as? String
                           let endDate = resonseTal?.value(forKey: "endDate") as? String
                           let today = resonseTal?.value(forKey: "currentDateTime") as? String
                           let dateStr = today!.components(separatedBy: ".")
                           let currentDateStr    = dateStr[0]
                           let dateFormatter = DateFormatter()
                           dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
                           
                          if let currentDate = dateFormatter.date(from: currentDateStr)
                          {
                           if let start = dateFormatter.date(from: startDate ?? "")
                            {
                                if let end = dateFormatter.date(from: endDate ?? "")
                                {
                                    if start.compare(currentDate) == .orderedAscending && end.compare(currentDate) == .orderedDescending {
                                            self.dict["titleAr"] =  resonseTal?.value(forKey: "titleAr") as? String
                                            self.dict["descriptionEn"] =  resonseTal?.value(forKey: "descriptionEn") as? String
                                            self.dict["descriptionAr"] =  resonseTal?.value(forKey: "descriptionAr") as? String
                                            self.dict["titleEn"] =  resonseTal?.value(forKey: "titleEn") as? String
                                            self.navigateAppSiteUnderMaintananceController()
                                          }
                                          else{
                                              self.navigateAppRootNavigationController()
                                          }
                                 }
                               else{
                                   self.navigateAppRootNavigationController()
                               }
                           }
                              
                           else
                           {
                              // self.navigateAppSiteUnderMaintananceController()
                               self.navigateAppRootNavigationController()
                           }
                        }
                        else{
                            self.navigateAppRootNavigationController()
                        }
                           
                           
                   }
                   else if statusCode == 400
                    {
                       // self.navigateAppSiteUnderMaintananceController()
                          self.navigateAppRootNavigationController()
                    }
                    else
                    {
                       // self.navigateAppSiteUnderMaintananceController()
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
                                  // self.navigateAppRootNavigationController()
                                   self.navigateAppSiteUnderMaintananceController()
                               // Global.shared.timeoUtOrNot = "no"
                               // self.showAlertForTimer(titulo: "", mensagem: Global.shared.sessionTimedOutTxt, vc: self)

                               }
                               
                              
//                                   let alert = ViewControllerManager.displayAlert(message: errorString ?? "", title:APPLICATIONNAME)
       //                           self.present(alert, animated: true, completion: nil)
                                  // self.navigateAppRootNavigationController()
                             //      self.navigateAppSiteUnderMaintananceController()
                         //      }
                              
                               
                           }

           }
        
    }

}

extension SplashViewController: SwiftyGifDelegate {
    func gifDidStop(sender: UIImageView) {
        
        if Connectivity.isConnectedToInternet {
                callSiteUnderMencAPI()
        }
        else
        {
            let alert = UIAlertController(title: "Alert", message: "The Internet connection appears to be offline.", preferredStyle: UIAlertController.Style.alert)
            // add an action (button)
            alert.view.tintColor = ColorCodes.newAppRed
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: {_ in
                if Connectivity.isConnectedToInternet {
                    self.callSiteUnderMencAPI()
                }
                else{
                    exit(0)
                }
               
            }))
            // show the alert
            self.present(alert, animated: true, completion: nil)
        }
      //
        
       // self.navigateAppRootNavigationController()
        
    }
    
}


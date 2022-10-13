//
//  WuSecndTermsConditions.swift
//  Canvas
//
//  Created by urmila reddy on 26/11/20.
//  Copyright © 2020 urmila reddy. All rights reserved.
//

import UIKit
import Alamofire

class WuSecndTermsConditions: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var popUpView: UIView!
    
    @IBOutlet weak var titleLbl: UILabel!
    
    @IBOutlet weak var wuTbleView: UITableView!
    
    @IBOutlet weak var okBtnOtlt: UIButton!
    var isSummeryTerm : Bool = false
    
    
     var termsConditionsResponse = [Any]()
    
    var valuesData = [String]()
    
    var headerTxt = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.showSpinner(onView: self.view)
        popUpView.layer.cornerRadius = 5
                         okBtnOtlt.layer.cornerRadius = 5
                         assignLabels()
                         
                         
                         self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
                         self.showAnimate()
               wuTbleView.estimatedRowHeight = 42
                      wuTbleView.rowHeight = UITableView.automaticDimension
        
        if isSummeryTerm  {
            DispatchQueue.main.async {
                //self.downloadTermsConditions(type: 605, indexValue: 0)
//               self.downloadTermsConditionsOther()
                self.getSummeryTermsConditions()
                
            }
        }else{
            DispatchQueue.main.async {
                self.downloadTermsConditions(type: 602, indexValue: 0)
               self.downloadTermsConditionsOther()
            }
        }
        
    }
    
    //     Mark: For downloading terms and conditions
        func getSummeryTermsConditions() {

            let paramaterPasing: [String:Any] = ["languageCode":LocalizationSystem.sharedInstance.getLanguage(), "type": 605]


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
                        let dataStr = newv["fcTermsAndsConditions"] as? String
                        let newObj = Global.shared.convertToAryDictionary(text: dataStr ?? "")

                        for i in 0..<newObj!.count {
//                            let finalobj = newObj?[i]["items"]  as? NSArray
                            let finalobj1 = newObj?[i]["value"]  as? String
                         //   self.termsConditionsResponse = newObj!
                    
                          //  print(finalobj)
//                            if let securityHeading = newObj?[i]["heading"] as? String {
//                              //  self.valuesData = securityQuestion
//                                self.valuesData.append(securityHeading)
//                                   //  self.wuTbleView.reloadData()
//
//                            }
                            
                         
                           // if let securityQuestion = finalobj1?.value(forKey: "value") as? [String] {
                              //  self.valuesData = securityQuestion
                            self.valuesData.append(finalobj1 ?? "")
                              //  self.valuesData.append(contentsOf: finalobj1)
                                     self.wuTbleView.reloadData()
                              
                          //  }
                        }

                   // self.termsConditionsResponse = termsAndConditions as! [Any]
                    }

                    self.wuTbleView.reloadData()
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
    
    
    func downloadTermsConditions(type : Int, indexValue : Int) {
           
           let paramaterPasing: [String:Any] = ["languageCode":LocalizationSystem.sharedInstance.getLanguage(), "type": type]
           
           
           let headers: HTTPHeaders = [
               "Content-Type": "application/json"
           ]
           
           NetWorkDataManager.sharedInstance.termsConditionsImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
               
               if errorString == nil
               {
                   
                   print(resonseTal!)
                   if let termsAndConditions = resonseTal?.value(forKey: "termsAndConditions") as? NSArray {
                       print(termsAndConditions)
                    /*   let newObj = Global.shared.convertToAryDictionary(text: termsAndConditions)
                       self.termsConditionsResponse = newObj!*/
                       
                       
                       let newv =  termsAndConditions[indexValue] as! NSDictionary
                       print(newv)
                       let dataStr = newv["wuPrivacy"] as? String
                       let newObj = Global.shared.convertToAryDictionary(text: dataStr ?? "")
                    //print(newObj)
                   if let newobj = newObj
                   {
                    for dataObj in newobj {
                        if let name = dataObj["value"] as? String{
                        //    self.languageNames.append(name)
                            self.valuesData.append(name)
                            
                        }
                    }
                   }
                    
                    
                  //  self.termsConditionsResponse.append(newObj)
                    self.downloadTermsConditionsOther()
                  // self.termsConditionsResponse = termsAndConditions as! [Any]
                   }
                   
                 //  self.wuTbleView.reloadData()
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
    
    func downloadTermsConditionsOther() {
              
              let paramaterPasing: [String:Any] = ["languageCode":LocalizationSystem.sharedInstance.getLanguage(), "type": 603]
              
              
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
                        self.titleLbl.text = newv["header"] as? String ?? ""
                        let dataStr = newv["wuMoneyTransfer"] as? String
                        let newObj = Global.shared.convertToAryDictionary(text: dataStr ?? "")
                        
                        for i in 0..<newObj!.count {
                            let finalobj = newObj?[i]["items"]  as? NSArray
                         //   self.termsConditionsResponse = newObj!
                    
                          //  print(finalobj)
                            if let securityHeading = newObj?[i]["heading"] as? String {
                              //  self.valuesData = securityQuestion
                                self.valuesData.append(securityHeading)
                                   //  self.wuTbleView.reloadData()
                              
                            }
                            
                            
                            if let securityQuestion = finalobj?.value(forKey: "value") as? [String] {
                              //  self.valuesData = securityQuestion
                                self.valuesData.append(contentsOf: securityQuestion)
                                     self.wuTbleView.reloadData()
                              
                            }
                        }
                        
                   /*     let finalobj = newObj?[0]["items"]  as? NSArray
                     //   self.termsConditionsResponse = newObj!
                
                        print(finalobj)
                        
                        if let securityQuestion = finalobj?.value(forKey: "value") as? [String] {
                          //  self.valuesData = securityQuestion
                            self.valuesData.append(contentsOf: securityQuestion)
                                 self.wuTbleView.reloadData()
                          
                        }*/
                    
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
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
              
              return self.valuesData.count
          }
          
          func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
              
              let cell = wuTbleView.dequeueReusableCell(withIdentifier: "WuTermsConditionsCell")! as! WuTermsConditionsCell
             cell.subTitleLbl.text =  "• " +  self.valuesData[indexPath.row] as? String
             
              cell.selectionStyle = UITableViewCell.SelectionStyle.none
              return cell
              
          }
          func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
              return UITableView.automaticDimension
          }
       
       
    @IBAction func cancelBtnActn(_ sender: Any) {
        removeAnimate()
    }
    
    
    @IBAction func okBtnActn(_ sender: Any) {
        removeAnimate()
    }
    

}

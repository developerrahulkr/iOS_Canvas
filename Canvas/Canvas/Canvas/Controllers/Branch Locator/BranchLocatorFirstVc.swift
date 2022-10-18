//
//  BranchLocatorFirstVc.swift
//  Canvas
//
//  Created by urmila reddy on 07/11/20.
//  Copyright © 2020 urmila reddy. All rights reserved.
//

import UIKit
import Alamofire

class BranchLocatorFirstVc: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate{
    
    
    //hdr
    @IBOutlet weak var navHeaderLbl: UILabel!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var searchTbleView: UITableView!
    
    var branchLocatorResponse = [Any]()
    
    var branchLocatorList = [BranchLocatorSearch]()
       var branchLocatorSearchList = [BranchLocatorSearch]()
       
       var searching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navHeaderLbl.text = Global.shared.ourBranches
        
        self.showSpinner(onView: self.view)
        // Do any additional setup after loading the view.
        //   searchTbleView.estimatedRowHeight = 100
        searchTbleView.rowHeight = 110
        
        downloadBranches()
        
        
    }
    
    // Mark: For downloading branches
    func downloadBranches() {
        
        let paramaterPasing: [String:Any] = ["languageCode":LocalizationSystem.sharedInstance.getLanguage(),
                                             "type": 1]
        
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        NetWorkDataManager.sharedInstance.branchLocatorImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            
            if errorString == nil
            {
                
                print(resonseTal!)
                
                 self.removeSpinner()
              /*  for dataobj in (resonseTal!["branchesList"] as? [Any])! {
                    
                    print(dataobj)
                    
                    
                    
                    
                    if let dataDict = dataobj as? NSDictionary {
                        print(dataDict)
                        self.branchLocatorResponse.append(dataDict)
                       
                    }
                }
                self.searchTbleView.reloadData()*/
                
                if let branchLocatorJson = resonseTal?.value(forKey: "branchesList") as? [[String:Any]] {
                                                     print(branchLocatorJson)
                                                  //   self.drpResponse = occupationsList as! [Any]
                                                  self.branchLocatorList = BranchLocatorSearch.getBranches(branchLocatorJson)
                                                 
                                                 }
                                                 self.searchTbleView.reloadData()
                
                
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
    
    @IBAction func bckBtnActn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func languageBtnActn(_ sender: Any) {
        Global.shared.languageChangeActn()
    }
    
    @IBAction func logoutBtnActn(_ sender: Any) {
        let refreshAlert = UIAlertController(title: Global.shared.logoutHeaderTxt, message: Global.shared.logoutTxt, preferredStyle: UIAlertController.Style.alert)
        refreshAlert.view.tintColor = ColorCodes.newAppRed
        refreshAlert.addAction(UIAlertAction(title: Global.shared.yesTxt, style: .default, handler: { (action: UIAlertAction!) in
           self.pushViewController(controller: LoginVc.initiateController())
        }))
        
        refreshAlert.addAction(UIAlertAction(title: Global.shared.noTxt, style: .default, handler: { (action: UIAlertAction!) in
            print("Handle Cancel Logic here")
              refreshAlert.dismiss(animated: true, completion: nil)
            
        }))
        
        present(refreshAlert, animated: true, completion: nil)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         if searching == true {
                return branchLocatorSearchList.count
              }
              else {
                return branchLocatorList.count
              }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = searchTbleView.dequeueReusableCell(withIdentifier: "BranchLocatorCell")! as! BranchLocatorCell
      /*  let eachObj = self.branchLocatorResponse[indexPath.row] as?NSDictionary
        
        cell.headerLbl.text = eachObj?.value(forKey: "branchName")  as? String ?? ""
        cell.adressLbl.text = eachObj?.value(forKey: "branchAddress")  as? String ?? ""
        cell.phoneNumberLbl.text = eachObj?.value(forKey: "phone") as? String ?? ""
        
        cell.viewOnMapBtnOtlt.addTarget(self, action: #selector(mapActnn(sender:)), for: .touchUpInside)
        cell.viewOnMapBtnOtlt.params["latitude"] = eachObj?.value(forKey: "latitude") as? String ?? ""
        cell.viewOnMapBtnOtlt.params["longitude"] = eachObj?.value(forKey: "longitude") as? String ?? ""
        cell.viewOnMapBtnOtlt.params["branchName"] = eachObj?.value(forKey: "branchName") as? String ?? ""
        cell.viewOnMapBtnOtlt.params["branchAddress"] = eachObj?.value(forKey: "branchAddress") as? String ?? ""*/
        
         cell.viewOnMapBtnOtlt.addTarget(self, action: #selector(mapActnn(sender:)), for: .touchUpInside)
        
        if searching == true {
            let eachObj = self.branchLocatorSearchList[indexPath.row]
            
            cell.headerLbl.text = eachObj.branchName
            cell.adressLbl.text = eachObj.branchAddress
            cell.phoneNumberLbl.text = eachObj.phone
            
            cell.viewOnMapBtnOtlt.params["latitude"] = eachObj.latitude
            cell.viewOnMapBtnOtlt.params["longitude"] = eachObj.longitude
            cell.viewOnMapBtnOtlt.params["branchName"] = eachObj.branchName
            cell.viewOnMapBtnOtlt.params["branchAddress"] = eachObj.branchAddress
            
            
        }
        else {
            let eachObj = self.branchLocatorList[indexPath.row]
            
            cell.headerLbl.text = eachObj.branchName
            cell.adressLbl.text = eachObj.branchAddress
            cell.phoneNumberLbl.text = eachObj.phone
            
            cell.viewOnMapBtnOtlt.params["latitude"] = eachObj.latitude
            cell.viewOnMapBtnOtlt.params["longitude"] = eachObj.longitude
            cell.viewOnMapBtnOtlt.params["branchName"] = eachObj.branchName
            cell.viewOnMapBtnOtlt.params["branchAddress"] = eachObj.branchAddress
        }
        
        
        
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(branchLocatorList[indexPath.row].id ?? 0)
        addUserAPI(branchID: branchLocatorList[indexPath.row].id ?? 0)
    }
    
    /*  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
     return UITableView.automaticDimension
     }*/
    @objc func mapActnn(sender: PassableUIButton){
        
        Global.shared.lat  = sender.params["latitude"] as? String ?? "29.321077"
        Global.shared.long  = sender.params["longitude"] as? String ?? "48.023456"
        Global.shared.branchNameLocator  = sender.params["branchName"] as? String ?? "29.321077"
        Global.shared.branchAdresLocator  = sender.params["branchAddress"] as? String ?? "48.023456"
      self.pushViewController(controller: BranchLocatorMapVc.initiateController(),animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
      branchLocatorSearchList = branchLocatorList.filter({ (branchLocator) -> Bool in
        let tmp:NSString = branchLocator.branchName! as NSString
        let range = tmp.range(of: searchText, options: NSString.CompareOptions.caseInsensitive)
        return range.location != NSNotFound
      })
    
      if (branchLocatorSearchList.count == 0) {
        searching = false
      }
      else {
        searching = true
      }
      self.searchTbleView.reloadData()
    }
   
    
    @IBAction func mapActn(_ sender: Any) {
      self.pushViewController(controller: BranchLoctorAllBranchesMapVc.initiateController(),animated: true)

    }
    
    
}

//MARK: -   Add User Branch
extension BranchLocatorFirstVc  {
    
    
    func addUserAPI(branchID:Int){
        let paramaterPasing: [String:Any] = ["registrationId": Global.shared.afterLoginRegistrtnId ?? "", "branchId" : branchID, "createdBy" : "Backend"]
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        NetWorkDataManager.sharedInstance.addUserBranchDetails(headersTobePassed: headers, postParameters: paramaterPasing) { [weak self] responseData, errString in
            guard let self = self else {return}
            guard errString == nil else {
                print(errString ?? "")
                
                let finalError = errString?.components(separatedBy: ":")
                let alert = ViewControllerManager.displayAlert(message: finalError?[1] ?? "", title:APPLICATIONNAME)
//                self.present(alert, animated: true, completion: nil)
                return
            }
            let statusMsg = responseData?.value(forKey: "statusMessage") as? String ?? ""
            let mesageCode = responseData?.value(forKey: "messageCode") as? String ?? statusMsg
            if let statusCode = responseData?.value(forKey: "statusCodes") as? Int {
                print(statusCode)
                if(statusCode == 200) {
                    FXbookingMaster.shared.getUserBranchDetails { success, errCode in
                        if success {
                            print("Hit Successfully..............")
                            let alert = ViewControllerManager.displayAlert(message: statusMsg, title:APPLICATIONNAME)
                            self.present(alert, animated: true)
                            self.searchTbleView.reloadData()
                        }
                    }
                    
                }else{
                    let alert = ViewControllerManager.displayAlert(message: statusMsg, title:APPLICATIONNAME)
                    self.present(alert, animated: true)
                }
                
            }
            
        }
        
        
    }
    
    
    
}

//
//  TermsAndConditionsVc.swift
//  Canvas
//
//  Created by urmila reddy on 27/08/20.
//  Copyright © 2020 urmila reddy. All rights reserved.
//

import UIKit
import Alamofire

class TermsAndConditionsVc: UIViewController, UITableViewDataSource, UITableViewDelegate  {

    
    //header to be added
    @IBOutlet weak var navHeaderLbl: UILabel!
    
    
    
    @IBOutlet weak var termsConditionTbleView: UITableView!
    
  //  @IBOutlet weak var searchOtlt: UITextField!
    
    var termsConditionsResponse = [Any]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navHeaderLbl.text = Global.shared.termsConditionBtnTxt
        
        // Do any additional setup after loading the view.
        termsConditionTbleView.estimatedRowHeight = 42
        termsConditionTbleView.rowHeight = UITableView.automaticDimension
        downloadTermsConditions()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    // Mark: For downloading terms and conditions
    func downloadTermsConditions() {
        
        let paramaterPasing: [String:Any] = ["languageCode":LocalizationSystem.sharedInstance.getLanguage(), "type": 600]
        
        
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
                    
                    let newv =  termsAndConditions[0] as! NSDictionary
                    print(newv)
                    
                    let dataStr = newv["termsAndsConditions"] as? String
                    let newObj = Global.shared.convertToAryDictionary(text: dataStr ?? "")
                    
                    self.termsConditionsResponse = newObj!
                                       
               // self.termsConditionsResponse = termsAndConditions as! [Any]
                }
                
                self.termsConditionTbleView.reloadData()
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           
           return self.termsConditionsResponse.count
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           
           let cell = termsConditionTbleView.dequeueReusableCell(withIdentifier: "TermsConditionsCell")! as! TermsConditionsCell
           let eachObj = self.termsConditionsResponse[indexPath.row] as?NSDictionary
           
        let valueTxt = eachObj?.value(forKey: "value") as! String
        cell.subTitleLabel.text = "• " + valueTxt
           
           cell.selectionStyle = UITableViewCell.SelectionStyle.none
           return cell
           
       }
       func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return UITableView.automaticDimension
       }
    
    
    @IBAction func languageChangeActn(_ sender: Any) {
        Global.shared.languageChangeActn()
    }
    
}
extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return nil }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return nil
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
}

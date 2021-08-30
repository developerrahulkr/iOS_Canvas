//
//  FaqVc.swift
//  Canvas
//
//  Created by urmila reddy on 26/08/20.
//  Copyright © 2020 urmila reddy. All rights reserved.
//

import UIKit
import Alamofire

class FaqVc: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    //hedr
    @IBOutlet weak var navHeaderLbl: UILabel!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    @IBOutlet weak var faqTableView: UITableView!
    
    var faqResponse = [Any]()
    
    var faqList = [FaqSearch]()
    var faqSearchList = [FaqSearch]()
    
    var searching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.showSpinner(onView: self.view)
        
        self.navHeaderLbl.text = Global.shared.faqTxt
      
        faqTableView.estimatedRowHeight = 68
        faqTableView.rowHeight = UITableView.automaticDimension
        
        
        // Do any additional setup after loading the view.
        downloadFaq()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    
    // Mark: Downloading Faq's
    func downloadFaq() {
        
        let paramaterPasing: [String:Any] = ["languageCode":LocalizationSystem.sharedInstance.getLanguage(), "type": 0]
        
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        NetWorkDataManager.sharedInstance.faqImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            
            if errorString == nil
            {
                self.removeSpinner()
                
                print(resonseTal!)
            /*    if let faqList = resonseTal?.value(forKey: "faqList") as? NSArray {
                    print(faqList)
                    self.faqResponse = faqList as! [Any]
                }
                self.faqTableView.reloadData()*/
                
                if let faqJson = resonseTal?.value(forKey: "faqList") as? [[String:Any]] {
                                      print(faqJson)
                                   //   self.drpResponse = occupationsList as! [Any]
                                   self.faqList = FaqSearch.getFaqs(faqJson)
                                  
                                  }
                                  self.faqTableView.reloadData()
                
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
        
       if searching == true {
         return faqSearchList.count
       }
       else {
         return faqList.count
       }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = faqTableView.dequeueReusableCell(withIdentifier: "FaqCell")! as! FaqCell
        /*    let eachObj = self.faqResponse[indexPath.row] as?NSDictionary
         
         cell.titleLabel.text = eachObj?.value(forKey: "question")  as? String
         cell.subTitleLabel.text = eachObj?.value(forKey: "answer") as? String*/
        
        if searching == true {
            let eachObj = self.faqSearchList[indexPath.row]
            let serialNumber = "\(eachObj.serialNumber ?? 0)"
            let questionTxt = eachObj.question ?? ""
            cell.titleLabel.text = serialNumber + ". " +  questionTxt
            cell.subTitleLabel.text = eachObj.answer
        }
        else {
            let eachObj = self.faqList[indexPath.row]
            let serialNumber = "\(eachObj.serialNumber ?? 0)"
            let questionTxt = eachObj.question ?? ""
            cell.titleLabel.text = serialNumber + ". " +  questionTxt
            cell.subTitleLabel.text = eachObj.answer
        }
        
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
    @IBAction func backBtnActn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
      faqSearchList = faqList.filter({ (faq) -> Bool in
        let tmp:NSString = faq.question! as NSString
       // let tmp1:NSString = faq.answer! as NSString
        let range = tmp.range(of: searchText, options: NSString.CompareOptions.caseInsensitive)
        return range.location != NSNotFound
      })
    
      if (faqSearchList.count == 0) {
        searching = false
      }
      else {
        searching = true
      }
      self.faqTableView.reloadData()
    }
    
 
   
    
    @IBAction func languageChangeActn(_ sender: Any) {
        Global.shared.languageChangeActn()
    }
    
}

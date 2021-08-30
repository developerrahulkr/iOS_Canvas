//
//  DropDownSearchVc.swift
//  Canvas
//
//  Created by urmila reddy on 16/10/20.
//  Copyright © 2020 urmila reddy. All rights reserved.
//

import UIKit
import Alamofire
protocol UIDropDownrDelegateM{
    func dropValuesChanged(dropDisplay:String, dropValue:String)
}

class DropDownSearchVc: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate, UISearchBarDelegate {
    var delegate: UIDropDownrDelegateM! = nil
    
    @IBOutlet weak var popUpVieww: UIView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var searchTbleView: UITableView!
    
    var drpResponse = [Any]()
    var occupationList = [OccupationSearch]()
    var occuptnSearchList = [OccupationSearch]()
    
      var searching = false
    
    lazy var emptyLabel: UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .center
        lbl.text = "No Data  available"
        lbl.textColor = ColorCodes.newAppRed
        lbl.isHidden = true
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
      }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.showSpinner(onView: self.view)
       
        popUpVieww.layer.cornerRadius = 5
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        self.showAnimate()
        downloadOccupationDataDefault()
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
    
    // Mark: To download occupation data
    func downloadOccupationDataDefault() {
           self.drpResponse.removeAll()
           let paramaterPasing: [String:Any] = [
               "searchTerm": "",
               "type": 1
           ]
           
           
           let headers: HTTPHeaders = [
               "Content-Type": "application/json"
           ]
           
           NetWorkDataManager.sharedInstance.occupationDrpDwnImplementation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
               
               if errorString == nil
               {
                self.removeSpinner()
                   
                   print(resonseTal!)
                if let occupationJson = resonseTal?.value(forKey: "occupationsList") as? [[String:Any]] {
                       print(occupationJson)
                    //   self.drpResponse = occupationsList as! [Any]
                    self.occupationList = OccupationSearch.getOccupations(occupationJson)
                   
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
    
    
  
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
       if searching == true {
            return occuptnSearchList.count
          }
          else {
            return occupationList.count
          }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = searchTbleView.dequeueReusableCell(withIdentifier: "DrpDwnSearchCell")! as! DrpDwnSearchCell
        
         if searching == true {
        let eachObj = self.occuptnSearchList[indexPath.row]
        
        cell.labelOne.text = eachObj.name
        }
         else {
            let eachObj = self.occupationList[indexPath.row]
                   
                   cell.labelOne.text = eachObj.name
        }
        
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let eachObj = searching ?  occuptnSearchList[indexPath.row]: occupationList[indexPath.row]
        let displayKey = eachObj.name ?? ""
        let droppValue = eachObj.value ?? ""
        self.delegate.dropValuesChanged(dropDisplay:displayKey, dropValue:droppValue)
        
        removeAnimate()
    }
    
    
    @IBAction func cancelBtnActn(_ sender: Any) {
        removeAnimate()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
       occuptnSearchList = occupationList.filter({ (occupation) -> Bool in
         let tmp:NSString = occupation.name! as NSString
         let range = tmp.range(of: searchText, options: NSString.CompareOptions.caseInsensitive)
         return range.location != NSNotFound
       })
     
       if (occuptnSearchList.count == 0) {
         searching = true
       }
       else if (searchBar.text == "") {
        searching = false
      }
       
       else {
         searching = true
       }
       self.searchTbleView.reloadData()
     }
   
    
    private func enableEmptyLabel(_ isShow: Bool) {
       
       self.searchTbleView.addSubview(emptyLabel)
       NSLayoutConstraint.activate([emptyLabel.centerXAnchor.constraint(equalTo: searchTbleView.centerXAnchor),emptyLabel.centerYAnchor.constraint(equalTo: searchTbleView.centerYAnchor)])
       emptyLabel.isHidden = isShow
     }
}

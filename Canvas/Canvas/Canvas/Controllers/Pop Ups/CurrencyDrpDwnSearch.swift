//
//  CurrencyDrpDwnSearch.swift
//  Canvas
//
//  Created by urmila reddy on 27/11/20.
//  Copyright © 2020 urmila reddy. All rights reserved.
//

import UIKit
import Alamofire
protocol UIDropDownCurrencyDelegateM{
  func didSelectedCountry(country:Country)
  
}
enum ShowPopupFromViewControllerType {
    case DashBoard
    case none
    case currency
}
class CurrencyDrpDwnSearch: UIViewController, UITableViewDataSource, UITableViewDelegate {
  var delegate: UIDropDownCurrencyDelegateM! = nil
  
  @IBOutlet weak var popUpVieww: UIView!
  
  @IBOutlet weak var searchTbleView: UITableView!
  
  @IBOutlet weak var searchBar: UISearchBar!
  var countriesList = Global.shared.countris
  var searchcountriesList: [Country] = []
  var searching: Bool!
  var popupViewControllerType = ShowPopupFromViewControllerType.none
    var currencys: [String] = []
    
    var searchCurrencys: [String] = []
    var currencyHandler:(_ currency: String)-> Void = {_ in}
    
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
    countriesList = countriesList.sorted { $0.currencyFulName!.localizedCaseInsensitiveCompare($1.currencyFulName!) == ComparisonResult.orderedAscending }
    
    if popupViewControllerType == .currency {
        currencys = countriesList.map{ country in
                 if let currencyName = country.currencyFulName, let code = country.currencyCode {
                   return currencyName + " - " + code
                 }
                 return ""
             }
        currencys = Array(Set(currencys))
        currencys = currencys.sorted { $0.localizedCaseInsensitiveCompare($1) == ComparisonResult.orderedAscending }
    }
    
    
    popUpVieww.layer.cornerRadius = 5
    self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
    self.showAnimate()
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
        self.willMove(toParent: nil)
        self.view.removeFromSuperview()
        self.removeFromParent()
      }
    });
    if popupViewControllerType == .DashBoard {
      self.dismiss(animated: true, completion: nil)
    }
  }
  
  
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    if popupViewControllerType == .currency {
        if searching == true {
          return searchCurrencys.count
        }
        else {
          return currencys.count
        }
    }
    else {
    if searching == true {
      return searchcountriesList.count
    }
    else {
      return countriesList.count
    }
    }
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = searchTbleView.dequeueReusableCell(withIdentifier: "CurrencyDrpDwnSearchCell")! as! CurrencyDrpDwnSearchCell
    
    
    
    if popupViewControllerType == .currency {
        if searching == true {
            cell.labelOne.text = searchCurrencys[indexPath.row]
        }
        else {
            cell.labelOne.text = currencys[indexPath.row]
            
        }
    }
    else {
        if searching == true {
            
            if Global.shared.fromWuBankCashRate == "WU" {
                let searchCountry = searchcountriesList[indexPath.row]
                
                let curencyCode = " - " + searchCountry.countryName!
                cell.labelOne.text = searchCountry.currencyCode! + curencyCode
                
                cell.imgOne.image = UIImage(named: searchCountry.countryCode?.lowercased() ?? "")
            }
            else {
            /*let searchCountry = searchcountriesList[indexPath.row]
            
            let curencyCode = " - " + searchCountry.currencyCode!
            cell.labelOne.text = searchCountry.currencyFulName! + curencyCode*/
                
                if searchcountriesList.count < 1 {
                    let curencyName   = countriesList[indexPath.row].currencyCode
                      let curencyCode   = " - " + countriesList[indexPath.row].currencyFulName!
                      
                      cell.labelOne.text = curencyName! + curencyCode
                   
                    cell.imgOne.image = UIImage(named: countriesList[indexPath.row].countryCode?.lowercased() ?? "")
                }
                else {
                    let searchCountry = searchcountriesList[indexPath.row]
                    
                    let curencyCode = " - " + searchCountry.currencyFulName!
                    cell.labelOne.text = searchCountry.currencyCode! + curencyCode
                    
                    cell.imgOne.image = UIImage(named: searchCountry.countryCode?.lowercased() ?? "")
                }
          
            }
            
        }
        else {
            if Global.shared.fromWuBankCashRate == "WU" {
                let curencyName   = countriesList[indexPath.row].currencyCode
                  let curencyCode   = " - " + countriesList[indexPath.row].countryName!
                  
                  cell.labelOne.text = curencyName! + curencyCode
               
                cell.imgOne.image = UIImage(named: countriesList[indexPath.row].countryCode?.lowercased() ?? "")
            }
            else {
          /*  let curencyName   = countriesList[indexPath.row].currencyFulName
            let curencyCode   = " - " + countriesList[indexPath.row].currencyCode!
            
            cell.labelOne.text = curencyName! + curencyCode*/
            
            let curencyName   = countriesList[indexPath.row].currencyCode
              let curencyCode   = " - " + countriesList[indexPath.row].currencyFulName!
              
              cell.labelOne.text = curencyName! + curencyCode
                
            DispatchQueue.main.async {
                cell.imgOne.image = UIImage(named: self.countriesList[indexPath.row].countryCode?.lowercased() ?? "")
                }
            
            }
        }
    }
    
    
    
    cell.selectionStyle = UITableViewCell.SelectionStyle.none
    
    return cell
  }
    private func userDidSelectCurrency(currency: String) {
       let code = currency.split(separator: "-").last ?? ""
       currencyHandler(String(code))

     }
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if popupViewControllerType == .currency {
        if searching == true {
                userDidSelectCurrency(currency: searchCurrencys[indexPath.row])
              }
              else {
                userDidSelectCurrency(currency: currencys[indexPath.row])
              }
    }
    
    else {
    if searching == true {
        if searchcountriesList.count < 1 {
            let country = countriesList[indexPath.row]
            delegate.didSelectedCountry(country: country)
        }
        else {
            let searchCountry = searchcountriesList[indexPath.row]
            delegate.didSelectedCountry(country: searchCountry)
        }
    //  let searchCountry = searchcountriesList[indexPath.row]
     // delegate.didSelectedCountry(country: searchCountry)
    }
    else {
      let country = countriesList[indexPath.row]
      delegate.didSelectedCountry(country: country)
    }
    }
    
    removeAnimate()
  }
  
  
  
  
  
  @IBAction func cancelBtnActn(_ sender: Any) {
    self.removeAnimate()
  }
}
extension CurrencyDrpDwnSearch: UISearchBarDelegate{
    //MARK: UISearchbar delegate
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searching = true
    }
       
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
           searchBar.resignFirstResponder()
        searching = false
    }
       
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
           searchBar.resignFirstResponder()
     //   emptyLabel.isHidden = true
        searching = false
    }
       
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
      //  emptyLabel.isHidden = true
           searchBar.resignFirstResponder()
        searching = false
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.count == 0 {
            searching = false
            self.searchTbleView.reloadData()
        }
        else {
      if popupViewControllerType == .currency {
          /* searchCurrencys = currencys.filter({ (currency) -> Bool in
           let tmp:NSString = currency as NSString
           let range = tmp.range(of: searchText, options: NSString.CompareOptions.caseInsensitive)
           return range.location != NSNotFound
           })*/
          self.searchCurrencys = self.currencys.filter({(currency) -> Bool in
              let stringMatch = currency.range(of: searchText, options: NSString.CompareOptions.caseInsensitive)
              return (stringMatch != nil)
          })
          searchCurrencys = searchCurrencys.sorted { $0.localizedCaseInsensitiveCompare($1) == ComparisonResult.orderedAscending }
      //  enableEmptyLabel(searchCurrencys.count > 0)
         /* if (searchCurrencys.count == 0) {
            searching = false
          }
          else {
            searching = true
          }*/
        searching = true
        
      }
      else {
        
        self.searchcountriesList = self.countriesList.filter({(country) -> Bool in
                let currencyName = country.currencyFulName ?? ""
                let currencyCode = country.currencyCode ?? ""
                let currencyNamAndCode = currencyName + currencyCode
                  let stringMatch = currencyNamAndCode.range(of: searchText, options: NSString.CompareOptions.caseInsensitive)
                       return (stringMatch != nil)
                   })
    /*  searchcountriesList = countriesList.filter({ (country) -> Bool in
        let tmp:NSString = country.currencyFulName! as NSString
        let tmp1:NSString = country.currencyCode! as NSString
      
        let tmpFinal = tmp + tmp1
        
        let range = tmp.range(of: searchText, options: NSString.CompareOptions.caseInsensitive)
        return range.location != NSNotFound
      })*/
      searchcountriesList = searchcountriesList.sorted { $0.currencyFulName!.localizedCaseInsensitiveCompare($1.currencyFulName!) == ComparisonResult.orderedAscending }
      //  enableEmptyLabel(searchcountriesList.count > 0)

    /*  if (searchcountriesList.count == 0) {
        searching = false
      }
      else {
        searching = true
      }*/
        searching = true
        
      }
        }
      self.searchTbleView.reloadData()
    }
    private func enableEmptyLabel(_ isShow: Bool) {
       
       self.searchTbleView.addSubview(emptyLabel)
       NSLayoutConstraint.activate([emptyLabel.centerXAnchor.constraint(equalTo: searchTbleView.centerXAnchor),emptyLabel.centerYAnchor.constraint(equalTo: searchTbleView.centerYAnchor)])
       emptyLabel.isHidden = isShow
     }
   
    
}


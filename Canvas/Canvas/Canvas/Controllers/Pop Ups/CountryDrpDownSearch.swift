//
//  CountryDrpDownSearch.swift
//  Canvas
//
//  Created by urmila reddy on 27/11/20.
//  Copyright © 2020 urmila reddy. All rights reserved.
//

import UIKit
import Alamofire
protocol UIDropDownCountryDelegateM{
    func dropValuesCountryChanged(dropDisplay:String)
}

class CountryDrpDownSearch: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate{
    
     var delegate: UIDropDownCountryDelegateM! = nil
    
    @IBOutlet weak var popUpVieww: UIView!
    
    
    
    @IBOutlet weak var searchTbleView: UITableView!
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var originalAry:[String] = []
    var searchingDataAry:[String] = []
 
    var searching: Bool!
    
       override func viewDidLoad() {
           super.viewDidLoad()
           
           // Do any additional setup after loading the view.
        
        // Mark: Default countries
        if Global.shared.countrysChangeAccordingly == "Any" {
           
            Global.shared.countryNameData =  Global.shared.countryNameDataAll
            Global.shared.countryCodesData =  Global.shared.countryCodesDataAll
            Global.shared.currencyCodesData = Global.shared.currencyCodesDataAll
            Global.shared.currencyNameData = Global.shared.currencyNameDataAll
            Global.shared.phoneCodesData = Global.shared.phoneCodesDataAll
            Global.shared.pickerResponseCountryData = Global.shared.pickerResponseCountryDataAll
            Global.shared.pickerResponseOnlyCurrencyData = Global.shared.pickerResponseOnlyCurrencyDataAll
            Global.shared.pickerResponseFullCurrencyNameData = Global.shared.pickerResponseFullCurrencyNameDataAll
            
            originalAry = Global.shared.countryNameData
        }
        
        // Mark: For Bank Transfer
       else if Global.shared.countrysChangeAccordingly == "Bank" {
        
         Global.shared.countryNameData =  Global.shared.countryNameDataBank
         Global.shared.countryCodesData =  Global.shared.countryCodesDataBank
         Global.shared.currencyCodesData = Global.shared.currencyCodesDataBank
         Global.shared.currencyNameData = Global.shared.currencyNameDataBank
         Global.shared.phoneCodesData = Global.shared.phoneCodesDataBank
         Global.shared.pickerResponseCountryData = Global.shared.pickerResponseCountryDataBank
         Global.shared.pickerResponseOnlyCurrencyData = Global.shared.pickerResponseOnlyCurrencyDataBank
         Global.shared.pickerResponseFullCurrencyNameData = Global.shared.pickerResponseFullCurrencyNameDataBank
         
         originalAry = Global.shared.countryNameData
            
        }
       
       // Mark: For Cash pickup
       else if Global.shared.countrysChangeAccordingly == "Cash" {
        Global.shared.countryNameData =  Global.shared.countryNameDataBank
        Global.shared.countryCodesData =  Global.shared.countryCodesDataBank
        Global.shared.currencyCodesData = Global.shared.currencyCodesDataBank
        Global.shared.currencyNameData = Global.shared.currencyNameDataBank
        Global.shared.phoneCodesData = Global.shared.phoneCodesDataBank
        Global.shared.pickerResponseCountryData = Global.shared.pickerResponseCountryDataBank
        Global.shared.pickerResponseOnlyCurrencyData = Global.shared.pickerResponseOnlyCurrencyDataBank
        Global.shared.pickerResponseFullCurrencyNameData = Global.shared.pickerResponseFullCurrencyNameDataBank
            originalAry = Global.shared.countryNameData
        }
       
       // Mark: For western union
      else  if Global.shared.countrysChangeAccordingly == "WU" {
        Global.shared.countryNameData =  Global.shared.countryNameDataWU
        Global.shared.countryCodesData =  Global.shared.countryCodesDataWU
        Global.shared.currencyCodesData = Global.shared.currencyCodesDataWU
        Global.shared.currencyNameData = Global.shared.currencyNameDataWU
        Global.shared.phoneCodesData = Global.shared.phoneCodesDataWU
        Global.shared.pickerResponseCountryData = Global.shared.pickerResponseCountryDataWU
        Global.shared.pickerResponseOnlyCurrencyData = Global.shared.pickerResponseOnlyCurrencyDataWU
        Global.shared.pickerResponseFullCurrencyNameData = Global.shared.pickerResponseFullCurrencyNameDataWU
        
            originalAry = Global.shared.countryNameData
        }
      
      // Mark: For western union addition
      else  if Global.shared.countrysChangeAccordingly == "WUAdd" {
        Global.shared.countryNameData =  Global.shared.countryNameDataWUAdd
        Global.shared.countryCodesData =  Global.shared.countryCodesDataWUAdd
        Global.shared.currencyCodesData = Global.shared.currencyCodesDataWUAdd
        Global.shared.currencyNameData = Global.shared.currencyNameDataWUAdd
        Global.shared.phoneCodesData = Global.shared.phoneCodesDataWUAdd
        Global.shared.pickerResponseCountryData = Global.shared.pickerResponseCountryDataWUAdd
        Global.shared.pickerResponseOnlyCurrencyData = Global.shared.pickerResponseOnlyCurrencyDataWUAdd
        Global.shared.pickerResponseFullCurrencyNameData = Global.shared.pickerResponseFullCurrencyNameDataWUAdd
        
            originalAry = Global.shared.countryNameData
        }
      
      // Mark: For Bank transfer adding
      else  if Global.shared.countrysChangeAccordingly == "BankAdd" {
        Global.shared.countryNameData =  Global.shared.countryNameDataBankAdd
        Global.shared.countryCodesData =  Global.shared.countryCodesDataBankAdd
        Global.shared.currencyCodesData = Global.shared.currencyCodesDataBankAdd
        Global.shared.currencyNameData = Global.shared.currencyNameDataBankAdd
        Global.shared.phoneCodesData = Global.shared.phoneCodesDataAll
        Global.shared.pickerResponseCountryData = Global.shared.pickerResponseCountryDataBankAdd
        Global.shared.pickerResponseOnlyCurrencyData = Global.shared.pickerResponseOnlyCurrencyDataBankAdd
        Global.shared.pickerResponseFullCurrencyNameData = Global.shared.pickerResponseFullCurrencyNameDataBankAdd
        
            originalAry = Global.shared.countryNameData
        }
      
      // Mark: For Cash Transfer adding
      else  if Global.shared.countrysChangeAccordingly == "CashAdd" {
        Global.shared.countryNameData =  Global.shared.countryNameDataCashAdd
        Global.shared.countryCodesData =  Global.shared.countryCodesDataCashAdd
        Global.shared.currencyCodesData = Global.shared.currencyCodesDataCashAdd
        Global.shared.currencyNameData = Global.shared.currencyNameDataCashAdd
        Global.shared.phoneCodesData = Global.shared.phoneCodesDataAll
        Global.shared.pickerResponseCountryData = Global.shared.pickerResponseCountryDataCashAdd
        Global.shared.pickerResponseOnlyCurrencyData = Global.shared.pickerResponseOnlyCurrencyDataCashAdd
        Global.shared.pickerResponseFullCurrencyNameData = Global.shared.pickerResponseFullCurrencyNameDataCashAdd
        
            originalAry = Global.shared.countryNameData
        }
      
      // Mark: For Fc Calculator
      else  if Global.shared.countrysChangeAccordingly == "Fc" {
        Global.shared.countryNameData =  Global.shared.countryNameDataFc
        Global.shared.countryCodesData =  Global.shared.countryCodesDataFc
        Global.shared.currencyCodesData = Global.shared.currencyCodesDataFc
        Global.shared.currencyNameData = Global.shared.currencyNameDataFc
        Global.shared.phoneCodesData = Global.shared.phoneCodesDataFc
        Global.shared.pickerResponseCountryData = Global.shared.pickerResponseCountryDataFc
        Global.shared.pickerResponseOnlyCurrencyData = Global.shared.pickerResponseOnlyCurrencyDataFc
        Global.shared.pickerResponseFullCurrencyNameData = Global.shared.pickerResponseFullCurrencyNameDataFc
        
            originalAry = Global.shared.countryNameData
        }
        else {
            
        }
        
        originalAry = Global.shared.countryNameData
           
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
                   self.view.removeFromSuperview()
               }
           });
       }
       
      
       
       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching == true {
            return searchingDataAry.count
        }
        else {
            return originalAry.count
        }
          
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           
           let cell = searchTbleView.dequeueReusableCell(withIdentifier: "CountryDrpDwnSearchCell")! as! CountryDrpDwnSearchCell
           
           if searching == true {
            cell.labelOne.text = searchingDataAry[indexPath.row]
            
            let indexS = Global.shared.countryNameData.firstIndex(of: cell.labelOne.text ?? "")
            let countryCode = Global.shared.countryCodesData[indexS ?? 0]
            //  self.placeOfBirthImg.image = UIImage(named: dropDisplay)
            cell.imgOne.image = UIImage(named:  countryCode.lowercased())
          //  cell.imgOne.image = UIImage(named: searchingDataAry[indexPath.row])
            
                 }
                 else {
            cell.labelOne.text = originalAry[indexPath.row]
                    let indexS = Global.shared.countryNameData.firstIndex(of: cell.labelOne.text ?? "")
                    let countryCode = Global.shared.countryCodesData[indexS ?? 0]
                    //  self.placeOfBirthImg.image = UIImage(named: dropDisplay)
                    cell.imgOne.image = UIImage(named:  countryCode.lowercased())
                    
           //  cell.imgOne.image = UIImage(named: originalAry[indexPath.row])
                 }
         
           
           cell.selectionStyle = UITableViewCell.SelectionStyle.none
           
           return cell
       }
       
       func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          if searching == true {
            
            let displayKey = searchingDataAry[indexPath.row]
            self.delegate.dropValuesCountryChanged(dropDisplay:displayKey)
          }
          else {
            let displayKey = originalAry[indexPath.row]
            self.delegate.dropValuesCountryChanged(dropDisplay:displayKey)
          }
          
          
           removeAnimate()
       }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchingDataAry = originalAry.filter({ (text) -> Bool in
            let tmp:NSString = text as NSString
            let range = tmp.range(of: searchText, options: NSString.CompareOptions.caseInsensitive)
            return range.location != NSNotFound
        })
        
        if (searchingDataAry.count == 0) {
            searching = false
        }
        else {
            searching = true
        }
        self.searchTbleView.reloadData()
    }
    
    
    @IBAction func cancelBtnActn(_ sender: Any) {
        self.removeAnimate()
    }
      
        
        
    }



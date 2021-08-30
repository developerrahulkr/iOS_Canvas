//
//  RateTabsCalculatorVc.swift
//  Canvas
//
//  Created by urmila reddy on 21/11/20.
//  Copyright © 2020 urmila reddy. All rights reserved.
//

import UIKit
import Alamofire

class RateTabsCalculatorVc: UIViewController, XMSegmentedControlDelegate {
    
    
    @IBOutlet weak var navgtnHeaderLbl: UILabel!
    
    @IBOutlet weak var seg: XMSegmentedControl!
    
    @IBOutlet weak var firstView: UIView!
    
    @IBOutlet weak var secndView: UIView!
    
    @IBOutlet weak var thirdView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        navgtnHeaderLbl.text = Global.shared.rateCalculatorHeader
        
        self.showSpinner(onView: self.view)
        downloadAccountConfigCountriesBank()
        downloadAccountConfigCountriesWu()
        downloadAccountConfigCountriesFc()
        menuItemsData()
        
    }
    
    func menuItemsData()  {
       // self.removeSpinner()
       // let titles = [Global.shared.bankTabTxt! ,Global.shared.foreignCurncyTxt!, Global.shared.wuTabTxt!]
        let titles = [Global.shared.transfersTxtTab! ,Global.shared.foreignCurncyTxt!]
        self.seg.delegate = self
        self.seg.segmentTitle = titles
        
        self.seg.selectedItemHighlightStyle=XMSelectedItemHighlightStyle.bottomEdge
        self.seg.backgroundColor = UIColor.white
        self.seg.highlightColor = UIColor.red
        // self.seg.tint = ColorCodes.DarkCement
        self.seg.tint = UIColor.gray
        self.seg.highlightTint = UIColor.red
        self.seg.font = UIFont.boldSystemFont(ofSize: 14)
        
        firstView.isHidden = false
        secndView.isHidden = true
        thirdView.isHidden = true
        
      //  self.removeSpinner()
    }
    
    // Mark: For getting bank/Transfers countries and currencies
    func downloadAccountConfigCountriesBank() {
        
        let paramaterPasing: [String:Any] = ["languageCode":LocalizationSystem.sharedInstance.getLanguage(),
                                             "type": 2]
        
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        NetWorkDataManager.sharedInstance.countryListImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            
            if errorString == nil
            {
                
               // print(resonseTal!)
                if let countres = resonseTal?.value(forKey: "countriesList") as? [[String: Any]] {
                    //  Global.shared.countrisBank = Country.getCountries(countres)
                    Global.shared.countrisAllBank = countres
                    
                }
                if let countries = resonseTal?.value(forKey: "countriesList") as? NSArray {
                    print(countries)
                    //please check country
                    
                    
                    if let countryName = countries.value(forKey: "countryName") as? [String] {
                        Global.shared.countryNameDataBank = countryName
                    }
                    if let countryCode = countries.value(forKey: "countryCode") as? [String] {
                        Global.shared.countryCodesDataBank = countryCode
                    }
                    if let currency = countries.value(forKey: "countryCurrency") as? [String] {
                        Global.shared.currencyCodesDataBank = currency
                    }
                    if let currencyNames = countries.value(forKey: "currencyName") as? [String] {
                        Global.shared.currencyNameDataBank = currencyNames
                    }
                    
                    if let phoneCodes = countries.value(forKey: "phoneCode") as? [String] {
                        Global.shared.phoneCodesDataBank = phoneCodes
                    }
                    
                    for i in 0..<Global.shared.currencyCodesDataBank.count {
                        Global.shared.pickerResponseOnlyCurrencyDataBank.append(["value":  Global.shared.currencyCodesDataBank[i], "display":  Global.shared.currencyCodesDataBank[i]])
                    }
                    
                    for i in 0..<Global.shared.currencyNameDataBank.count {
                        Global.shared.pickerResponseFullCurrencyNameDataBank.append(["value":  Global.shared.currencyNameDataBank[i], "display":  Global.shared.currencyNameDataBank[i]])
                    }
                    
                    
                    for i in 0..<Global.shared.countryNameDataBank.count {
                        Global.shared.pickerResponseCountryDataBank.append(["value": Global.shared.countryNameDataBank[i], "display": Global.shared.countryNameDataBank[i]])
                    }
                    
                    /*    for i in 0..<self.countryNameData.count {
                     self.pickerResponseData.append(["value": self.countryCodeData[i], "display": self.countryNameData[i]])
                     }*/
                    
                    
                }
                //       print(self.pickerResponseData)
                
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
    
    // Mark: Getting data for western union calculator
    func downloadAccountConfigCountriesWu() {
        
        let paramaterPasing: [String:Any] = ["languageCode":LocalizationSystem.sharedInstance.getLanguage(),
                                             "type": 3]
        
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        NetWorkDataManager.sharedInstance.countryListImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            
            if errorString == nil
            {
                
                print(resonseTal!)
                if let countres = resonseTal?.value(forKey: "countriesList") as? [[String: Any]] {
                    //   Global.shared.countrisWU = Country.getCountries(countres)
                    Global.shared.countrisAllWU = countres
                    
                }
                if let countries = resonseTal?.value(forKey: "countriesList") as? NSArray {
                    print(countries)
                    //please check country
                    
                    
                    if let countryName = countries.value(forKey: "countryName") as? [String] {
                        Global.shared.countryNameDataWU = countryName
                    }
                    if let countryCode = countries.value(forKey: "countryCode") as? [String] {
                        Global.shared.countryCodesDataWU = countryCode
                    }
                    if let currency = countries.value(forKey: "countryCurrency") as? [String] {
                        Global.shared.currencyCodesDataWU = currency
                    }
                    if let currencyNames = countries.value(forKey: "currencyName") as? [String] {
                        Global.shared.currencyNameDataWU = currencyNames
                    }
                    
                    if let phoneCodes = countries.value(forKey: "phoneCode") as? [String] {
                        Global.shared.phoneCodesDataWU = phoneCodes
                    }
                    
                    for i in 0..<Global.shared.currencyCodesDataWU.count {
                        Global.shared.pickerResponseOnlyCurrencyDataWU.append(["value":  Global.shared.currencyCodesDataWU[i], "display":  Global.shared.currencyCodesDataWU[i]])
                    }
                    
                    for i in 0..<Global.shared.currencyNameDataWU.count {
                        Global.shared.pickerResponseFullCurrencyNameDataWU.append(["value":  Global.shared.currencyNameDataWU[i], "display":  Global.shared.currencyNameDataWU[i]])
                    }
                    
                    
                    for i in 0..<Global.shared.countryNameDataWU.count {
                        Global.shared.pickerResponseCountryDataWU.append(["value": Global.shared.countryNameDataWU[i], "display": Global.shared.countryNameDataWU[i]])
                    }
                    
                    /*    for i in 0..<self.countryNameData.count {
                     self.pickerResponseData.append(["value": self.countryCodeData[i], "display": self.countryNameData[i]])
                     }*/
                    
                    
                }
                //       print(self.pickerResponseData)
                
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
   
    // Mark: Downloading data for fc calculator
    func downloadAccountConfigCountriesFc() {
        
        let paramaterPasing: [String:Any] = ["languageCode":LocalizationSystem.sharedInstance.getLanguage(),
                                             "type": 6]
        
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        NetWorkDataManager.sharedInstance.countryListImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            
            if errorString == nil
            {
                
                print(resonseTal!)
              if let countres = resonseTal?.value(forKey: "countriesList") as? [[String: Any]] {
              //  Global.shared.countrisBank = Country.getCountries(countres)
                Global.shared.countrisAllFc = countres

              }
                if let countries = resonseTal?.value(forKey: "countriesList") as? NSArray {
                    print(countries)
                    //please check country
                    
                    
                    if let countryName = countries.value(forKey: "countryName") as? [String] {
                        Global.shared.countryNameDataFc = countryName
                    }
                    if let countryCode = countries.value(forKey: "countryCode") as? [String] {
                        Global.shared.countryCodesDataFc = countryCode
                    }
                    if let currency = countries.value(forKey: "countryCurrency") as? [String] {
                        Global.shared.currencyCodesDataFc = currency
                    }
                    if let currencyNames = countries.value(forKey: "currencyName") as? [String] {
                        Global.shared.currencyNameDataFc = currencyNames
                    }
                    
                    if let phoneCodes = countries.value(forKey: "phoneCode") as? [String] {
                                           Global.shared.phoneCodesDataFc = phoneCodes
                                       }
                    
                    for i in 0..<Global.shared.currencyCodesDataFc.count {
                        Global.shared.pickerResponseOnlyCurrencyDataFc.append(["value":  Global.shared.currencyCodesDataFc[i], "display":  Global.shared.currencyCodesDataFc[i]])
                    }
                    
                    for i in 0..<Global.shared.currencyNameDataFc.count {
                        Global.shared.pickerResponseFullCurrencyNameDataFc.append(["value":  Global.shared.currencyNameDataFc[i], "display":  Global.shared.currencyNameDataFc[i]])
                    }
                    
                    
                    for i in 0..<Global.shared.countryNameDataFc.count {
                        Global.shared.pickerResponseCountryDataFc.append(["value": Global.shared.countryNameDataFc[i], "display": Global.shared.countryNameDataFc[i]])
                    }
                    
                    /*    for i in 0..<self.countryNameData.count {
                     self.pickerResponseData.append(["value": self.countryCodeData[i], "display": self.countryNameData[i]])
                     }*/
                    
                    
                }
                //       print(self.pickerResponseData)
                self.removeSpinner()
                
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
    
    
    //MARK:- SLIDE TO CHANGHE SEGMENT METHODS
    func xmSegmentedControl(_ xmSegmentedControl: XMSegmentedControl, selectedSegment: Int) {
        
        if xmSegmentedControl == seg {
            print("SegmentedControl1 Selected Segment: \(selectedSegment)")
            
            switch selectedSegment {
            case 0:
                
                firstView.isHidden = false
                thirdView.isHidden = true
                secndView.isHidden = true
                
                
            case 1:
                
                firstView.isHidden = true
                thirdView.isHidden = false
                secndView.isHidden = true
                
           /* case 2:
                
                firstView.isHidden = true
                thirdView.isHidden = true
                secndView.isHidden = false*/
                
            default:
                
                break
            }
        }
    }
    
    
    @IBAction func bckBtnActn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           navigationController?.setNavigationBarHidden(true, animated: animated)
       }
       
       override func viewWillDisappear(_ animated: Bool) {
           super.viewWillDisappear(animated)
           navigationController?.setNavigationBarHidden(false, animated: animated)
       }
    
    @IBAction func languageChangeActn(_ sender: Any) {
        Global.shared.languageChangeActn()
    }
}

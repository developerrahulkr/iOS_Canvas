//
//  FXBookingVC.swift
//  Canvas
//
//  Created by apple on 21/09/22.
//  Copyright © 2022 urmila reddy. All rights reserved.
//

import UIKit
import Alamofire

class FXBookingVC: UIViewController,protocolPush, navigateToDiffrentScreenDelegate, UIDropDownCurrencyDelegateM, UITextFieldDelegate, PopupDelegate {
    
    

    
    //MARK: - OUTLETS
    @IBOutlet weak var tableViewFX: UITableView!
    @IBOutlet weak var centerCardView: UIView!
    @IBOutlet weak var lblFinalText: UILabel!
    @IBOutlet weak var countriesWidth: NSLayoutConstraint!
    @IBOutlet weak var btnSelectCountries: UIButton!
    @IBOutlet weak var imgCountries: UIImageView!
    @IBOutlet weak var lblSelectCities: UILabel!
    @IBOutlet var footer: UIView!
    
    @IBOutlet weak var tableViewTopConstraints: NSLayoutConstraint!
    @IBOutlet weak var tfDestinationAmount: UITextField!
    @IBOutlet weak var tfSourceAmount: UITextField!
    @IBOutlet weak var btnAddCurrency: UIButton!
    @IBOutlet weak var viewPromotionCode: UIView!
    public var menuPopUp: MenuViewController!
    var curencyRate = ""
    weak var sourceTimer: Timer?
    weak var targetTimer: Timer?
    var cmFXBooking : CMFXBooking?
    var countryCode : String?
    var fxHomeAddress : CMBookingHomeAddress?

    var selectDate : String?
    var timeSlot : String?
    var purposeCode : String?
    
    lazy var fxBookingDataSource : [CMFXBooking] = {
      let data = [CMFXBooking]()
        return data
    }()
    
    
    lazy var homeDataSource : [CMBookingHomeAddress] = {
      let data = [CMBookingHomeAddress]()
        return data
    }()
    
    lazy var branchDataSource : [CMBookingBranchAddress] = {
        let data = [CMBookingBranchAddress]()
          return data
    }()
    
    lazy var selectDateDataSource : [CMSelectDate] = {
        let data = [CMSelectDate]()
        return data
        
    }()
    
    lazy var fxTimemSlotDataSource : [FXTimeSlot] = {
        let data = [FXTimeSlot]()
        return data
        
    }()
    
    //MARK: - VARIABLES
    var count = 0
    
    
    
    //MARK: - LIFECYCLE METHODS
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if lblSelectCities.text == "Select\nCountries" {
            imgCountries.isHidden = true
        }
        viewPromotionCode.layer.cornerRadius = 5
        viewPromotionCode.layer.borderWidth = 1
        viewPromotionCode.layer.borderColor = #colorLiteral(red: 0.6666666667, green: 0.6666666667, blue: 0.6666666667, alpha: 1)
        btnAddCurrency.layer.cornerRadius = 5
        tableViewFX.register(UINib(nibName: "CellSectionTwo", bundle: nil), forCellReuseIdentifier: "CellSectionTwo")
        tableViewFX.delegate = self
        tableViewFX.dataSource = self
        tfSourceAmount.delegate = self
        tfDestinationAmount.delegate = self
        self.tfSourceAmount.addTarget(self, action: #selector(sourceTextFieldDidEditingChanged(_:)), for: UIControl.Event.editingChanged)
        self.tfDestinationAmount.addTarget(self, action: #selector(targetTextFieldDidEditingChanged(_:)), for: UIControl.Event.editingChanged)
        

//        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLayoutSubviews() {
        centerCardView.layer.masksToBounds = true
        centerCardView.layer.cornerRadius = centerCardView.bounds.height / 2
        centerCardView.layer.borderColor = UIColor.gray.cgColor
        centerCardView.layer.borderWidth = 1.0
        
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: tfSourceAmount.frame.height - 1, width: tfSourceAmount.frame.width, height: 1.0)
        
        let bottomLine1 = CALayer()
        bottomLine1.frame = CGRect(x: 0.0, y: tfDestinationAmount.frame.height - 1, width: tfDestinationAmount.frame.width, height: 1.0)
        bottomLine.backgroundColor = UIColor.gray.cgColor
        bottomLine1.backgroundColor = UIColor.gray.cgColor
        tfSourceAmount.borderStyle = UITextField.BorderStyle.none
        tfSourceAmount.layer.addSublayer(bottomLine)
        tfDestinationAmount.layer.addSublayer(bottomLine1)
    }
    
    @IBAction func onClickedAddBtn(_ sender: UIButton) {
        guard cmFXBooking != nil else {
            return 
        }
        if fxBookingDataSource.count <= 10 {
            fxBookingDataSource.append(cmFXBooking!)
        }else{
            let alert = ViewControllerManager.displayAlert(message: "Maximum length is 8", title:"Canvas")
            self.present(alert, animated: true, completion: nil)
        }
        
        tableViewFX.reloadData()
    }
    
    
    @IBAction func onClickedInfoBtn(_ sender: UIButton) {
        
    }
    
    
    @objc func targetTextFieldDidEditingChanged(_ textField: UITextField) {
        
        // if a timer is already active, prevent it from firing
        if targetTimer != nil {
            targetTimer?.invalidate()
            targetTimer = nil
        }
        
        
        
        targetTimer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(targetSearchForKeyword(_:)), userInfo: textField.text!, repeats: false)
        
    }
    
    @objc func targetSearchForKeyword(_ timer: Timer) {
        
        // retrieve the keyword from user info
        let keyword = timer.userInfo!
        
        print("Searching for keyword \(keyword)")
        
        self.view.endEditing(true)
        
//        rateCalculatorThey()
        
    }
    //MARK: - ACTIONS
    
    @IBAction func onTapAdd(_ sender: Any) {
        if count > 0 && count < 11  {
            count = count + 1
            tableViewFX.reloadData()
           
            
        }
        
    }
    
    @IBAction func onClickedSelectCountries(_ sender: UIButton) {
        Global.shared.fromWuBankCashRate = "Any"
        Global.shared.countris = Country.getCountries(Global.shared.countrisAllBank)
        let popOverVC = Storyboad.shared.mainStoryboard?.instantiateViewController(withIdentifier: "CurrencyDrpDwnSearch") as! CurrencyDrpDwnSearch
        self.addChild(popOverVC)
        popOverVC.delegate = self
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParent: self)
    }
    
    
    
    @IBAction func onClickedLangBtn(_ sender: UIButton) {
        Global.shared.languageChangeActn()
//        self.curencyRate = "Currency"
        
        
    }
    @IBAction func onClickedLogoutBtn(_ sender: UIButton) {
        logout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        DispatchQueue.main.asyncAfter(deadline: .now()) {[weak self] in
            guard let self = self else {return}
            self.getHomeData()
        }
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let self = self else {return}
            self.getSelectDateData()
            self.getTimeSlotData()
        }
    }
    
    @IBAction func onClickMenuBtn(_ sender: Any) {
        menuPopUp = Storyboad.shared.mainStoryboard?.instantiateViewController(withIdentifier: "MenuViewController") as? MenuViewController
        
        menuPopUp.delegateObj = self
        self.addChild(menuPopUp)
        menuPopUp.view.frame = self.view.frame
        self.view.addSubview(menuPopUp.view)
        menuPopUp.didMove(toParent: self)
    }
    
    
    //MARK: - FUNCTIONS
    //MARK: - Delegate Push
    func didPressCell(sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "YourAddress") as! YourAddress
        vc.homeDataSource = homeDataSource
        vc.branchDataSource = branchDataSource
        navigationController?.pushViewController(vc, animated: true)
    }
}


//MARK: - EXTENSIONS
//MARK: EXTENSIONS for HEADER
extension FXBookingVC: UITableViewDelegate,UITableViewDataSource,Delete{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return section == 0 ?  fxBookingDataSource.count : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CellCountry", for: indexPath) as! CellCountry
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            cell.deleteBtn.tag = indexPath.row
            if !fxBookingDataSource.isEmpty {
                cell.tfSourceField.text = fxBookingDataSource[indexPath.row].fcAmount ?? ""
                cell.tfTargetField.text = fxBookingDataSource[indexPath.row].lcAmount ?? ""
                cell.lblCurrencyCode.text = fxBookingDataSource[indexPath.row].currencyCode ?? ""
                cell.imgCountry.image = UIImage(named: fxBookingDataSource[indexPath.row].countryCode ?? "")
            }
           
            cell.delegate = self
            return cell
        }
        else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CellSectionTwo", for: indexPath) as! CellSectionTwo
            cell.selectionStyle = .none
            cell.homeDataSource = homeDataSource
            cell.branchDataSource = branchDataSource
            cell.TFSelectDate.text = selectDate
            cell.TFTimeSlot.text = timeSlot
            cell.TFSelectPurposeOf.text = purposeCode
            cell.Pushdelegate = self
            return cell
        }
    }
    
    func getHomeAddress() {
        print("Home Data: \(homeDataSource)")
        homeDataSource.removeAll()
        branchDataSource.removeAll()
        self.getHomeData()
    }
    
    
    
    func getBranchAddress() {
        branchDataSource.removeAll()
        homeDataSource.removeAll()
        print("branch Data : \(branchDataSource)", branchDataSource.count)
        self.getBranchData()
    }
    
    // reset the searchTimer whenever the textField is editingChanged
    @objc func sourceTextFieldDidEditingChanged(_ textField: UITextField) {
        
        // if a timer is already active, prevent it from firing
        if sourceTimer != nil {
            sourceTimer?.invalidate()
            sourceTimer = nil
        }
        
        sourceTimer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(sourceSearchForKeyword(_:)), userInfo: textField.text!, repeats: false)
        
    }
    
    @objc func sourceSearchForKeyword(_ timer: Timer) {
        
        // retrieve the keyword from user info
        let keyword = timer.userInfo!
        
        print("Searching for keyword \(keyword)")
        
        self.view.endEditing(true)
        rateCalculator()
        
    }
    
    func getSelectDate() {
        let popupViewController = Storyboad.shared.fxBookingStoryboard?.instantiateViewController(withIdentifier: "CalanderPopupVC") as! CalanderPopupVC
        popupViewController.modalPresentationStyle = .custom
        popupViewController.modalTransitionStyle = .crossDissolve
          //presenting the pop up viewController from the parent viewController
        popupViewController.setListData(with: .calander, data: selectDateDataSource)
        popupViewController.delegate = self
//        popupViewController.item = selectDateDataSource
        
        self.present(popupViewController, animated: true)
    }
    
    func getTimeSlot() {
        let popupViewController = Storyboad.shared.fxBookingStoryboard?.instantiateViewController(withIdentifier: "CalanderPopupVC") as! CalanderPopupVC
        popupViewController.modalPresentationStyle = .custom
        popupViewController.modalTransitionStyle = .crossDissolve
          //presenting the pop up viewController from the parent viewController
        popupViewController.setListData(with: .timeSlot, data: fxTimemSlotDataSource)
        popupViewController.delegate = self

//        popupViewController.item = selectDateDataSource
        self.present(popupViewController, animated: true)

    }
    
//    MARK: - Purpose Code Delegate Function
    
    func getPurposeName() {
        guard BeneficiaryDetails.shared.purposeList.count > 0 else {return}
      let popupVc = PopupViewController.showPopup(parentVC: self, data: BeneficiaryDetails.shared.purposeList)
        popupVc?.setListData(with: .purposeScreen, data: BeneficiaryDetails.shared.purposeList)
       popupVc?.delegate = self
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView?
    {
        return section == 0 ?  footer : UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat
    {
        return section == 0 ?  50 : 0.1
    }
    
    func deleteRow(index:Int) {
        print("click")
        print(index)
        if count < 12 && count > 1{
            
            count = count - 1
            tableViewFX.reloadData()
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        
    }
    
    
    func rateCalculator() {
      
        let amntDecimal = NSDecimalNumber(string: tfSourceAmount.text?.replacingOccurrences(of: ",", with: "", options: .literal, range: nil) ?? "0.0")
        
        //    if Int(truncating: amntDecimal) > 0 {
        if Double(truncating: amntDecimal) >= 0.01 {
            self.showSpinner(onView: self.view)
            let paramaterPasing: [String:Any] = [
                "currenyCode": lblSelectCities.text ?? 0.0,
                "amount": amntDecimal ,
                "calcType": "FC",
                "branchCode": ""
            ]
            
            print(paramaterPasing)
            let headers: HTTPHeaders = [
                "Content-Type": "application/json"
            ]
            
            //       let headers: HTTPHeaders = [.authorization(bearerToken: UserDefaults.standard.string(forKey: "token")!)]
            
            NetWorkDataManager.sharedInstance.ttRateCalculatorImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
                
                if errorString == nil
                {
                    
                    self.removeSpinner()
                    print(resonseTal!)
                    let statusMsg = resonseTal?.value(forKey: "statusMessage") as? String ?? ""
                    let mesageCode = resonseTal?.value(forKey: "messageCode") as? String ?? statusMsg
                    if let statusCode = resonseTal?.value(forKey: "statusCodes") as? Int {
                        if statusCode == 200 {

                            
                            self.tfDestinationAmount.text = resonseTal?["fcAmount"] as? String ?? ""
                            let ratee = resonseTal?["rate"] as? String ?? ""
                            
                            let finalTxt = "1 " + self.lblSelectCities.text! + " = " +  ratee + " " + "KWD"
                            print(finalTxt)
                            self.cmFXBooking = CMFXBooking(type: "FC", fcAmount: self.tfSourceAmount.text ?? "", lcAmount: self.tfDestinationAmount.text ?? "", currencyCode: self.lblSelectCities.text ?? "", countryCode: self.countryCode ?? "", finalText: finalTxt)
                            print("myModel is \(self.cmFXBooking)")
                            self.centerCardView.isHidden = false
                            self.tableViewTopConstraints.constant = 50.0
                            self.lblFinalText.text = finalTxt
//                            self.rateCalculationLbl.text = finalTxt
//                            self.rateCalculationLbl.isHidden = false
                            self.tableViewFX.reloadData()
                        }
                        else {
                            self.centerCardView.isHidden = true
                            let alert = ViewControllerManager.displayAlert(message:Global.shared.messageCodeType(text: mesageCode), title:APPLICATIONNAME)
                            self.present(alert, animated: true, completion: nil)
                        }
                        
                    }
                    
                }
                
                else
                {
                    print(errorString!)
                    self.centerCardView.isHidden = true
                    self.removeSpinner()
                    let finalError = errorString?.components(separatedBy: ":")
                    let alert = ViewControllerManager.displayAlert(message: finalError?[1] ?? "", title:APPLICATIONNAME)
                    self.present(alert, animated: true, completion: nil)
                    
                }
            }
        }
        
    }
    
}

extension FXBookingVC {
    func navigateToDiffrentScreenDelegate(toWhichScreenWeAreNaviagting: String) {
        print(toWhichScreenWeAreNaviagting)
        if toWhichScreenWeAreNaviagting == Global.shared.lbl_fxbooking {
          // same screen
        }
        else{
            MenuScreenShow(screen:toWhichScreenWeAreNaviagting)
        }
    }
    
    func didSelectedCountry(country: Country) {
        lblSelectCities.text = country.currencyCode
        countryCode = country.countryCode?.lowercased()
        imgCountries.image = UIImage(named: country.countryCode?.lowercased() ?? "")
        countriesWidth.constant = 80.0
        imgCountries.isHidden = false
        if tfSourceAmount.text == "" && tfDestinationAmount.text == "" {
            print("no action")
        }
        
//        else if tfSourceAmount.text == "" {
//            rateCalculatorThey()
//        }
        else if tfDestinationAmount.text == ""{
            rateCalculator()
        }
        else  if tfSourceAmount.text != nil {
            rateCalculator()
        }
        else {
            print("no action")
        }
    }
    
    // Mark: Calculating the rate when entered in target field
    
//    func rateCalculatorThey() {
//
//
//
//        let amntDecimal = NSDecimalNumber(string: self.targetField.text?.replacingOccurrences(of: ",", with: "", options: .literal, range: nil) ?? "0.0")
//        // if Int(truncating: amntDecimal) > 0 {
//        if Double(truncating: amntDecimal) >= 0.01 {
//            self.showSpinner(onView: self.view)
//            let paramaterPasing: [String:Any] = [
//                "currenyCode": targetCurency.text!,
//                "amount": amntDecimal,
//                "calcType": "LC",
//                "branchCode": ""
//            ]
//
//            print(paramaterPasing)
//            let headers: HTTPHeaders = [
//                "Content-Type": "application/json"
//            ]
//
//            /*    let headers: HTTPHeaders = [.authorization(bearerToken: UserDefaults.standard.string(forKey: "token")!)]*/
//
//            NetWorkDataManager.sharedInstance.ttRateCalculatorImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
//
//                if errorString == nil
//                {
//
//                    self.removeSpinner()
//
//                    print(resonseTal!)
//                    let statusMsg = resonseTal?.value(forKey: "statusMessage") as? String ?? ""
//                    let mesageCode = resonseTal?.value(forKey: "messageCode") as? String ?? statusMsg
//                    if let statusCode = resonseTal?.value(forKey: "statusCodes") as? Int {
//                        if statusCode == 200 {
//
//                            self.tfSourceAmount.text = resonseTal?["lcAmount"] as? String ?? ""
//
//                            let ratee = resonseTal?["rate"] as? String ?? ""
//                            let finalTxt = "1 " + self.tfDestinationAmount.text! + " = " +  ratee + " " + "KWD"
//                            self.tfSourceAmount.text = finalTxt
//                            self.tfSourceAmount.isHidden = false
//                        }
//                        else {
//                            let alert = ViewControllerManager.displayAlert(message:Global.shared.messageCodeType(text: mesageCode), title:APPLICATIONNAME)
//                            self.present(alert, animated: true, completion: nil)
//                        }
//
//                    }
//
//                }
//
//                else
//                {
//                    print(errorString!)
//                    self.removeSpinner()
//                    let finalError = errorString?.components(separatedBy: ":")
//                    let alert = ViewControllerManager.displayAlert(message: finalError?[1] ?? "", title:APPLICATIONNAME)
//                    self.present(alert, animated: true, completion: nil)
//
//                }
//            }
//
//        }
//    }
    
    func getHomeData() {
        self.homeDataSource.removeAll()
        self.branchDataSource.removeAll()
        let paramaterPasing: [String:Any] = ["registrationId": Global.shared.afterLoginRegistrtnId ?? ""]
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        self.showSpinner(onView: self.view)
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            NetWorkDataManager.sharedInstance.gethomeaddressList(headersTobePassed: headers, postParameters: paramaterPasing) { [weak self] responseData, errString in
                guard let self = self else {return}
                self.removeSpinner()
                
                guard errString == nil else {
                    print(errString ?? "")
                    let finalError = errString?.components(separatedBy: ":")
                    let alert = ViewControllerManager.displayAlert(message: finalError?[1] ?? "", title:APPLICATIONNAME)
                    self.present(alert, animated: true, completion: nil)
                    return
                }
                let statusMsg = responseData?.value(forKey: "statusMessage") as? String ?? ""
                let mesageCode = responseData?.value(forKey: "messageCode") as? String ?? statusMsg
                if let statusCode = responseData?.value(forKey: "statusCodes") as? Int {
                    
                    print(statusCode)
                    if(statusCode == 200) {
                        if let dataArray = responseData?.value(forKey: "fxAddressResult") as? NSArray {
                            print(dataArray)
                            for onemessage in dataArray as! [Dictionary<String, AnyObject>] {
                                self.homeDataSource.append(
                                    CMBookingHomeAddress(addressId: onemessage["addressId"] as? Int,
                                                         firstName: onemessage["firstName"] as? String,
                                                         flat: onemessage["flat"] as? String,
                                                         floor: onemessage["floor"] as? String,
                                                         building: onemessage["building"] as? String,
                                                         gada: onemessage["gada"] as? String,
                                                         street: onemessage["street"] as? String,
                                                         block: onemessage["block"] as? String,
                                                         areaCity: onemessage["areaCity"] as? String,
                                                         postalCode: onemessage["postalCode"] as? String,
                                                         phoneNumber: onemessage["phoneNumber"] as? String,
                                                         createdDate: onemessage["createdDate"] as? String,
                                                         updatedDate: onemessage["updatedDate"] as? String,
                                                         registrationId: onemessage["registrationId"] as? String,
                                                         bIsDefault: onemessage["bIsDefault"] as? String,
                                                         latitude: onemessage["latitude"] as? String,
                                                         longitude: onemessage["longitude"] as? String))
                            }
                            
                            
                        }
                        
                        print("My Home Address is : \(self.homeDataSource)")
                        self.tableViewFX.reloadData()
                    }
                    else {
                        let alert = ViewControllerManager.displayAlert(message:Global.shared.messageCodeType(text: mesageCode), title:APPLICATIONNAME)
                        self.present(alert, animated: true, completion: nil)
                        
                    }
                    
                }
                
                
            }
        }
    }
    
    
    
//    MARK: - get Branch Data
    
    
    func getBranchData() {
        
        let paramaterPasing: [String:Any] = ["languageCode": "en",
                                             "searchTerm": "",
                                             "type": 0]
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        self.showSpinner(onView: self.view)
        
        NetWorkDataManager.sharedInstance.getbranchAddressList(headersTobePassed: headers, postParameters: paramaterPasing) { [weak self] responseData, errString in
            guard let self = self else {return}
            self.removeSpinner()
            guard errString == nil else {
                print(errString ?? "")
                
                let finalError = errString?.components(separatedBy: ":")
                let alert = ViewControllerManager.displayAlert(message: finalError?[1] ?? "", title:APPLICATIONNAME)
                self.present(alert, animated: true, completion: nil)
                return
            }
            let statusMsg = responseData?.value(forKey: "statusMessage") as? String ?? ""
            let mesageCode = responseData?.value(forKey: "messageCode") as? String ?? statusMsg
            
            if let statusCode = responseData?.value(forKey: "statusCodes") as? Int {
                print(statusCode)
                if(statusCode == 200) {
                    
                    if let dataArray = responseData?.value(forKey: "branchesList") as? NSArray {
                        print(dataArray)
                        for onemessage in dataArray as! [Dictionary<String, AnyObject>] {
                            self.branchDataSource.append(CMBookingBranchAddress(id: onemessage["id"] as? Int,
                                                                                branchCode: onemessage["branchCode"] as? String,
                                                                                branchName: onemessage["branchName"] as? String,
                                                                                branchAddress: onemessage["branchAddress"] as? String,
                                                                                phone: onemessage["phone"] as? String,
                                                                                fax: onemessage["fax"] as? String,
                                                                                latitude: onemessage["latitude"] as? String,
                                                                                longitude: onemessage["longitude"] as? String,
                                                                                languageCode: onemessage["languageCode"] as? String,
                                                                                isFEEnabled: onemessage["languageCode"] as? Bool))
                        }
                    }
                    
                    print("All Branch Data : \(self.branchDataSource)")
                    self.tableViewFX.reloadData()
                }else {
                    let alert = ViewControllerManager.displayAlert(message:Global.shared.messageCodeType(text: mesageCode), title:APPLICATIONNAME)
                    self.present(alert, animated: true, completion: nil)
                    
                    
                    
                }
            }
        }
    }
    
    
    
    
    func getSelectDateData() {
        self.selectDateDataSource.removeAll()
        let paramaterPasing: [String:Any] = [:]
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
//        self.showSpinner(onView: self.view)
        NetWorkDataManager.sharedInstance.getSelectDate(headersTobePassed: headers, postParameters: paramaterPasing) { [weak self] responseData, errString in
            guard let self = self else {return}
//            self.removeSpinner()
            guard errString == nil else {
                print(errString ?? "")
                
                let finalError = errString?.components(separatedBy: ":")
                let alert = ViewControllerManager.displayAlert(message: finalError?[1] ?? "", title:APPLICATIONNAME)
                self.present(alert, animated: true, completion: nil)
                return
            }
            let statusMsg = responseData?.value(forKey: "statusMessage") as? String ?? ""
            let mesageCode = responseData?.value(forKey: "messageCode") as? String ?? statusMsg
            
            if let statusCode = responseData?.value(forKey: "statusCodes") as? Int {
                print(statusCode)
                if(statusCode == 200) {
                    if let dataArray = responseData?.value(forKey: "lstSelectedDate") as? NSArray {
                        for onemessage in dataArray as! [Dictionary<String, AnyObject>] {
                            self.selectDateDataSource.append(CMSelectDate(id: onemessage["id"] as? String, sDate: onemessage["sDate"] as? String))
                        }
                    }
                    print("Select Date Data : \(self.selectDateDataSource)")
                }else {
                    let alert = ViewControllerManager.displayAlert(message:Global.shared.messageCodeType(text: mesageCode), title:APPLICATIONNAME)
                    self.present(alert, animated: true, completion: nil)
                    
                    
                    
                }
                
            }
        }
    }
    
//    MARK: - GetTime Slot Data
    func getTimeSlotData() {
        self.selectDateDataSource.removeAll()
        let paramaterPasing: [String:Any] = ["languageCode":LocalizationSystem.sharedInstance.getLanguage()]
        
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
//        self.showSpinner(onView: self.view)
        NetWorkDataManager.sharedInstance.accountConfigsImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { [weak self] responseData , errString in
            
            guard let self = self else {return}
//            self.removeSpinner()
            guard errString == nil else {
                print(errString ?? "")
                
                let finalError = errString?.components(separatedBy: ":")
                let alert = ViewControllerManager.displayAlert(message: finalError?[1] ?? "", title:APPLICATIONNAME)
                self.present(alert, animated: true, completion: nil)
                return
            }
            let statusMsg = responseData?.value(forKey: "statusMessage") as? String ?? ""
            let mesageCode = responseData?.value(forKey: "messageCode") as? String ?? statusMsg
            if let statusCode = responseData?.value(forKey: "statusCodes") as? Int {
                print(statusCode)
                
                if(statusCode == 200) {
                    print("Time Slot ResponseData  : \(responseData)")
                    if let fxTimeSlot = responseData?.value(forKey: "fxTimeSlot") as? String {
                        let newObj = Global.shared.convertToAryDictionary(text: fxTimeSlot)
                        for dataObj in newObj! {
                            self.fxTimemSlotDataSource.append(FXTimeSlot(name: dataObj["name"] as? String, value: dataObj["value"] as? String))
                        }
                    }
                    
                    print("timeSlot Data : \(self.fxTimemSlotDataSource)")
                }else{
                    let alert = ViewControllerManager.displayAlert(message:Global.shared.messageCodeType(text: mesageCode), title:APPLICATIONNAME)
                    self.present(alert, animated: true, completion: nil)
                }
                
            }
            
        }
        
    }
}

extension FXBookingVC : PopupViewControllerDelegate {
    func didSelectItem<T>(item: T, vc: UIViewController?) {
        if let itemData = item as? CMSelectDate {
            selectDate = itemData.sDate
        }else if let timeData = item as? FXTimeSlot{
            timeSlot = timeData.name
            print("time Slot Date : \(item)")
        }else if let purposeCodeData = item as? BeneficiaryPurposeData {
            purposeCode = purposeCodeData.name ?? ""
            
        }
        vc?.dismiss(animated: true)
        tableViewFX.reloadData()
    }
}

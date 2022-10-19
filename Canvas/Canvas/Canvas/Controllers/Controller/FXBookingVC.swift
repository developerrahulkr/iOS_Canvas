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
    
    
    @IBOutlet weak var lblFCAmtPlaceholder: UILabel!
    @IBOutlet weak var lblLCAmtPlaceholder: UILabel!
    @IBOutlet weak var viewRate: UIView!
    @IBOutlet weak var tableViewFX: UITableView!
//    @IBOutlet weak var countriesWidth: NSLayoutConstraint!
    @IBOutlet weak var btnSelectCountries: UIButton!
    @IBOutlet weak var imgCountries: UIImageView!
    @IBOutlet weak var lblSelectCities: UILabel!
    @IBOutlet weak var lblrate: UILabel!

    @IBOutlet weak var leftConstantCurrency: NSLayoutConstraint!
    @IBOutlet weak var tableViewTopConstraints: NSLayoutConstraint!
    @IBOutlet weak var txtLCamount: UITextField!
    @IBOutlet weak var txtFCamount: UITextField!
    public var menuPopUp: MenuViewController!
    var curencyRate = ""
    weak var sourceTimer: Timer?
    weak var targetTimer: Timer?
    var cmFXBooking : CMFXBooking?
    var countryCode : String?
    var fxHomeAddress : CMBookingHomeAddress?
    var highValue : String?
    var mixTap : String?
    var denomination : Int?
    //var selectDate : String?
//    var timeSlot : String?
//    var purposeCode : String?
    
    var fxdelegate : delegatecallbackfromFxbooking?

    
    
//    lazy var homeDataSource : [CMBookingHomeAddress] = {
//        let data = [CMBookingHomeAddress]()
//        return data
//    }()
    
//    lazy var branchDataSource : [CMBookingBranchAddress] = {
//        let data = [CMBookingBranchAddress]()
//        return data
//    }()
    
    lazy var selectDateDataSource : [CMSelectDate] = {
        let data = [CMSelectDate]()
        return data
        
    }()
    
    lazy var fxTimemSlotDataSource : [FXTimeSlot] = {
        let data = [FXTimeSlot]()
        return data
        
    }()
    
    //MARK: - VARIABLES
   // var count = 0
    
    
    
    //MARK: - LIFECYCLE METHODS
    override func viewDidLoad() {
        super.viewDidLoad()
        
////        Global.shared.countrysChangeAccordingly = "fc"
//        print("denomination is >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>************ \(Global.shared.denominationFCCurrency)")
//        FXbookingMaster.shared.dispose()
//        txtLCamount.isUserInteractionEnabled = false
//        
//        FXbookingMaster.shared.deliveryType = 2
//
//        if lblSelectCities.text == "Currency" {
//            imgCountries.isHidden = true
//            leftConstantCurrency.constant = 20
//            txtFCamount.isUserInteractionEnabled = false
//            
//        }
//        viewRate.cornerRadius = 15
//        viewRate.borderColor = #colorLiteral(red: 0.6666666667, green: 0.6666666667, blue: 0.6666666667, alpha: 1)
//        viewRate.borderWidth = 1
//        
//        tableViewFX.register(UINib(nibName: "CellSectionTwo", bundle: nil), forCellReuseIdentifier: "CellSectionTwo")
//        
//        localizeData()
//        tableViewFX.delegate = self
//        tableViewFX.dataSource = self
//        txtFCamount.delegate = self
//        txtLCamount.delegate = self
//        self.txtFCamount.addTarget(self, action: #selector(sourceTextFieldDidEditingChanged(_:)), for: UIControl.Event.editingChanged)
//        self.txtLCamount.addTarget(self, action: #selector(targetTextFieldDidEditingChanged(_:)), for: UIControl.Event.editingChanged)
//        getsessionid()
        
        //        self.navigationController?.navigationBar.isHidden = true
        
    }
    
    func localizeData() {
        lblFCAmtPlaceholder.text = Global.shared.fc_amount
        lblLCAmtPlaceholder.text = Global.shared.lc_amonut
        
//        txtLCamount.placeholder = Global.shared.lc_amonut
//        txtFCamount.placeholder = Global.shared.fc_amount
//        txtFCamount.placeholder = ""
//        txtLCamount.placeholder = ""
        lblrate.text = Global.shared.rate
        lblSelectCities.text = Global.shared.currency
        
    }
    

    
    override func viewDidLayoutSubviews() {
//        centerCardView.layer.masksToBounds = true
//        centerCardView.layer.cornerRadius = centerCardView.bounds.height / 2
//        centerCardView.layer.borderColor = UIColor.gray.cgColor
//        centerCardView.layer.borderWidth = 1.0
        
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: txtFCamount.frame.height - 1, width: txtFCamount.frame.width, height: 1.0)
        
        let bottomLine1 = CALayer()
        bottomLine1.frame = CGRect(x: 0.0, y: txtLCamount.frame.height - 1, width: txtLCamount.frame.width, height: 1.0)
        bottomLine.backgroundColor = UIColor.gray.cgColor
        bottomLine1.backgroundColor = UIColor.gray.cgColor
        txtFCamount.borderStyle = UITextField.BorderStyle.none
        txtFCamount.layer.addSublayer(bottomLine)
        txtLCamount.layer.addSublayer(bottomLine1)
    }
    
    @IBAction func onClickedAddBtn(_ sender: UIButton)
    {
        
        if FXbookingMaster.shared.fxBookingDataSource.count <= 10
        {
            var dulicatecurrency = FXbookingMaster.shared.fxBookingDataSource.filter { obj in
                return (obj.currenyCodeTo == self.cmFXBooking?.currenyCodeTo)
            }
            if(dulicatecurrency.count > 0)
            {
                var index = FXbookingMaster.shared.fxBookingDataSource.firstIndex { obj in
                return (obj.currenyCodeTo == self.cmFXBooking?.currenyCodeTo)
            }
                FXbookingMaster.shared.fxBookingDataSource.remove(at: index!)
        }
        
        guard cmFXBooking != nil else {
            return
        }
            FXbookingMaster.shared.fxBookingDataSource.append(cmFXBooking!)
            self.cmFXBooking = nil
            txtLCamount.text = ""
            txtFCamount.text = ""
            lblrate.text = "Rate"
            countryCode = ""
            lblSelectCities.text = "Currency"
            txtFCamount.isUserInteractionEnabled = false
            leftConstantCurrency.constant = 20
            imgCountries.image = nil
            
            
        }
        else{
            let alert = ViewControllerManager.displayAlert(message: "Maximum length is 8", title:"Canvas")
            self.present(alert, animated: true, completion: nil)
        }
        
        tableViewFX.reloadData()
    }
    
    
    @IBAction func onClickedInfoBtn(_ sender: UIButton)
    {
        if let viewController = Storyboad.shared.mainStoryboard?.instantiateViewController(withIdentifier: "ToolTipListController") as? ToolTipListController {
            var index = 0
            var height = 0
//               print( "Value of index is \(index)")
//                if index == 0
//                {
                    height = height + 60
//                }
//                else {
//                    height = height + 60
//                }
//
               index = index + 1
//            }
            viewController.preferredContentSize = CGSize(width: 300, height: height)
                let navController = UINavigationController(rootViewController: viewController)
                navController.modalPresentationStyle = .popover

                if let pctrl = navController.popoverPresentationController {
                    pctrl.delegate = self

                    pctrl.sourceView = (sender as! UIView)
                    pctrl.sourceRect = (sender as! UIView).bounds

                    self.present(navController, animated: true, completion: nil)
                }
            }
    }
   
    func onclicksubmit()
    {
        if(FXbookingMaster.shared.fxBookingDataSource.count == 0)
        {
            let alert = ViewControllerManager.displayAlert(message: Global.shared.currency_required_msg, title:"")
            self.present(alert, animated: true, completion: nil)
            return
        }
        if(FXbookingMaster.shared.selecytedhomeaddress == nil && FXbookingMaster.shared.selecedbranchaddress == nil)
        {
            let alert = ViewControllerManager.displayAlert(message: Global.shared.address_required_msg, title:"")
            self.present(alert, animated: true, completion: nil)
            return
        }
//        if(FXbookingMaster.shared.selecteddateslot == "")
//        {
//            let alert = ViewControllerManager.displayAlert(message: Global.shared.date_required_msg, title:"")
//            self.present(alert, animated: true, completion: nil)
//            return
//        }
//        if(FXbookingMaster.shared.selectedtimeslot == "")
//        {
//            let alert = ViewControllerManager.displayAlert(message: Global.shared.time_required_msg, title:"")
//            self.present(alert, animated: true, completion: nil)
//            return
//        }
        if(FXbookingMaster.shared.selectedpurpose == "")
        {
            let alert = ViewControllerManager.displayAlert(message: Global.shared.pot_required_msg, title:"")
            self.present(alert, animated: true, completion: nil)
            return
        }
        var fccurrencydict = FXbookingMaster.shared.fxBookingDataSource.map {["type": "S", "fcCurrencyCode": $0.currenyCodeTo, "fcAmount": Double($0.amountTo) ?? 0.0, "lcAmount": Double($0.amountFrom) ?? 0.0, "rate": Double($0.actualRate) ?? 0.0]}
        if let cell = tableViewFX.cellForRow(at: IndexPath(row: 0, section: 1)) as? CellSectionTwo
        {
            FXbookingMaster.shared.deliveryinstruction = cell.TFDeliveryInst.text!
        }
        var  netamount = 0.0
        for count in fccurrencydict
        {
            netamount = count["lcAmount"] as! Double + netamount
        }
        print(fccurrencydict)
        print(netamount)
        FXbookingMaster.shared.netamount = "\(netamount)"

        let vc = Storyboad.shared.fxBookingStoryboard?.instantiateViewController(withIdentifier: "TransactionSummaryVC") as! TransactionSummaryVC
        self.navigationController?.pushViewController(vc, animated: true)
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
    
    @IBAction func onTapPromotionCode(_ sender: Any) {
//        let vc = storyboard?.instantiateViewController(withIdentifier: "PromotionsVC") as! PromotionsVC
//        navigationController?.pushViewController(vc, animated: true)
//
//        print("Call Promotion List API")
//        callPromotionListAPI()
        
    }
    
    
    @IBAction func onTapAdd(_ sender: Any)
    {
        if FXbookingMaster.shared.fxBookingDataSource.count > 0 && FXbookingMaster.shared.fxBookingDataSource.count < 11
        {
            tableViewFX.reloadData()
        }
        
    }
    
    @IBAction func onClickedSelectCountries(_ sender: UIButton) {
        self.curencyRate = "Currency"
        Global.shared.countris = Country.getCountries(Global.shared.countrisAllFc)
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
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        
        if(FXbookingMaster.shared.iscomefromtab)
        {
            FXbookingMaster.shared.iscomefromtab = false
            FXbookingMaster.shared.dispose()
            txtFCamount.text = ""
            txtLCamount.text = ""
            lblSelectCities.text = "Currency"
            
            txtLCamount.isUserInteractionEnabled = false
            
            FXbookingMaster.shared.deliveryType = 2

            if lblSelectCities.text == "Currency" {
                imgCountries.isHidden = true
                leftConstantCurrency.constant = 20
                txtFCamount.isUserInteractionEnabled = false
                
            }
            
            self.cmFXBooking = nil
//            txtLCamount.text = ""
//            txtFCamount.text = ""
//            lblrate.text = "Rate"
//            countryCode = ""
//            lblSelectCities.text = "Currency"
//            txtFCamount.isUserInteractionEnabled = false
//            leftConstantCurrency.constant = 20
//            imgCountries.image = nil

            
            viewRate.cornerRadius = 15
            viewRate.borderColor = #colorLiteral(red: 0.6666666667, green: 0.6666666667, blue: 0.6666666667, alpha: 1)
            viewRate.borderWidth = 1
            
            tableViewFX.register(UINib(nibName: "CellSectionTwo", bundle: nil), forCellReuseIdentifier: "CellSectionTwo")
            
            localizeData()
            tableViewFX.delegate = self
            tableViewFX.dataSource = self
            txtFCamount.delegate = self
            txtLCamount.delegate = self
            self.txtFCamount.addTarget(self, action: #selector(sourceTextFieldDidEditingChanged(_:)), for: UIControl.Event.editingChanged)
            self.txtLCamount.addTarget(self, action: #selector(targetTextFieldDidEditingChanged(_:)), for: UIControl.Event.editingChanged)
            getsessionid()
            self.tableViewFX.reloadData()
            self.fxdelegate?.reloadhomeaddress()
            
            //        self.navigationController?.navigationBar.isHidden = true
            
        }
        
        
        
        
        
        if(self.fxdelegate != nil)
        {
            self.fxdelegate?.reloadhomeaddress()
        }
//        DispatchQueue.main.asyncAfter(deadline: .now()) {[weak self] in
//            guard let self = self else {return}
//            self.getHomeData()
//        }
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
    
    
    func callPromotionListAPI(){
        let paramaterPasing: [String:Any] = ["registrationId": Global.shared.afterLoginRegistrtnId ?? "","date" : Global.shared.transactionsToDate ?? ""]
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        self.showSpinner(onView: self.view)
        NetWorkDataManager.sharedInstance.hitPromotionListAPI(headersToBePassed: headers, postParameter: paramaterPasing) {responseData,
            errString in
            self.removeSpinner()
            guard errString == nil else {
                print(errString ?? "")
                self.removeSpinner()
                let finalError = errString?.components(separatedBy: ":")
                let alert = ViewControllerManager.displayAlert(message: errString ?? "", title:APPLICATIONNAME)
                self.present(alert, animated: true, completion: nil)
                return
            }
            let statusMsg = responseData?.value(forKey: "statusMessage") as? String ?? ""
            let mesageCode = responseData?.value(forKey: "messageCode") as? String ?? statusMsg
            print(statusMsg,mesageCode)
            
            if let statusCode = responseData?.value(forKey: "statusCodes") as? Int {
                print(statusCode)
                if(statusCode == 200)  {
                    print("Status Code 200")
                }else{
                    let alert = ViewControllerManager.displayAlert(message:Global.shared.messageCodeType(text: mesageCode), title:APPLICATIONNAME)
                    self.present(alert, animated: true, completion: nil)
                }
            }
            
        }
        
    }
    
    //MARK: - Delegate Push
    func didPressCell(sender: Any)
    {
        if(FXbookingMaster.shared.deliveryType == 2)
        {
            let vc = storyboard?.instantiateViewController(withIdentifier: "YourAddress") as! YourAddress
            navigationController?.pushViewController(vc, animated: true)
        }
        else
        {
            self.pushViewController(controller: BranchLocatorFirstVc.initiateController())
        }
    }
    
    
    func onclickcancel()
    {
        MenuScreenShow(screen:"Dashboard")
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
        return section == 0 ?  FXbookingMaster.shared.fxBookingDataSource.count : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CellCountry", for: indexPath) as! CellCountry
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            cell.deleteBtn.tag = indexPath.row
            cell.lblLCAmount.text = Global.shared.lc_amonut
            cell.lblFCAmmount.text = Global.shared.fc_amount
            if !FXbookingMaster.shared.fxBookingDataSource.isEmpty {
                
                
                if let fcRate = Double(FXbookingMaster.shared.fxBookingDataSource[indexPath.row].rate) {
                    print("Float value = \(fcRate)")
                    let lvAmnt = String(format: "%.3f", fcRate)
                    let finalTxt = "1 \(FXbookingMaster.shared.fxBookingDataSource[indexPath.row].currenyCodeTo) = \(lvAmnt) \(FXbookingMaster.shared.fxBookingDataSource[indexPath.row].currenyCodeFrom)"
                    cell.lblConverter.text = finalTxt
                } else {
                    print("String does not contain Float")
                }
                
                
//                cell.tfSourceField.text = "\(FXbookingMaster.shared.fxBookingDataSource[indexPath.row].amountFrom) KWD"
                let amountFrom = FXbookingMaster.shared.fxBookingDataSource[indexPath.row].amountFrom
                if let lcAmounnt = Double(amountFrom) {
                    print("Float value = \(lcAmounnt)")
                    let lvAmnt = String(format: "%.3f", lcAmounnt)
                    cell.tfSourceField.text =  "\(lvAmnt) KWD"
                } else {
                    print("String does not contain Float")
                }
                cell.tfTargetField.text = FXbookingMaster.shared.fxBookingDataSource[indexPath.row].amountTo
                cell.lblCurrencyCode.text = FXbookingMaster.shared.fxBookingDataSource[indexPath.row].currenyCodeTo
                cell.imgCountry.image = UIImage(named: FXbookingMaster.shared.fxBookingDataSource[indexPath.row].countryCode.lowercased())
            }
            
            cell.delegate = self
            return cell
        }
        else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CellSectionTwo", for: indexPath) as! CellSectionTwo
            cell.selectionStyle = .none
            cell.TFTimeSlot.placeholder = Global.shared.timeslot
            cell.TFSelectDate.placeholder = Global.shared.preferred_date
            cell.lblPurpose.text = "\(Global.shared.purpose!) *"
            cell.homeSegment.setTitle(Global.shared.home, forSegmentAt: 0)
            cell.homeSegment.setTitle(Global.shared.branch, forSegmentAt: 1)
            cell.TFSelectDate.text = FXbookingMaster.shared.selecteddateslot
            cell.TFTimeSlot.text = FXbookingMaster.shared.selectedtimeslot
            cell.TFSelectPurposeOf.text = FXbookingMaster.shared.selectedpurpose
            cell.lblDenominations.text = Global.shared.denominations
            cell.lblHighValue.text = Global.shared.high_value
            cell.lblMixedNotes.text = Global.shared.mix_notes
            cell.lblnote.text = Global.shared.note
            cell.lblChooseDeliveryOptions.text = Global.shared.delivery_option
            cell.btnSubmit.setTitle(Global.shared.submit, for: .normal)
            cell.BtnCancle.setTitle(Global.shared.cancel, for: .normal)
            
            cell.Pushdelegate = self
            cell.parentobj = self
            return cell
        }
    }
    
    
//    func getHomeAddress()
//    {
//        FXbookingMaster.shared.getHomeData { [self] success, errorcode in
//            self.fxdelegate?.reloadhomeaddress()
//        }
//    }
//    
//    
//    
//    func getBranchAddress()
//    {
//        FXbookingMaster.shared.getBranchData { [self] success, errorcode in
//            self.fxdelegate?.reloadhomeaddress()
//        }
//    }
    
    // reset the searchTimer whenever the textField is editingChanged
    @objc func sourceTextFieldDidEditingChanged(_ textField: UITextField) {
        
        // if a timer is already active, prevent it from firing
        if sourceTimer != nil {
            sourceTimer?.invalidate()
            sourceTimer = nil
        }
        
        sourceTimer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(sourceSearchForKeyword(_:)), userInfo: textField.text!, repeats: false)
        
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let  char = string.cString(using: String.Encoding.utf8)!
        let isBackSpace = strcmp(char, "\\b")
        if (isBackSpace == -92) {
//            txtFCamount.text = nil
            lblrate.text = "Rate"
            txtLCamount.text = ""
            self.cmFXBooking = nil

        }
        return true
    }
    
    @objc func sourceSearchForKeyword(_ timer: Timer) {
        
        // retrieve the keyword from user info
        let keyword = timer.userInfo!
        
        print("Searching for keyword \(keyword)")
        
        self.view.endEditing(true)
        if(countryCode != nil && countryCode != "")
        {
            if txtFCamount.text!.count > 0{
                if (Int(txtFCamount.text ?? "") ?? 0) % (denomination ?? 0) == 0 {
                    rateCalculator()
                }else{
                    let alert = ViewControllerManager.displayAlert(message:"\(Global.shared.denomination_lbl ?? "") \(denomination ?? 0)", title:APPLICATIONNAME)
                    self.present(alert, animated: true, completion: nil)
                }
                
            }else{
                txtLCamount.text = ""
                lblrate.text = "Rate"
                self.cmFXBooking = nil

            }
          
        }
    }
    
    func onClickedHighValue(value: String) {
        highValue = value
        print("High Value : \(value)")
    }
    
    func onClickedMixedNoted(value: String) {
        mixTap = value
        print("mixed Value : \(value)")
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
    
//    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView?
//    {
//        return section == 0 ?  footer : UIView()
//    }
//
//    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat
//    {
//        return section == 0 ?  50 : 0.1
//    }
    
    func deleteRow(index:Int)
    {
        FXbookingMaster.shared.fxBookingDataSource.remove(at: index)
        tableViewFX.reloadSections([0], with: .none)
//        print("click")
//        print(index)
//        if count < 12 && count > 1{
//
//            count = count - 1
//            tableViewFX.reloadData()
//
//        }
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//        fxHomeAddress = homeDataSource
//    }
    
    func getsessionid()
    {
        Decimal()
        let paramaterPasing: [String:Any] = ["registrationId": Global.shared.afterLoginRegistrtnId ?? ""]
        print(paramaterPasing)
        let headers: HTTPHeaders = ["Content-Type": "application/json"]
        NetWorkDataManager.sharedInstance.getSessionIdImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
                
                if errorString == nil
                {
                    print(resonseTal!)
                    let statusMsg = resonseTal?.value(forKey: "statusMessage") as? String ?? ""
                    let mesageCode = resonseTal?.value(forKey: "messageCode") as? String ?? statusMsg
                    if let statusCode = resonseTal?.value(forKey: "statusCodes") as? Int {
                    if statusCode == 200
                    {
                        FXbookingMaster.shared.fxsessionid = (resonseTal?.value(forKey: "sessionID") as? String)!
                    }
                    else
                    {
                            let alert = ViewControllerManager.displayAlert(message:Global.shared.messageCodeType(text: mesageCode), title:APPLICATIONNAME)
                            self.present(alert, animated: true, completion: nil)
                    }
                        
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
        
    
    func rateCalculator() {
        let amntDecimal = NSDecimalNumber(string: txtFCamount.text?.replacingOccurrences(of: ",", with: "", options: .literal, range: nil) ?? "0.0")
        
        //    if Int(truncating: amntDecimal) > 0 {
        if Double(truncating: amntDecimal) >= 0.01 {
            self.showSpinner(onView: self.view)
            let paramaterPasing: [String:Any] = [
                "sessionId": FXbookingMaster.shared.fxsessionid,
                 "currenyCodeFrom": "KWD",
                "currenyCodeTO": lblSelectCities.text!,
                 "amount": amntDecimal,
                 "promoCode": ""
            ]
            print(paramaterPasing)
            let headers: HTTPHeaders = [
                "Content-Type": "application/json"
            ]
            
            //       let headers: HTTPHeaders = [.authorization(bearerToken: UserDefaults.standard.string(forKey: "token")!)]
            
            NetWorkDataManager.sharedInstance.fxbookingratecalculator(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
                
                if errorString == nil
                {
                    
                    self.removeSpinner()
                    print(resonseTal!)
                    let statusMsg = resonseTal?.value(forKey: "statusMessage") as? String ?? ""
                    let mesageCode = resonseTal?.value(forKey: "messageCode") as? String ?? statusMsg
                    if let statusCode = resonseTal?.value(forKey: "statusCodes") as? Int {
                        if statusCode == 200 {
                            
                            if let ratecalobj = (resonseTal?["getFCRate2Result"]) as? [String:Any]
                            {
                                
                                let amountFrom = "\(ratecalobj["amountFrom"] ?? "")"
                                
                                
                                if let lcAmounnt = Double(amountFrom) {
                                    print("Float value = \(lcAmounnt)")
                                    let lvAmnt = String(format: "%.3f", lcAmounnt)
                                    self.txtLCamount.text = "\(lvAmnt)"
                                } else {
                                    print("String does not contain Float")
                                }
                                
                                self.txtFCamount.text = "\(ratecalobj["amountTo"] ?? "")"
//                                self.txtLCamount.text = "\(ratecalobj["amountFrom"] ?? "")"
                                let ratee = "\(ratecalobj["rate"] ?? "")"
                                
                                if let rateFloat = Double(ratee) {
                                    print("Float value = \(rateFloat)")
                                    let rateAmnt = String(format: "%.3f", rateFloat)
                                    let finalTxt = "\(rateAmnt) KWD"
                                    print(finalTxt)
                                    self.lblrate.text = finalTxt
                                } else {
                                    print("String does not contain Float")
                                }
                                self.cmFXBooking = CMFXBooking(
                                    actualRate: "\(ratecalobj["actualRate"] ?? "")",
                                    amountFrom: "\(ratecalobj["amountFrom"] ?? "")",
                                    netAmt: "\(ratecalobj["netAmt"] ?? "")",
                                    rate: "\(ratecalobj["rate"] ?? "")",
                                    amountTo: "\(ratecalobj["amountTo"] ?? "")",
                                    commAmount: "\(ratecalobj["commAmount"] ?? "")",
                                    promoCommAmount: "\(ratecalobj["promoCommAmount"] ?? "")",
                                    currenyCodeFrom: "\(ratecalobj["currenyCodeFrom"] ?? "")",
                                    currenyCodeTo: "\(ratecalobj["currenyCodeTo"] ?? "")", countryCode: self.countryCode ?? ""
                                )
                                print("myModel is \(self.cmFXBooking)")
                                //                            self.rateCalculationLbl.text = finalTxt
                                //                            self.rateCalculationLbl.isHidden = false
                                self.tableViewFX.reloadData()
                            }
                        }
                        else {
                            let alert = ViewControllerManager.displayAlert(message:Global.shared.messageCodeType(text: mesageCode), title:APPLICATIONNAME)
                            self.present(alert, animated: true, completion: nil)
                        }
                        
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
        
    }
    
}

extension FXBookingVC {
    func navigateToDiffrentScreenDelegate(toWhichScreenWeAreNaviagting : String)
     {
         print(toWhichScreenWeAreNaviagting)
         if toWhichScreenWeAreNaviagting == Global.shared.lbl_fxbooking{
             
         }
         else{
             MenuScreenShow(screen:toWhichScreenWeAreNaviagting)
         }
     }
    
    func didSelectedCountry(country: Country) {
        lblSelectCities.text = country.currencyCode
        countryCode = country.countryCode?.lowercased()
        imgCountries.image = UIImage(named: country.countryCode?.lowercased() ?? "")
        imgCountries.isHidden = false
        denomination = country.denomination ?? 0
        leftConstantCurrency.constant = 45
        txtLCamount.text = ""
        lblrate.text = "Rate"
        self.cmFXBooking = nil
        txtFCamount.isUserInteractionEnabled = true
       if txtFCamount.text != ""
        {
           if (Int(txtFCamount.text ?? "") ?? 0) % (denomination ?? 0) == 0 {
               rateCalculator()
           }else{
               let alert = ViewControllerManager.displayAlert(message:"\(Global.shared.denomination_lbl ?? "") \(denomination ?? 0)", title:APPLICATIONNAME)
               self.present(alert, animated: true, completion: nil)
           }
//            rateCalculator()
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
        self.fxTimemSlotDataSource.removeAll()
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
//            selectDate = itemData.sDate
            FXbookingMaster.shared.selecteddateslot = itemData.sDate ?? ""
        }else if let timeData = item as? FXTimeSlot{
//            timeSlot = timeData.name
            FXbookingMaster.shared.selectedtimeslot = timeData.name ?? ""

            print("time Slot Date : \(item)")
        }else if let purposeCodeData = item as? BeneficiaryPurposeData {
            FXbookingMaster.shared.selectedpurpose = purposeCodeData.name ?? ""
//            purposeCode = purposeCodeData.name ?? ""
            
        }
        vc?.dismiss(animated: true)
        tableViewFX.reloadData()
    }
}

//
//"type": "S",
//"fcCurrencyCode": "USD",
//"fcAmount": 100.0,
//"lcAmount": 30.500,
//"rate": 0.3050000


class FXbookingMaster {
    
    struct Static
        {
            static var shared: FXbookingMaster?
        }

        class var shared: FXbookingMaster
        {
            if Static.shared == nil
            {
                Static.shared = FXbookingMaster()
            }

            return Static.shared!
        }

        func dispose()
        {
            FXbookingMaster.Static.shared = nil
            
            print("Disposed Singleton instance")
        }
    
    
    var iscomefromtab = false
//    static var shared = FXbookingMaster()
    var deliveryType  = 2
    var selecytedhomeaddress : Int?
    var selecedbranchaddress : Int?
//    var selectedaddresstype = 0
    var selecteddateslot = ""
    var selectedtimeslot = ""
    var deliveryinstruction = ""
    var selectedpurpose = ""
    var deminations = ""
    var netamount = ""
    var fxsessionid : String = ""
    var selectedhomeaddress1name = ""
    var selectedhomeaddress2name = ""
    var selectedbranchaddress1name = ""
    var selectedbranchaddress2name = ""

    var txnRefNo = ""
    lazy var dataSource : [CMSummery] = {
        let data = [CMSummery]()
        return data
    }()
    
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
    
    
    
    func getData(){
        dataSource.removeAll()
        let data0 = CMSummery(summery: "", ammount: "")
        dataSource.append(data0)
        let data1 = CMSummery(summery: "Commission Discount", ammount: "0.0 KWD")
        dataSource.append(data1)
        let data2 = CMSummery(summery: "Delivery Chanrges", ammount: "1 KWD")
        dataSource.append(data2)
        let data3 = CMSummery(summery: "Commission Discount", ammount: "0.0 KWD")
        dataSource.append(data3)
        let data4 = CMSummery(summery: "", ammount: "")
        dataSource.append(data4)
        
    }
    
    
    func getHomeData(completionHandler: @escaping (Bool,String?) -> ())
    {
        FXbookingMaster.shared.homeDataSource.removeAll()
        let paramaterPasing: [String:Any] = ["registrationId": Global.shared.afterLoginRegistrtnId ?? ""]
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            NetWorkDataManager.sharedInstance.gethomeaddressList(headersTobePassed: headers, postParameters: paramaterPasing) { [weak self] responseData, errString in
                guard let self = self else {return}
                
                guard errString == nil else {
                    print(errString ?? "")
                    let finalError = errString?.components(separatedBy: ":")
//                    let alert = ViewControllerManager.displayAlert(message: finalError?[1] ?? "", title:APPLICATIONNAME)
//                    self.present(alert, animated: true, completion: nil)
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
                                FXbookingMaster.shared.homeDataSource.append(
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
                                                         bIsDefault: onemessage["bIsDefault"] as! Bool,
                                                         latitude: onemessage["latitude"] as? String,
                                                         longitude: onemessage["longitude"] as? String))
                            }
                        }
                        
                        print("My Home Address is : \(self.homeDataSource)")
                        completionHandler(true,"")
//                        self.tableViewFX.reloadData()
                    }
                    else {
                        completionHandler(false,mesageCode)

                        let alert = ViewControllerManager.displayAlert(message:Global.shared.messageCodeType(text: mesageCode), title:APPLICATIONNAME)
//                        self.present(alert, animated: true, completion: nil)
                        
                    }
                    
                }
                
                
            }
        }
    }
    
    
    
    
//    MARK: - get_user_branch_details_url
    
    func getUserBranchDetails(completionhandler : @escaping (Bool, String) -> Void) {
        FXbookingMaster.shared.branchDataSource.removeAll()
        let paramaterPasing: [String:Any] = ["registrationId": Global.shared.afterLoginRegistrtnId ?? ""]
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        NetWorkDataManager.sharedInstance.getUserBranchDetails(headersTobePassed: headers, postParameters: paramaterPasing) {  [weak self] responseData, errString in
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
                    if let dataArray = responseData?.value(forKey: "userBranchList") as? NSArray {
                        print("User Branch List \(dataArray)")
                        for onemessage in dataArray as! [Dictionary<String, AnyObject>] {
                            print("oneMessage Data is : \(onemessage)")
                            if let branchDetail = onemessage["branchDetail"] as? NSDictionary {
//                                let dataObj = Global.shared.convertToDictionary(text: branchDetail)
                                FXbookingMaster.shared.branchDataSource.append(CMBookingBranchAddress(id: branchDetail["id"] as? Int,
                                                                                    branchCode: branchDetail["branchCode"] as? String,
                                                                                    branchName: branchDetail["branchName"] as? String,
                                                                                    branchAddress: branchDetail["branchAddress"] as? String,
                                                                                    phone: branchDetail["phone"] as? String,
                                                                                    fax: branchDetail["fax"] as? String,
                                                                                    latitude: branchDetail["latitude"] as? String,
                                                                                    longitude: branchDetail["longitude"] as? String,
                                                                                    languageCode: branchDetail["languageCode"] as? String,
                                                                                    isFEEnabled: branchDetail["isFEEnabled"] as? Bool))
                                print("Dictionary Data : \(branchDetail)")
                                
                            }      
                        }
                    }
                    print("All Branch Data : \(self.branchDataSource)")
                    completionhandler(true, mesageCode)
                }else{
                    completionhandler(false, mesageCode)
                }
                
            }
        }
        
    }
    
    //    MARK: - get Branch Data
    
    
    func getBranchData(completionHandler: @escaping (Bool,String?) -> ())
    {
        
        FXbookingMaster.shared.branchDataSource.removeAll()

        let paramaterPasing: [String:Any] = ["languageCode": "en",
                                             "searchTerm": "",
                                             "type": 0]
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        NetWorkDataManager.sharedInstance.getbranchAddressList(headersTobePassed: headers, postParameters: paramaterPasing) { [weak self] responseData, errString in
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
                    
                    if let dataArray = responseData?.value(forKey: "branchesList") as? NSArray {
                        print(dataArray)
                        for onemessage in dataArray as! [Dictionary<String, AnyObject>] {
                            FXbookingMaster.shared.branchDataSource.append(CMBookingBranchAddress(id: onemessage["id"] as? Int,
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
                    completionHandler(true,"")

                }else {
                    completionHandler(true,mesageCode)

//                    let alert = ViewControllerManager.displayAlert(message:Global.shared.messageCodeType(text: mesageCode), title:APPLICATIONNAME)
//                    self.present(alert, animated: true, completion: nil)
                    
                    
                    
                }
            }
        }
    }
    
//    (completionHandler: @escaping (Bool,String?) -> ())

}

protocol delegatecallbackfromFxbooking
{
    func reloadhomeaddress()
}

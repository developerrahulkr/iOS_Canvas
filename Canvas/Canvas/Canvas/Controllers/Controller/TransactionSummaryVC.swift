//
//  TransactionSummaryVC.swift
//  Al_MuzainiDummy
//
//  Created by apple on 05/10/22.
//

import UIKit
import Alamofire

class TransactionSummaryVC: UIViewController, navigateToDiffrentScreenDelegate, protocolTermAndCondition {
    
    
    
    
    
    //MARK: - OUTLETS
    
    
    
    
    @IBOutlet weak var lblCurrency: UILabel!
    @IBOutlet weak var lblFCAmount: UILabel!
    @IBOutlet weak var lblRate: UILabel!
    @IBOutlet weak var lblLCAmount: UILabel!
    @IBOutlet weak var lblTotal: UILabel!
    
    
    
    
    
    @IBOutlet weak var lblTransectionSummery: UILabel!
    public var menuPopUp: MenuViewController!
    @IBOutlet weak var lblTotalAmount: UILabel!
    @IBOutlet weak var viewActualTotal: UIView!
    @IBOutlet weak var ViewTotalLCAmount: UIView!
    @IBOutlet var viewTotal: UIView!
    @IBOutlet var headerViewTitle: UIView!
    @IBOutlet weak var viewCurrency: UIView!
    @IBOutlet weak var viewFCAmount: UIView!
    @IBOutlet weak var viewRate: UIView!
    @IBOutlet weak var viewLCAmount: UIView!
    
    @IBOutlet weak var tableViewTransaction: UITableView!
    
    //MARK: - VARIABLES
    var tempForSummaryCount = 0
    var termsConditionsResponse = [Any]()
    
//
    
    
    //MARK: - LIFECYCLE METHODS
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        var digitTwo = Double(FXbookingMaster.shared.netamount)
        var digitThree = String(format: "%.3f", digitTwo!)
        lblTotalAmount.text = "\(digitThree) KWD"

        FXbookingMaster.shared.getData()
        tableViewTransaction.allowsSelection = false
        
        tableViewTransaction.delegate = self
        tableViewTransaction.dataSource = self
        
        viewCurrency.layer.borderColor = #colorLiteral(red: 0.6666666667, green: 0.6666666667, blue: 0.6666666667, alpha: 1)
        viewCurrency.layer.borderWidth = 1
        
        viewFCAmount.layer.borderColor = #colorLiteral(red: 0.6666666667, green: 0.6666666667, blue: 0.6666666667, alpha: 1)
        viewFCAmount.layer.borderWidth = 1
        
        viewRate.layer.borderColor = #colorLiteral(red: 0.6666666667, green: 0.6666666667, blue: 0.6666666667, alpha: 1)
        viewRate.layer.borderWidth = 1
        
        viewLCAmount.layer.borderColor = #colorLiteral(red: 0.6666666667, green: 0.6666666667, blue: 0.6666666667, alpha: 1)
        viewLCAmount.layer.borderWidth = 1
        
        //MARK: Total cells 4
        
        tableViewTransaction.register(UINib(nibName: "CellTermsAndConditions", bundle: nil), forCellReuseIdentifier: "CellTermsAndConditions")
        
        tableViewTransaction.register(UINib(nibName: "CellCurrencyData", bundle: nil), forCellReuseIdentifier: "CellCurrencyData")
        
        tableViewTransaction.register(UINib(nibName: "CellPurpose", bundle: nil), forCellReuseIdentifier: "CellPurpose")
        
        tableViewTransaction.register(UINib(nibName: "CellSummary", bundle: nil), forCellReuseIdentifier: "CellSummary")
        // Do any additional setup after loading the view.
        langTranslation()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    //MARK: - ACTIONS
    func langTranslation() {
        lblRate.text = Global.shared.rate
        lblTotal.text = Global.shared.total
        lblFCAmount.text = Global.shared.fc_amount
        lblLCAmount.text = Global.shared.lc_amonut
        lblCurrency.text = Global.shared.currency
        lblTransectionSummery.text = Global.shared.transaction_summary
    }
    
    @IBAction func onClickMenuBtn(_ sender: UIButton) {
        menuPopUp = Storyboad.shared.mainStoryboard?.instantiateViewController(withIdentifier: "MenuViewController") as? MenuViewController
        
        menuPopUp.delegateObj = self
        self.addChild(menuPopUp)
        menuPopUp.view.frame = self.view.frame
        self.view.addSubview(menuPopUp.view)
        menuPopUp.didMove(toParent: self)
    }
    
    @IBAction func onClickLanguageBtn(_ sender: UIButton) {
        Global.shared.languageChangeActn()
    }
    @IBAction func onClickLogoutBtn(_ sender: UIButton) {
        logout()
    }
    //MARK: - FUNCTIONS
    
    func funcTermsAndContions(btnTerm: Int) {
        let popOverVC = Storyboad.shared.mainStoryboard?.instantiateViewController(withIdentifier: "WuSecndTermsConditions") as! WuSecndTermsConditions
        self.addChild(popOverVC)
        popOverVC.isSummeryTerm = true
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParent: self)
//        getTermsConditions()
    }
    
    
    
}
//MARK: - EXTENSIONS

extension TransactionSummaryVC: UITableViewDelegate,UITableViewDataSource, TransectionActionDelegate{
    
    func onClickbackDelagate() {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    
    //MARK: Each Section 1 cell
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {           //MARK: Section 0
            return FXbookingMaster.shared.fxBookingDataSource.count                //MARK: No. of counrty cell
        }
        else if section == 1{       //MARK: Section 1
            return 1                //MARK: No. of Purpose cell - Allways return 1
        }
        else if section == 2{       //MARK: Section 2
            if FXbookingMaster.shared.dataSource.count > 0{
                return FXbookingMaster.shared.dataSource.count
                //MARK: if summary cell is greater then 0 then top and bottom cells are required
            }else {
                return FXbookingMaster.shared.dataSource.count
                
            }  //MARK: if summary cell is 0 then no top and bottom cells
        }
        else {return 1}             //MARK: Section 3
    }                               //MARK: No. of Terms and Conditions cell - Allways return 1
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CellCurrencyData", for: indexPath) as! CellCurrencyData
            cell.lblFCAmount.text = FXbookingMaster.shared.fxBookingDataSource[indexPath.row].amountTo
            let amountFrom = FXbookingMaster.shared.fxBookingDataSource[indexPath.row].amountFrom
            if let lcAmounnt = Double(amountFrom) {
                print("Float value = \(lcAmounnt)")
                let lvAmnt = String(format: "%.3f", lcAmounnt)
                cell.lblLCAmount.text =  "\(lvAmnt) KWD"
            } else {
                print("String does not contain Float")
            }
            
            
//            cell.lblLCAmount.text = "\(FXbookingMaster.shared.fxBookingDataSource[indexPath.row].amountFrom) KWD"
            cell.lblFinalTxt.text = "1 \(FXbookingMaster.shared.fxBookingDataSource[indexPath.row].currenyCodeTo) = \(FXbookingMaster.shared.fxBookingDataSource[indexPath.row].actualRate)"
            cell.imgFlag.image = UIImage(named: FXbookingMaster.shared.fxBookingDataSource[indexPath.row].countryCode.lowercased())
            cell.lblCurrencyCode.text = FXbookingMaster.shared.fxBookingDataSource[indexPath.row].currenyCodeTo
            return cell
        }
        else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CellPurpose", for: indexPath) as! CellPurpose
            cell.lblPurpose.text = "\(Global.shared.purpose ?? "") : "
            cell.lblAddressLang.text = "\( Global.shared.address ?? "") : "
            cell.lblRemarks.text = "\(Global.shared.remarks ?? "") : "
            cell.lblDelivery.text = "\(Global.shared.delivery_type ?? "") : "
            cell.lblDateAndTime.text = "\(Global.shared.date_timeslot ?? "") : "
            cell.lblAddress.text = FXbookingMaster.shared.selectedhomeaddress1name
            if (FXbookingMaster.shared.selecteddateslot == "" && FXbookingMaster.shared.selectedtimeslot == "" )
            {
                cell.lblDateTime.text = ""
            }
            else if (FXbookingMaster.shared.selecteddateslot != "" && FXbookingMaster.shared.selectedtimeslot != "" )
            {
                cell.lblDateTime.text = "\(FXbookingMaster.shared.selecteddateslot) | \(FXbookingMaster.shared.selectedtimeslot)"
            }
            else
            {
                cell.lblDateTime.text = "\(FXbookingMaster.shared.selecteddateslot) \(FXbookingMaster.shared.selectedtimeslot)"
            }
            
            
            cell.lblDeliveryType.text = FXbookingMaster.shared.deliveryType == 2 ? "Home" : "Branch"
            cell.lblPurposeTrnf.text = FXbookingMaster.shared.selectedpurpose
            cell.lblRemark.text = FXbookingMaster.shared.deliveryinstruction
            return cell
        }
        else if indexPath.section == 2{
            let cell = tableView.dequeueReusableCell(withIdentifier: "CellSummary", for: indexPath) as! CellSummary
            
            if indexPath.row == 0{
                cell.lblLeft.text = Global.shared.summary
                cell.lblRight.text = ""
                cell.lblLeft.textColor = .white
                cell.contentView.backgroundColor = #colorLiteral(red: 0.8509803922, green: 0.2156862745, blue: 0.1921568627, alpha: 1)
                
            }
            
            else if indexPath.row == FXbookingMaster.shared.dataSource.count - 1{
                cell.lblLeft.text = Global.shared.you_pay
                //MARK: Static Value
                var digitTwo = ((Double(FXbookingMaster.shared.netamount) ?? 0.0) + 1.0)
                var digitThree = String(format: "%.3f", digitTwo)
                cell.lblRight.text = "\(digitThree) KWD"
                
//                cell.lblRight.text = "\((Float(FXbookingMaster.shared.netamount) ?? 0.0) + 1.0) KWD"
                cell.lblRight.textColor = .white
                cell.contentView.backgroundColor = .gray
                cell.lblLeft.textColor = .white
            }else{
                
                if let fcRate = Double(FXbookingMaster.shared.dataSource[indexPath.row].amount ?? "") {
                        print("Float value = \(fcRate)")
                        let lvAmnt = String(format: "%.3f", fcRate)
                    cell.lblRight.text = lvAmnt + " KWD"    
                    } else {
                        print("String does not contain Float")
                    }
                
                
                
                
                
                cell.lblLeft.text = FXbookingMaster.shared.dataSource[indexPath.row].summery
                
                cell.lblLeft.textColor = .gray
                cell.lblRight.textColor = .gray
                cell.contentView.backgroundColor = .clear
            }
            
            return cell
            
        }
        else{                   //MARK: Section 3rd cell
            let cell = tableView.dequeueReusableCell(withIdentifier: "CellTermsAndConditions", for: indexPath) as! CellTermsAndConditions
            cell.lblTermAndConditions.setTitle(Global.shared.terms, for: .normal)
            cell.btnPay.setTitle(Global.shared.pay, for: .normal)
            cell.btnBack.setTitle(Global.shared.back, for: .normal)
            cell.delegate = self
            cell.varDelegate = self
            return cell
        }
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            return headerViewTitle
        }
        return UIView()
    }
    
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section == 0{
            return viewTotal
        }
        else {
            return UIView()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0{
            return 30
        }
        else {return 0.01}
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 0{ return 30}
        else {return 0.01}
    }
    
    func onClickPayDelagate()
    {
        if let cell = tableViewTransaction.cellForRow(at: IndexPath(row: 0, section: 3)) as? CellTermsAndConditions
        {
            if(cell.btncheck.isSelected)
            {
                self.cretefctransaction()
            }
            else
            {
                let alert = ViewControllerManager.displayAlert(message: Global.shared.acceptTermsCondtnsAlert, title:"")
                self.present(alert, animated: true, completion: nil)
                return
            }
        }

//        let vc = Storyboad.shared.fxBookingStoryboard?.instantiateViewController(withIdentifier: "FinalSummaryVC") as! FinalSummaryVC
//        navigationController?.pushViewController(vc, animated: true)
    }
    //Menu Delegate
    
    func navigateToDiffrentScreenDelegate(toWhichScreenWeAreNaviagting: String) {
        print(toWhichScreenWeAreNaviagting)
        if toWhichScreenWeAreNaviagting == Global.shared.transctnSumary {
            // same screen
        }
        else{
            MenuScreenShow(screen:toWhichScreenWeAreNaviagting)
        }
        
    }
    
    
    func cretefctransaction()
    {

        let fccurrencydict = FXbookingMaster.shared.fxBookingDataSource.map {
            ["type": "S",
             "fcCurrencyCode": $0.currenyCodeTo,
             "fcAmount": NSDecimalNumber(string: $0.amountTo.replacingOccurrences(of: ",", with: "", options: .literal, range: nil)) ,
             "lcAmount": NSDecimalNumber(string: $0.amountFrom.replacingOccurrences(of: ",", with: "", options: .literal, range: nil)),
             "rate": NSDecimalNumber(string: $0.rate.replacingOccurrences(of: ",", with: "", options: .literal, range: nil))]
            }
        self.showSpinner(onView: self.view)
        let paramaterPasing: [String:Any] =
        [
            "sessionId": FXbookingMaster.shared.fxsessionid,
            "registrationId": Global.shared.afterLoginRegistrtnId ?? "",
            "txnRefNo": "",
            "remID": UserDefaults.standard.string(forKey: "remId")!,
            "commAmount":NSDecimalNumber(string: "0.0".replacingOccurrences(of: ",", with: "", options: .literal, range: nil)),
            "netAmt": NSDecimalNumber(string: FXbookingMaster.shared.netamount.replacingOccurrences(of: ",", with: "", options: .literal, range: nil)),
            "payMode": 1,
            "soi": "SALARY",
            "pot": "FAM",
            "remarks": FXbookingMaster.shared.deliveryinstruction,
            "cashierID": "9998",
            "entity": "201",
            "promoCode": "",
            "deliveryType": FXbookingMaster.shared.deliveryType,
            "objectReferenceID": "\(FXbookingMaster.shared.deliveryType == 2 ? FXbookingMaster.shared.selecytedhomeaddress! : FXbookingMaster.shared.selecedbranchaddress!)",
            "timeSlot": FXbookingMaster.shared.selectedtimeslot,
            "denomination": FXbookingMaster.shared.deminations,
            "purposeOfTransfer": FXbookingMaster.shared.selectedpurpose == "" ? nil : FXbookingMaster.shared.selectedpurpose,
            "selectedDate": FXbookingMaster.shared.selecteddateslot == "" ? nil : FXbookingMaster.shared.selecteddateslot,
            "deliveryInsruction": FXbookingMaster.shared.deliveryinstruction,
            "remitterAddress1": "\(FXbookingMaster.shared.deliveryType == 2 ? FXbookingMaster.shared.selectedhomeaddress1name : FXbookingMaster.shared.selectedbranchaddress1name)",
            "remitterAddress2": "\(FXbookingMaster.shared.deliveryType == 2 ? FXbookingMaster.shared.selectedhomeaddress2name : FXbookingMaster.shared.selectedbranchaddress2name)",
            "fcDetails": fccurrencydict
        ]
        
            let hmacResult2: String = Global.shared.publicKeyStr.hmac(algorithm: HMACAlgorithm.SHA512, key: Global.shared.privateKeyStr)
            var headers = HTTPHeaders()
            if let authToken = UserDefaults.standard.string(forKey: "token") {
                headers  = [.authorization(bearerToken: authToken)]

                    headers["x-publickey"] = Global.shared.publicKeyStr
                    headers["x-client"] = hmacResult2
                    headers["x-hash"] = ""
                    headers["sessionId"] = FXbookingMaster.shared.fxsessionid

            }
        NetWorkDataManager.sharedInstance.hitcreatefctransaction(headersToBePassed: headers, postParameter: paramaterPasing) { [weak self] responseData, errString in
            self!.removeSpinner()

            guard let self = self else {return}
            guard errString == nil else {
                print(errString ?? "")
//                let vc = Storyboad.shared.fxBookingStoryboard?.instantiateViewController(withIdentifier: "BenefPaymentWebViewVc") as! BenefPaymentWebViewVc
                



                
//                let finalError = errString?.components(separatedBy: ":")
//                let alert = ViewControllerManager.displayAlert(message: finalError?[1] ?? "", title:APPLICATIONNAME)
//                self.present(alert, animated: true, completion: nil)
                return
            }
            let statusMsg = responseData?.value(forKey: "statusMessage") as? String ?? ""
            let mesageCode = responseData?.value(forKey: "messageCode") as? String ?? statusMsg
            if let statusCode = responseData?.value(forKey: "statusCodes") as? Int {
                print(statusCode)
                if(statusCode == 200)  {
                    let dict = responseData?.value(forKey: "fcTransactionResult") as! Dictionary<String,Any>
                    
                    FXbookingMaster.shared.txnRefNo = dict["txnRefNo"] as! String
                   
                    let vc = Storyboad.shared.mainStoryboard?.instantiateViewController(withIdentifier: "BenefPaymentWebViewVc") as! BenefPaymentWebViewVc
                    vc.isfromfxbooking = true
                    self.navigationController?.pushViewController(vc, animated: true)
//                    self.navigationController?.pushViewController(vc, animated: true)

//                    self.pushViewController(controller: BenefPaymentWebViewVc.initiateController())
                }else{
                    let alert = ViewControllerManager.displayAlert(message:Global.shared.messageCodeType(text: mesageCode), title:APPLICATIONNAME)
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
    }
}







struct CMSummery {
    let summery, amount : String?
}








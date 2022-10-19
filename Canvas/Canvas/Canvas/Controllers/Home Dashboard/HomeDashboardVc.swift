//
//  HomeDashboardVc.swift
//  Canvas
//
//  Created by urmila reddy on 03/11/20.
//  Copyright © 2020 urmila reddy. All rights reserved.
//

import UIKit
import Charts
import Alamofire
import MaterialShowcase
import Firebase
class HomeDashboardVc: BaseViewController, UICollectionViewDataSource, UICollectionViewDelegate, UITextFieldDelegate, navigateToDiffrentScreenDelegate, UIDropDownCurrencyDelegateM, XMSegmentedControlDelegate   {
    @IBOutlet weak var HelpCollectionHeight: NSLayoutConstraint!
    @IBOutlet weak var helpCollectionView: UICollectionView!
    var sequence = MaterialShowcaseSequence()
    lazy var guideView_1 =  MaterialShowcase()
    lazy var guideView_2 =  MaterialShowcase()
    lazy var guideView_3 =  MaterialShowcase()
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var helpVideoList = [[String: Any]]()
    
    
    
    var tipsVideoList = [[String: Any]]()
    
    @IBOutlet weak var setAlertBtnOtlt: UIButton!
    @IBOutlet weak var btn_tip: UIButton!
    
    @IBOutlet weak var seg: XMSegmentedControl!
    
    @IBOutlet weak var offerView: UIView!
    
    @IBOutlet weak var ratePaternImg: UIImageView!
    
    @IBOutlet weak var ratePaternDrpLbl: UILabel!
    
    @IBOutlet weak var firstView: UIView!
    
    @IBOutlet weak var secndView: UIView!
    
    @IBOutlet weak var thirdView: UIView!
    
    @IBOutlet weak var transactionsConstrt: NSLayoutConstraint!
    
    @IBOutlet weak var facouriteConstrt: NSLayoutConstraint!
    @IBOutlet weak var welcomeLbl: UILabel!
    
    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var recentTransctnsCollectnView: UICollectionView!
    
    
    @IBOutlet weak var favBenefCollectnView: UICollectionView!
    
    @IBOutlet weak var barChartVieww: BarChartView!
    
    @IBOutlet weak var youSendLbl: UILabel!
    @IBOutlet weak var youSendField: UITextField!
    
    @IBOutlet weak var youSendReqLbl: UILabel!
    
    @IBOutlet weak var theyReceiveLbl: UILabel!
    @IBOutlet weak var theyReceiveField: UITextField!
    
    @IBOutlet weak var theyReceiveReqLbl: UILabel!
    
    
    @IBOutlet weak var sourceCurrencyCodeLbl: UILabel!
    
    @IBOutlet weak var targetCurrencyCodeLbl: UILabel!
    
    @IBOutlet weak var lineChartVieww: LineChartView!
    
    @IBOutlet weak var kuwaitDinarLbl: UILabel!
    
    
    @IBOutlet weak var inrOrOtherCurencyLbl: UILabel!
    
    
    @IBOutlet weak var profileImg: UIImageView!
    
    
    @IBOutlet weak var firstImg: UIImageView!
    
    @IBOutlet weak var selectedImg: UIImageView!
    
    
    @IBOutlet weak var rateCalculationLbl: UILabel!
    
    
    @IBOutlet weak var recentTransctnsLbl: UILabel!
    
    @IBOutlet weak var favouriteBeneficiaryLbl: UILabel!
    
    @IBOutlet weak var transctnInsightsLbl: UILabel!
    
    
    @IBOutlet weak var ratePatternLbl: UILabel!
    
    
    
    @IBOutlet weak var rateCalcultorLbl: UILabel!
    
    
    
    
    @IBOutlet weak var transctnInsigtVieww: UIView!
    
    @IBOutlet weak var rateCalctrView: UIView!
    
    @IBOutlet weak var ratePatternView: UIView!
    
    
    @IBOutlet weak var downBanerImgView: UIView!
    
    @IBOutlet weak var imgNameLbl: UILabel!
    
    
    @IBOutlet weak var noRecrdsFndTxtRecentTnsctns: UILabel!
    
    @IBOutlet weak var noRecrdsFavBenefTxt: UILabel!
    
    
    @IBOutlet weak var fromDateOneLbl: UILabel!
    @IBOutlet weak var toDateOneLbl: UILabel!
    
    @IBOutlet weak var fromDateOneField: UILabel!
    @IBOutlet weak var toDateOneField: UILabel!
    
    
    @IBOutlet weak var fromDateTwoLbl: UILabel!
    @IBOutlet weak var toDateTwoLbl: UILabel!
    
    @IBOutlet weak var fromDateTwoField: UILabel!
    @IBOutlet weak var toDateTwoField: UILabel!
    
    
    
    @IBOutlet weak var targtCrncyNmeLbl: UILabel!
    @IBOutlet weak var targetCrncyNewLbl: UIButton!
    
    var ratePaternCurncyCode = ""
    
    
    
    public var menuPopUp: MenuViewController!
    var transctnResponse = [Any]()
    
    var beneficiaryResponse = [Any]()
    var beneficaryFilteredResponse = [Any]()
    
    
    var barchartDownNamesAry = [String]()
    var monthDateNamesAry = [String]()
    var barChartValuesAry = [Int]()
    
    var linechartDownNamesAry = [String]()
    var lineChartNamesAry = [String]()
    var lineChartValuesAry = [Double]()
    
    let dataX = [1,2,3,4,5,6,7,8,9,10,11,12]
    
    var datesAry = ["Fri 25 Sep 2020", "Fri 25 Sep 2020", "Fri 25 Sep 2020"]
    var titlesAry = ["International Mashaer event", "Hubbulrrasool event by Kerala Islamic Group", "Avenues 2nd branch is now open"]
    var subtitlesAry = ["International Mashaer event in Kuwait Medical Association", "Kerala Islamic group has conducted Hubbulrrasool event", "Avenues 2nd branch is now open is phase 4"]
    var newsImgesAry = ["news1", "news2", "news3"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.HelpCollectionHeight.constant = 0
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "OfferPopUpController") as! OfferPopUpController
        self.present(vc, animated: true, completion: nil)

       
       
        helpCollectionView.delegate = self
        helpCollectionView.dataSource = self
        noRecrdsFndTxtRecentTnsctns.isHidden = true
        noRecrdsFavBenefTxt.isHidden = true
        
      //  offerView.backgroundColor = UIColor.black.withAlphaComponent(0.5)

        setAlertBtnOtlt.setTitle(Global.shared.setAlertDashboard, for: .normal)
        setAlertBtnOtlt.makeButtonFitToContent(buttonTitle: setAlertBtnOtlt)
        noRecrdsFndTxtRecentTnsctns.text =  Global.shared.noRecordsFoundTxt
        noRecrdsFavBenefTxt.text =  Global.shared.noRecordsFoundTxt
        
        self.fromDateOneLbl.text = Global.shared.transactionsFromDate
        self.toDateOneLbl.text = Global.shared.transactionsToDate
        
        self.fromDateTwoLbl.text = Global.shared.transactionsFromDate
        self.toDateTwoLbl.text = Global.shared.transactionsToDate
        
        targtCrncyNmeLbl.text = Global.shared.transactionsTargetCurrency
        
      /*  ratePaternCurncyCode = "AUD"
        self.ratePaternDrpLbl.text = "AUD"*/
        
        menuItemsData()
        youSendField.maxLength = Global.shared.sendLimit
        theyReceiveField.maxLength = Global.shared.receiveLimit
        
        // Do any additional setup after loading the view.
        transctnInsigtVieww.addDropShadowToView(targetView: transctnInsigtVieww)
        rateCalctrView.addDropShadowToView(targetView: rateCalctrView)
        ratePatternView.addDropShadowToView(targetView: ratePatternView)
        downBanerImgView.addDropShadowToView(targetView: downBanerImgView)
        
        youSendField.delegate = self
        theyReceiveField.delegate = self
        profileImg.setRounded()
        
        rateCalculationLbl.layer.cornerRadius = 15
        rateCalculationLbl.layer.masksToBounds = true
        rateCalculationLbl.layer.backgroundColor = UIColor.clear.cgColor
        
        self.imgNameLbl.layer.cornerRadius = self.imgNameLbl.frame.size.width / 2;
        self.imgNameLbl.clipsToBounds = true
        
        self.nameLbl.text = UserDefaults.standard.string(forKey: "displayName")!
        self.nameLbl.makeLabelFitToContent(labelTitle: nameLbl)
        self.imgNameLbl.text = UserDefaults.standard.string(forKey: "imageName")!
        
        let profileImage = UserDefaults.standard.string(forKey: "profileImage")!
        
        if profileImage == "" {
            print("nothing")
            
            let randomColr = UserDefaults.standard.string(forKey: "randomColour")!
            
            let colorrs = randomColr.components(separatedBy: "-")
            
            let firstColr = colorrs[0]
            let secndColr = colorrs[1]
            
            let newColorLbl = UIColor.colorFrom(hexString: firstColr)
            // let newColorLbl = UIColor(
            
            self.imgNameLbl.borderColor = newColorLbl
            self.imgNameLbl.textColor = newColorLbl
            
            self.imgNameLbl.backgroundColor = UIColor.colorFrom(hexString: secndColr)
            
            self.imgNameLbl.isHidden = false
            self.profileImg.isHidden = true
        }
        else {
            if let decodedImageData = Data(base64Encoded: profileImage ?? "", options: .ignoreUnknownCharacters) {
                let image2 = UIImage(data: decodedImageData)
                if image2 != nil {
                    self.profileImg.isHidden = false
                    self.imgNameLbl.isHidden = true
                    self.profileImg.image = image2
                }
                else if profileImage != nil {
                    
                    let image1 = profileImage.base64ToImage()
                    self.profileImg.isHidden = false
                    self.imgNameLbl.isHidden = true
                    self.profileImg.image = image1
                }
                else {
                    
                    print("nothing")
                }
                
            }
            
        }
        let todaysDate = Date().string(format: "yyyy-MM-dd")
        
        //  let prevMonth = Calendar.current.date(byAdding: .month, value: -6, to: Date())
        //  print(prevMonth)
        let prevMonth = Calendar.current.date(byAdding: .day, value: -10, to: Date())
        let prevWeek = Calendar.current.date(byAdding: .day, value: -6, to: Date())
        
        //from date todays date -7
        let fromDateMonth = prevMonth?.string(format: "yyyy-MM-dd")
        let fromDates = prevWeek?.string(format: "yyyy-MM-dd")
    
        self.fromDateOneValue = fromDateMonth
        self.toDateOneValue = todaysDate
        
        self.fromDateTwoValue = fromDates
        self.toDateTwoValue = todaysDate
        
        
        
        self.fromDateOneField.text = prevMonth?.string(format: "dd/MM/yyyy")
        self.toDateOneField.text = Date().string(format: "dd/MM/yyyy")
        
        self.fromDateTwoField.text = prevWeek?.string(format: "dd/MM/yyyy")
        self.toDateTwoField.text = Date().string(format: "dd/MM/yyyy")
        
        
        self.navigationController?.navigationBar.isHidden = true
        ShowOfferPopUp()
        btn_tip.isHidden = true
        if Connectivity.isConnectedToInternet {
            //   self.showSpinner(onView: self.view)
            print("Connected")
            
             getTipsList()
          //  downloadAccountConfigCountriesRatePattern()
            downloadAccountConfigCountriesWu()
            downloadAccountConfigCountriesBank()
            downloadAccountConfigCountriesFc()
            downloadAccountConfigCountriesVisa()
            
//            DispatchQueue.main.async {
//                self.downloadBarChartData()
//            }
            
            
         //   downloadTransactnFilterDetails()
           
         //   downloadLineChartData()
            // downloadBeneficiary()
            assigingLabels()
            
        } else {
            let alert = UIAlertController(title: "", message: "The Internet connection appears to be offline.", preferredStyle: UIAlertController.Style.alert)
            // add an action (button)
            alert.view.tintColor = ColorCodes.newAppRed
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            // show the alert
            self.present(alert, animated: true, completion: nil)
            // loadTransactionLocalData()
        }
        
    }
    
    func ShowOfferPopUp() {
//        let vc = OfferPopUpController()
//        vc.modalPresentationStyle = .overCurrentContext
//        vc.modalTransitionStyle = .crossDissolve
//        present(vc, animated: true, completion: nil)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
       
        
        Global.shared.timeoUtOrNot = "yes"
        observeTimeout()
        addGuideViews()
    }
    
    func showBiomatricPopUp()
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "BiometricController") as! BiometricController
        self.present(vc, animated: false, completion: nil)
    }
    
    func menuItemsData()  {
        self.removeSpinner()
      //  let titles = [Global.shared.bankTabTxt! ,Global.shared.foreignCurncyTxt!, Global.shared.wuTabTxt!]
        let titles = [Global.shared.transfersTxtTab! ,Global.shared.foreignCurncyTxt!]
        
        self.seg.delegate = self
        self.seg.segmentTitle = titles
    //    self.seg.segmentTitle.adjustsFontSizeToFitWidth = true
        
        self.seg.selectedItemHighlightStyle=XMSelectedItemHighlightStyle.bottomEdge
        self.seg.backgroundColor = UIColor.white
        self.seg.highlightColor = UIColor.red
        // self.seg.tint = ColorCodes.DarkCement
        self.seg.tint = UIColor.gray
        self.seg.highlightTint = UIColor.red
        self.seg.font = UIFont.boldSystemFont(ofSize: 14)
       
        
     //   let font = UIFont.systemFont(ofSize: 16)
    
        firstView.isHidden = false
        secndView.isHidden = true
        thirdView.isHidden = true
        
        self.removeSpinner()
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
                
          /*  case 2:
                
                firstView.isHidden = true
                thirdView.isHidden = true
                secndView.isHidden = false*/
                
            default:
                
                break
            }
        }
    }
    
    func assigingLabels() {
        self.recentTransctnsLbl.text = Global.shared.recentTransctnsLbl
        self.favouriteBeneficiaryLbl.text = Global.shared.favBenfDashboard
        self.transctnInsightsLbl.text = Global.shared.transactnInsight
        self.ratePatternLbl.text = Global.shared.ratePaternDashboard
        self.rateCalcultorLbl.text  = Global.shared.rateCalculatorHeader
        self.welcomeLbl.text = Global.shared.welcomeTxt
        self.removeSpinner()
        
    }
    
    
    func navigateToDiffrentScreenDelegate(toWhichScreenWeAreNaviagting : String)
    {
        print(toWhichScreenWeAreNaviagting)
        
        if toWhichScreenWeAreNaviagting == Global.shared.menuDashboard {
          // same screen
        }
        else{
            MenuScreenShow(screen:toWhichScreenWeAreNaviagting)
        }
        
    }
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        Analytics.logEvent("ios_Dashboard", parameters: nil)
        helpCollectionView.isHidden = true
        
        let remiterStatus = UserDefaults.standard.string(forKey: "remitterStatus")!
        if remiterStatus == "1" {
            print("nothing")
        }
        else {
            let alert = ViewControllerManager.displayAlert(message:  Global.shared.remiterInactiveDashboard, title:APPLICATIONNAME)
            self.present(alert, animated: true, completion: nil)
        }
//        Global.shared.timeoUtOrNot = "yes"
//        observeTimeout()
        menuItemsData()
        // downloadTransactnFilterDetails()
        self.showLoader()
        DispatchQueue.main.async {
            self.getHelpList()
            self.downloadTransactnFilterDetails()
            self.downloadAccountConfigCountriesRatePattern()
            self.downloadBeneficiary()
        }
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if Global.shared.checkOfferPopUp == 1
        {
            if Global.shared.biometricPoup == "true"
            {
                if UserDefaults.exists(key: "biometricEnabled") {
                    if UserDefaults.standard.string(forKey: "biometricEnabled")! == "true" {


                    }

                    else {
                        DispatchQueue.main.asyncAfter(deadline: .now()) {
                            self.showBiomatricPopUp()
                           }
                       

                    }
                }
                else{
                    DispatchQueue.main.asyncAfter(deadline: .now()) {
                        self.showBiomatricPopUp()
                       }
                }

            }
            Global.shared.checkOfferPopUp = 0
        }
        
        if Global.shared.checkBiometric == 1
        {
            self.getHelpList()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
        stopTimer()
    }
    
    @IBAction func setAlertActn(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "RateAlertVc") as! RateAlertVc
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func getTipsList() {
        let paramaterPasing: [String:Any] = [
              "helpTypes": 3,
              "language": LocalizationSystem.sharedInstance.getLanguage(),
              "screen": 1,
              "registrationId": Global.shared.afterLoginRegistrtnId!
            
          ]
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
       // self.showSpinner(onView: self.view)
        NetWorkDataManager.sharedInstance.getHelpAndTips(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            
            if errorString == nil
            {
               print(resonseTal)
                self.removeSpinner()
                if let helpVideoList = resonseTal?.value(forKey: "helpAndTipsResponseList") as? NSArray
                {
                    self.tipsVideoList = helpVideoList as! [[String : Any]]
                    if self.tipsVideoList.count != 0
                    {
                        self.btn_tip.isHidden = false
                    }
                    else
                    {
                        self.btn_tip.isHidden = true
                    }
                    
                    print("helpActionTips",self.helpVideoList)
                        self.removeSpinner()
                    
                }
              
            }
            else
            {
                print(errorString!)
                self.removeSpinner()
                let finalError = errorString?.components(separatedBy: ":")
                if finalError?.count == 2
                {
                   let alert = ViewControllerManager.displayAlert(message: finalError?[1] ?? "", title:APPLICATIONNAME)
                    self.present(alert, animated: true, completion: nil)
                }
                else
                {
                    let alert = ViewControllerManager.displayAlert(message: errorString ?? "", title:APPLICATIONNAME)
                    self.present(alert, animated: true, completion: nil)
                }
                
            }
        }
        
    }
    
    func getHelpList() {
        Global.shared.checkBiometric = 0
        self.helpVideoList.removeAll()
        let paramaterPasing: [String:Any] = [
              "helpTypes": 2,
              "language": LocalizationSystem.sharedInstance.getLanguage(),
              "screen": 0,
              "registrationId": Global.shared.afterLoginRegistrtnId!
            
          ]

        print("token ye hai \(UserDefaults.standard.string(forKey: "token")!)")
        
        let headers: HTTPHeaders = [.authorization(bearerToken: UserDefaults.standard.string(forKey: "token")!)]
       // self.showSpinner(onView: self.view)
        NetWorkDataManager.sharedInstance.getHelpAndTips(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            
            if errorString == nil
            {
               print(resonseTal)
                self.removeSpinner()
                if let helpVideoList = resonseTal?.value(forKey: "helpAndTipsResponseList") as? [[String : Any]]
                {
                
                    var list = helpVideoList
                 //   self.helpVideoList = helpVideoList as! [[String : Any]]
                    var index = 0
                    while index < list.count {
                       print( "Value of index is \(index)")
                        let helpdata = list[index]
                        
                        let screenToNavigate = helpdata["screenToNavigate"] as! Int
                        if screenToNavigate == 7
                        {
                            if UserDefaults.exists(key: "biometricEnabled") {
                                if UserDefaults.standard.string(forKey: "biometricEnabled")! == "true" {
                                    
                                }
                                
                                else {
                                    self.helpVideoList.append(helpdata)
                                    
                                }
                            }
                            else
                            {
                                self.helpVideoList.append(helpdata)
                            }
                        }
                        else{
                            self.helpVideoList.append(helpdata)
                        }
                        
                      index = index + 1
                       
                    }
                    if helpVideoList.count == 0
                    {
                        self.HelpCollectionHeight.constant = 0
                    }
                    else{
                        self.HelpCollectionHeight.constant = 50
                    }
                    print("helpAction",self.helpVideoList)
                    self.helpCollectionView.isHidden = false
                    self.startTimer()
                    self.helpCollectionView.reloadData()
                    self.removeSpinner()
                }
                
              
            }
            else
            {
                print(errorString!)
                self.removeSpinner()
                let finalError = errorString?.components(separatedBy: ":")
                if finalError?.count == 2
                {
                   let alert = ViewControllerManager.displayAlert(message: finalError?[1] ?? "", title:APPLICATIONNAME)
                    self.present(alert, animated: true, completion: nil)
                }
                else
                {
                    let alert = ViewControllerManager.displayAlert(message: errorString ?? "", title:APPLICATIONNAME)
                    self.present(alert, animated: true, completion: nil)
                }
                
            }
        }
        
    }
    var carousalTimer: Timer?
    var newOffsetX: CGFloat = 0.0
      func startTimer() {
        guard carousalTimer == nil else { return }
          
          if carousalTimer == nil {
              carousalTimer = Timer(fire: Date(), interval: 0.015, repeats: true) { (timer) in

                  let initailPoint = CGPoint(x: self.newOffsetX,y :0)

                  if __CGPointEqualToPoint(initailPoint, self.helpCollectionView.contentOffset) {

                      if self.newOffsetX < self.helpCollectionView.contentSize.width {
                          self.newOffsetX += 0.75
                      }
                      if self.newOffsetX > self.helpCollectionView.contentSize.width - self.helpCollectionView.frame.size.width {
                          self.newOffsetX = 0
                      }

                      self.helpCollectionView.contentOffset = CGPoint(x: self.newOffsetX,y :0)

                  } else {
                      self.newOffsetX = self.helpCollectionView.contentOffset.x
                  }
              }

              RunLoop.current.add(carousalTimer!, forMode: .common)
            }
       
        

//        self.removeSpinner()
//          if helpVideoList.count != 0
//          {
//             Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(self.scrollAutomatically), userInfo: nil, repeats: true)
//          }
      }
         var x = 1
          @objc func scrollAutomatically(_ timer1: Timer) {
           
    
             if self.x < self.helpVideoList.count {
                let indexPath = IndexPath(item: x, section: 0)
                self.helpCollectionView.scrollToItem(at: indexPath, at: .left, animated: true)
                self.x = self.x + 1
              }else{
                self.x = 0
                self.helpCollectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .left, animated: true)
              }
          }
    func stopTimer()
    {
        if carousalTimer != nil {
            carousalTimer!.invalidate()
            carousalTimer = nil
        }
    }
    
    @IBAction func obClickTipsBtn(_ sender: Any) {
        if let viewController = self.storyboard?.instantiateViewController(withIdentifier: "ToolTipListController") as? ToolTipListController {
            viewController.helpVideoList = tipsVideoList
            var index = 0
            var height = 0
            while index < tipsVideoList.count {
               print( "Value of index is \(index)")
                if index == 0
                {
                    height = height + 60
                }
                else {
                    height = height + 60
                }
              
               index = index + 1
            }
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
    // Mark: For getting recent 10 transactions
    func downloadTransactnFilterDetails() {
        
        let paramaterPasing: [String:Any] = ["registrationId": UserDefaults.standard.string(forKey: "registrationId")!,
                                             "filterType": 3,
                                             "recordCount": 10,"period": 90]
//        let paramaterPasing: [String:Any] = ["registrationId": UserDefaults.standard.string(forKey: "registrationId")!,
//                                             "filterType": 3,
//                                             "recordCount": 10]
        
        
        /*    let headers: HTTPHeaders = [
         "Content-Type": "application/json"
         ]*/
        
        print("token ye hai \(UserDefaults.standard.string(forKey: "token")!)")
        
        let headers: HTTPHeaders = [.authorization(bearerToken: UserDefaults.standard.string(forKey: "token")!)]
        
        NetWorkDataManager.sharedInstance.benefTransctnFilterImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
           // debugPrint(resonseTal)
            if errorString == nil
            {
                self.transctnResponse.removeAll()
                
                   print(resonseTal!)
                if let transactionHistory = resonseTal?.value(forKey: "transactionHistory") as? NSArray {
                    
                    /*  UserDefaults.standard.set(transactionHistory, forKey: "TransactionHistoryLocal")
                     let tableData  =  UserDefaults.standard.object(forKey: "TransactionHistoryLocal") ?? []
                     print(tableData)*/
                    
                    print(transactionHistory)
                    self.transctnResponse = transactionHistory as! [Any]
                    
                    let newV:[Any] = transactionHistory as! [Any]
                    
                    let transactnData = NSKeyedArchiver.archivedData(withRootObject: newV)
                    UserDefaults.standard.set(transactnData, forKey: "TransactionHistoryLocal")
                    
                }
                if self.transctnResponse.count > 0 {
                    
                    self.noRecrdsFndTxtRecentTnsctns.isHidden = true
                    self.recentTransctnsCollectnView.isHidden = false
                    
                    self.recentTransctnsCollectnView.reloadData()
                }
                else {
                    
                    self.recentTransctnsCollectnView.isHidden = true
                    self.noRecrdsFndTxtRecentTnsctns.isHidden = false
                    //  self.transactionsConstrt.constant = 0
                }
                
                
                //    self.removeSpinner()
                
                //   self.loadPlaces()
                
                let statusMsg = resonseTal?.value(forKey: "statusMessage") as? String
                let statusCode = resonseTal?.value(forKey: "statusCodes") as? Int
                let mesageCode = resonseTal?.value(forKey: "messageCode") as? String ?? statusMsg

                if statusCode ==  400 {
                    if mesageCode == "E110042"
                    {
                        self.showAlert(withTitle: "", withMessage: resonseTal?["statusMessage"] as? String ?? "")

                    }
                    else{
                    let alert = ViewControllerManager.displayAlert(message: statusMsg ?? "", title:APPLICATIONNAME)
                    self.present(alert, animated: true, completion: nil)
                    }
                }
            }
            
            else
            {
                print(errorString!)
                self.removeLoader()
                self.removeSpinner()
                /*  let finalError = errorString?.components(separatedBy: ":")
                 let alert = ViewControllerManager.displayAlert(message: finalError?[1] ?? "", title:APPLICATIONNAME)
                 self.present(alert, animated: true, completion: nil)*/
                Global.shared.methodName = CanvasUrls.benefTransctnFilter
                NetWorkDataManager.sharedInstance.callChannelException()
                if errorString == "Response could not be serialized, input data was nil or zero length." {
                    Global.shared.timeoUtOrNot = "no"
                    self.showAlertForTimer(titulo: "", mensagem: Global.shared.sessionTimedOutTxt, vc: self)
//                    let refreshAlert = UIAlertController(title: "", message: Global.shared.sessionTimedOutTxt, preferredStyle: UIAlertController.Style.alert)
//                    refreshAlert.view.tintColor = ColorCodes.newAppRed
//                    refreshAlert.addAction(UIAlertAction(title: Global.shared.okTxt, style: .default, handler: { (action: UIAlertAction!) in
//                        self.pushViewController(controller: LoginVc.initiateController())
//                    }))
//
//                    self.present(refreshAlert, animated: true, completion: nil)
                }
                
                else {
                    let alert = ViewControllerManager.displayAlert(message: errorString ?? "", title:APPLICATIONNAME)
                    self.present(alert, animated: true, completion: nil)
                }
                
                
                
            }
            
        }
        
    }
    
    func loadTransactionLocalData(){
        let transactnData = UserDefaults.standard.object(forKey: "TransactionHistoryLocal") as? NSData
        
        if let transactnData = transactnData {
            let transctnArray = NSKeyedUnarchiver.unarchiveObject(with: transactnData as Data)
            
            
            
            self.transctnResponse = transctnArray as! [Any]
            self.recentTransctnsCollectnView.reloadData()
            
        }
    }
    
    //Bar chart data
    func downloadBarChartData() {
        
        //month ,year,date
        /*    let todaysDate = Date().string(format: "yyyy-MM-dd")
         print(todaysDate)
         //  let prevMonth = Calendar.current.date(byAdding: .month, value: -6, to: Date())
         //  print(prevMonth)
         let prevWeek = Calendar.current.date(byAdding: .day, value: -6, to: Date())
         print(prevWeek)
         //from date todays date -7
         let fromDates = prevWeek?.string(format: "yyyy-MM-dd")
         print(fromDates)*/
        
        let paramaterPasing: [String:Any] = ["registrationId": UserDefaults.standard.string(forKey: "registrationId")!,
                                             "fromDate": self.fromDateOneValue!,
                                             "toDate": self.toDateOneValue!,
                                             "filterType": 1]
        
        
        /*    let headers: HTTPHeaders = [
         "Content-Type": "application/json"
         ]*/
        let headers: HTTPHeaders = [.authorization(bearerToken: UserDefaults.standard.string(forKey: "token")!)]
        
        NetWorkDataManager.sharedInstance.barChartImplementation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            
            if errorString == nil
            {
                
                  print(resonseTal!)
                if let transactionHistory = resonseTal?.value(forKey: "transactionInsightList") as? NSArray {
                    
                    
                    if let createdMonth = transactionHistory.value(forKey: "createdDate") as? [String] {
                        self.barchartDownNamesAry = createdMonth
                    }
                    for i in 0..<self.barchartDownNamesAry.count {
                        let firstv = self.barchartDownNamesAry[i].components(separatedBy: "-")
                        let dateNew = firstv[2]
                        let dateM = dateNew.components(separatedBy: "T")
                        let dateV = dateM[0]
                        let monthV = firstv[1]
                        
                        let finalTxt = monthV + "-" + dateV
                        self.monthDateNamesAry.append(finalTxt)
                    }
                    
                    if let transactionCount = transactionHistory.value(forKey: "transactionCount") as? [Int] {
                        self.barChartValuesAry = transactionCount
                        //  Global.shared.afterLoginSecurityIdList = transactionCount
                        //     Global.shared.afterLoginSecurityIdListString = //Global.shared.afterLoginSecurityIdList.map(String.init)
                    }
                }
                
                
                
                self.customizeChart(dataPoints: self.barchartDownNamesAry, valuesY: self.barChartValuesAry.map{ Double($0) })
            }
            
            else
            {
                print(errorString!)
                self.removeSpinner()
                NetWorkDataManager.sharedInstance.callChannelException()
                let finalError = errorString?.components(separatedBy: ":")
                if finalError?.count == 2
                {
                let alert = ViewControllerManager.displayAlert(message: finalError?[1] ?? "", title:APPLICATIONNAME)
                self.present(alert, animated: true, completion: nil)
                }
                else
                {
                    let alert = ViewControllerManager.displayAlert(message: finalError?[0] ?? "", title:APPLICATIONNAME)
                    self.present(alert, animated: true, completion: nil)
                }
                
            }
        }
        
    }
    
    // Mark: For getting line chart data
    func downloadLineChartData() {
        
        
        
        
        //month ,year,date
        /*    let todaysDate = Date().string(format: "yyyy-MM-dd")
         print(todaysDate)
         let prevWeek = Calendar.current.date(byAdding: .day, value: -6, to: Date())
         print(prevWeek)
         let fromDates = prevWeek?.string(format: "yyyy-MM-dd")
         print(fromDates)
         
         let newFromDate = "2019-12-13"*/
        
        let paramaterPasing: [String:Any] = ["targetCurrenyCode": ratePaternCurncyCode,
                                             "fromDate": self.fromDateTwoValue!,
                                             "toDate": self.toDateTwoValue!]
        
        /*
         let headers: HTTPHeaders = [
         "Content-Type": "application/json"
         ]*/
        
        let headers: HTTPHeaders = [.authorization(bearerToken: UserDefaults.standard.string(forKey: "token")!)]
        
        NetWorkDataManager.sharedInstance.lineChartImplementation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            
            if errorString == nil
            {
                  // print(resonseTal)
                self.lineChartValuesAry.removeAll()
                self.lineChartNamesAry.removeAll()
                self.linechartDownNamesAry.removeAll()
                
                if let ratePatternList = resonseTal?.value(forKey: "ratePatternList") as? NSArray {
                    print(ratePatternList)
                    
                    //   if let createdDate = ratePatternList.value(forKey: "createdDate") as? [String] {
                    
                    if let createdMonth = ratePatternList.value(forKey: "createdDate") as? [String] {
                        self.linechartDownNamesAry = createdMonth
                    }
                    for i in 0..<self.linechartDownNamesAry.count {
                      //  let dateIS = self.convertDateFormater(self.linechartDownNamesAry[i])
                      //  print(dateIS)
//                       let first = self.linechartDownNamesAry[i].components(separatedBy: "T")
//                        let date = self.convertDateFormater(first[0])
//                        print(date)
                        let firstv = self.linechartDownNamesAry[i].components(separatedBy: "-")
                        let dateNew = firstv[2]
                        let dateM = dateNew.components(separatedBy: "T")
                        let dateV = dateM[0]
                        let monthV = firstv[1]
                        
                        let finalTxt = monthV + "-" + dateV
                        self.lineChartNamesAry.append(finalTxt)
                    }
                    
                    if let amount = ratePatternList.value(forKey: "amount") as? [Double] {
                     
                        self.lineChartValuesAry = amount
                    }
                    
                    
                    //   setChart()
                 //   self.customizeChart2(dataPoints: self.lineChartNamesAry, valuesY: self.lineChartValuesAry.map{ (Double($0) ) })
                    self.customizeChart2(dataPoints: self.lineChartNamesAry, valuesY: self.lineChartValuesAry)
                }
                if self.lineChartValuesAry.count < 1 {
                    self.ratePaternImg.isHidden = false
                    self.lineChartVieww.isHidden = true
                }
                else {
                    self.ratePaternImg.isHidden = true
                    self.lineChartVieww.isHidden = false
                }
            }
            
            else
            {
                print(errorString!)
                self.removeSpinner()
                Global.shared.methodName = CanvasUrls.lineChartData
                NetWorkDataManager.sharedInstance.callChannelException()
                let finalError = errorString?.components(separatedBy: ":")
                if finalError?.count == 2
                {
                let alert = ViewControllerManager.displayAlert(message: finalError?[1] ?? "", title:APPLICATIONNAME)
                self.present(alert, animated: true, completion: nil)
                }
                else
                {
                    let alert = ViewControllerManager.displayAlert(message: finalError?[0] ?? "", title:APPLICATIONNAME)
                    self.present(alert, animated: true, completion: nil)
                }
//                let alert = ViewControllerManager.displayAlert(message: finalError?[1] ?? "", title:APPLICATIONNAME)
//                self.present(alert, animated: true, completion: nil)
                
            }
        }
        
    }
    
    func convertDateFormater(_ date: String) -> String
        {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            let date1 = dateFormatter.date(from: date)
            dateFormatter.dateFormat = "yyyy-MMM-dd"
            return  dateFormatter.string(from: date1!)

        }
    
    // Mark: Assigning bar chart values accordingly
    func customizeChart(dataPoints: [String], valuesY: [Double]) {
        // TO-DO: customize the chart here
        print(dataPoints.count)
        var dataEntries: [BarChartDataEntry] = []
        for i in 0..<dataPoints.count {
            //   let dataEntry = BarChartDataEntry(x: Double(valuesX[i]), y: Double(valuesY[i]))
            let dataEntry = BarChartDataEntry(x: Double(i), y: Double(valuesY[i]), data: dataPoints)
            dataEntries.append(dataEntry)
            
        }
        
        
        
        let chartDataSet = BarChartDataSet(dataEntries)
        let chartData = BarChartData(dataSet: chartDataSet)
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .none
        formatter.maximumFractionDigits = 0
        formatter.multiplier = 1.0
        let format = DefaultValueFormatter(formatter: formatter)
        //  chartData.colors = .init(arrayLiteral: .red)
        chartDataSet.colors = .init(arrayLiteral: .red)
        chartData.setValueFormatter(format)
        
        //   barChartVieww.rightAxis.enabled = false
        
        
        //  let months = [ "Oct", "Nov"]
        
        barChartVieww.xAxis.valueFormatter = IndexAxisValueFormatter(values:self.monthDateNamesAry)
        
        
        //   barChartVieww.xAxis.granularity = 1
        
        //   barChartVieww.xAxis.drawAxisLineEnabled = false
        //   barChartVieww.xAxis.drawGridLinesEnabled = false
        
        
        
        // X axis configurations
        barChartVieww.xAxis.granularityEnabled = true
        barChartVieww.xAxis.granularity = 1
        
        barChartVieww.xAxis.drawAxisLineEnabled = false
        barChartVieww.xAxis.drawGridLinesEnabled = false
        // barChartVieww.xAxis.labelFont = UIFont.systemFont(ofSize: 15.0)
        barChartVieww.xAxis.labelTextColor = UIColor.black
        barChartVieww.xAxis.labelPosition = .bottom
        
        
        // barChartVieww.leftAxis
        // Right axis configurations
        barChartVieww.rightAxis.drawAxisLineEnabled = false
        barChartVieww.rightAxis.drawGridLinesEnabled = false
        barChartVieww.rightAxis.drawLabelsEnabled = false
        
        
        barChartVieww.leftAxis.drawAxisLineEnabled = false
        barChartVieww.leftAxis.drawGridLinesEnabled = false
        //   barChartVieww.leftAxis.drawLabelsEnabled = false
        barChartVieww.legend.enabled = false
        
        
        /*  let chartDataSet = BarChartDataSet(entries: dataEntries, label: nil)
         chartDataSet.colors = .init(arrayLiteral: .red)
         // chartDataSet.colors = [.orange, .orange, .orange, .orange, .orange, .orange]
         let chartData = BarChartData(dataSet: chartDataSet)*/
        barChartVieww.data = chartData
        
    }
    
    // Mark: For assigning line chart values
    func customizeChart2(dataPoints: [String], valuesY: [Double]) {
        var chartdataEntries: [ChartDataEntry] = []
        
        if dataPoints.count <= valuesY.count
        {
            for i in 0..<dataPoints.count {
                // let chartdataEntry = ChartDataEntry(x: values[i], y: Double(i))
               let chartdataEntry = ChartDataEntry(x: Double(i), y: Double(valuesY[i]), data: dataPoints)
               
                    chartdataEntries.append(chartdataEntry)
               
            }
            
        }
        else{
            
            for i in 0..<valuesY.count {
                // let chartdataEntry = ChartDataEntry(x: values[i], y: Double(i))
               let chartdataEntry = ChartDataEntry(x: Double(i), y: Double(valuesY[i]), data: dataPoints)
               
                    chartdataEntries.append(chartdataEntry)
               
            }
            
        }
     
   
        lineChartVieww.xAxis.valueFormatter = IndexAxisValueFormatter(values:self.lineChartNamesAry)
        lineChartVieww.xAxis.granularityEnabled = true
        lineChartVieww.xAxis.granularity = 1
        lineChartVieww.xAxis.drawAxisLineEnabled = false
        lineChartVieww.xAxis.drawGridLinesEnabled = false
        // barChartVieww.xAxis.labelFont = UIFont.systemFont(ofSize: 15.0)
        lineChartVieww.xAxis.labelTextColor = UIColor.black
        lineChartVieww.xAxis.labelPosition = .bottom
        
        // Right axis configurations
        lineChartVieww.rightAxis.drawAxisLineEnabled = false
        lineChartVieww.rightAxis.drawGridLinesEnabled = false
        lineChartVieww.rightAxis.drawLabelsEnabled = false
        lineChartVieww.legend.enabled = false
        
        lineChartVieww.leftAxis.drawAxisLineEnabled = false
        lineChartVieww.leftAxis.drawGridLinesEnabled = false
        
        let lineChartDataSet = LineChartDataSet(entries: chartdataEntries, label: "")
        lineChartDataSet.colors = .init(arrayLiteral: .red)
        lineChartDataSet.valueFormatter = DefaultValueFormatter(decimals: 3)
        let lineChartData = LineChartData(dataSet: lineChartDataSet)
        lineChartVieww.data = lineChartData
    
    }
    
    
    // Mark: Downloading beneficiaries for getting favourites
    func downloadBeneficiary() {
        
        // self.beneficaryFilteredResponse.removeAll()
        
        let paramaterPasing: [String:Any] = ["registrationId": Global.shared.afterLoginRegistrtnId ?? "",
                                             "status": 0, "disbursalMode": "", "requestType": 1]
        
        
        /* let headers: HTTPHeaders = [
         "Content-Type": "application/json"
         ]*/
        print(UserDefaults.standard.string(forKey: "token")!)
        let headers: HTTPHeaders = [.authorization(bearerToken: UserDefaults.standard.string(forKey: "token")!)]
        
        NetWorkDataManager.sharedInstance.benefGetListImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
           // debugPrint(resonseTal)
            if errorString == nil
            {
                
                self.removeLoader()
                self.removeSpinner()
                self.beneficaryFilteredResponse.removeAll()
                 print(resonseTal!)
                if let faqList = resonseTal?.value(forKey: "beneficiariesResponseList") as? NSArray {
                    
                    self.beneficiaryResponse = faqList as! [Any]
                    for i in 0 ..< self.beneficiaryResponse.count {
                        
                        let eachObj = self.beneficiaryResponse[i] as?NSDictionary
                        
                        if let beneficiaryType = eachObj?.value(forKey: "beneficiaryType") as?Int
                        {
                            if (beneficiaryType == 100 || beneficiaryType == 101 || beneficiaryType == 102 || beneficiaryType == 103)
                            {
                                // if let dataDict = eachObj {
                                self.beneficaryFilteredResponse.append(eachObj!)
                                
                                
                                if self.beneficaryFilteredResponse.count < 1 {
                                    self.favBenefCollectnView.isHidden = true
                                    self.noRecrdsFavBenefTxt.isHidden = false
                                }
                                else {
                                    self.noRecrdsFavBenefTxt.isHidden = true
                                    self.favBenefCollectnView.isHidden = false
                                    
                                }
                                
                                //  }
                            }
                            
                        }
                        
                    }
                }
                
                let statusMsg = resonseTal?.value(forKey: "statusMessage") as? String
                let statusCode = resonseTal?.value(forKey: "statusCodes") as? Int
                let mesageCode = resonseTal?.value(forKey: "messageCode") as? String ?? statusMsg

                if statusCode ==  400 {
                    if mesageCode == "E110042"
                    {
                        self.showAlert(withTitle: "", withMessage: resonseTal?["statusMessage"] as? String ?? "")

                    }
                    else if mesageCode == "R111"
                    {
                        let alert = ViewControllerManager.displayAlert(message: Global.shared.messageCodeType(text: "R115"), title:APPLICATIONNAME)
                        self.present(alert, animated: true, completion: nil)
                    }
                    else{
                    let alert = ViewControllerManager.displayAlert(message: statusMsg ?? "", title:APPLICATIONNAME)
                    self.present(alert, animated: true, completion: nil)
                    }
                }
                
                self.favBenefCollectnView.reloadData()
                self.removeSpinner()
                
            }
            
            else
            {
                print(errorString!)
                self.removeLoader()
                self.removeSpinner()
                /*  let finalError = errorString?.components(separatedBy: ":")
                 let alert = ViewControllerManager.displayAlert(message: finalError?[1] ?? "", title:APPLICATIONNAME)
                 self.present(alert, animated: true, completion: nil)*/
                if errorString == "Response could not be serialized, input data was nil or zero length." {
                    Global.shared.timeoUtOrNot = "no"
                    self.showAlertForTimer(titulo: "", mensagem: Global.shared.sessionTimedOutTxt, vc: self)
//                    let refreshAlert = UIAlertController(title: "", message: Global.shared.sessionTimedOutTxt, preferredStyle: UIAlertController.Style.alert)
//                    refreshAlert.view.tintColor = ColorCodes.newAppRed
//                    refreshAlert.addAction(UIAlertAction(title: Global.shared.okTxt, style: .default, handler: { (action: UIAlertAction!) in
//                        self.pushViewController(controller: LoginVc.initiateController())
//                    }))
//
//                    self.present(refreshAlert, animated: true, completion: nil)
                }
                
                else {
                    let alert = ViewControllerManager.displayAlert(message: errorString ?? "", title:APPLICATIONNAME)
                    self.present(alert, animated: true, completion: nil)
                }
                Global.shared.methodName = CanvasUrls.getBeneficiaries
                NetWorkDataManager.sharedInstance.callChannelException()
                
                
            }
        }
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // return self.transctnResponse.count
        
        
        var count:Int?
        if collectionView == self.recentTransctnsCollectnView {
            return self.transctnResponse.count
        }
        if collectionView == self.favBenefCollectnView {
            return self.beneficaryFilteredResponse.count
        }
        if collectionView == self.helpCollectionView {
            return self.helpVideoList.count
        }
        return count!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        
        
        var cell:UICollectionViewCell?
        
        if  collectionView == self.recentTransctnsCollectnView {
            let cell = recentTransctnsCollectnView.dequeueReusableCell(withReuseIdentifier: "HomeRecentTransactionsCell", for: indexPath) as! HomeRecentTransactionsCell
            if LocalizationSystem.sharedInstance.getLanguage() == "ar" {
                cell.centerConstraint.constant = 25
            }
            else{
                cell.centerConstraint.constant = -15
            }
            cell.contentView.layer.cornerRadius = 2.0
            cell.contentView.layer.borderWidth = 0.5
            cell.contentView.layer.borderColor = UIColor.lightGray.cgColor
            cell.contentView.layer.masksToBounds = true
            
            cell.layer.backgroundColor = UIColor.white.cgColor
            cell.layer.shadowColor = UIColor.gray.cgColor
            cell.layer.shadowOffset = CGSize(width: 3.0, height: 3.0)//CGSizeMake(0, 2.0);
            cell.layer.shadowRadius = 2.0
            cell.layer.shadowOpacity = 0.2
            cell.layer.masksToBounds = false
            cell.layer.shadowPath = UIBezierPath(roundedRect:cell.bounds, cornerRadius:cell.contentView.layer.cornerRadius).cgPath
            
            let eachObj = self.transctnResponse[indexPath.row] as?NSDictionary
            
            //    cell.quickSendBtnOtlt.setTitle(Global.shared.transactionsQuickSend, for: .normal)
            
            //   cell.benIdField.text = String(eachObj?.value(forKey: "beneficiaryId") as? Int ?? 0)
            cell.imgNameLbl.layer.cornerRadius = cell.imgNameLbl.frame.size.width / 2;
            cell.imgNameLbl.clipsToBounds = true
            
            let randomColr = eachObj?.value(forKey: "randomColour") as? String ?? "#9df4c2-#e6fcf0"
            
            let colorrs = randomColr.components(separatedBy: "-")
            
            let firstColr = colorrs[0]
            let secndColr = colorrs[1]
            
            let newColorLbl = UIColor.colorFrom(hexString: firstColr)
            // let newColorLbl = UIColor(
            
            cell.imgNameLbl.borderColor = newColorLbl
            cell.imgNameLbl.textColor = newColorLbl
            cell.imgePic.borderColor = newColorLbl
            
            cell.imgNameLbl.backgroundColor = UIColor.colorFrom(hexString: secndColr)
            
            cell.imgePic.layer.cornerRadius = cell.imgePic.frame.size.width / 2;
            cell.imgePic.clipsToBounds = true
            cell.imgNameLbl.text = eachObj?.value(forKey: "imageName") as? String ?? ""
            // cell.imgePic.borderColor = .random()
            //   cell.imgePic.borderColor = newColorLbl
            
            
            
            let firstNameTxt  = eachObj?.value(forKey: "beneficiaryFirstName") as? String ?? ""
            let middleNameTxt  = eachObj?.value(forKey: "beneficiaryMiddleName") as? String ?? ""
            let lastNameTxt  = eachObj?.value(forKey: "beneficiaryLastName") as? String ?? ""
            
            cell.nameLbl.text = firstNameTxt + " " + middleNameTxt + " " + lastNameTxt
            cell.bankOrWuLbl.text = eachObj?.value(forKey: "beneficiaryTypeName") as? String ?? ""
            
            let curencyName = eachObj?.value(forKey: "sourceCurrenyCode") as? String ?? ""
            
            var newCurencyData = "10"
            if let value = eachObj?["totalLCAmount"] as? Int {
                newCurencyData = String(value)
            }else if let value = eachObj?["totalLCAmount"] as? String {
                newCurencyData = value
            }
            else if let value = eachObj?["totalLCAmount"] as? Double {
                newCurencyData = String(value)
            }
          //  let statuNamee = eachObj?.value(forKey: "statusName") as? String ?? ""
            
            let finalCurency = newCurencyData + " " + curencyName
            
            let statusType = eachObj?.value(forKey: "status") as? Int ?? 0
            let retailType = eachObj?.value(forKey: "isRetail") as? Bool ?? false
            
           
            
            //pending
            if statusType == 0 {
                cell.repeatBtnOtlt.setTitle(Global.shared.pendingTxt, for: .normal)
                cell.repeatBtnOtlt.setTitleColor(ColorCodes.newAppGray, for: .normal)
                
            }
            
            //failed
            else if statusType == 2 {
                cell.repeatBtnOtlt.setTitle(Global.shared.failedTxt, for: .normal)
                cell.repeatBtnOtlt.setTitleColor(ColorCodes.newAppGray, for: .normal)
            }
            
            //sucess
            else if statusType == 1 {
                cell.repeatBtnOtlt.setTitle(Global.shared.repeatTxt, for: .normal)
                cell.repeatBtnOtlt.setTitleColor(ColorCodes.newAppRed, for: .normal)
            }
            //cancelled
            else if statusType == 3 {
                cell.repeatBtnOtlt.setTitle(Global.shared.cancelleddTxt, for: .normal)
                cell.repeatBtnOtlt.setTitleColor(ColorCodes.newAppGray, for: .normal)
            }
            if retailType  == true {
                cell.repeatBtnOtlt.setTitleColor(ColorCodes.newAppGray, for: .normal)
            }
            
            
            //   let finalCurency = String(eachObj?.value(forKey: "totalLCAmount") as? Int ?? 10) + " " + curencyName
           
            
            cell.currencyLbl.text = finalCurency
            cell.viewStatusBtnOtlt.params["txnNo"] = eachObj?.value(forKey: "txnRefNo")
            
       
            cell.viewStatusBtnOtlt.tag = indexPath.row
            cell.viewStatusBtnOtlt.setTitle(Global.shared.tviewStatus, for: .normal)
            cell.viewStatusBtnOtlt.addTarget(self, action:  #selector(TransStatusActn(sender:)), for: .touchUpInside)
            
           
            
            
            cell.repeatBtnOtlt.addTarget(self, action: #selector(quickSendActnn(sender:)), for: .touchUpInside)
            cell.repeatBtnOtlt.params["beneficiaryType"] = eachObj?.value(forKey: "beneficiaryType") as? Int ?? 0
            cell.repeatBtnOtlt.params["beneficiaryId"] = eachObj?.value(forKey: "beneficiaryId") as? Int ?? 0
            cell.repeatBtnOtlt.params["status"] = eachObj?.value(forKey: "status") as? Int ?? 0
            cell.repeatBtnOtlt.params["isDisable"] = eachObj?.value(forKey: "isDisable") as? Bool ?? false
            
            cell.repeatBtnOtlt.params["lcAmount"] = eachObj?.value(forKey: "lcAmount") as? String ?? "0.0"
            cell.repeatBtnOtlt.params["isRetail"] = eachObj?.value(forKey: "isRetail") as? Bool ?? false
            
            
            return cell
        }
        if  collectionView == self.favBenefCollectnView {
            let cell = favBenefCollectnView.dequeueReusableCell(withReuseIdentifier: "HomeBenFavCollctnCell", for: indexPath) as! HomeBenFavCollctnCell
            let eachObj = self.beneficaryFilteredResponse[indexPath.row] as?NSDictionary
            
            cell.contentView.layer.cornerRadius = 2.0
            cell.contentView.layer.borderWidth = 0.5
            cell.contentView.layer.borderColor = UIColor.lightGray.cgColor
            cell.contentView.layer.masksToBounds = true
            
            cell.layer.backgroundColor = UIColor.white.cgColor
            cell.layer.shadowColor = UIColor.gray.cgColor
            cell.layer.shadowOffset = CGSize(width: 3.0, height: 3.0)//CGSizeMake(0, 2.0);
            cell.layer.shadowRadius = 2.0
            cell.layer.shadowOpacity = 0.2
            cell.layer.masksToBounds = false
            cell.layer.shadowPath = UIBezierPath(roundedRect:cell.bounds, cornerRadius:cell.contentView.layer.cornerRadius).cgPath
            
            
            cell.beneficiaryId = eachObj?.value(forKey: "beneficiaryId") as? Int ?? 0
            
            cell.imgNameLbl.layer.cornerRadius = cell.imgNameLbl.frame.size.width / 2;
            cell.imgNameLbl.clipsToBounds = true
            
            let randomColr = eachObj?.value(forKey: "randomColour") as? String ?? "#9df4c2-#e6fcf0"
            
            let colorrs = randomColr.components(separatedBy: "-")
            
            let firstColr = colorrs[0]
            let secndColr = colorrs[1]
            
            let newColorLbl = UIColor.colorFrom(hexString: firstColr)
            // let newColorLbl = UIColor(
            
            cell.imgNameLbl.borderColor = newColorLbl
            cell.imgNameLbl.textColor = newColorLbl
            cell.imgBenef.borderColor = newColorLbl
            
            cell.imgNameLbl.backgroundColor = UIColor.colorFrom(hexString: secndColr)
            
            
            /*       let newColorLbl = UIColor.random()
             
             
             
             cell.imgNameLbl.borderColor = newColorLbl
             cell.imgNameLbl.textColor = newColorLbl
             cell.imgBenef.borderColor = newColorLbl*/
            
            cell.imgBenef.layer.cornerRadius = cell.imgBenef.frame.size.width / 2;
            cell.imgBenef.clipsToBounds = true
            
            
            let profileImage = eachObj?.value(forKey: "beneficiaryImage") as? String
            if profileImage == "" {
                
                
                cell.imgNameLbl.isHidden = false
                cell.imgNameLbl.text = eachObj?.value(forKey: "imageName") as? String ?? ""
                
                cell.imgBenef.isHidden = true
            }
            else if let decodedImageData = Data(base64Encoded: profileImage ?? "", options: .ignoreUnknownCharacters) {
                let image2 = UIImage(data: decodedImageData)
                if image2 != nil {
                    cell.imgBenef.image = image2
                    cell.imgNameLbl.isHidden = true
                }
                else if profileImage != nil {
                    let image1 = profileImage?.base64ToImage()
                    cell.imgBenef.image = image1
                    cell.imgNameLbl.isHidden = true
                }
                else {
                    
                    
                    cell.imgNameLbl.isHidden = false
                    cell.imgNameLbl.text = eachObj?.value(forKey: "imageName") as? String ?? ""
                    
                    cell.imgBenef.isHidden = true
                    
                }
                
            }
            
            
            cell.cardNumber = eachObj?.value(forKey: "cardNumber") as? String ?? ""
            cell.beneficiaryType = eachObj?.value(forKey: "beneficiaryType") as? Int ?? 0
            
            let firstNameTxt  = eachObj?.value(forKey: "firstName") as? String ?? ""
            let middleNameTxt  = eachObj?.value(forKey: "middleName") as? String ?? ""
            let lastNameTxt  = eachObj?.value(forKey: "lastName") as? String ?? ""
            cell.nameLbl.text = firstNameTxt + " " + middleNameTxt + " " + lastNameTxt
            let cardNumber = eachObj?.value(forKey: "cardNumber") as? String ?? ""
            let acntNumbr = eachObj?.value(forKey: "accountNumber") as? String ?? ""
            let curencyTxt = eachObj?.value(forKey: "currency") as? String ?? ""
            cell.currencyLbl.text = acntNumbr + "\n" + curencyTxt
           // cell.bankLbl.text = eachObj?.value(forKey: "bankName") as? String ?? ""
            let benefTypeName = eachObj?.value(forKey: "beneficiaryTypeName") as? String ?? ""
            cell.bankLbl.text = eachObj?.value(forKey: "bankName") as? String ?? benefTypeName
            
            if cell.beneficiaryType == 103
            {
                cell.bankLbl.text = eachObj?.value(forKey: "bankName") as? String ?? Global.shared.VisaDirect
                cell.currencyLbl.text = cardNumber + "\n" + curencyTxt
            }
        
            
            cell.abaRouteCode = eachObj?.value(forKey: "abaRouteCode") as? String ?? ""
            cell.accountNumber = eachObj?.value(forKey: "accountNumber") as? String ?? ""
            cell.address1 = eachObj?.value(forKey: "address1") as? String ?? ""
            cell.address2 = eachObj?.value(forKey: "address2") as? String ?? ""
            cell.agentID = eachObj?.value(forKey: "agentID") as? String ?? ""
            cell.agentName = eachObj?.value(forKey: "agentName") as? String ?? ""
            cell.bankCode = eachObj?.value(forKey: "bankCode") as? String ?? ""
            cell.bankName = eachObj?.value(forKey: "bankName") as? String ?? ""
            cell.benID = eachObj?.value(forKey: "benID") as? String ?? ""
            cell.beneficiaryId = eachObj?.value(forKey: "beneficiaryId") as? Int ?? 0
            cell.beneficiaryType = eachObj?.value(forKey: "beneficiaryType") as? Int ?? 0
            cell.branchAddress1 = eachObj?.value(forKey: "branchAddress1") as? String ?? ""
            cell.branchAddress2 = eachObj?.value(forKey: "branchAddress2") as? String ?? ""
            cell.branchCity = eachObj?.value(forKey: "branchCity") as? String ?? ""
            cell.branchCode = eachObj?.value(forKey: "branchCode") as? String ?? ""
            cell.branchName = eachObj?.value(forKey: "branchName") as? String ?? ""
            cell.branchState = eachObj?.value(forKey: "branchState") as? String ?? ""
            cell.city = eachObj?.value(forKey: "city") as? String ?? ""
            cell.cnicno = eachObj?.value(forKey: "cnicno") as? String ?? ""
            cell.country = eachObj?.value(forKey: "country") as? String ?? ""
            cell.currency = eachObj?.value(forKey: "currency") as? String ?? ""
            cell.defaultPurposeCode = eachObj?.value(forKey: "defaultPurposeCode") as? String ?? ""
            cell.defaultPurposeName = eachObj?.value(forKey: "defaultPurposeName") as? String ?? ""
            cell.disbursalMode = eachObj?.value(forKey: "disbursalMode") as? String ?? ""
            cell.disbursalModeName = eachObj?.value(forKey: "disbursalModeName") as? String ?? ""
            cell.fcMaxAmount = eachObj?.value(forKey: "fcMaxAmount") as? String ?? ""
            cell.fcMinAmount = eachObj?.value(forKey: "fcMinAmount") as? String ?? ""
            cell.firstName = eachObj?.value(forKey: "firstName") as? String ?? ""
            cell.ibanCode = eachObj?.value(forKey: "ibanCode") as? String ?? ""
            cell.ifscCode = eachObj?.value(forKey: "ifscCode") as? String ?? ""
            cell.lastName = eachObj?.value(forKey: "lastName") as? String ?? ""
            cell.middleName = eachObj?.value(forKey: "middleName") as? String ?? ""
            cell.mobile = eachObj?.value(forKey: "mobileNo") as? String ?? ""
            cell.nationality = eachObj?.value(forKey: "nationality") as? String ?? ""
            cell.postCode = eachObj?.value(forKey: "postCode") as? String ?? ""
            cell.referenceId = eachObj?.value(forKey: "referenceId") as? String ?? ""
            cell.remID = eachObj?.value(forKey: "remID") as? String ?? ""
            cell.remarks = eachObj?.value(forKey: "remarks") as? String ?? ""
            cell.sourceOfIncome = eachObj?.value(forKey: "sourceOfIncome") as? String ?? ""
            cell.state = eachObj?.value(forKey: "state") as? String ?? ""
            cell.swiftCode = eachObj?.value(forKey: "swiftCode") as? String ?? ""
            cell.telePhone = eachObj?.value(forKey: "telePhone") as? String ?? ""
            cell.txnRef = eachObj?.value(forKey: "txnRef") as? String ?? ""
            
            
            cell.edittBtnOtlt.addTarget(self, action: #selector(editBtnnActnn(sender:)), for: .touchUpInside)
            cell.edittBtnOtlt.params["beneficiaryId"] = eachObj?.value(forKey: "beneficiaryId") as? Int ?? 0
            
            cell.edittBtnOtlt.params["isDisable"] =  eachObj?.value(forKey: "isDisable") as? Bool ?? false
            
            cell.edittBtnOtlt.params["firstName"] = eachObj?.value(forKey: "firstName") as? String ?? ""
            cell.edittBtnOtlt.params["currency"] = eachObj?.value(forKey: "currency") as? String ?? ""
            cell.edittBtnOtlt.params["bankName"] = eachObj?.value(forKey: "bankName") as? String ?? ""
            
            
            cell.edittBtnOtlt.params["abaRouteCode"] = eachObj?.value(forKey: "abaRouteCode") as? String ?? ""
            cell.edittBtnOtlt.params["accountNumber"] = eachObj?.value(forKey: "accountNumber") as? String ?? ""
            cell.edittBtnOtlt.params["address1"] = eachObj?.value(forKey: "address1") as? String ?? ""
            cell.edittBtnOtlt.params["address2"] = eachObj?.value(forKey: "address2") as? String ?? ""
            cell.edittBtnOtlt.params["agentID"] = eachObj?.value(forKey: "agentID") as? String ?? ""
            cell.edittBtnOtlt.params["agentName"] = eachObj?.value(forKey: "agentName") as? String ?? ""
            cell.edittBtnOtlt.params["bankCode"] = eachObj?.value(forKey: "bankCode") as? String ?? ""
            cell.edittBtnOtlt.params["bankName"] = eachObj?.value(forKey: "bankName") as? String ?? ""
            cell.edittBtnOtlt.params["benID"] = eachObj?.value(forKey: "benID") as? String ?? ""
            
            cell.edittBtnOtlt.params["beneficiaryType"] = eachObj?.value(forKey: "beneficiaryType") as? Int ?? 0
            cell.edittBtnOtlt.params["branchAddress1"] = eachObj?.value(forKey: "branchAddress1") as? String ?? ""
            cell.edittBtnOtlt.params["branchAddress2"] = eachObj?.value(forKey: "branchAddress2") as? String ?? ""
            cell.edittBtnOtlt.params["branchCity"] = eachObj?.value(forKey: "branchCity") as? String ?? ""
            cell.edittBtnOtlt.params["branchCode"] = eachObj?.value(forKey: "branchCode") as? String ?? ""
            cell.edittBtnOtlt.params["branchName"] = eachObj?.value(forKey: "branchName") as? String ?? ""
            cell.edittBtnOtlt.params["branchState"] = eachObj?.value(forKey: "branchState") as? String ?? ""
            cell.edittBtnOtlt.params["city"] = eachObj?.value(forKey: "city") as? String ?? ""
            cell.edittBtnOtlt.params["cnicno"] = eachObj?.value(forKey: "cnicno") as? String ?? ""
            cell.edittBtnOtlt.params["country"] = eachObj?.value(forKey: "country") as? String ?? ""
            cell.edittBtnOtlt.params["currency"] = eachObj?.value(forKey: "currency") as? String ?? ""
            cell.edittBtnOtlt.params["defaultPurposeCode"] = eachObj?.value(forKey: "defaultPurposeCode") as? String ?? ""
            cell.edittBtnOtlt.params["defaultPurposeName"] = eachObj?.value(forKey: "defaultPurposeName") as? String ?? ""
            cell.edittBtnOtlt.params["disbursalMode"] = eachObj?.value(forKey: "disbursalMode") as? String ?? ""
            cell.edittBtnOtlt.params["disbursalModeName"] = eachObj?.value(forKey: "disbursalModeName") as? String ?? ""
            cell.edittBtnOtlt.params["fcMaxAmount"] = eachObj?.value(forKey: "fcMaxAmount") as? String ?? ""
            cell.edittBtnOtlt.params["fcMinAmount"] = eachObj?.value(forKey: "fcMinAmount") as? String ?? ""
            cell.edittBtnOtlt.params["firstName"] = eachObj?.value(forKey: "firstName") as? String ?? ""
            cell.edittBtnOtlt.params["ibanCode"] = eachObj?.value(forKey: "ibanCode") as? String ?? ""
            cell.edittBtnOtlt.params["ifscCode"] = eachObj?.value(forKey: "ifscCode") as? String ?? ""
            cell.edittBtnOtlt.params["lastName"] = eachObj?.value(forKey: "lastName") as? String ?? ""
            cell.edittBtnOtlt.params["middleName"] = eachObj?.value(forKey: "middleName") as? String ?? ""
            cell.edittBtnOtlt.params["mobileNo"] = eachObj?.value(forKey: "mobileNo") as? String ?? ""
            cell.edittBtnOtlt.params["nationality"] = eachObj?.value(forKey: "nationality") as? String ?? ""
            cell.edittBtnOtlt.params["postCode"] = eachObj?.value(forKey: "postCode") as? String ?? ""
            cell.edittBtnOtlt.params["referenceId"] = eachObj?.value(forKey: "referenceId") as? String ?? ""
            cell.edittBtnOtlt.params["remID"] = eachObj?.value(forKey: "remID") as? String ?? ""
            cell.edittBtnOtlt.params["remarks"] = eachObj?.value(forKey: "remarks") as? String ?? ""
            cell.edittBtnOtlt.params["sourceOfIncome"] = eachObj?.value(forKey: "sourceOfIncome") as? String ?? ""
            cell.edittBtnOtlt.params["state"] = eachObj?.value(forKey: "state") as? String ?? ""
            cell.edittBtnOtlt.params["swiftCode"] = eachObj?.value(forKey: "swiftCode") as? String ?? ""
            cell.edittBtnOtlt.params["telePhone"] = eachObj?.value(forKey: "telePhone") as? String ?? ""
            cell.edittBtnOtlt.params["txnRef"] = eachObj?.value(forKey: "txnRef") as? String ?? ""
            cell.edittBtnOtlt.params["cardNumber"] = eachObj?.value(forKey: "cardNumber") as? String ?? ""
            cell.edittBtnOtlt.params["sendToOwnCard"] = eachObj?.value(forKey: "sendToOwnCard") as? String ?? ""
           
            return cell
        }
        if collectionView == self.helpCollectionView {
        
            let cell = helpCollectionView.dequeueReusableCell(withReuseIdentifier: "DashboardHelpCell", for: indexPath) as! DashboardHelpCell
            let help = helpVideoList[indexPath.row]
          //  cell.lbl_title.text = help["content"] as? String ?? ""
            
            let description = help["content"] as? String ?? ""
            cell.lbl_title.attributedText = description.htmlToAttributedString
            
            cell.lbl_title.font = Global.shared.fontTopLbl
              return cell
        }
        
        return cell!
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if  collectionView == self.helpCollectionView {
            
            let help = helpVideoList[indexPath.row]
            print(help)
            let screenToNavigate = help["screenToNavigate"] as! Int
            if screenToNavigate == 1
            {
                appDelegate.helpScreen = 0
                self.tabBarController?.selectedIndex = 3
            }
            else if screenToNavigate == 2
            {
                appDelegate.helpScreen = 1
                self.tabBarController?.selectedIndex = 3
            }
            else if screenToNavigate == 3
            {
                self.tabBarController?.selectedIndex = 1
               
            }
            else if screenToNavigate == 4
            {
                self.tabBarController?.selectedIndex = 2
            }
            else if screenToNavigate == 5
            {
                
            }
            else if screenToNavigate == 6
            {
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "UpdateCivilIDController") as! UpdateCivilIDController
                self.navigationController?.pushViewController(vc, animated: true)
                
            }
            else if screenToNavigate == 7
            {
                self.showBiomatricPopUp()
                
            }
            else{
              
            }
                
        }
        else if  collectionView == self.recentTransctnsCollectnView {
        }
        else {
            //    Global.shared.benefCasBankWu = "Bank"
            let eachObj = self.beneficaryFilteredResponse[indexPath.row] as?NSDictionary
           
            BeneficiaryDetails.shared.abaRouteCode = eachObj?.value(forKey: "abaRouteCode") as? String ?? ""
            BeneficiaryDetails.shared.accountNumber = eachObj?.value(forKey: "accountNumber") as? String ?? ""
            BeneficiaryDetails.shared.address1 = eachObj?.value(forKey: "address1") as? String ?? ""
            BeneficiaryDetails.shared.address2 = eachObj?.value(forKey: "address2") as? String ?? ""
            BeneficiaryDetails.shared.agentID = eachObj?.value(forKey: "agentID") as? String ?? ""
            BeneficiaryDetails.shared.agentName = eachObj?.value(forKey: "agentName") as? String ?? ""
            BeneficiaryDetails.shared.bankCode = eachObj?.value(forKey: "bankCode") as? String ?? ""
            BeneficiaryDetails.shared.bankName = eachObj?.value(forKey: "bankName") as? String ?? ""
            BeneficiaryDetails.shared.benID = eachObj?.value(forKey: "benID") as? String ?? ""
            BeneficiaryDetails.shared.beneficiaryId = eachObj?.value(forKey: "beneficiaryId") as? Int ?? 0
            BeneficiaryDetails.shared.beneficiaryType = eachObj?.value(forKey: "beneficiaryType") as? Int ?? 0
            BeneficiaryDetails.shared.branchAddress1 = eachObj?.value(forKey: "branchAddress1") as? String ?? ""
            BeneficiaryDetails.shared.branchAddress2 = eachObj?.value(forKey: "branchAddress2") as? String ?? ""
            BeneficiaryDetails.shared.branchCity = eachObj?.value(forKey: "branchCity") as? String ?? ""
            BeneficiaryDetails.shared.branchCode = eachObj?.value(forKey: "branchCode") as? String ?? ""
            BeneficiaryDetails.shared.branchName = eachObj?.value(forKey: "branchName") as? String ?? ""
            BeneficiaryDetails.shared.branchState = eachObj?.value(forKey: "branchState") as? String ?? ""
            BeneficiaryDetails.shared.city = eachObj?.value(forKey: "city") as? String ?? ""
            BeneficiaryDetails.shared.cnicno = eachObj?.value(forKey: "cnicno") as? String ?? ""
            BeneficiaryDetails.shared.country = eachObj?.value(forKey: "country") as? String ?? ""
            BeneficiaryDetails.shared.currency = eachObj?.value(forKey: "currency") as? String ?? ""
            BeneficiaryDetails.shared.defaultPurposeCode = eachObj?.value(forKey: "defaultPurposeCode") as? String ?? ""
            BeneficiaryDetails.shared.defaultPurposeName = eachObj?.value(forKey: "defaultPurposeName") as? String ?? ""
            BeneficiaryDetails.shared.disbursalMode = eachObj?.value(forKey: "disbursalMode") as? String ?? ""
            BeneficiaryDetails.shared.disbursalModeName = eachObj?.value(forKey: "disbursalModeName") as? String ?? ""
            BeneficiaryDetails.shared.fcMaxAmount = eachObj?.value(forKey: "fcMaxAmount") as? String ?? ""
            BeneficiaryDetails.shared.fcMinAmount = eachObj?.value(forKey: "fcMinAmount") as? String ?? ""
            BeneficiaryDetails.shared.firstName = eachObj?.value(forKey: "firstName") as? String ?? ""
            BeneficiaryDetails.shared.ibanCode = eachObj?.value(forKey: "ibanCode") as? String ?? ""
            BeneficiaryDetails.shared.ifscCode = eachObj?.value(forKey: "ifscCode") as? String ?? ""
            BeneficiaryDetails.shared.lastName = eachObj?.value(forKey: "lastName") as? String ?? ""
            BeneficiaryDetails.shared.middleName = eachObj?.value(forKey: "middleName") as? String ?? ""
            BeneficiaryDetails.shared.mobile = eachObj?.value(forKey: "mobile") as? String ?? ""
            BeneficiaryDetails.shared.nationality = eachObj?.value(forKey: "nationality") as? String ?? ""
            BeneficiaryDetails.shared.postCode = eachObj?.value(forKey: "postCode") as? String ?? ""
            BeneficiaryDetails.shared.referenceId = eachObj?.value(forKey: "referenceId") as? String ?? ""
            BeneficiaryDetails.shared.remID = eachObj?.value(forKey: "remID")  as? String ?? ""
            BeneficiaryDetails.shared.remarks = eachObj?.value(forKey: "remarks") as? String ?? ""
            BeneficiaryDetails.shared.sourceOfIncome = eachObj?.value(forKey: "sourceOfIncome") as? String ?? ""
            BeneficiaryDetails.shared.state = eachObj?.value(forKey: "state") as? String ?? ""
            BeneficiaryDetails.shared.swiftCode = eachObj?.value(forKey: "swiftCode") as? String ?? ""
            BeneficiaryDetails.shared.telePhone = eachObj?.value(forKey: "telePhone") as? String ?? ""
            BeneficiaryDetails.shared.txnRef = eachObj?.value(forKey: "txnRef") as? String ?? ""
            BeneficiaryDetails.shared.cardNumber = eachObj?.value(forKey: "cardNumber") as? String ?? ""
            BeneficiaryDetails.shared.sendToOwnCard = eachObj?.value(forKey: "sendToOwnCard") as? String ?? ""
            
            
            BeneficiaryDetails.shared.quickSend = "Details"
            
            let disablee = eachObj?.value(forKey: "isDisable") as? Bool ?? false
            
            
            
            BeneficiaryDetails.shared.beneficiaryType = eachObj?.value(forKey: "beneficiaryType") as? Int ?? 0
            let benificiaryType = eachObj?.value(forKey: "beneficiaryType") as? Int ?? 0
            
            if benificiaryType == 100 || benificiaryType == 101 || benificiaryType == 103 {
                
                if disablee == false {
                  /*  let vc = self.storyboard?.instantiateViewController(withIdentifier: "BenefBankCashNewTransferVc") as! BenefBankCashNewTransferVc
                    self.navigationController?.pushViewController(vc, animated: false)*/
                    downloadBeneficiaryPurpose()
                }
                else {
                    let alert = ViewControllerManager.displayAlert(message:  Global.shared.selectedBenefDisabled, title:APPLICATIONNAME)
                    self.present(alert, animated: true, completion: nil)
                    
                }
                
            }
            else {
                if disablee == false {
                    /*let vc = self.storyboard?.instantiateViewController(withIdentifier: "BenefWuNewTrnsferVc") as! BenefWuNewTrnsferVc
                    self.navigationController?.pushViewController(vc, animated: false)*/
                    Global.shared.fraudPopUpDirectWu = "Normal"
                    
                /*    let popOverVC = self.storyboard?.instantiateViewController(withIdentifier: "WuFirstTermsConditions") as! WuFirstTermsConditions
                                 self.addChild(popOverVC)
                                 popOverVC.view.frame = self.view.frame
                                 self.view.addSubview(popOverVC.view)
                                 popOverVC.didMove(toParent: self)*/
                    downloadBeneficiaryPurpose()
                }
                else {
                    let alert = ViewControllerManager.displayAlert(message:  Global.shared.selectedBenefDisabled, title:APPLICATIONNAME)
                    self.present(alert, animated: true, completion: nil)
                    
                }
                
            }
        }
        
    }
    
    // Mark: Edit button action
    @objc func editBtnnActnn(sender: PassableUIButton){
        
        
        let refreshAlert = UIAlertController(title: "", message: Global.shared.selectOptionTxt, preferredStyle: UIAlertController.Style.actionSheet)
        
        refreshAlert.addAction(UIAlertAction(title: Global.shared.unfavBenefTxt, style: .default, handler: { (action: UIAlertAction!) in
            self.showSpinner(onView: self.view)
            
            let benefId = sender.params["beneficiaryId"] ?? 0
            
            let paramaterPasing: [String:Any] =
                [
                    "registrationId": Global.shared.afterLoginRegistrtnId ?? "",
                    "beneficiaryId": benefId,
                    "isFavourite": false
                ]
            
            
            /*  let headers: HTTPHeaders = [
             "Content-Type": "application/json"
             ]*/
            print(UserDefaults.standard.string(forKey: "token")!)
            let headers: HTTPHeaders = [.authorization(bearerToken: UserDefaults.standard.string(forKey: "token")!)]
            
            NetWorkDataManager.sharedInstance.benefFavouriteImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
                
                if errorString == nil
                {
                    // print(resonseTal)
                    
                    let statusMsg = resonseTal?.value(forKey: "statusMessage") as? String
                    let statusCode = resonseTal?.value(forKey: "statusCodes") as? Int
                    let mesageCode = resonseTal?.value(forKey: "messageCode") as? String ?? statusMsg

                    if statusCode ==  400 {
                        if mesageCode == "E110042"
                        {
                            self.showAlert(withTitle: "", withMessage: resonseTal?["statusMessage"] as? String ?? "")

                        }
                        else{
                        let alert = ViewControllerManager.displayAlert(message: statusMsg ?? "", title:APPLICATIONNAME)
                        self.present(alert, animated: true, completion: nil)
                        }
                    }
                    else{
                       self.downloadBeneficiary()
                    }
                    
                }
                else
                {
                    print(errorString!)
                    self.removeLoader()
                    self.removeSpinner()
                    /*  let finalError = errorString?.components(separatedBy: ":")
                     let alert = ViewControllerManager.displayAlert(message: finalError?[1] ?? "", title:APPLICATIONNAME)
                     self.present(alert, animated: true, completion: nil)*/
                    if errorString == "Response could not be serialized, input data was nil or zero length." {
                        Global.shared.timeoUtOrNot = "no"
                        self.showAlertForTimer(titulo: "", mensagem: Global.shared.sessionTimedOutTxt, vc: self)
//                        let refreshAlert = UIAlertController(title: "", message: Global.shared.sessionTimedOutTxt, preferredStyle: UIAlertController.Style.alert)
//                        refreshAlert.view.tintColor = ColorCodes.newAppRed
//                        refreshAlert.addAction(UIAlertAction(title: Global.shared.okTxt, style: .default, handler: { (action: UIAlertAction!) in
//                            self.pushViewController(controller: LoginVc.initiateController())
//                        }))
//
//                        self.present(refreshAlert, animated: true, completion: nil)
                    }
                    
                    else {
                        let alert = ViewControllerManager.displayAlert(message: errorString ?? "", title:APPLICATIONNAME)
                        self.present(alert, animated: true, completion: nil)
                    }
                    
                    
                }
                
            }
        }))
        
        refreshAlert.addAction(UIAlertAction(title: Global.shared.editTxt, style: .default, handler: { (action: UIAlertAction!) in
            print("Handle Cancel Logic here")
            
            BeneficiaryDetails.shared.abaRouteCode = sender.params["abaRouteCode"] as? String ?? ""
            BeneficiaryDetails.shared.accountNumber = sender.params["accountNumber"] as? String ?? ""
            BeneficiaryDetails.shared.address1 = sender.params["address1"] as? String ?? ""
            BeneficiaryDetails.shared.address2 = sender.params["address2"] as? String ?? ""
            BeneficiaryDetails.shared.agentID = sender.params["agentID"] as? String ?? ""
            BeneficiaryDetails.shared.agentName = sender.params["agentName"] as? String ?? ""
            BeneficiaryDetails.shared.bankCode = sender.params["bankCode"] as? String ?? ""
            BeneficiaryDetails.shared.bankName = sender.params["bankName"] as? String ?? ""
            BeneficiaryDetails.shared.benID = sender.params["benID"] as? String ?? ""
            BeneficiaryDetails.shared.beneficiaryId = sender.params["beneficiaryId"] as? Int ?? 0
            BeneficiaryDetails.shared.beneficiaryType = sender.params["beneficiaryType"] as? Int ?? 0
            BeneficiaryDetails.shared.branchAddress1 = sender.params["branchAddress1"] as? String ?? ""
            BeneficiaryDetails.shared.branchAddress2 = sender.params["branchAddress2"] as? String ?? ""
            BeneficiaryDetails.shared.branchCity = sender.params["branchCity"] as? String ?? ""
            BeneficiaryDetails.shared.branchCode = sender.params["branchCode"] as? String ?? ""
            BeneficiaryDetails.shared.branchName = sender.params["branchName"] as? String ?? ""
            BeneficiaryDetails.shared.branchState = sender.params["branchState"] as? String ?? ""
            BeneficiaryDetails.shared.city = sender.params["city"] as? String ?? ""
            BeneficiaryDetails.shared.cnicno = sender.params["cnicno"] as? String ?? ""
            BeneficiaryDetails.shared.country = sender.params["country"] as? String ?? ""
            BeneficiaryDetails.shared.currency = sender.params["currency"] as? String ?? ""
            BeneficiaryDetails.shared.defaultPurposeCode = sender.params["defaultPurposeCode"] as? String ?? ""
            BeneficiaryDetails.shared.defaultPurposeName = sender.params["defaultPurposeName"] as? String ?? ""
            BeneficiaryDetails.shared.disbursalMode = sender.params["disbursalMode"] as? String ?? ""
            BeneficiaryDetails.shared.disbursalModeName = sender.params["disbursalModeName"] as? String ?? ""
            BeneficiaryDetails.shared.fcMaxAmount = sender.params["fcMaxAmount"] as? String ?? ""
            BeneficiaryDetails.shared.fcMinAmount = sender.params["fcMinAmount"] as? String ?? ""
            BeneficiaryDetails.shared.firstName = sender.params["firstName"] as? String ?? ""
            BeneficiaryDetails.shared.ibanCode = sender.params["ibanCode"] as? String ?? ""
            BeneficiaryDetails.shared.ifscCode = sender.params["ifscCode"] as? String ?? ""
            BeneficiaryDetails.shared.lastName = sender.params["lastName"] as? String ?? ""
            BeneficiaryDetails.shared.middleName = sender.params["middleName"] as? String ?? ""
            BeneficiaryDetails.shared.mobile = sender.params["mobileNo"] as? String ?? ""
            BeneficiaryDetails.shared.nationality = sender.params["nationality"] as? String ?? ""
            BeneficiaryDetails.shared.postCode = sender.params["postCode"] as? String ?? ""
            BeneficiaryDetails.shared.referenceId = sender.params["referenceId"] as? String ?? ""
            BeneficiaryDetails.shared.remID = sender.params["remID"] as? String ?? ""
            BeneficiaryDetails.shared.remarks = sender.params["remarks"] as? String ?? ""
            BeneficiaryDetails.shared.sourceOfIncome = sender.params["sourceOfIncome"] as? String ?? ""
            BeneficiaryDetails.shared.state = sender.params["state"] as? String ?? ""
            BeneficiaryDetails.shared.swiftCode = sender.params["swiftCode"] as? String ?? ""
            BeneficiaryDetails.shared.telePhone = sender.params["telePhone"] as? String ?? ""
            BeneficiaryDetails.shared.txnRef = sender.params["txnRef"] as? String ?? ""
            
            BeneficiaryDetails.shared.cardNumber = sender.params["cardNumber"] as? String ?? ""
            BeneficiaryDetails.shared.sendToOwnCard = sender.params["sendToOwnCard"] as? String ?? ""
            
            
            let benificiaryType = sender.params["beneficiaryType"] ?? 0
            
            if benificiaryType as! Int == 100 {
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "BenefBankEditVc") as! BenefBankEditVc
                self.navigationController?.pushViewController(vc, animated: true)
            }
            else   if benificiaryType as! Int == 101 {
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "BenefCashEditVc") as! BenefCashEditVc
                self.navigationController?.pushViewController(vc, animated: true)
            }
            else   if benificiaryType as! Int == 103 {
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "BenefVisaCardEditVC") as! BenefVisaCardEditVC
                self.navigationController?.pushViewController(vc, animated: true)
            }
            else {
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "BenefWuEditVc") as! BenefWuEditVc
                self.navigationController?.pushViewController(vc, animated: false)
                
            }
            
        }))
        
        let disablee = sender.params["isDisable"] ?? false
        if disablee as! Bool == true {
            refreshAlert.addAction(UIAlertAction(title: Global.shared.enableBenefTxt , style: .default, handler: { (action: UIAlertAction!) in
                self.showSpinner(onView: self.view)
                
                let benefId = sender.params["beneficiaryId"] ?? 0
                
                let paramaterPasing: [String:Any] =
                    [
                        "registrationId": Global.shared.afterLoginRegistrtnId ?? "",
                        "beneficiaryId": benefId,
                        "disable": false
                    ]
                
                
                /*  let headers: HTTPHeaders = [
                 "Content-Type": "application/json"
                 ]*/
                
                let headers: HTTPHeaders = [.authorization(bearerToken: UserDefaults.standard.string(forKey: "token")!)]
                
                NetWorkDataManager.sharedInstance.enableDisableBenefImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
                    
                    if errorString == nil
                    {
                        // print(resonseTal)
                        let statusMsg = resonseTal?.value(forKey: "statusMessage") as? String
                        let statusCode = resonseTal?.value(forKey: "statusCodes") as? Int
                        let mesageCode = resonseTal?.value(forKey: "messageCode") as? String ?? statusMsg

                        if statusCode ==  400 {
                            if mesageCode == "E110042"
                            {
                                self.showAlert(withTitle: "", withMessage: resonseTal?["statusMessage"] as? String ?? "")

                            }
                            else{
                            
                            let alert = ViewControllerManager.displayAlert(message: statusMsg ?? "", title:APPLICATIONNAME)
                            self.present(alert, animated: true, completion: nil)
                            }
                        }
                        else{
                            self.downloadBeneficiary()
                        }
                        
                    }
                    else
                    {
                        print(errorString!)
                        
                    }
                }
            }))
        }
        else {
            
            refreshAlert.addAction(UIAlertAction(title: Global.shared.disableBenefTxt, style: .default, handler: { (action: UIAlertAction!) in
                self.showSpinner(onView: self.view)
                
                let benefId = sender.params["beneficiaryId"] ?? 0
                
                let paramaterPasing: [String:Any] =
                    [
                        "registrationId": Global.shared.afterLoginRegistrtnId ?? "",
                        "beneficiaryId": benefId,
                        "disable": true
                    ]
                
                
                /*  let headers: HTTPHeaders = [
                 "Content-Type": "application/json"
                 ]*/
                
                let headers: HTTPHeaders = [.authorization(bearerToken: UserDefaults.standard.string(forKey: "token")!)]
                
                NetWorkDataManager.sharedInstance.enableDisableBenefImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
                    
                    if errorString == nil
                    {
                        // print(resonseTal)
                        let statusMsg = resonseTal?.value(forKey: "statusMessage") as? String
                        let statusCode = resonseTal?.value(forKey: "statusCodes") as? Int
                        let mesageCode = resonseTal?.value(forKey: "messageCode") as? String ?? statusMsg

                        if statusCode ==  400 {
                            if mesageCode == "E110042"
                            {
                                self.showAlert(withTitle: "", withMessage: resonseTal?["statusMessage"] as? String ?? "")

                            }
                            else{
                            
                            let alert = ViewControllerManager.displayAlert(message: statusMsg ?? "", title:APPLICATIONNAME)
                            self.present(alert, animated: true, completion: nil)
                            }
                        }
                        else{

                           self.downloadBeneficiary()
                        }
                        
                    }
                    else
                    {
                        print(errorString!)
                        
                    }
                }
            }))
        }
        
        refreshAlert.addAction(UIAlertAction(title: Global.shared.cancelTxt, style: .cancel, handler: { (action: UIAlertAction!) in
        }))
        
        
        present(refreshAlert, animated: true, completion: nil)
        
        
    }
    @objc func TransStatusActn(sender: PassableUIButton)
    {
        
        let eachObj = self.transctnResponse[sender.tag] as?NSDictionary
        
        
        print(eachObj)
        
        BeneficiaryDetails.shared.beneficiaryId = eachObj?.value(forKey: "beneficiaryId") as? Int ?? 0
        
        BeneficiaryDetails.shared.mtcn = eachObj?.value(forKey: "mtcn") as? String ?? ""
        BeneficiaryDetails.shared.ttRefNottn = eachObj?.value(forKey: "ttRefNo") as? String ?? ""
        
        let lcAmnt =  eachObj?.value(forKey: "lcAmount") as? String  ?? "0"
        let doubleLcAmnt = Double(lcAmnt)
        BeneficiaryDetails.shared.lcAmntQuickSend = doubleLcAmnt
        
        BeneficiaryDetails.shared.quickSend = "Quick"
        BeneficiaryDetails.shared.beneficiaryType = eachObj?.value(forKey: "beneficiaryType") as? Int ?? 0
        BeneficiaryDetails.shared.isRetail = eachObj?.value(forKey: "isRetail") as? Bool ?? false
        BeneficiaryDetails.shared.remitterEmail = eachObj?.value(forKey: "remitterEmail") as? String ?? ""
        
        BeneficiaryDetails.shared.txnRef = eachObj?.value(forKey: "txnRefNo") as? String ?? ""
        BeneficiaryDetails.shared.sourceCurrenyCode = eachObj?.value(forKey: "sourceCurrenyCode") as? String ?? ""
        BeneficiaryDetails.shared.targetCurencyCode = eachObj?.value(forKey: "targetCurrenyCode") as? String ?? ""
        BeneficiaryDetails.shared.beneficiaryTypeName = eachObj?.value(forKey: "beneficiaryTypeName") as? String ?? ""
        BeneficiaryDetails.shared.firstName = eachObj?.value(forKey: "beneficiaryFirstName") as? String ?? ""
        BeneficiaryDetails.shared.middleName = eachObj?.value(forKey: "beneficiaryMiddleName") as? String ?? ""
        BeneficiaryDetails.shared.lastName = eachObj?.value(forKey: "beneficiaryLastName") as? String ?? ""
        BeneficiaryDetails.shared.voucherMsg = eachObj?.value(forKey: "voucherMessage") as? String ?? ""
  
        BeneficiaryDetails.shared.sourceTotalAmnt = eachObj?["totalLCAmount"] as? String ?? ""
        
        BeneficiaryDetails.shared.targetTotalAmnt =  eachObj?["fcAmount"] as? String ?? ""
        
        BeneficiaryDetails.shared.countryCode = eachObj?.value(forKey: "beneficiaryCountry") as? String ?? ""
        BeneficiaryDetails.shared.enableOrDisable = eachObj?.value(forKey: "isDisable") as? Bool ?? false
        
        let newDate = eachObj?.value(forKey: "createdDate") as? String ?? ""
        
        if newDate.contains(".") {
         BeneficiaryDetails.shared.createdDatee = Date.getMonthDayYearString(newDate)
        }
        else {
            BeneficiaryDetails.shared.createdDatee = Date.getMonthDayYearWithoutSecndsString(newDate)
        }
        
        BeneficiaryDetails.shared.transctnStatusText = eachObj?.value(forKey: "statusName") as? String ?? ""
        BeneficiaryDetails.shared.transctnStatusInt = eachObj?.value(forKey: "status") as? Int ?? 0
        
        BeneficiaryDetails.shared.bankName = eachObj?.value(forKey: "bankName") as? String ?? ""
        BeneficiaryDetails.shared.branchName = eachObj?.value(forKey: "branchName") as? String ?? ""
        BeneficiaryDetails.shared.accountNumber = eachObj?.value(forKey: "accountNumber") as? String ?? ""
        
        
        let txnNo = eachObj?.value(forKey: "txnRefNo") as! String
        self.showSpinner(onView: self.view)
        let paramaterPasing: [String:Any] = [
            "registrationId": Global.shared.afterLoginRegistrtnId ?? "",
            "txnNo":txnNo
        ]
        
        
        /*    let headers: HTTPHeaders = [
         "Content-Type": "application/json"
         ]*/
        
        let headers: HTTPHeaders = [.authorization(bearerToken: UserDefaults.standard.string(forKey: "token")!)]
        
        NetWorkDataManager.sharedInstance.transactionEnquiryImplementation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            
            if errorString == nil
            {
                print(resonseTal)
                self.removeSpinner()
                
            let statusMsg = resonseTal?.value(forKey: "statusMessage") as? String ?? ""
            let mesageCode = resonseTal?.value(forKey: "messageCode") as? String ?? statusMsg
                if let statusCode = resonseTal?.value(forKey: "statusCodes") as? Int {
                    if statusCode == 200 {
                        BeneficiaryDetails.shared.transactionStatus = resonseTal?.value(forKey: "transactionStatus") as? String ?? ""
                        let vc = self.storyboard?.instantiateViewController(withIdentifier: "TransactionStatusController") as! TransactionStatusController
                        self.present(vc, animated: true, completion: nil)
                        
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
              //  Global.shared.methodName = CanvasUrls.ttRateCalculator
              //  NetWorkDataManager.sharedInstance.callChannelException()
                let finalError = errorString?.components(separatedBy: ":")
                if finalError?.count == 2
                {
                let alert = ViewControllerManager.displayAlert(message: finalError?[1] ?? "", title:APPLICATIONNAME)
                self.present(alert, animated: true, completion: nil)
                }
                else
                {
                    let alert = ViewControllerManager.displayAlert(message: finalError?[0] ?? "", title:APPLICATIONNAME)
                    self.present(alert, animated: true, completion: nil)
                }
            }
            
        }
        callStatusAPI()
    }
    func callStatusAPI()
    {
       
    }
    
    
    
    @objc func quickSendActnn(sender: PassableUIButton){
        
        let statusType = sender.params["status"] as? Int
        
        //pending
        if statusType == 0 {
            let alert = ViewControllerManager.displayAlert(message: Global.shared.pendingTrnsctnTxt, title:APPLICATIONNAME)
            self.present(alert, animated: true, completion: nil)
        }
        
        //failed
        else if statusType == 2 {
            let alert = ViewControllerManager.displayAlert(message: Global.shared.failedTrnsctnTxt, title:APPLICATIONNAME)
            self.present(alert, animated: true, completion: nil)
        }
        //cancelled
        else if statusType == 3 {
            let alert = ViewControllerManager.displayAlert(message: Global.shared.failedTrnsctnTxt, title:APPLICATIONNAME)
            self.present(alert, animated: true, completion: nil)
        }
        
        //sucess
        else {
            
          //  let isDisable = sender.params["isDisable"] ?? false
            let isRetail = sender.params["isRetail"] ?? false
            if isRetail as! Bool == true {
            //    if isDisable as! Bool == true || isRetail as! Bool == true {
                
              //  Global.shared.selectedBenefDisabled
                let alert = ViewControllerManager.displayAlert(message:  Global.shared.repetFailedPendingTxt, title:APPLICATIONNAME)
                self.present(alert, animated: true, completion: nil)
            }
            else {
                
              //  let benificiaryType = sender.params["beneficiaryType"] ?? 0
                
                BeneficiaryDetails.shared.quickSend = "Quick"
                BeneficiaryDetails.shared.beneficiaryId = sender.params["beneficiaryId"] as? Int
                let lcAmnt = sender.params["lcAmount"] as? String  ?? "0"
                let doubleLcAmnt = Double(lcAmnt)
                BeneficiaryDetails.shared.lcAmntQuickSend = doubleLcAmnt
                
                
                BeneficiaryDetails.shared.beneficiaryType = sender.params["beneficiaryType"] as? Int
                
                downloadBeneficiaryPurpose()
                
             /*   if benificiaryType as! Int == 100 || benificiaryType as! Int == 101 {
                 /*   let benefBankCashNewTransferVC:BenefBankCashNewTransferVc = .initiateController()
                    self.pushViewController(controller:benefBankCashNewTransferVC)*/
                    downloadBeneficiaryPurpose()
                }
                else {
                  /*  let benefWuNewTrnsferVc:BenefWuNewTrnsferVc = .initiateController()
                    self.pushViewController(controller:benefWuNewTrnsferVc)*/
                    
                    Global.shared.fraudPopUpDirectWu = "Normal"
                    
                   /* let popOverVC = self.storyboard?.instantiateViewController(withIdentifier: "WuFirstTermsConditions") as! WuFirstTermsConditions
                                 self.addChild(popOverVC)
                                 popOverVC.view.frame = self.view.frame
                                 self.view.addSubview(popOverVC.view)
                                 popOverVC.didMove(toParent: self)*/
                    downloadBeneficiaryPurpose()
                    
                }*/
            }
            
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return view.frame.height
    }
    
    
    
    func rateCalculator() {
        self.showSpinner(onView: self.view)
        let paramaterPasing: [String:Any] = [
            "currenyCode": targetCurrencyCodeLbl.text!,
            "amount": Int(youSendField.text ?? "0") ?? 0,
            "calcType": "FC",
            "branchCode": ""
        ]
        
        
        /*    let headers: HTTPHeaders = [
         "Content-Type": "application/json"
         ]*/
        
        let headers: HTTPHeaders = [.authorization(bearerToken: UserDefaults.standard.string(forKey: "token")!)]
        
        NetWorkDataManager.sharedInstance.ttRateCalculatorImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            
            if errorString == nil
            {
                
                self.removeSpinner()
                
                let statusMsg = resonseTal?.value(forKey: "statusMessage") as? String ?? ""
            let mesageCode = resonseTal?.value(forKey: "messageCode") as? String ?? statusMsg
                if let statusCode = resonseTal?.value(forKey: "statusCodes") as? Int {
                    if statusCode == 200 {
                        
                        //     self.redMainView.isHidden = false
                        //     self.redSubView.isHidden = false
                        self.theyReceiveField.text = resonseTal?["fcAmount"] as? String ?? ""
                        //    self.rateField.text = (resonseTal?["rate"] as? String ?? "") + " " + self.curencyCode
                        //    self.fcAmntField.text = (resonseTal?["fcAmount"] as? String ?? "") + " " + self.curencyCode
                        let receivee = Double(self.theyReceiveField.text?.replacingOccurrences(of: ",", with: "", options: .literal, range: nil) ?? "0")
                        let sendd = Double(self.youSendField.text?.replacingOccurrences(of: ",", with: "", options: .literal, range: nil) ?? "0")
                        
                        let rateCalcltn = receivee!/sendd!
                        let finalRateCalculated = rateCalcltn.rounded(toPlaces: 3)
                        let finalTxt = "1 KWD = " + String(finalRateCalculated) + " " + self.targetCurrencyCodeLbl.text!
                        self.rateCalculationLbl.text = finalTxt
                        self.rateCalculationLbl.isHidden = false
                        
                        
                        
                        
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
                Global.shared.methodName = CanvasUrls.ttRateCalculator
                NetWorkDataManager.sharedInstance.callChannelException()
                let finalError = errorString?.components(separatedBy: ":")
                if finalError?.count == 2
                {
                let alert = ViewControllerManager.displayAlert(message: finalError?[1] ?? "", title:APPLICATIONNAME)
                self.present(alert, animated: true, completion: nil)
                }
                else
                {
                    let alert = ViewControllerManager.displayAlert(message: finalError?[0] ?? "", title:APPLICATIONNAME)
                    self.present(alert, animated: true, completion: nil)
                }
//                let alert = ViewControllerManager.displayAlert(message: finalError?[1] ?? "", title:APPLICATIONNAME)
//                self.present(alert, animated: true, completion: nil)
                
            }
            
        }
        
    }
    
    func rateCalculatorThey() {
    
        self.showSpinner(onView: self.view)
        let paramaterPasing: [String:Any] = [
            "currenyCode": targetCurrencyCodeLbl.text!,
            "amount": Int(theyReceiveField.text ?? "0") ?? 0,
            "calcType": "LC",
            "branchCode": ""
        ]
        
        /*    let headers: HTTPHeaders = [
         "Content-Type": "application/json"
         ]*/
        
        let headers: HTTPHeaders = [.authorization(bearerToken: UserDefaults.standard.string(forKey: "token")!)]
        
        NetWorkDataManager.sharedInstance.ttRateCalculatorImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            
            if errorString == nil
            {
                
                self.removeSpinner()
                let statusMsg = resonseTal?.value(forKey: "statusMessage") as? String ?? ""
            let mesageCode = resonseTal?.value(forKey: "messageCode") as? String ?? statusMsg
                
                if let statusCode = resonseTal?.value(forKey: "statusCodes") as? Int {
                    if statusCode == 200 {
                        
                        //     self.redMainView.isHidden = false
                        //     self.redSubView.isHidden = false
                        self.youSendField.text = resonseTal?["lcAmount"] as? String ?? ""
                        //    self.rateField.text = (resonseTal?["rate"] as? String ?? "") + " " + self.curencyCode
                        //    self.fcAmntField.text = (resonseTal?["fcAmount"] as? String ?? "") + " " + self.curencyCode
                        let receivee = Double(self.theyReceiveField.text?.replacingOccurrences(of: ",", with: "", options: .literal, range: nil) ?? "0")
                        let sendd = Double(self.youSendField.text?.replacingOccurrences(of: ",", with: "", options: .literal, range: nil) ?? "0")
                        
                        let rateCalcltn = receivee!/sendd!
                        let finalRateCalculated = rateCalcltn.rounded(toPlaces: 3)
                        let finalTxt = "1 KWD = " + String(finalRateCalculated) + " " + self.targetCurrencyCodeLbl.text!
                        self.rateCalculationLbl.text = finalTxt
                        self.rateCalculationLbl.isHidden = false
                        
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
                Global.shared.methodName = CanvasUrls.ttRateCalculator
                NetWorkDataManager.sharedInstance.callChannelException()
                let finalError = errorString?.components(separatedBy: ":")
                let alert = ViewControllerManager.displayAlert(message: finalError?[1] ?? "", title:APPLICATIONNAME)
                self.present(alert, animated: true, completion: nil)
                
            }
        }
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        //doneAction()
        if textField == youSendField{
            
            if youSendField.text!.count ==  0 {
                //   sourceReqLbl.isHidden = false
            }
            else {
                rateCalculator()
                //   sourceReqLbl.isHidden = true
            }
        }
        
        if textField == theyReceiveField{
            
            if theyReceiveField.text!.count ==  0 {
                //   sourceReqLbl.isHidden = false
            }
            else {
                
                rateCalculatorThey()
                
                
                //   sourceReqLbl.isHidden = true
            }
        }
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField == youSendField {
            if (youSendField.text?.contains("."))! && string == "." {
                return false
            }
            if (youSendField.text?.contains("."))! {
                if youSendField.text?.components(separatedBy: ".")[1].count == Global.shared.digitsAfterDecimal {
                    
                    if string == "." || string == "1" || string ==  "2" || string ==  "3" || string ==  "4" || string ==  "5" ||  string == "6" ||  string == "7" || string ==  "8" || string ==  "9" || string ==  "0" {
                        return false
                        
                    }
                    else {
                        return true
                    }
                   // return true
                }
            }
            if youSendField.text!.count <= -1 {
                // sourceReqLbl.isHidden = false
            }
            else {
                //  rateSourceCalculator()
                //   sourceReqLbl.isHidden = true
            }
        }
        if textField == theyReceiveField {
            if (theyReceiveField.text?.contains("."))! && string == "." {
                return false
            }
            if (theyReceiveField.text?.contains("."))! {
                if theyReceiveField.text?.components(separatedBy: ".")[1].count == Global.shared.digitsAfterDecimal {
                    
                    if string == "." || string == "1" || string ==  "2" || string ==  "3" || string ==  "4" || string ==  "5" ||  string == "6" ||  string == "7" || string ==  "8" || string ==  "9" || string ==  "0" {
                        return false
                        
                    }
                    else {
                        return true
                    }
                   // return true
                }
            }
            if youSendField.text!.count <= -1 {
                // sourceReqLbl.isHidden = false
            }
            else {
                //  rateSourceCalculator()
                //   sourceReqLbl.isHidden = true
            }
        }
        return true
        
        
    }
    
    
    @IBAction func menuBtnActn(_ sender: Any) {
        menuPopUp = self.storyboard?.instantiateViewController(withIdentifier: "MenuViewController") as? MenuViewController
        
        menuPopUp.delegateObj = self
        self.addChild(menuPopUp)
        menuPopUp.view.frame = self.view.frame
        self.view.addSubview(menuPopUp.view)
        menuPopUp.didMove(toParent: self)
    }
    
    
    @IBAction func currencyDrpActn(_ sender: Any) {
        /*   let pickerData = Global.shared.pickerResponseFullCurrencyNameData
         PickerDialog().show(title: "", options: pickerData , selected: "") {
         (value) -> Void in
         /*      self.targetCurrencyCodeLbl.text = "\(value)"
         let indexS = Global.shared.currencyNameData.firstIndex(of: "\(value)")
         self.inrOrOtherCurencyLbl.text  = Global.shared.currencyNameData[indexS ?? 0]*/
         //  self.targetReqLbl.isHidden = true
         
         
         self.inrOrOtherCurencyLbl.text = "\(value)"
         let indexS = Global.shared.currencyNameData.firstIndex(of: "\(value)")
         self.targetCurrencyCodeLbl.text = Global.shared.countryCodesData[indexS ?? 0]
         let imgee = Global.shared.countryNameData[indexS ?? 0]
         self.selectedImg.image = UIImage(named: imgee)
         
         }*/
        self.curencyRate = "Currency"
        
        let popOverVC = self.storyboard?.instantiateViewController(withIdentifier: "CurrencyDrpDwnSearch") as! CurrencyDrpDwnSearch
        self.addChild(popOverVC)
        popOverVC.delegate = self
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParent: self)
        
        
    }
    
    var curencyRate = ""
    
    func didSelectedCountry(country: Country) {
        if self.curencyRate == "Currency" {
            self.inrOrOtherCurencyLbl.text = country.currencyFulName
            
            self.selectedImg.image = UIImage(named: country.countryCode?.lowercased() ?? "")
            self.targetCurrencyCodeLbl.text = country.currencyCode
        }
        else {
            let curencyFulName = country.currencyFulName ?? ""
           let curncyCode = country.currencyCode ?? "INR"
            
            self.ratePaternDrpLbl.text = curncyCode + " - " + curencyFulName
            self.ratePaternCurncyCode = country.currencyCode ?? "INR"
            self.downloadLineChartData()
        }
    }
    
    
    @IBAction func logoutActn(_ sender: Any) {
        logout()
    }
    
    @IBAction func drpActnRatePatern(_ sender: Any) {
        /* let pickerData = Global.shared.ratePpickerResponseCountryData
         PickerDialog().show(title: "", options: pickerData , selected: "") {
         (value) -> Void in
         self.ratePaternDrpLbl.text = "\(value)"
         
         
         let indexS = Global.shared.ratePcountryNameData.firstIndex(of: "\(value)")
         self.ratePaternCurncyCode = Global.shared.ratePcurrencyCodesData[indexS ?? 0]
         self.downloadLineChartData()
         }*/
        
        self.curencyRate = "Rate"
        Global.shared.countris = Country.getCountries(Global.shared.countrisAllRate)
        let popOverVC = self.storyboard?.instantiateViewController(withIdentifier: "CurrencyDrpDwnSearch") as! CurrencyDrpDwnSearch
        self.addChild(popOverVC)
        popOverVC.delegate = self
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParent: self)
    }
    
    @IBAction func langugeChangeActn(_ sender: Any) {
        Global.shared.languageChangeActn()
        
    }
    
    var fromDateOneValue:String!
    var toDateOneValue:String!
    
    var fromDateTwoValue:String!
    var toDateTwoValue:String!
    
    @IBAction func fromDateFirstActn(_ sender: Any) {
        DatePickerDialog().show(Global.shared.transactionsFromDate, doneButtonTitle: "Done", cancelButtonTitle: "Cancel", maximumDate: NSDate() as Date, datePickerMode: .date) {
            (date) -> Void in
            if let dt = date {
                let formatter = DateFormatter()
                formatter.locale = Locale(identifier: "en_US_POSIX")
                formatter.dateFormat = "dd/MM/yyyy"
                self.fromDateOneField.text = formatter.string(from: dt)
                
                formatter.dateFormat = "yyyy-MM-dd"
                self.fromDateOneValue = formatter.string(from: dt)
                
                //     self.fromDateReqLbl.isHidden = true
                
                
                
                if self.fromDateOneField.text == ""  || self.toDateOneField.text == ""{
                    print("nothing")
                }
                else  if self.fromDateOneValue > self.toDateOneValue {
                    self.fromDateOneField.text = ""
                    print("nothing")
                }
                else {
                    self.downloadBarChartData()
                }
            }
        }
    }
    @IBAction func toDateFirstActn(_ sender: Any) {
        DatePickerDialog().show(Global.shared.transactionsToDate, doneButtonTitle: "Done", cancelButtonTitle: "Cancel", maximumDate: NSDate() as Date, datePickerMode: .date) {
            (date) -> Void in
            if let dt = date {
                let formatter = DateFormatter()
                formatter.locale = Locale(identifier: "en_US_POSIX")
                formatter.dateFormat = "dd/MM/yyyy"
                self.toDateOneField.text = formatter.string(from: dt)
                
                formatter.dateFormat = "yyyy-MM-dd"
                self.toDateOneValue = formatter.string(from: dt)
                
                
                //    self.toDateReqLbl.isHidden = true
                
                if self.fromDateOneField.text == ""  || self.toDateOneField.text == ""{
                    print("nothing")
                }
                else  if self.fromDateOneValue > self.toDateOneValue {
                    self.toDateOneField.text = ""
                    print("nothing")
                }
                else {
                    self.downloadBarChartData()
                }
                
            }
        }
    }
    @IBAction func fromDateTwoActn(_ sender: Any) {
        DatePickerDialog().show(Global.shared.transactionsFromDate, doneButtonTitle: "Done", cancelButtonTitle: "Cancel", maximumDate: NSDate() as Date, datePickerMode: .date) {
            (date) -> Void in
            if let dt = date {
                let formatter = DateFormatter()
                formatter.locale = Locale(identifier: "en_US_POSIX")
                formatter.dateFormat = "dd/MM/yyyy"
                self.fromDateTwoField.text = formatter.string(from: dt)
                
                formatter.dateFormat = "yyyy-MM-dd"
                self.fromDateTwoValue = formatter.string(from: dt)
                
                //     self.fromDateReqLbl.isHidden = true
                
                
                
                if self.fromDateTwoField.text == ""  || self.toDateTwoField.text == ""{
                    print("nothing")
                }
                else  if self.fromDateTwoValue > self.toDateTwoValue {
                    self.fromDateTwoField.text = ""
                    print("nothing")
                }
                else {
                    self.downloadLineChartData()
                }
            }
        }
    }
    @IBAction func toDateTwoActn(_ sender: Any) {
        DatePickerDialog().show(Global.shared.transactionsToDate, doneButtonTitle: "Done", cancelButtonTitle: "Cancel", maximumDate: NSDate() as Date, datePickerMode: .date) {
            (date) -> Void in
            if let dt = date {
                let formatter = DateFormatter()
                formatter.locale = Locale(identifier: "en_US_POSIX")
                formatter.dateFormat = "dd/MM/yyyy"
                self.toDateTwoField.text = formatter.string(from: dt)
                
                formatter.dateFormat = "yyyy-MM-dd"
                self.toDateTwoValue = formatter.string(from: dt)
                
                
                //    self.toDateReqLbl.isHidden = true
                
                if self.fromDateTwoField.text == ""  || self.toDateTwoField.text == ""{
                    print("nothing")
                }
                else  if self.fromDateTwoValue > self.toDateTwoValue {
                    self.toDateTwoField.text = ""
                    print("nothing")
                }
                else {
                    self.downloadLineChartData()
                }
                
            }
        }
    }
    
    // Mark: Getting beneficiary purpose
    func downloadBeneficiaryPurpose() {
        
        self.showSpinner(onView: self.view)
        let paramaterPasing: [String:Any] = ["registrationId": Global.shared.afterLoginRegistrtnId ?? "",
                                             "status": 0, "beneficiaryId": BeneficiaryDetails.shared.beneficiaryId ?? 0, "disbursalMode": ""]
        
        
        /*    let headers: HTTPHeaders = [
         "Content-Type": "application/json"
         ]*/
        
        let headers: HTTPHeaders = [.authorization(bearerToken: UserDefaults.standard.string(forKey: "token")!)]
        
        NetWorkDataManager.sharedInstance.benefGetListImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            //test
            if errorString == nil
            {
               // print(resonseTal)
                self.removeSpinner()
               
                if let benList = resonseTal?.value(forKey: "beneficiariesResponseList") as? NSArray {
                  
                   if benList.count < 1 {
                        let alert = ViewControllerManager.displayAlert(message:  Global.shared.benefDatNotAvailble, title:APPLICATIONNAME)
                                       self.present(alert, animated: true, completion: nil)
                    }
                    else  {
                        let isDisable = (benList[0] as AnyObject).value(forKey: "isDisable") as? Bool ?? false
                         if isDisable == true  {
                             let alert = ViewControllerManager.displayAlert(message:  Global.shared.repetFailedPendingTxt, title:APPLICATIONNAME)
                             self.present(alert, animated: true, completion: nil)
                         }
                         else {
                            let benificiaryType = BeneficiaryDetails.shared.beneficiaryType
                                 if benificiaryType == 100 || benificiaryType == 101 {
                                  self.pushViewController(controller: BenefBankCashNewTransferVc.initiateController(),animated: false)
                                 }
                             else if  benificiaryType == 103 {
                                 self.pushViewController(controller: VisaDirectNewTransferVC.initiateController(),animated: false)
                                 
                             }
                                 else {
                                    Global.shared.fraudPopUpDirectWu = "Normal"
                                 
                                    let popOverVC = self.storyboard?.instantiateViewController(withIdentifier: "WuFirstTermsConditions") as! WuFirstTermsConditions
                                                 self.addChild(popOverVC)
                                                 popOverVC.view.frame = self.view.frame
                                                 self.view.addSubview(popOverVC.view)
                                                 popOverVC.didMove(toParent: self)
                               //   self.pushViewController(controller: BenefWuNewTrnsferVc.initiateController(), animated: false)
                                    
                                     
                                 }
                         }
                        }
                    }
                }
       
            
                
            else {
                            print(errorString!)
                Global.shared.methodName = CanvasUrls.getBeneficiaries
                NetWorkDataManager.sharedInstance.callChannelException()
                       
                            self.removeSpinner()
                         
                        }

        }
    }
    
    func downloadAccountConfigCountriesVisa()
    {
        let paramaterPasing: [String:Any] = ["languageCode":LocalizationSystem.sharedInstance.getLanguage(),
                                             "type": 8]
        
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        NetWorkDataManager.sharedInstance.countryListImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            
            if errorString == nil
            {
                
                print(resonseTal!)
                if let countres = resonseTal?.value(forKey: "countriesList") as? [[String: Any]] {
                    //  Global.shared.countrisBank = Country.getCountries(countres)
                    Global.shared.countrisAllVisa = countres
                    
                }
                if let countries = resonseTal?.value(forKey: "countriesList") as? NSArray {
                    print(countries)
                    //please check country
                    
                    
                    if let countryName = countries.value(forKey: "countryName") as? [String] {
                        Global.shared.countryNameDataVisa = countryName
                    }
                    if let countryCode = countries.value(forKey: "countryCode") as? [String] {
                        Global.shared.countryCodesDataVisa = countryCode
                    }
                    if let currency = countries.value(forKey: "countryCurrency") as? [String] {
                        Global.shared.currencyCodesDataVisa = currency
                    }
                    if let currencyNames = countries.value(forKey: "currencyName") as? [String] {
                        Global.shared.currencyNameDataVisa = currencyNames
                    }
                    
                    if let phoneCodes = countries.value(forKey: "phoneCode") as? [String] {
                        Global.shared.phoneCodesDataVisa = phoneCodes
                    }
                    
                    for i in 0..<Global.shared.currencyCodesDataVisa.count {
                        Global.shared.pickerResponseOnlyCurrencyDataVisa.append(["value":  Global.shared.currencyCodesDataVisa[i], "display":  Global.shared.currencyCodesDataVisa[i]])
                    }
                    
                    for i in 0..<Global.shared.currencyNameDataVisa.count {
                        Global.shared.pickerResponseFullCurrencyNameDataVisa.append(["value":  Global.shared.currencyNameDataVisa[i], "display":  Global.shared.currencyNameDataVisa[i]])
                    }
                    
                    
                    for i in 0..<Global.shared.countryNameDataVisa.count {
                        Global.shared.pickerResponseCountryDataVisa.append(["value": Global.shared.countryNameDataVisa[i], "display": Global.shared.countryNameDataVisa[i]])
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
                NetWorkDataManager.sharedInstance.callChannelException()
                let finalError = errorString?.components(separatedBy: ":")
                let alert = ViewControllerManager.displayAlert(message: finalError?[1] ?? "", title:APPLICATIONNAME)
                self.present(alert, animated: true, completion: nil)
                
            }
        }
    }
    
    
    func downloadAccountConfigCountriesWu() {
        
        let paramaterPasing: [String:Any] = ["languageCode":LocalizationSystem.sharedInstance.getLanguage(),
                                             "type": 3]
        
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        NetWorkDataManager.sharedInstance.countryListImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            
            if errorString == nil
            {
                
               // print(resonseTal!)
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
                Global.shared.methodName = CanvasUrls.countrysList
                NetWorkDataManager.sharedInstance.callChannelException()
                let finalError = errorString?.components(separatedBy: ":")
                let alert = ViewControllerManager.displayAlert(message: finalError?[1] ?? "", title:APPLICATIONNAME)
                self.present(alert, animated: true, completion: nil)
                
                
            }
        }
        
    }
    
    
    
  
    
   
    
    func downloadAccountConfigCountriesRatePattern() {
        
        let paramaterPasing: [String:Any] = ["languageCode":LocalizationSystem.sharedInstance.getLanguage(),
                                             "type": 1]
        
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        NetWorkDataManager.sharedInstance.countryListImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
        // debugPrint(resonseTal)
            if errorString == nil
            {
                if resonseTal != nil
                {
                //    print(resonseTal!)
                
                /*     if let countres = resonseTal?.value(forKey: "countriesList") as? [[String: Any]] {
                 Global.shared.countris = Country.getCountries(countres)
                 
                 }*/
                if let countres = resonseTal?.value(forKey: "countriesList") as? [[String: Any]] {
                    //    Global.shared.countrisWUAdd = Country.getCountries(countres)
                    Global.shared.countrisAllRate = countres
                }
                if let countries = resonseTal?.value(forKey: "countriesList") as? NSArray {
                    print(countries)
                    //please check country
                    
                    
                    if let countryName = countries.value(forKey: "countryName") as? [String] {
                        Global.shared.ratePcountryNameData = countryName
                    }
                    if let countryCode = countries.value(forKey: "countryCode") as? [String] {
                        Global.shared.ratePcountryCodesData = countryCode
                    }
                    if let currency = countries.value(forKey: "countryCurrency") as? [String] {
                        Global.shared.ratePcurrencyCodesData = currency
                    }
                    if let currencyNames = countries.value(forKey: "currencyName") as? [String] {
                        Global.shared.ratePcurrencyNameData = currencyNames
                    }
                    
                    if let phoneCodes = countries.value(forKey: "phoneCode") as? [String] {
                        Global.shared.ratePphoneCodesData = phoneCodes
                    }
                    
                    for i in 0..<Global.shared.ratePcurrencyCodesData.count {
                        Global.shared.ratePpickerResponseOnlyCurrencyData.append(["value":  Global.shared.ratePcurrencyCodesData[i], "display":  Global.shared.ratePcurrencyCodesData[i]])
                    }
                    
                    for i in 0..<Global.shared.ratePcurrencyNameData.count {
                        Global.shared.ratePpickerResponseFullCurrencyNameData.append(["value":  Global.shared.ratePcurrencyNameData[i], "display":  Global.shared.ratePcurrencyNameData[i]])
                    }
                    
                    
                    for i in 0..<Global.shared.ratePcountryNameData.count {
                        Global.shared.ratePpickerResponseCountryData.append(["value": Global.shared.ratePcountryNameData[i], "display": Global.shared.ratePcountryNameData[i]])
                    }
                    
                    /*    for i in 0..<self.countryNameData.count {
                     self.pickerResponseData.append(["value": self.countryCodeData[i], "display": self.countryNameData[i]])
                     }*/
                    
                    
                }
                
                let sortedArray = Global.shared.ratePcurrencyNameData.sorted()
                 
                
                let curencyNameR = sortedArray[0]
                
                
              if let indexS = Global.shared.currencyNameData.firstIndex(of: curencyNameR)
              {
          
                self.ratePaternCurncyCode = Global.shared.currencyCodesData[indexS]
                let curncyFull  = self.ratePaternCurncyCode + " - " + curencyNameR
                 self.ratePaternDrpLbl.text = curncyFull
              }
                
                self.downloadLineChartData()
                //       print(self.pickerResponseData)
                
            }
            
            else
            {
                print(errorString!)
                self.removeSpinner()
                Global.shared.methodName = CanvasUrls.countrysList
                NetWorkDataManager.sharedInstance.callChannelException()
                let finalError = errorString?.components(separatedBy: ":")
                let alert = ViewControllerManager.displayAlert(message: finalError?[1] ?? "", title:APPLICATIONNAME)
                self.present(alert, animated: true, completion: nil)
                
            }
          }
        }
        
    }
    
    func downloadAccountConfigCountriesBank() {
        
        let paramaterPasing: [String:Any] = ["languageCode":LocalizationSystem.sharedInstance.getLanguage(),
                                             "type": 2]
        
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        NetWorkDataManager.sharedInstance.countryListImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            
            if errorString == nil
            {
                
                print(resonseTal!)
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
                NetWorkDataManager.sharedInstance.callChannelException()
                let finalError = errorString?.components(separatedBy: ":")
                let alert = ViewControllerManager.displayAlert(message: finalError?[1] ?? "", title:APPLICATIONNAME)
                self.present(alert, animated: true, completion: nil)
                
            }
        }
        
    }
    
    func downloadAccountConfigCountriesFc() {
        
        let paramaterPasing: [String:Any] = ["languageCode":LocalizationSystem.sharedInstance.getLanguage(),
                                             "type": 6]
        
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        NetWorkDataManager.sharedInstance.countryListImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            
            if errorString == nil
            {
                
               // print(resonseTal!)
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
                    if let denomination = countries.value(forKey: "denomination") as? [Int] {
                        Global.shared.denominationFCCurrency = denomination
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
                    
                    for i in 0..<Global.shared.denominationFCCurrency.count {
                        Global.shared.pickerResponseDenominationFc.append(["value": Global.shared.denominationFCCurrency[i], "display": Global.shared.denominationFCCurrency[i]])
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
                Global.shared.methodName = CanvasUrls.countrysList
                NetWorkDataManager.sharedInstance.callChannelException()
                let finalError = errorString?.components(separatedBy: ":")
                let alert = ViewControllerManager.displayAlert(message: finalError?[1] ?? "", title:APPLICATIONNAME)
                self.present(alert, animated: true, completion: nil)
                
            }
        }
        
    }
    
}

extension Date {
    
    func string(format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
    
    func asString(style: DateFormatter.Style) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = style
        return dateFormatter.string(from: self)
    }
    static func getMonthDayYearString(_ dateString: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        guard
            let userDOBDate = dateFormatter.date(from:String(dateString)) else {
            return nil
            
        }
        dateFormatter.dateFormat = "dd-MMM-yyyy h:mm a"
        return  dateFormatter.string(from: userDOBDate)
    }
    static func getMonthDayYearString2(_ dateString: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
        guard
            let userDOBDate = dateFormatter.date(from:String(dateString)) else {
            return nil
            
        }
        dateFormatter.dateFormat = "dd-MMM-yyyy h:mm a"
        return  dateFormatter.string(from: userDOBDate)
    }
    static func getMonthDayYearWithoutSecndsString(_ dateString: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        guard
            let userDOBDate = dateFormatter.date(from:String(dateString)) else {
            return nil
            
        }
        dateFormatter.dateFormat = "dd-MMM-yyyy h:mm a"
        return  dateFormatter.string(from: userDOBDate)
    }
    
    static func getMonthDayYearSecLastLogString(_ dateString: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
        guard
            let userDOBDate = dateFormatter.date(from:String(dateString)) else {
            return nil
            
        }
        dateFormatter.dateFormat = "dd-MMM-yyyy hh:mm:ss aa"
        return  dateFormatter.string(from: userDOBDate)
    }
    
    static func getMonthDayYearWithoutTime(_ dateString: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        guard
            let userDOBDate = dateFormatter.date(from:String(dateString)) else {
            return nil
            
        }
        dateFormatter.dateFormat = "dd-MMM-yyyy"
        return  dateFormatter.string(from: userDOBDate)
    }
    
}

extension String {
    func dateStrToStr(dateString: String, format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        let dateObj = dateFormatter.date(from: dateString)
        return "\(dateObj ?? Date())"
        
    }
}



extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}
extension UIColor {
    static func random() -> UIColor {
        return UIColor(
            red:   .random(),
            green: .random(),
            blue:  .random(),
            alpha: 1.0
        )
    }
}

extension UIColor {
    static func random(from colors: [UIColor]) -> UIColor? {
        return colors.randomElement()
    }
}

/*extension UIColor {
 /*  convenience init(red: Int, green: Int, blue: Int) {
 assert(red >= 0 && red <= 255, "Invalid red component")
 assert(green >= 0 && green <= 255, "Invalid green component")
 assert(blue >= 0 && blue <= 255, "Invalid blue component")
 
 self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
 }*/
 
 /* convenience init(rgb: Int) {
 self.init(
 red: (rgb >> 16) & 0xFF,
 green: (rgb >> 8) & 0xFF,
 blue: rgb & 0xFF
 )
 }*/
 
 convenience init(_ hex: String, alpha: CGFloat = 1.0) {
 var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
 
 if (cString.hasPrefix("#")) { cString.removeFirst() }
 
 if ((cString.count) != 6) {
 self.init(hex: "ff0000") // return red color for wrong hex input
 return
 }
 
 var rgbValue: UInt64 = 0
 Scanner(string: cString).scanHexInt64(&rgbValue)
 
 self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
 green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
 blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
 alpha: alpha)
 }
 }*/

extension UIView {
    
    func addDropShadowToView(targetView:UIView? ){
        targetView!.layer.masksToBounds =  false
        targetView!.layer.shadowColor = UIColor.darkGray.cgColor
        targetView!.layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
        targetView!.layer.shadowOpacity = 0.3
    }
}

extension HomeDashboardVc {
    
    func setGuideView(with title: String, subTitle: String, guideView: MaterialShowcase, targetView: UIView) {
        guideView.setTargetView(view: targetView)
        guideView.primaryText = title
        guideView.targetHolderRadius = 80
        guideView.secondaryText = subTitle
        if guideView == guideView_3 {
            guideView.backgroundRadius = 350
            guideView.targetHolderRadius = 50
            
        }
        guideView.backgroundPromptColor = ColorCodes.newAppRed
        guideView.delegate = self
        
    }
    func addGuideViews() {
        guard  !Global.dashBoardGuideView else {return}
        let titles = [Global.shared.guidedTour21!, Global.shared.guidedTour17!, Global.shared.guidedTour19!]
        let subTitles = [Global.shared.guidedTour16!, Global.shared.guidedTour18!, Global.shared.guidedTour20!]
        recentTransctnsLbl.textColor = ColorCodes.newAppRed
        
        let targetnilViews = [recentTransctnsLbl, favouriteBeneficiaryLbl, rateCalcultorLbl]
        let targetViews = targetnilViews.compactMap { $0 }
        for (index, view) in [guideView_1,guideView_2,guideView_3].enumerated() {
            setGuideView(with: titles[index], subTitle: subTitles[index], guideView: view, targetView: targetViews[index])
        }
        let oneTimeKey = UUID().uuidString
        sequence.temp(guideView_1).temp(guideView_2).temp(guideView_3
        ).setKey(key: oneTimeKey).start()
    }
}
extension HomeDashboardVc: MaterialShowcaseDelegate {
    
    
    func showCaseWillDismiss(showcase: MaterialShowcase, didTapTarget:Bool) {
        if showcase == guideView_1  {
            recentTransctnsLbl.textColor = .darkText
            favouriteBeneficiaryLbl.textColor = ColorCodes.newAppRed
        } else if showcase == guideView_2 {
            favouriteBeneficiaryLbl.textColor = .darkText
            rateCalcultorLbl.textColor = ColorCodes.newAppRed
            
        } else {
            rateCalcultorLbl.textColor = .darkText
            
        }
    }
    func showCaseDidDismiss(showcase: MaterialShowcase, didTapTarget: Bool) {
        sequence.showCaseWillDismis()
        
        if showcase == guideView_3 {
            Global.dashBoardGuideView = true
        }
        
    }
    
    
    
}
extension UIView {
    /// Remove all subview
    func removeAllSubviews() {
        subviews.forEach { $0.removeFromSuperview() }
    }
    
    /// Remove all subview with specific type
    func removeAllSubviews<T: UIView>(type: T.Type) {
        subviews
            .filter { $0.isMember(of: type) }
            .forEach { $0.removeFromSuperview() }
    }
}
class DigitValueFormatter : NSObject, ValueFormatter {

    func stringForValue(_ value: Double,
                        entry: ChartDataEntry,
                        dataSetIndex: Int,
                        viewPortHandler: ViewPortHandler?) -> String {
        let valueWithoutDecimalPart = String(format: "%.0f", value)
        return "\(valueWithoutDecimalPart)"
    }
}
class ChartValueFormatter: NSObject, ValueFormatter {
    fileprivate var numberFormatter: NumberFormatter?

    convenience init(numberFormatter: NumberFormatter) {
        self.init()
        self.numberFormatter = numberFormatter
    }

    func stringForValue(_ value: Double, entry: ChartDataEntry, dataSetIndex: Int, viewPortHandler: ViewPortHandler?) -> String {
        guard let numberFormatter = numberFormatter
            else {
                return ""
        }
        return numberFormatter.string(for: value)!
    }
}

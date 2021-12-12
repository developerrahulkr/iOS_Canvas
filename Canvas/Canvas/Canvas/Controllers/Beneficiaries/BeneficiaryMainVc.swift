//
//  BeneficiaryMainVc.swift
//  Canvas
//
//  Created by urmila reddy on 26/08/20.
//  Copyright © 2020 urmila reddy. All rights reserved.
//

import UIKit
import Alamofire

import MaterialShowcase
class BeneficiaryMainVc: BaseViewController, XMSegmentedControlDelegate, navigateToDiffrentScreenDelegate  {
    
    
    @IBOutlet weak var navHeaderLbl: UILabel!
    
    
  @IBOutlet weak var menuIcon: UIButton!
  //  @IBOutlet weak var beneficiriesLblHeader: UILabel!
    
    @IBOutlet weak var seg: XMSegmentedControl!
    var sequence = MaterialShowcaseSequence()
    lazy var guideView_1 =  MaterialShowcase()
    lazy var guideView_2 =  MaterialShowcase()
    lazy var guideView_3 =  MaterialShowcase()
    lazy var guideView_4 =  MaterialShowcase()

    @IBOutlet weak var firstView: UIView!
    
    @IBOutlet weak var secndView: UIView!
    
    @IBOutlet weak var thirdView: UIView!
    
    
    @IBOutlet weak var addBtnOtlt: UIButton!
    
    
    @IBOutlet weak var gridBtnOtlt: UIButton!
    
    
    @IBOutlet weak var listBtnOtlt: UIButton!
    
    public var menuPopUp: MenuViewController!
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        if LocalizationSystem.sharedInstance.getLanguage() == "ar" {
            let titles = [Global.shared.addWesternUnion! ,Global.shared.addCash!,Global.shared.addBank!]
            self.view.semanticContentAttribute = .forceRightToLeft
            self.seg.delegate = self
            self.seg.segmentTitle = titles
        }
        else {
        let titles = [Global.shared.addBank! ,Global.shared.addCash!,Global.shared.addWesternUnion!]
        self.seg.delegate = self
        self.seg.segmentTitle = titles
        }
        
        self.seg.selectedItemHighlightStyle=XMSelectedItemHighlightStyle.bottomEdge
        //    self.seg.segmentContent = XMSelectedItemHighlightStyle.bottomEdge
        //   let frame = CGRect(x: 0, y: 114, width: self.view.frame.width, height: 44)
        //    seg = XMSegmentedControl(frame: <#CGRect#>, segmentContent: (titles, icons), selectedItemHighlightStyle: XMSelectedItemHighlightStyle.bottomEdge)
        self.seg.backgroundColor = UIColor.white
        self.seg.highlightColor = UIColor.red
        // self.seg.tint = ColorCodes.DarkCement
        self.seg.tint = UIColor.gray
        self.seg.highlightTint = UIColor.red
        self.seg.font = UIFont.boldSystemFont(ofSize: 14)
        
        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.isHidden = true
        self.seg.backgroundColor = UIColor.white
        downloadBeneficiary()
        
        navHeaderLbl.text = Global.shared.beneficiriesHeader
        
        self.addBtnOtlt.layer.cornerRadius = self.addBtnOtlt.frame.size.width / 2;
        self.addBtnOtlt.clipsToBounds = true
        //  self.beneficiriesLblHeader.text = Global.shared.beneficiriesHeader
        if UserDefaults.exists(key: "enableListView") {
            if UserDefaults.standard.string(forKey: "enableListView")! == "list" {
                Global.shared.fromListGrid = "list"
                listBtnOtlt.setImage(UIImage(named: "listviewImg"), for: .normal)
                gridBtnOtlt.setImage(UIImage(named: "gridGrey"), for: .normal)
            }
            else {
                Global.shared.fromListGrid = "grid"
                listBtnOtlt.setImage(UIImage(named: "listGrey"), for: .normal)
                gridBtnOtlt.setImage(UIImage(named: "dashboardTab"), for: .normal)
                
               
            }
        }
        else {
            Global.shared.fromListGrid = "grid"
            listBtnOtlt.setImage(UIImage(named: "listGrey"), for: .normal)
            gridBtnOtlt.setImage(UIImage(named: "dashboardTab"), for: .normal)
        }
        
    
        
        //   menuItemsData()
    }
    
    var beneficiaryResponse = [Any]()
    
    func downloadBeneficiary() {
        
        
        
        Global.shared.refreshOrNot = "no"
        let paramaterPasing: [String:Any] = ["registrationId": Global.shared.afterLoginRegistrtnId ?? "",
                                             "status": 0, "disbursalMode": ""]
        
      self.showLoader()

        self.showSpinner(onView: self.view)
        /*   let headers: HTTPHeaders = [
         "Content-Type": "application/json"
         ]*/
        
        let headers: HTTPHeaders = [.authorization(bearerToken: UserDefaults.standard.string(forKey: "token")!)]
        
        NetWorkDataManager.sharedInstance.benefGetListImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            
            
            if errorString == nil
            {
                
                BeneficiaryDetails.shared.beneficaryBankFilteredResponse.removeAll()
                BeneficiaryDetails.shared.beneficaryCashFilteredResponse.removeAll()
                BeneficiaryDetails.shared.beneficaryWuFilteredResponse.removeAll()
                
               self.beneficiaryResponse.removeAll()
               self.removeLoader()
                self.removeSpinner()
                print(resonseTal!)
                if let faqList = resonseTal?.value(forKey: "beneficiariesResponseList") as? NSArray {
                   // print(faqList)
                    self.beneficiaryResponse = faqList as! [Any]
                    for i in 0 ..< self.beneficiaryResponse.count {
                        
                        let eachObj = self.beneficiaryResponse[i] as?NSDictionary
                        
                        if let beneficiaryType = eachObj?.value(forKey: "beneficiaryType") as?Int
                        {
                            if (beneficiaryType == 100)
                            {
                                // if let dataDict = eachObj {
                                BeneficiaryDetails.shared.beneficaryBankFilteredResponse.append(eachObj!)
                               // print(self.beneficaryBankFilteredResponse)
                             
                        }
                            if (beneficiaryType == 101)
                            {
                                // if let dataDict = eachObj {
                                BeneficiaryDetails.shared.beneficaryCashFilteredResponse.append(eachObj!)
                               // print(self.beneficaryBankFilteredResponse)
                             
                        }
                            if (beneficiaryType == 102)
                            {
                                // if let dataDict = eachObj {
                                BeneficiaryDetails.shared.beneficaryWuFilteredResponse.append(eachObj!)
                               // print(self.beneficaryBankFilteredResponse)
                             
                        }
                            self.menuItemsData()
                    }
                }
              
               
               
            }
                let statusMsg = resonseTal?.value(forKey: "statusMessage") as? String
                let statusCode = resonseTal?.value(forKey: "statusCodes") as? Int

                if statusCode ==  400 {
                    let alert = ViewControllerManager.displayAlert(message: statusMsg ?? "", title:APPLICATIONNAME)
                    self.present(alert, animated: true, completion: nil)
                }
            }
                
            else
            {
                            print(errorString!)
                         //   self.removeLoader()
                            self.removeSpinner()
                          /*  let finalError = errorString?.components(separatedBy: ":")
                            let alert = ViewControllerManager.displayAlert(message: finalError?[1] ?? "", title:APPLICATIONNAME)
                            self.present(alert, animated: true, completion: nil)*/
                            if errorString == "Response could not be serialized, input data was nil or zero length." {
                                Global.shared.timeoUtOrNot = "no"
                                self.showAlertForTimer(titulo: "", mensagem: Global.shared.sessionTimedOutTxt, vc: self)
//                                let refreshAlert = UIAlertController(title: "", message: Global.shared.sessionTimedOutTxt, preferredStyle: UIAlertController.Style.alert)
//                                refreshAlert.view.tintColor = ColorCodes.newAppRed
//                                refreshAlert.addAction(UIAlertAction(title: Global.shared.okTxt, style: .default, handler: { (action: UIAlertAction!) in
//                                   self.pushViewController(controller: LoginVc.initiateController())
//                                }))
//
//                                self.present(refreshAlert, animated: true, completion: nil)
                            }
                            
                            else {
                                let alert = ViewControllerManager.displayAlert(message: errorString ?? "", title:APPLICATIONNAME)
                                self.present(alert, animated: true, completion: nil)
                            }
                           
                            
                        }

        }
    }
    
   func navigateToDiffrentScreenDelegate(toWhichScreenWeAreNaviagting : String)
      {
          print(toWhichScreenWeAreNaviagting)
         if toWhichScreenWeAreNaviagting == Global.shared.menuBeneficiary {
           
          }
         else{
             MenuScreenShow(screen:toWhichScreenWeAreNaviagting)
         }
              
         
          
      }
    
    /*  @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
     if let swipeGesture = gesture as? UISwipeGestureRecognizer {
     switch swipeGesture.direction {
     case UISwipeGestureRecognizer.Direction.right:
     print("Swiped right")
     
     print(self.seg.selectedSegment)
     
     print(self.seg.selectedSegment - 1)
     
     self.seg.selectedSegment = (self.seg.selectedSegment - 1) % 3
     print( self.seg.selectedSegment)
     
     if(self.seg.selectedSegment == -1){
     self.seg.selectedSegment = 3 - 1
     }
     print(self.seg.selectedSegment)
     
     xmSegmentedControl(self.seg, selectedSegment: self.seg.selectedSegment)
     
     case UISwipeGestureRecognizer.Direction.down:
     print("Swiped down")
     
     case UISwipeGestureRecognizer.Direction.left:
     print("Swiped left")
     
     self.seg.selectedSegment = (self.seg.selectedSegment + 1) % 3
     xmSegmentedControl(self.seg, selectedSegment: self.seg.selectedSegment)
     
     case UISwipeGestureRecognizer.Direction.up:
     
     print("Swiped up")
     default:
     break
     }
     }
     }*/
    
    
    func menuItemsData()  {
        if LocalizationSystem.sharedInstance.getLanguage() == "ar" {
            let titles = [Global.shared.addWesternUnion! ,Global.shared.addCash!,Global.shared.addBank!]
            self.view.semanticContentAttribute = .forceRightToLeft
            self.seg.delegate = self
            self.seg.segmentTitle = titles
        }
        else {
        let titles = [Global.shared.addBank! ,Global.shared.addCash!,Global.shared.addWesternUnion!]
        self.seg.delegate = self
        self.seg.segmentTitle = titles
        }
        
        self.seg.selectedItemHighlightStyle=XMSelectedItemHighlightStyle.bottomEdge
        //    self.seg.segmentContent = XMSelectedItemHighlightStyle.bottomEdge
        //   let frame = CGRect(x: 0, y: 114, width: self.view.frame.width, height: 44)
        //    seg = XMSegmentedControl(frame: <#CGRect#>, segmentContent: (titles, icons), selectedItemHighlightStyle: XMSelectedItemHighlightStyle.bottomEdge)
        self.seg.backgroundColor = UIColor.white
        self.seg.highlightColor = UIColor.red
        // self.seg.tint = ColorCodes.DarkCement
        self.seg.tint = UIColor.gray
        self.seg.highlightTint = UIColor.red
        self.seg.font = UIFont.boldSystemFont(ofSize: 12)
        if LocalizationSystem.sharedInstance.getLanguage() == "ar" {
            firstView.isHidden = true
            secndView.isHidden = true
            thirdView.isHidden = false
        }
        else {
        firstView.isHidden = false
        secndView.isHidden = true
        thirdView.isHidden = true
        }
        
        if let vcOne = children.filter({$0 is BeneficiaryFirstTabVc}).first as? BeneficiaryFirstTabVc {
            vcOne.viewDidLoad()
        }
            if let vcTwo = children.filter({$0 is BeneficiarySecndTabVc}).first as? BeneficiarySecndTabVc {
                vcTwo.viewDidLoad()
            }
                if let vcThree = children.filter({$0 is BeneficiaryThirdTabVc}).first as? BeneficiaryThirdTabVc {
                    vcThree.viewDidLoad()
                }
        
      //  self.removeLoader()
        self.removeSpinner()
        /*   let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
         swipeRight.direction = UISwipeGestureRecognizer.Direction.right
         self.view.addGestureRecognizer(swipeRight)
         
         let swipeletf = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
         swipeletf.direction = UISwipeGestureRecognizer.Direction.left
         self.view.addGestureRecognizer(swipeletf)*/
        
   /*     DispatchQueue.main.async {
             self.removeSpinner()
        }*/
       
    }
    
    
    //MARK:- SLIDE TO CHANGHE SEGMENT METHODS
    func xmSegmentedControl(_ xmSegmentedControl: XMSegmentedControl, selectedSegment: Int) {
        if LocalizationSystem.sharedInstance.getLanguage() == "ar" {
            if xmSegmentedControl == seg {
                print("SegmentedControl1 Selected Segment: \(selectedSegment)")
                //duelsView.isHidden=false
                switch selectedSegment {
                case 0:
                    // saapView.isHidden=false
                    firstView.isHidden = true
                    secndView.isHidden = true
                    thirdView.isHidden = false
                    
                    if let vc = children.filter({$0 is BeneficiaryFirstTabVc}).first as? BeneficiaryFirstTabVc {
                        vc.viewWillAppear(true)
                        
                           }
                    
                    
                case 1:
                    
                    firstView.isHidden = true
                    secndView.isHidden = false
                    thirdView.isHidden = true
                    
                    if let vc = children.filter({$0 is BeneficiarySecndTabVc}).first as? BeneficiarySecndTabVc {
                        vc.viewWillAppear(true)
                           }
                    
                case 2:
                    
                    firstView.isHidden = false
                    secndView.isHidden = true
                    thirdView.isHidden = true
                    
                    if let vc = children.filter({$0 is BeneficiaryThirdTabVc}).first as? BeneficiaryThirdTabVc {
                         vc.viewWillAppear(true)
                           }
                    
                default:
                    
                    break
                }
            }
        }
        else {
        if xmSegmentedControl == seg {
            print("SegmentedControl1 Selected Segment: \(selectedSegment)")
            //duelsView.isHidden=false
            switch selectedSegment {
            case 0:
                // saapView.isHidden=false
                firstView.isHidden = false
                secndView.isHidden = true
                thirdView.isHidden = true
                
                if let vc = children.filter({$0 is BeneficiaryFirstTabVc}).first as? BeneficiaryFirstTabVc {
                    vc.viewWillAppear(true)
                    
                       }
                
                
            case 1:
                
                firstView.isHidden = true
                secndView.isHidden = false
                thirdView.isHidden = true
                
                if let vc = children.filter({$0 is BeneficiarySecndTabVc}).first as? BeneficiarySecndTabVc {
                    vc.viewWillAppear(true)
                       }
                
            case 2:
                
                firstView.isHidden = true
                secndView.isHidden = true
                thirdView.isHidden = false
                
                if let vc = children.filter({$0 is BeneficiaryThirdTabVc}).first as? BeneficiaryThirdTabVc {
                     vc.viewWillAppear(true)
                       }
                
            default:
                
                break
            }
        }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //  self.showSpinner(onView: self.view)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
  override func viewDidAppear(_ animated: Bool) {
    
    super.viewDidAppear(animated)
    Global.shared.timeoUtOrNot = "yes"
    observeTimeout()
    addGuideViews()
  }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    
    @IBAction func addBtnActn(_ sender: Any) {
        //  self.hidesBottomBarWhenPushed = true
        
        
//        let dateFormatter : DateFormatter = DateFormatter()
//        //  dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
//        dateFormatter.dateFormat = "dd/MM/yyyy"
//        let date = Date()
//        let dateString = dateFormatter.string(from: date)
//        let interval = date.timeIntervalSince1970
        
        
//        //Ref date
       let civilExpDate = UserDefaults.standard.string(forKey: "civilIDExpiryDate")!
//
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "MM/dd/yyyy"
//        let someDate = dateFormatter.date(from: civilExpDate)
//
//        //Get calendar
//        let dateFormatter1 = DateFormatter()
//
//        dateFormatter1.dateFormat = "dd/MM/yyyy"
//
//        let currentDate = dateFormatter1.string(from: Date())
//
//        print(someDate, currentDate)
        let expiryDate = civilExpDate // Jan 10 2020

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"

        if Date() < dateFormatter.date(from: expiryDate) ?? Date() {
            print("Not Yet expiryDate")
            let remiterStatus = UserDefaults.standard.string(forKey: "remitterStatus")!
            if remiterStatus == "1" {
                print("nothing")
                if firstView.isHidden == false &&  secndView.isHidden == true && thirdView.isHidden == true {
                  self.pushViewController(controller: BeneficiaryBankTransferVc.initiateController())
                    
                } else if firstView.isHidden == true && secndView.isHidden == false && thirdView.isHidden == true {
                  self.pushViewController(controller: BeneficiaryCashTransferVc.initiateController())
                    
                }  else if firstView.isHidden == true && secndView.isHidden == true && thirdView.isHidden == false {
                    
                 /*   if Global.shared.fraudRemovePopUpWu == "AddDisable" {
                        print("do nothing")
                    }
                    else {*/
                        Global.shared.fraudPopUpDirectWu = "Direct"
                      //  Global.shared.fraudRemovePopUpWu = "AddDisable"
                        let popOverVC = self.storyboard?.instantiateViewController(withIdentifier: "WuFirstTermsConditions") as! WuFirstTermsConditions
                                      self.addChild(popOverVC)
                                      popOverVC.view.frame = self.view.frame
                                      self.view.addSubview(popOverVC.view)
                                      popOverVC.didMove(toParent: self)
                 //   }
                   
                //  self.pushViewController(controller: BenefWuDirectTransferVc.initiateController())

                }
                
            }
            else {
                let alert = ViewControllerManager.displayAlert(message: UserDefaults.standard.string(forKey: "remitterStatusMessage")!, title:APPLICATIONNAME)
                self.present(alert, animated: true, completion: nil)
            }
        } else {
            let refreshAlert = UIAlertController(title: "", message: "Your CIVIL ID is expired. Click 'Here' (or) Please visit nearest Al Muzaini branch to update your CIVIL ID.", preferredStyle: UIAlertController.Style.alert)

            refreshAlert.addAction(UIAlertAction(title: "Here", style: .default, handler: { (action: UIAlertAction!) in
                 // print("Handle Ok logic here")
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "UpdateCivilIDController") as! UpdateCivilIDController
                self.navigationController?.pushViewController(vc, animated: true)
            }))

            refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
                  print("Handle Cancel Logic here")
            }))

            self.present(refreshAlert, animated: true, completion: nil)
//            let alert = ViewControllerManager.displayAlert(message: "Remitter cannot Add Beneficiary due to CivilID Expired", title:APPLICATIONNAME)
//            self.present(alert, animated: true, completion: nil)
        }
        
       
   /*     if firstView.isHidden == false &&  secndView.isHidden == true && thirdView.isHidden == true {
          self.pushViewController(controller: BeneficiaryBankTransferVc.initiateController())
            
        } else if firstView.isHidden == true && secndView.isHidden == false && thirdView.isHidden == true {
          self.pushViewController(controller: BeneficiaryCashTransferVc.initiateController())
            
        }  else if firstView.isHidden == true && secndView.isHidden == true && thirdView.isHidden == false {
          self.pushViewController(controller: BenefWuDirectTransferVc.initiateController())

        }*/
        
        
        
        /*  let vc = self.storyboard?.instantiateViewController(identifier: "BeneficiaryAddVc") as! BeneficiaryAddVc
         self.navigationController?.pushViewController(vc, animated: true)*/
    }
    
    
    
    /*  @IBAction func getTransctnActn(_ sender: Any) {
     
     }*/
    
    
    
    @IBAction func listActn(_ sender: Any) {
        
      /* listBtnOtlt.isUserInteractionEnabled = true
               gridBtnOtlt.isUserInteractionEnabled = false*/
               
               
               listBtnOtlt.setImage(UIImage(named: "listviewImg"), for: .normal)
               gridBtnOtlt.setImage(UIImage(named: "gridGrey"), for: .normal)
        
        UserDefaults.standard.set("list", forKey: "enableListView")
       //  self.viewDidLoad()
        Global.shared.fromListGrid = "list"
        if let vc = children.filter({$0 is BeneficiaryFirstTabVc}).first as? BeneficiaryFirstTabVc {
          /*   vc.showSpinner(onView: vc.view)
            vc.viewDidLoad()
            vc.removeSpinner()*/
            vc.viewWillAppear(true)
            
        }
        if let vc = children.filter({$0 is BeneficiarySecndTabVc}).first as? BeneficiarySecndTabVc {
           /*  vc.showSpinner(onView: vc.view)
            vc.viewDidLoad()
            vc.removeSpinner()*/
            vc.viewWillAppear(true)
        }
        if let vc = children.filter({$0 is BeneficiaryThirdTabVc}).first as? BeneficiaryThirdTabVc {
          /*   vc.showSpinner(onView: vc.view)
            vc.viewDidLoad()
            vc.removeSpinner()*/
            vc.viewWillAppear(true)
        }
        
        
        
    }
    
    @IBAction func gridAction(_ sender: Any) {
        
        listBtnOtlt.setImage(UIImage(named: "listGrey"), for: .normal)
               gridBtnOtlt.setImage(UIImage(named: "dashboardTab"), for: .normal)
               
            /*   listBtnOtlt.isUserInteractionEnabled = false
               gridBtnOtlt.isUserInteractionEnabled = true*/
        
       
        
        UserDefaults.standard.set("grid", forKey: "enableListView")
        Global.shared.fromListGrid = "grid"
        
     //   self.viewDidLoad()
       if let vc = children.filter({$0 is BeneficiaryFirstTabVc}).first as? BeneficiaryFirstTabVc {
         //   vc.showSpinner(onView: vc.view)
        vc.viewWillAppear(true)
        }
        if let vc = children.filter({$0 is BeneficiarySecndTabVc}).first as? BeneficiarySecndTabVc {
         //    vc.showSpinner(onView: vc.view)
            vc.viewWillAppear(true)
        }
        if let vc = children.filter({$0 is BeneficiaryThirdTabVc}).first as? BeneficiaryThirdTabVc {
        //     vc.showSpinner(onView: vc.view)
            vc.viewWillAppear(true)
        }
        
    }
    
    /*  func listActnnnn() {
     let name = "list"
     let gridVal = "false"
     
     self.delegate.valuesChanged(firstName: name, mobileNumber: gridVal)
     }
     
     func gridActnnnn() {
     let name = "grid"
     let gridVal = "true"
     self.delegate.valuesChanged(firstName: name, mobileNumber: gridVal)
     }*/
    
    
    @IBAction func menuBtnActn(_ sender: Any) {
        /*   let pickerData = Global.shared.pickerResponseLanguge
         PickerDialog().show(title: "", options: pickerData , selected: "") {
         (value) -> Void in
         let langcode = "\(value)"
         if langcode == "English" {
         LocalizationSystem.sharedInstance.setLanguage(languageCode: "en")
         UIView.appearance().semanticContentAttribute = .forceLeftToRight
         //  UITextField.appearance().semanticContentAttribute = UISemanticContentAttribute.forceLeftToRight
         // self.languageLbl.text = "English"
         }
         else {
         LocalizationSystem.sharedInstance.setLanguage(languageCode: "ar")
         UIView.appearance().semanticContentAttribute = .forceRightToLeft
         //    UITextField.appearance().semanticContentAttribute = UISemanticContentAttribute.forceRightToLeft
         //  self.languageLbl.text = "عربى"
         }
         
         
         //  UIApplication.shared.keyWindow?.rootViewController = self.storyboard?.instantiateInitialViewController()
         
         UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.rootViewController = self.storyboard?.instantiateInitialViewController()*/
        
        
        menuPopUp = self.storyboard?.instantiateViewController(withIdentifier: "MenuViewController") as? MenuViewController
        
        menuPopUp.delegateObj = self
        self.addChild(menuPopUp)
        menuPopUp.view.frame = self.view.frame
        self.view.addSubview(menuPopUp.view)
        menuPopUp.didMove(toParent: self)
        
        
    }
    
    
    
    @IBAction func languageActn(_ sender: Any) {
        Global.shared.languageChangeActn()
    }
    
    
    
    @IBAction func logoutActn(_ sender: Any) {
        logout()
//        let refreshAlert = UIAlertController(title: Global.shared.logoutHeaderTxt, message: Global.shared.logoutTxt, preferredStyle: UIAlertController.Style.alert)
//        refreshAlert.view.tintColor = ColorCodes.newAppRed
//        refreshAlert.addAction(UIAlertAction(title: Global.shared.yesTxt, style: .default, handler: { (action: UIAlertAction!) in
//           self.pushViewController(controller: LoginVc.initiateController())
//        }))
//
//        refreshAlert.addAction(UIAlertAction(title: Global.shared.noTxt, style: .default, handler: { (action: UIAlertAction!) in
//            print("Handle Cancel Logic here")
//              refreshAlert.dismiss(animated: true, completion: nil)
//
//        }))
//
//        present(refreshAlert, animated: true, completion: nil)
    }
    
    
    
}


extension BeneficiaryMainVc {
   
  func addGuideViews() {
    guard  !Global.benficiaryGuideView else {return}
    guideView_1.setTargetView(view: addBtnOtlt)
    guideView_1.primaryText = Global.shared.guidedTour1!
    guideView_1.secondaryText = Global.shared.guidedTour2!
    guideView_1.shouldSetTintColor = false // It should be set to false when button uses image.
    guideView_1.backgroundPromptColor = ColorCodes.newAppRed
    guideView_1.isTapRecognizerForTargetView = false
    
   
    guideView_2.setTargetView(view: getSegmentedView() ?? seg)
    guideView_2.primaryText = Global.shared.guidedTour3!
    guideView_2.secondaryText = Global.shared.guidedTour4!
    guideView_2.isTapRecognizerForTargetView = true
    guideView_2.backgroundPromptColor = ColorCodes.newAppRed
    guideView_2.isTapRecognizerForTargetView = false
    
    
    guideView_3
      .setTargetView(view: listBtnOtlt)
    guideView_3
      .primaryText = Global.shared.guidedTour5!
    guideView_3
      .secondaryText = Global.shared.guidedTour6!
    if LocalizationSystem.sharedInstance.getLanguage() == "ar" {
        guideView_3.backgroundRadius = 200
        guideView_3.targetHolderRadius = 40
    }
    else {
        guideView_3.backgroundRadius = 260
        guideView_3.targetHolderRadius = 40
    }
   
    guideView_3
      .shouldSetTintColor = false // It should be set to false when button uses image.
    guideView_3
      .backgroundPromptColor = ColorCodes.newAppRed
    guideView_3
      .isTapRecognizerForTargetView = false
    
    
    guideView_4.setTargetView(view: menuIcon)
    guideView_4.backgroundViewType = .circle
    guideView_4.primaryText = Global.shared.guidedTour7!
    guideView_4.backgroundRadius = 200
    guideView_4.secondaryText = Global.shared.guidedTour8!
    guideView_4.isTapRecognizerForTargetView = false
    guideView_4.shouldSetTintColor = false // It should be set to false when button uses image.
    guideView_4.backgroundPromptColor = ColorCodes.newAppRed
    
    
    guideView_1.delegate = self
    guideView_2.delegate = self
    guideView_3.delegate = self
    guideView_4.delegate = self
    
    
    
    // With one key, the showcase sequence only shows one time
    // So, for this demo, it is better to create a random key
    let oneTimeKey = UUID().uuidString
    sequence.temp(guideView_1).temp(guideView_2).temp(guideView_3
    ).temp(guideView_4).setKey(key: oneTimeKey).start()
  }
}


// If you need handle other actions (i.e: show other showcase), you can implement MaterialShowcaseDelegate
extension BeneficiaryMainVc: MaterialShowcaseDelegate {
   func showCaseWillDismiss(showcase: MaterialShowcase, didTapTarget:Bool) {
    if showcase == guideView_3  {
      menuIcon.isHidden = false

    }
  }
  func showCaseDidDismiss(showcase: MaterialShowcase, didTapTarget: Bool) {
    sequence.showCaseWillDismis()
     
    if showcase == guideView_4 {
      menuIcon.isHidden = true
      Global.benficiaryGuideView = true
    }
  }
  func getSegmentedView() -> UIButton? {
    var button: UIButton?
       seg.subviews.forEach { (view) in
         if view is UIButton {
           let btn = view as! UIButton
           if  btn.titleLabel?.text == "Cash transfer" {
             button = btn
           }
           
         }
       }
    return button
  }
    
   
    
}


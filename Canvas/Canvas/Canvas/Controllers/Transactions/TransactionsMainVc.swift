//
//  TransactionsMainVc.swift
//  Canvas
//
//  Created by urmila reddy on 02/11/20.
//  Copyright © 2020 urmila reddy. All rights reserved.
//

import UIKit
import MaterialShowcase
import Alamofire
class TransactionsMainVc: UIViewController, XMSegmentedControlDelegate, navigateToDiffrentScreenDelegate   {
  var sequence = MaterialShowcaseSequence()
   lazy var guideView_1 =  MaterialShowcase()
   lazy var guideView_2 =  MaterialShowcase()
   lazy var guideView_3 =  MaterialShowcase()
   lazy var guideView_4 =  MaterialShowcase()
    
    
  @IBOutlet weak var navgtnHeaderLbl: UILabel!
  
  @IBOutlet weak var transctionGuideLbl: UILabel!
 
  
    @IBOutlet weak var btn_tips: UIButton!
    
  @IBOutlet weak var seg: XMSegmentedControl!
  
  @IBOutlet weak var firstView: UIView!
  
  @IBOutlet weak var secndView: UIView!
  
  public var menuPopUp: MenuViewController!
    
    var helpVideoList = [[String: Any]]()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
    // Do any additional setup after loading the view.
    
    
    
    self.navigationController?.navigationBar.isHidden = true
    
    
    menuItemsData()
    assigningLabels()
    btn_tips.isHidden = true
    getHelpList()
  }
    
    func assigningLabels() {
        navgtnHeaderLbl.text =  Global.shared.menuTransactions
    }
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    Global.shared.timeoUtOrNot = "yes"
    observeTimeout() 
    
    addGuideViews()
  }
  func menuItemsData()  {
    self.removeSpinner()
   // let titles = ["Transactions by period" ,"Transactions by Date"]
    let titles = [Global.shared.transctionByPeriodTxt ?? "" ,Global.shared.transactionByDateTxt ?? ""]
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
    
    self.removeSpinner()
  }
  
  
  //MARK:- SLIDE TO CHANGHE SEGMENT METHODS
  func xmSegmentedControl(_ xmSegmentedControl: XMSegmentedControl, selectedSegment: Int) {
    
    if xmSegmentedControl == seg {
      print("SegmentedControl1 Selected Segment: \(selectedSegment)")
      
      switch selectedSegment {
      case 0:
        
        firstView.isHidden = false
        secndView.isHidden = true
        
      case 1:
        
        firstView.isHidden = true
        secndView.isHidden = false
        
      default:
        
        break
      }
    }
  }
  
  
  func navigateToDiffrentScreenDelegate(toWhichScreenWeAreNaviagting : String)
  {
    print(toWhichScreenWeAreNaviagting)
    
    

   if toWhichScreenWeAreNaviagting == Global.shared.menuTransactions{
    //  self.pushViewController(controller: TransactionsMainVc.initiateController())
     //   self.tabBarController?.selectedIndex = 2
      
    }
   else{
       MenuScreenShow(screen:toWhichScreenWeAreNaviagting)
   }
      
   
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.setNavigationBarHidden(true, animated: animated)
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    navigationController?.setNavigationBarHidden(false, animated: animated)
  }
    func getHelpList() {
        let paramaterPasing: [String:Any] = [
              "helpTypes": 3,
              "language": LocalizationSystem.sharedInstance.getLanguage(),
              "screen": 3,
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
                    self.helpVideoList = helpVideoList as! [[String : Any]]
                    
                    if self.helpVideoList.count != 0
                    {
                        self.btn_tips.isHidden = false
                    }
                    else
                    {
                        self.btn_tips.isHidden = true
                    }
                    
                    print("helpAction1",self.helpVideoList)

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
    @IBAction func onClickTipBtn(_ sender: Any) {
        if let viewController = self.storyboard?.instantiateViewController(withIdentifier: "ToolTipListController") as? ToolTipListController {
            viewController.helpVideoList = helpVideoList
            var index = 0
            var height = 0
            while index < helpVideoList.count {
               print( "Value of index is \(index)")
                if index == 0
                {
                    height = height + 40
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
    
  @IBAction func menuActn(_ sender: Any) {
    menuPopUp = self.storyboard?.instantiateViewController(withIdentifier: "MenuViewController") as? MenuViewController
    
    menuPopUp.delegateObj = self
    self.addChild(menuPopUp)
    menuPopUp.view.frame = self.view.frame
    self.view.addSubview(menuPopUp.view)
    menuPopUp.didMove(toParent: self)
  }
  
  @IBAction func languageChangeActn(_ sender: Any) {
    Global.shared.languageChangeActn()
  }
  
  //logout
  @IBAction func logoutActn(_ sender: Any) {
    logout()
//    let refreshAlert = UIAlertController(title: Global.shared.logoutHeaderTxt, message: Global.shared.logoutTxt, preferredStyle: UIAlertController.Style.alert)
//    refreshAlert.view.tintColor = ColorCodes.newAppRed
//    refreshAlert.addAction(UIAlertAction(title: Global.shared.yesTxt, style: .default, handler: { (action: UIAlertAction!) in
//       self.pushViewController(controller: LoginVc.initiateController())
//    }))
//
//    refreshAlert.addAction(UIAlertAction(title: Global.shared.noTxt, style: .default, handler: { (action: UIAlertAction!) in
//        print("Handle Cancel Logic here")
//          refreshAlert.dismiss(animated: true, completion: nil)
//
//    }))
//
//    present(refreshAlert, animated: true, completion: nil)
    
  }
  
  
}

extension TransactionsMainVc {
  
  func setGuideView(with title: String, subTitle: String, guideView: MaterialShowcase, targetView: UIView) {
    guideView.setTargetView(view: targetView)
    guideView.primaryText = title
    guideView.targetHolderRadius = 80
    guideView.secondaryText = subTitle
    if LocalizationSystem.sharedInstance.getLanguage() == "ar" {
        if guideView == guideView_3 {
            guideView.backgroundRadius = 350
            guideView.targetHolderRadius = 50
            
        }
        else {
            print("nothing")
        }
    }
    else {
        if guideView == guideView_3 {
            guideView.backgroundRadius = 360
            guideView.targetHolderRadius = 40
            
        }
        else {
            print("nothing")
        }
        
    }
    
    guideView.backgroundPromptColor = ColorCodes.newAppRed
    guideView.delegate = self
  }
  func getSegmentedView() -> UIButton? {
    var button: UIButton?
       seg.subviews.forEach { (view) in
         if view is UIButton {
           let btn = view as! UIButton
           if  btn.titleLabel?.text == Global.shared.transctionByPeriodTxt ?? "" {
             button = btn
           }
           
         }
       }
    return button
  }
   
func addGuideViews() {
  guard  !Global.transGuideView else {return}
  
  let guidetitles = [Global.shared.guidedTour21!, Global.shared.guidedTour23!, Global.shared.guidedTour25!]
  let subTitles = [Global.shared.guidedTour22!, Global.shared.guidedTour24!, Global.shared.guidedTour26!]
  let downloadBtn =  view.viewWithTag(100)

   let targetnilViews = [seg, getSegmentedView(),downloadBtn]
  let targetViews = targetnilViews.compactMap { $0 }
  for (index, view) in [guideView_1,guideView_2,guideView_3].enumerated() {
    setGuideView(with: guidetitles[index], subTitle: subTitles[index], guideView: view , targetView: targetViews[index])
  }
  let oneTimeKey = UUID().uuidString
  sequence.temp(guideView_1).temp(guideView_2).temp(guideView_3
  ).setKey(key: oneTimeKey).start()
}
}
extension TransactionsMainVc: MaterialShowcaseDelegate {
  
  
   func showCaseWillDismiss(showcase: MaterialShowcase, didTapTarget:Bool) {
  
  }
  func showCaseDidDismiss(showcase: MaterialShowcase, didTapTarget: Bool) {
    sequence.showCaseWillDismis()

    if showcase == guideView_3 {
      Global.transGuideView = true
    }
  
}

}

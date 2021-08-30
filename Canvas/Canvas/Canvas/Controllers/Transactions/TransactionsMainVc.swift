//
//  TransactionsMainVc.swift
//  Canvas
//
//  Created by urmila reddy on 02/11/20.
//  Copyright © 2020 urmila reddy. All rights reserved.
//

import UIKit
import MaterialShowcase
class TransactionsMainVc: UIViewController, XMSegmentedControlDelegate, navigateToDiffrentScreenDelegate   {
  var sequence = MaterialShowcaseSequence()
   lazy var guideView_1 =  MaterialShowcase()
   lazy var guideView_2 =  MaterialShowcase()
   lazy var guideView_3 =  MaterialShowcase()
   lazy var guideView_4 =  MaterialShowcase()
    
    
  @IBOutlet weak var navgtnHeaderLbl: UILabel!
  
  @IBOutlet weak var transctionGuideLbl: UILabel!
 
  
  
  @IBOutlet weak var seg: XMSegmentedControl!
  
  @IBOutlet weak var firstView: UIView!
  
  @IBOutlet weak var secndView: UIView!
  
  public var menuPopUp: MenuViewController!
    
    
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
    // Do any additional setup after loading the view.
    
    
    
    self.navigationController?.navigationBar.isHidden = true
    
    
    menuItemsData()
    assigningLabels()
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

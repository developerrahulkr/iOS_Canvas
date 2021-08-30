//AllExtensions.swift
//  UIViewController+Extension.swift
//  Canvas
//
//  Created by Varun Peddi on 18/12/20.
//  Copyright © 2020 urmila reddy. All rights reserved.
//

import UIKit

extension UIViewController {
  
  static func initiateController<T>()-> T {
    let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
     let controller = storyBoard.instantiateViewController(withIdentifier: String(describing: self)) as? T
  
    return controller!
  }
  func pushViewController(controller: UIViewController, isGestureEnable: Bool = true, animated: Bool = true) {
    self.navigationController?.pushViewController(controller, animated: animated)
    self.navigationController?.interactivePopGestureRecognizer?.isEnabled = isGestureEnable

  }
  func presentController(presentationStyle style: UIModalPresentationStyle = .fullScreen, controller: UIViewController) {
    controller.modalPresentationStyle  = style
    self.present(controller, animated: true, completion: nil)
   
  }
    
    func MenuScreenShow(screen:String){
        if screen == Global.shared.menuDashboard {
          //  let homeDashboardVC: HomeDashboardVc  = .initiateController()
            self.tabBarController?.selectedIndex = 0
           // self.pushViewController(controller: homeDashboardVC)
        }
        else if screen == Global.shared.menuBeneficiary {
           // let beneficiaryMainVc: BeneficiaryMainVc  = .initiateController()
           // self.pushViewController(controller: beneficiaryMainVc)
            self.tabBarController?.selectedIndex = 1
        }
        else if screen == Global.shared.menuTransactions{
          //  let transactionsMainVc: TransactionsMainVc  = .initiateController()
          //  self.pushViewController(controller: transactionsMainVc)
            self.tabBarController?.selectedIndex = 2
        }
        else if screen == Global.shared.menuProfile{
           // let profileVc: ProfileVc  = .initiateController()
           // self.pushViewController(controller: profileVc)
            self.tabBarController?.selectedIndex = 3
        }
        else if screen == Global.shared.transactionsQuickSend{
            
        }
        else if screen == Global.shared.loginChat{

         //   let vc = self.storyboard?.instantiateViewController(withIdentifier: "ChatController") as! ChatController
          //  self.navigationController?.pushViewController(vc, animated: true)
            let alert = ViewControllerManager.displayAlert(message: Global.shared.featureAddedSoonTxt , title:APPLICATIONNAME)
            //  let alert = ViewControllerManager.displayAlert(message:"Please enter valid email", title:APPLICATIONNAME)
            self.present(alert, animated: true, completion: nil)
            
        }
        else if screen == Global.shared.ourBranches {
            let branchLocatorFirstVC: BranchLocatorFirstVc  = .initiateController()
            self.pushViewController(controller: branchLocatorFirstVC)
        }
        else if screen == Global.shared.faqTxt {
            
            let faqVc: FaqVc  = .initiateController()
            self.pushViewController(controller: faqVc)
            
        }
        else if screen == Global.shared.rateCalculatorHeader {
            let rateTabsCalculatorVc: RateTabsCalculatorVc  = .initiateController()
            self.pushViewController(controller: rateTabsCalculatorVc)
            
        }
        else if screen ==  Global.shared.menuRateThisAppString {
            let alert = ViewControllerManager.displayAlert(message: Global.shared.featureAddedSoonTxt , title:APPLICATIONNAME)
            //  let alert = ViewControllerManager.displayAlert(message:"Please enter valid email", title:APPLICATIONNAME)
            self.present(alert, animated: true, completion: nil)
            
        }
        else if screen == Global.shared.menuMessages{
            
        }
        else if screen ==  Global.shared.menuContact{
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ContactUsVc") as! ContactUsVc
            
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
        else if screen ==  Global.shared.menuRateAlert{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "RateAlertVc") as! RateAlertVc
            
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
        else if screen ==  Global.shared.menuFeedback{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "FeedbackVc") as! FeedbackVc
            
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
        else if screen ==  Global.shared.menuChangePaswd{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ChangePaswdVc") as! ChangePaswdVc
            
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
    }
}
var vSpinner : UIView?

extension UIViewController {
  func showSpinner(onView : UIView) {
    let spinnerView = UIView.init(frame: onView.bounds)
    spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
    let logoGifImageView: UIImageView = {
      guard let gifImage = try? UIImage(gifName: "spinner.gif") else {
        return UIImageView()
      }
      return UIImageView(gifImage: gifImage)
    }()
    
    
    func addGifView(onView: UIView) {
      onView.addSubview(logoGifImageView)
      logoGifImageView.translatesAutoresizingMaskIntoConstraints = false
      logoGifImageView.centerXAnchor.constraint(equalTo: onView.centerXAnchor).isActive = true
      logoGifImageView.centerYAnchor.constraint(equalTo: onView.centerYAnchor).isActive = true
      logoGifImageView.widthAnchor.constraint(equalToConstant: 75).isActive = true
      logoGifImageView.heightAnchor.constraint(equalToConstant: 75).isActive = true
    }
    
    DispatchQueue.main.async {
      onView.addSubview(spinnerView)
      addGifView(onView: spinnerView)
    }
    
    vSpinner = spinnerView
  }
    
    func removeSpinner() {
        DispatchQueue.main.async {
            vSpinner?.removeFromSuperview()
            vSpinner = nil
        }
    }
}
extension UITextField {
    open override func awakeFromNib() {
        super.awakeFromNib()
        if LocalizationSystem.sharedInstance.getLanguage() == "ar" {
            //    if textAlignment == .natural {
            self.textAlignment = .right
            //   }
            
        }
        else if LocalizationSystem.sharedInstance.getLanguage() == "en" {
            
            self.textAlignment = .left
            
            
        }
        else if LocalizationSystem.sharedInstance.getLanguage() == "hi" {
            
            self.textAlignment = .left
            
            
        }
        else if LocalizationSystem.sharedInstance.getLanguage() == "ml" {
            
            self.textAlignment = .left
            
            
        }
        else if LocalizationSystem.sharedInstance.getLanguage() == "fil" {
            
            self.textAlignment = .left
            
            
        }
        
    }
}


extension Optional {
    // Unwarp optional value for printing log only
    var description: String {
        if let warped = self {
            return "\(warped)"
        }
        return ""
    }
}

extension UIButton {
    func makeButtonFitToContent(buttonTitle: UIButton) {
        buttonTitle.titleLabel?.minimumScaleFactor = 0.5
        buttonTitle.titleLabel?.numberOfLines = 0
        buttonTitle.titleLabel?.adjustsFontSizeToFitWidth = true
    }
}
extension UILabel {
    func makeLabelFitToContent(labelTitle: UILabel) {
        labelTitle.adjustsFontSizeToFitWidth = true
        labelTitle.minimumScaleFactor = 0.5
    }
}
extension UIViewController {
    func observeTimeout() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(handleTimeout),
            name: .appTimeout,
            object: nil)
    }

    @objc func handleTimeout() {
        
       // print(Global.shared.timeoUtOrNot)
        
        if Global.shared.timeoUtOrNot == "yes" {
            Global.shared.timeoUtOrNot = "no"
            showAlertForTimer(titulo: "", mensagem: Global.shared.sessionTimedOutTxt, vc: self)
        }
        else {
            print("nothing")
        }
    }
    func logout(){
        let refreshAlert = UIAlertController(title: Global.shared.logoutHeaderTxt, message: Global.shared.logoutTxt, preferredStyle: UIAlertController.Style.alert)
        refreshAlert.view.tintColor = ColorCodes.newAppRed
        refreshAlert.addAction(UIAlertAction(title: Global.shared.yesTxt, style: .default, handler: { (action: UIAlertAction!) in
            Global.shared.logoutValue = 1
            self.dismiss(animated: true, completion: {
            })
           // self.pushViewController(controller: LoginVc.initiateController())
        }))
        refreshAlert.addAction(UIAlertAction(title: Global.shared.noTxt, style: .default, handler: { (action: UIAlertAction!) in
            print("Handle Cancel Logic here")
            refreshAlert.dismiss(animated: true, completion: nil)
            
        }))
        
        present(refreshAlert, animated: true, completion: nil)
    }
}
extension UIViewController {
func showAlertForTimer(titulo: String, mensagem: String, vc: UIViewController) {
    
    let alert = UIAlertController(title: "", message: mensagem, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: Global.shared.okTxt, style: .default, handler: { action in

        Global.shared.logoutValue = 1
        print("default",vc)
       // let defaults = UserDefaults.standard
      //  UserDefaults.standard.removeObject(forKey: "token")
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { (timer) in
            exit(0)
        }
//        let currentTopVC: UIViewController? = self.currentTopViewController()
//        currentTopVC!.dismiss(animated: true, completion: {
//        })
       // let storyboard = UIStoryboard(name: "Main", bundle: nil)
       // UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.rootViewController = storyboard.instantiateInitialViewController()
    }))

    DispatchQueue.main.async {
        let currentTopVC: UIViewController? = self.currentTopViewController()

        currentTopVC!.present(alert, animated: true, completion: nil)
    }
    
    
    
//        let alerta = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert)
//        let acaoCancelar = UIAlertAction(title: Global.shared.okTxt, style: .default, handler: {_ in
//       // DispatchQueue.main.async {
//        Global.shared.logoutValue = 1
//        self.dismiss(animated: true, completion: {
//        })
//    })
//
//        alerta.addAction(acaoCancelar)
//
//        //if more than one VC is presenting, or the same one is presenting twice, this might at least tell you which one (assuming it has a title) or when (if the same one is presenting twice)
//        print("\(vc.title) is presenting alert")
//
//        vc.present(alerta, animated: true)
}
    func currentTopViewController() -> UIViewController {
        var topVC: UIViewController? = UIApplication.shared.delegate?.window??.rootViewController
        while ((topVC?.presentedViewController) != nil) {
            topVC = topVC?.presentedViewController
        }
        return topVC!
    }
}
extension String {
    func base64ToImage() -> UIImage? {
        if let url = URL(string: self),let data = try? Data(contentsOf: url),let image = UIImage(data: data) {
            return image
        }
        return nil
    }
}

extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

//
//  MenuViewController.swift
//  Profile
//
//  Created by Urmila on 26/08/2020.
//  Copyright © 2020 urmila. All rights reserved.
//

import UIKit
protocol navigateToDiffrentScreenDelegate {
    
    func navigateToDiffrentScreenDelegate(toWhichScreenWeAreNaviagting : String)
    
}
class MenuTableViewCell:UITableViewCell
{
    @IBOutlet weak var menuLabel: UILabel!
    
    @IBOutlet weak var menuImg: UIImageView!
    
}
class MenuViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UIGestureRecognizerDelegate {
    
   
    @IBOutlet weak var versionLbl: UILabel!
     @IBOutlet weak var editProfileBtnOtlt: UIButton!
    
    
    @IBOutlet weak var profileImg: UIImageView!
    
    @IBOutlet weak var maneLbl: UILabel!
    @IBOutlet weak var lastLoginLbl: UILabel!
   
    
    @IBOutlet weak var popUpView: UIView!
    
    
    @IBOutlet weak var transparentView: UIView!
    
    @IBOutlet weak var imgNameLbl: UILabel!
    //  let menuNames=[Global.shared.menuDashboard,Global.shared.menuProfile,Global.shared.menuTransactions,Global.shared.menuBeneficiary,Global.shared.menuMessages, Global.shared.menuContact, Global.shared.menuRateAlert, Global.shared.menuFeedback, Global.shared.menuChangePaswd]
 //   let menuImages=["india","india","india","india","india","india","india","india","india"]
    
    let menuNames=[Global.shared.menuDashboard, Global.shared.menuBeneficiary,Global.shared.menuTransactions, Global.shared.menuContact, Global.shared.loginChat, Global.shared.rateCalculatorHeader, Global.shared.ourBranches, Global.shared.faqTxt,Global.shared.menuOffer, Global.shared.menuRateThisAppString]
    let menuImages=["dashboardTab","beneficiariesTab","transactionsMenu","ContactUsMenu","chatMenu","rate-calculatorMenu","ourBranchesMenu","faqsMenu","Offer", "rateTheApp"]

    @IBOutlet weak var menuTableView: UITableView!
    
    
    
    var delegateObj : navigateToDiffrentScreenDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        print("hello")
        
        let version = Bundle.main.infoDictionary!["CFBundleShortVersionString"]!
        let versionNumber = version as? String ?? ""
        self.versionLbl.text = Global.shared.versionLbl + ":" + versionNumber
        self.transparentView.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        let gr = UITapGestureRecognizer(target: self, action: #selector(self.tagGestureRemovePOPUP))
        gr.delegate = self
        self.view.addGestureRecognizer(gr)
        
        self.editProfileBtnOtlt.setTitle( Global.shared.viewProfileTxt, for: .normal)
        editProfileBtnOtlt.makeButtonFitToContent(buttonTitle: editProfileBtnOtlt)
        self.maneLbl.text = UserDefaults.standard.string(forKey: "displayName")!
        
        self.imgNameLbl.text = UserDefaults.standard.string(forKey: "imageName")!
        
        self.imgNameLbl.layer.cornerRadius = self.imgNameLbl.frame.size.width / 2;
               self.imgNameLbl.clipsToBounds = true
        
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
            if let decodedImageData = Data(base64Encoded: profileImage, options: .ignoreUnknownCharacters) {
                let image2 = UIImage(data: decodedImageData)
                if image2 != nil {
                    self.profileImg.isHidden = false
                    self.imgNameLbl.isHidden = true
                    self.profileImg.image = image2
                }
                else if profileImage != "" {
                    self.profileImg.isHidden = false
                    self.imgNameLbl.isHidden = true
                    let image1 = profileImage.base64ToImage()
                    self.profileImg.image = image1
                }
                else {
                    
                    print("nothing")
                }
                
            }
            
        }
        
        var lastlog = ""
        if  let lastlogin = UserDefaults.standard.string(forKey: "lastLogin"){
            lastlog = lastlogin
        }
        
       // lastlog = "2021-02-05T13:24:29.2024827+03:00"
        if lastlog.contains("+") {
            let newStr = lastlog.components(separatedBy: "+")
            lastlog = newStr[0]
        }
   
    //   self.lastLoginLbl.text = getLocalDateString(lastlog)
        if Global.shared.lastLoginTxt != "" && lastlog != ""
        {
            self.lastLoginLbl.text = Global.shared.lastLoginTxt +  Date.getMonthDayYearSecLastLogString(lastlog)!
        }
        else
        {
            self.lastLoginLbl.text = ""
        }
        profileImg.setRounded()
        
    }
  func getLocalDateString(_ dateString: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        guard
            let userDOBDate = dateFormatter.date(from:String(dateString)) else {
            return nil
            
        }
        dateFormatter.dateFormat = "MMM dd yyyy HH:mm"
        let lastLogin = dateFormatter.string(from: userDOBDate)
    return Global.shared.lastLoginTxt + lastLogin
    }
    @objc func tagGestureRemovePOPUP(_ gestureRecognizer: UIGestureRecognizer)
    {
        self.view.removeFromSuperview()
        
        
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        
        //print(touch.view )
        if ((touch.view == gestureRecognizer.view))
        {
            return true;
        }
        return false;
    }
    //MARK:- TableView Delegate methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        
        
        return menuNames.count
    }
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 60
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell:MenuTableViewCell = self.menuTableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell") as! MenuTableViewCell
        
        cell.menuLabel.text=menuNames[indexPath.row]
        
        if LocalizationSystem.sharedInstance.getLanguage() == "ar" {
           
            cell.menuLabel.textAlignment = .right
           
        }
        
        cell.menuImg?.image = UIImage(named: menuImages[indexPath.row])
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //test
        let navigateScreen = menuNames[indexPath.row]
        
       // print(navigateScreen)
        
        self.view.removeFromSuperview()
        
        delegateObj?.navigateToDiffrentScreenDelegate(toWhichScreenWeAreNaviagting: navigateScreen!)
        
        // self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func editProfileBtnActn(_ sender: Any) {
       // let vc = self.storyboard?.instantiateViewController(withIdentifier: "ProfileVc") as! ProfileVc
        
       // self.navigationController?.pushViewController(vc, animated: true)
        self.view.removeFromSuperview()
        self.tabBarController?.selectedIndex = 3
        
    }
    
    @IBAction func removeBtnActn(_ sender: Any) {
        self.view.removeFromSuperview()
    }
    
    
}


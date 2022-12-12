//
//  ReferFriendViewController.swift
//  Canvas
//
//  Created by Rahul Kumar on 06/12/22.
//  Copyright © 2022 urmila reddy. All rights reserved.
//

import UIKit

class ReferFriendViewController: UIViewController {
    
    
// MARK: - OUTLET
 
    
    @IBOutlet weak var referAFriendLbl: UILabel!
    @IBOutlet weak var referalCode: UILabel!
    @IBOutlet var headerView: UIView!
    @IBOutlet weak var referralTabelView: UITableView!
    
    @IBOutlet weak var step3lbl: UILabel!
    @IBOutlet weak var step2lbl: UILabel!
    @IBOutlet weak var step1Lbl: UILabel!
    @IBOutlet weak var howitWork: UILabel!
    
    @IBOutlet weak var shareLbl: UILabel!
    @IBOutlet weak var copyLbl: UILabel!
    @IBOutlet weak var referraCodelLbl: UILabel!
    @IBOutlet weak var referViaWhatappsLbl: UILabel!
    @IBOutlet weak var youAndYourLbl: UILabel!
    @IBOutlet weak var yourFriendSignsLbl: UILabel!
    @IBOutlet weak var youSendTheLbl: UILabel!
    //    MARK: - variables
    public var menuPopUp: MenuViewController!
    override func viewDidLoad() {
        super.viewDidLoad()
        delegateCall()
        setUplanguage()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
//    MARK: Action
    
    @IBAction func shareButton(_ sender: Any) {
        
        let shareText = "Share link"

                    let vc = UIActivityViewController(activityItems: [shareText], applicationActivities: [])
                    if let popoverController = vc.popoverPresentationController {
                        popoverController.sourceRect = CGRect(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2, width: 0, height: 0)
                        popoverController.sourceView = self.view
                        popoverController.permittedArrowDirections = UIPopoverArrowDirection(rawValue: 0)
                    }
                    present(vc, animated: true, completion: nil)
        
    }
    
    @IBAction func copyButton(_ sender: Any) {
        
        UIPasteboard.general.string = referalCode.text ?? ""
        self.showToast(message: "\(UIPasteboard.general.string ?? "") \(Global.shared.copy ?? "")", font: .systemFont(ofSize: 12.0))
    }
    
    @IBAction func referViaWhatapp(_ sender: Any) {
        
    }
    
    @IBAction func languageBtn(_ sender: Any) {
        Global.shared.languageChangeActn()
        
    }
    @IBAction func logoutBtn(_ sender: Any) {
        logout()
    }
    
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
  
//    MARK: - Functions: -
    func delegateCall(){
        self.referralTabelView.delegate = self
        self.referralTabelView.dataSource = self
    }
    func setUplanguage(){
        howitWork.text = Global.shared.how_it_works
        step1Lbl.text = Global.shared.step1
        youSendTheLbl.text = Global.shared.step1_lbl
        step2lbl.text = Global.shared.step2
        yourFriendSignsLbl.text = Global.shared.step2_lbl
        step3lbl.text = Global.shared.step3
        youAndYourLbl.text = Global.shared.step3_lbl
        referViaWhatappsLbl.text = Global.shared.via_whatsapp
        referraCodelLbl .text = Global.shared.referralcode
        referAFriendLbl.text = Global.shared.referfriend
        copyLbl.text = Global.shared.copy
        shareLbl.text = Global.shared.share
        if let refcode = UserDefaults.standard.string(forKey: "myReferralCode") as? String
        {
            referalCode.text = refcode
        }
        
    }

}

extension ReferFriendViewController : UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
     
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
//    func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
//        return 0.0
//    }
    
}


extension UIViewController {

func showToast(message : String, font: UIFont) {

    let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-160, width: 150, height: 35))
    toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
    toastLabel.textColor = UIColor.white
    toastLabel.font = font
    toastLabel.textAlignment = .center;
    toastLabel.text = message
    toastLabel.alpha = 1.0
    toastLabel.layer.cornerRadius = 10;
    toastLabel.clipsToBounds  =  true
    self.view.addSubview(toastLabel)
    UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
         toastLabel.alpha = 0.0
    }, completion: {(isCompleted) in
        toastLabel.removeFromSuperview()
    })
} }

//Global.shared.copy = ref_label["copy"] as? String ?? ""
//Global.shared.how_it_works = ref_label["how_it_works"] as? String ?? ""
//Global.shared.invalid_ref = ref_label["invalid_ref"] as? String ?? ""
//Global.shared.referfriend = ref_label["referfriend"] as? String ?? ""
//Global.shared.referralcode = ref_label["referralcode"] as? String ?? ""
//Global.shared.share = ref_label["share"] as? String ?? ""
//Global.shared.step1 = ref_label["step1"] as? String ?? ""
//Global.shared.step1_lbl = ref_label["step1_lbl"] as? String ?? ""
//Global.shared.step2 = ref_label["step2"] as? String ?? ""
//Global.shared.step2_lbl = ref_label["step2_lbl"] as? String ?? ""
//Global.shared.step3 = ref_label["step3"] as? String ?? ""
//Global.shared.step3_lbl = ref_label["step3_lbl"] as? String ?? ""
//Global.shared.via_whatsapp = ref_label["via_whatsapp"] as? String ?? ""


//"referralcode_label": {
//    copy = Copy;
//    "how_it_works" = "How It Works";
//    "invalid_ref" = "Invalid referral code";
//    referfriend = "Refer a Friend";
//    referralcode = "Referral Code";
//    share = Share;
//    step1 = "Step 01";
//    "step1_lbl" = "You send the referral code to your friend";
//    step2 = "Step 02";
//    "step2_lbl" = "Your friend signs up on Muzaini application using this referral code";
//    step3 = "Step 03";
//    "step3_lbl" = "You and your friend will get referral points";
//    "via_whatsapp" = "REFER VIA WHATSAPP";
//}


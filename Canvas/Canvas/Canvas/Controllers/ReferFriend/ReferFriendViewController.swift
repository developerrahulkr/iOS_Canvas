//
//  ReferFriendViewController.swift
//  Canvas
//
//  Created by Rahul Kumar on 06/12/22.
//  Copyright © 2022 urmila reddy. All rights reserved.
//

import UIKit

class ReferFriendViewController: UIViewController, navigateToDiffrentScreenDelegate {
    
    
// MARK: - OUTLET
    
    @IBOutlet weak var referalCode: UILabel!
    @IBOutlet var headerView: UIView!
    @IBOutlet weak var referralTabelView: UITableView!
//    MARK: - variables
    public var menuPopUp: MenuViewController!
    override func viewDidLoad() {
        super.viewDidLoad()
        delegateCall()
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
        
        UIPasteboard.general.string = referalCode.text
    }
    
    @IBAction func referViaWhatapp(_ sender: Any) {
        
    }
    
    @IBAction func sideMenuButton(_ sender: Any) {
        
        menuPopUp = Storyboad.shared.mainStoryboard?.instantiateViewController(withIdentifier: "MenuViewController") as? MenuViewController
        
        menuPopUp.delegateObj = self
        self.addChild(menuPopUp)
        menuPopUp.view.frame = self.view.frame
        self.view.addSubview(menuPopUp.view)
        menuPopUp.didMove(toParent: self)
        
    }
    
    func delegateCall(){
        self.referralTabelView.delegate = self
        self.referralTabelView.dataSource = self
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
    
    
    
}

extension ReferFriendViewController{
    
    //MARK:  Function to navigate from side menu of FXBookingVC
    func navigateToDiffrentScreenDelegate(toWhichScreenWeAreNaviagting: String) {
        print(toWhichScreenWeAreNaviagting)
        if toWhichScreenWeAreNaviagting == Global.shared.transctnSumary {
            // same screen
        }
        else{
            MenuScreenShow(screen:toWhichScreenWeAreNaviagting)
        }
        
    }

}
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

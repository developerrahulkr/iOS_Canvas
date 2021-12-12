//
//  ProfileUnderReviewPopUp.swift
//  Canvas
//
//  Created by urmila reddy on 20/08/20.
//  Copyright © 2020 urmila reddy. All rights reserved.
//

import UIKit

class ProfileUnderReviewPopUp: UIViewController {
    
     @IBOutlet weak var titleLbl: UILabel!
     @IBOutlet weak var subTitleLbl: UILabel!
     var screen = ""
     var messageCode : String?
    
    
    
    
    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var continueBtnOtlt: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        popUpView.layer.cornerRadius = 5
        continueBtnOtlt.layer.cornerRadius = 5
        assignLabels()
        
        
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        self.showAnimate()
    }
    func assignLabels() {
       
        if messageCode == "I220033"
        {
            continueBtnOtlt.setTitle(Global.shared.okTxt, for: .normal)
            titleLbl.text = Global.shared.civilIDReviewTitleLbl
            subTitleLbl.text = Global.shared.civilIDReviewSubTitle1
        }
        else if messageCode == "I220034"
        {
            continueBtnOtlt.setTitle(Global.shared.okTxt, for: .normal)
            titleLbl.text = Global.shared.civilIDReviewTitleLbl
            subTitleLbl.text = Global.shared.civilIDReviewSubTitle2
        }
        else{
         continueBtnOtlt.setTitle(Global.shared.continueBtnTxt, for: .normal)
          titleLbl.text = Global.shared.profileReviewTitleLbl
          subTitleLbl.text = Global.shared.profileReviewSubTitleLbl
        }
        
    }
    func showAnimate()
    {
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0;
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        });
    }
    
    func removeAnimate()
    {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0;
        }, completion:{(finished : Bool)  in
            if (finished)
            {
                self.view.removeFromSuperview()
            }
        });
    }
    
  @IBAction func continueBtnActn(_ sender: Any) {
    
    
    /*     let vc = self.storyboard?.instantiateViewController(identifier: "VerifyOnlineAcntVc") as! VerifyOnlineAcntVc
     self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
     self.navigationController?.pushViewController(vc, animated: false)*/
      if messageCode == "I220033" || messageCode == "I220034"
      {
          self.navigationController?.popViewController(animated: true)
      }
      else{
          self.pushViewController(controller: LoginVc.initiateController(), isGestureEnable: false, animated: false)
      }
     
    
  }
  
    @IBAction func cancelBtnActn(_ sender: Any) {
        removeAnimate()
    }
}

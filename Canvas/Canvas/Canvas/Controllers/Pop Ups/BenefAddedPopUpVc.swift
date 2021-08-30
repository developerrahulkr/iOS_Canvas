//
//  BenefAddedPopUpVc.swift
//  Canvas
//
//  Created by urmila reddy on 23/11/20.
//  Copyright © 2020 urmila reddy. All rights reserved.
//

import UIKit

class BenefAddedPopUpVc: UIViewController {
    
     @IBOutlet weak var subTitleLbl: UILabel!
    

     @IBOutlet weak var popUpView: UIView!
        
        @IBOutlet weak var continueBtnOtlt: UIButton!
        
    @IBOutlet weak var titleLblTxt: UILabel!
    
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
            titleLblTxt.text = Global.shared.benAdded
            continueBtnOtlt.setTitle(Global.shared.okTxt, for: .normal)
            subTitleLbl.text = Global.shared.benSucesSubtitleTxt
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
            
            
            self.navigationController?.popToRootViewController(animated: true)
            
           
        }
        
        @IBAction func cancelBtnActn(_ sender: Any) {
            removeAnimate()
        }
    }

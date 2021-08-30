//
//  ViewController.swift
//  AnimatedGifLaunchScreen-Example
//
//  Created by Amer Hukic on 13/09/2018.
//  Copyright © 2018 Amer Hukic. All rights reserved.
//

import UIKit
import SwiftyGif

class SplashViewController: UIViewController {

    let logoAnimationView = LogoAnimationView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logoAnimationView.isHidden = false
        view.addSubview(logoAnimationView)
        logoAnimationView.pinEdgesToSuperView()
        logoAnimationView.logoGifImageView.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        logoAnimationView.logoGifImageView.startAnimatingGif()
        
    }
  
    func navigateAppRootNavigationController() {
      let approotNavVC = self.storyboard?.instantiateViewController(withIdentifier: "AppRootNavgationCotroller") as! AppRootNavgationCotroller
      if #available(iOS 13.0, *) {
        SceneDelegate.shared?.window?.rootViewController = approotNavVC
      } else {
        AppDelegate.sharedInstance().window?.rootViewController = approotNavVC
        AppDelegate.sharedInstance().window?.makeKeyAndVisible()
        // Fallback on earlier versions
      }
   }

}

extension SplashViewController: SwiftyGifDelegate {
    func gifDidStop(sender: UIImageView) {
        navigateAppRootNavigationController()
        logoAnimationView.isHidden = true
    }
}


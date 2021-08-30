//
//  AppRootNavgationCotroller.swift
//  Canvas
//
//  Created by Varun Peddi on 26/11/20.
//  Copyright © 2020 urmila reddy. All rights reserved.
//

import UIKit

class AppRootNavgationCotroller: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
      setupNavBarColor()
      

        // Do any additional setup after loading the view.
    }
    
  func setupNavBarColor() {
    if #available(iOS 13.0, *) {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.backgroundColor = .red   // use your own color
        navigationBar.standardAppearance = navBarAppearance
        navigationBar.scrollEdgeAppearance = navBarAppearance
    }
  }

}



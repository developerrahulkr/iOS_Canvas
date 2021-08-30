//
//  Extensions.swift
//  Canvas
//
//  Created by Varun Peddi on 26/11/20.
//  Copyright © 2020 urmila reddy. All rights reserved.
//

import Foundation

import UIKit

extension UIView {
  
  func pinEdgesToSuperView() {
    guard let superView = superview else { return }
    translatesAutoresizingMaskIntoConstraints = false
    topAnchor.constraint(equalTo: superView.topAnchor).isActive = true
    leftAnchor.constraint(equalTo: superView.leftAnchor).isActive = true
    bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive = true
    rightAnchor.constraint(equalTo: superView.rightAnchor).isActive = true
  }
  
}

extension UIApplication {
  
  func setStatusBarColor() {
    if #available(iOS 13.0, *) {
      let statusBar = UIView(frame: self.windows.first?.windowScene?.statusBarManager?.statusBarFrame ?? CGRect.zero)
      statusBar.backgroundColor = UIColor.red
      self.windows.first?.addSubview(statusBar)
    } else {
      let statusBar = UIApplication.shared.value(forKeyPath: "statusBarWindow.statusBar") as? UIView
      statusBar?.backgroundColor = .red
    }
  }
}

extension UINavigationController {
  static func configureNavigationBar(largeTitleColor: UIColor = .white) {
    if #available(iOS 13.0, *) {
      let navBarAppearance = UINavigationBarAppearance()
      navBarAppearance.configureWithOpaqueBackground()
      navBarAppearance.titleTextAttributes = [.foregroundColor: largeTitleColor]
      navBarAppearance.backgroundColor = ColorCodes.newAppRed
      UINavigationBar.appearance().tintColor = .white
      UINavigationBar.appearance().standardAppearance = navBarAppearance
      UINavigationBar.appearance().compactAppearance = navBarAppearance
      UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
    } else {
      UINavigationBar.appearance().barTintColor = ColorCodes.newAppRed
      UINavigationBar.appearance().tintColor = .white
      UINavigationBar.appearance().isTranslucent = false
      UINavigationBar.appearance().titleTextAttributes = [.foregroundColor : UIColor.white]
    }
  }}

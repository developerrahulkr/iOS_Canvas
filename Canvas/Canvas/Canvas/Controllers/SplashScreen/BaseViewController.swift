//
//  BaseViewController.swift
//  Canvas
//
//  Created by Varun Peddi on 06/12/20.
//  Copyright © 2020 urmila reddy. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
  
  lazy var spinner: UIView = {
    let spinner = UIView.init(frame: .zero)
    spinner.translatesAutoresizingMaskIntoConstraints = false
    return spinner
  }()
  let logoGifImageView: UIImageView = {
    guard let gifImage = try? UIImage(gifName: "spinner.gif") else {
      return UIImageView()
    }
    return UIImageView(gifImage: gifImage)
  }()
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  @objc func showLoader() {
    spinner.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
    self.view.addSubview(spinner)
    addconstraint()
    addGifView(onView: spinner)
    
  }
  private func addconstraint(){
    spinner.topAnchor.constraint(equalToSystemSpacingBelow: self.view.topAnchor, multiplier: 1).isActive = true
    spinner.bottomAnchor.constraint(equalToSystemSpacingBelow: self.view.bottomAnchor, multiplier: 1).isActive = true
    spinner.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: -10).isActive = true
    spinner.trailingAnchor.constraint(equalToSystemSpacingAfter: self.view.trailingAnchor, multiplier: 1).isActive = true

  }
  private func addGifView(onView: UIView) {
    onView.addSubview(logoGifImageView)
    logoGifImageView.translatesAutoresizingMaskIntoConstraints = false
    logoGifImageView.centerXAnchor.constraint(equalTo: onView.centerXAnchor).isActive = true
    logoGifImageView.centerYAnchor.constraint(equalTo: onView.centerYAnchor).isActive = true
    logoGifImageView.widthAnchor.constraint(equalToConstant: 75).isActive = true
    logoGifImageView.heightAnchor.constraint(equalToConstant: 75).isActive = true
  }
  @objc func removeLoader() {
    spinner.removeFromSuperview()
  }
    
}

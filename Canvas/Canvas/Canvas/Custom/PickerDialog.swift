//
//  PickerDialog.swift
//
//  Created by Loren Burton on 02/08/2016.
//

import Foundation
import UIKit
import QuartzCore

class PickerDialog: UIView, UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
      return 1
    }


    typealias PickerCallback = (_ value: String) -> Void

    /* Constants */
    private let kPickerDialogDefaultButtonHeight:       CGFloat = 50
    private let kPickerDialogDefaultButtonSpacerHeight: CGFloat = 1
    private let kPickerDialogCornerRadius:              CGFloat = 7
    private let kPickerDialogDoneButtonTag:             Int     = 1

    /* Views */
    private var dialogView:   UIView!
    private var titleLabel:   UILabel!
    public var picker:       UIPickerView!
    private var cancelButton: UIButton!
    private var doneButton:   UIButton!

    /* Variables */
    private var pickerData =         [[String: String]]()
    private var selectedPickerValue: String?
    private var callback:            PickerCallback?


    /* Overrides */
    init() {
        super.init(frame: CGRect(x:0, y:0, width:UIScreen.main.bounds.size.width, height:UIScreen.main.bounds.size.height))

        setupView()
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    func setupView() {
      self.dialogView = createContainerView()

      self.dialogView!.layer.shouldRasterize = true
      self.dialogView!.layer.rasterizationScale = UIScreen.main.scale

      self.layer.shouldRasterize = true
      self.layer.rasterizationScale = UIScreen.main.scale

      self.dialogView!.layer.opacity = 0.5
      self.dialogView!.layer.transform = CATransform3DMakeScale(1.3, 1.3, 1)

      self.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)

      picker.delegate = self

      self.addSubview(self.dialogView!)
    }

    /* Handle device orientation changes */
//    func deviceOrientationDidChange(_ notification: Notification) {
//        close() // For now just close it
//    }

    /* Required UIPickerView functions */
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
      return pickerData.count
    }
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
       var label: UILabel
       if let view = view as? UILabel { label = view }
       else { label = UILabel() }

     //  label.text = "..."
       label.textAlignment = .center
        label.font = UIFont(name: "Roboto", size: 18)!
        label.text =  pickerData[row]["display"]
        label.adjustsFontSizeToFitWidth = true
        return label
    }
  
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
      return pickerData[row]["display"]
    }

    /* Helper to find row of selected value */
    func findIndexForValue(value: String, array: [[String: String]]) -> Int? {
        for (index, dictionary) in array.enumerated() {
            if dictionary["value"] == value {
                return index
            }
        }

        return nil
    }

    /* Create the dialog view, and animate opening the dialog */
    func show(title: String, doneButtonTitle: String = "Done", cancelButtonTitle: String = "Cancel", options: [[String: String]], selected: String? = nil, callback: @escaping PickerCallback) {
    self.titleLabel.text = title
    self.pickerData = options
    self.doneButton.setTitle(doneButtonTitle, for: .normal)
    self.cancelButton.setTitle(cancelButtonTitle, for: .normal)
    self.callback = callback

        if selected != nil {
        self.selectedPickerValue = selected
        let selectedIndex = findIndexForValue(value: selected!, array: options) ?? 0
        self.picker.selectRow(selectedIndex, inComponent: 0, animated: false)
          
        }

        /* */
        UIApplication.shared.windows.first!.addSubview(self)
           UIApplication.shared.windows.first!.endEditing(true)

      NotificationCenter.default.addObserver(
                 self,
                 selector: .deviceOrientationDidChange,
                 name: UIDevice.orientationDidChangeNotification, object: nil
             )

       /* Anim */
          UIView.animate(
            withDuration: 0.2,
            delay: 0,
            options: UIView.AnimationOptions.curveEaseInOut,
            animations: { () -> Void in
              self.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4)
              self.dialogView!.layer.opacity = 1
              self.dialogView!.layer.transform = CATransform3DMakeScale(1, 1, 1)
          },
            completion: nil
          )
        }

    /* Dialog close animation then cleaning and removing the view from the parent */
    @objc func deviceOrientationDidChange(_ notification: Notification) {
         self.frame = UIScreen.main.bounds
         let dialogSize = CGSize(width: 300, height: 230 + kPickerDialogDefaultButtonHeight + kPickerDialogDefaultButtonSpacerHeight)
         dialogView.frame = CGRect(
             x: (UIScreen.main.bounds.size.width - dialogSize.width) / 2,
             y: (UIScreen.main.bounds.size.height - dialogSize.height) / 2,
             width: dialogSize.width,
             height: dialogSize.height
         )
     }

  private func close() {
         let currentTransform = self.dialogView.layer.transform

         let startRotation = (self.value(forKeyPath: "layer.transform.rotation.z") as? NSNumber) as? Double ?? 0.0
         let rotation = CATransform3DMakeRotation((CGFloat)(-startRotation + .pi * 270 / 180), 0, 0, 0)

         self.dialogView.layer.transform = CATransform3DConcat(rotation, CATransform3DMakeScale(1, 1, 1))
         self.dialogView.layer.opacity = 1

         UIView.animate(
             withDuration: 0.2,
             delay: 0,
             options: [],
             animations: {
                 self.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
                 let transform = CATransform3DConcat(currentTransform, CATransform3DMakeScale(0.6, 0.6, 1))
                 self.dialogView.layer.transform = transform
                 self.dialogView.layer.opacity = 0
             }
         ) { _ in
             for v in self.subviews {
                 v.removeFromSuperview()
             }

             self.removeFromSuperview()
             self.setupView()
         }
     }

    /* Creates the container view here: create the dialog, then add the custom content and buttons */
   
    /* Creates the container view here: create the dialog, then add the custom content and buttons */
    private func createContainerView() -> UIView {
      let screenSize = countScreenSize()
      let dialogSize = CGSize(width:
        300,height:230
          + kPickerDialogDefaultButtonHeight
          + kPickerDialogDefaultButtonSpacerHeight)

      // For the black background
      self.frame = CGRect(x:0, y:0, width:screenSize.width, height:screenSize.height)

      // This is the dialog's container; we attach the custom content and the buttons to this one
      let dialogContainer = UIView(frame: CGRect(x:(screenSize.width - dialogSize.width) / 2, y:(screenSize.height - dialogSize.height) / 2, width:dialogSize.width, height:dialogSize.height))

      // First, we style the dialog to match the iOS8 UIAlertView >>>
      let gradient: CAGradientLayer = CAGradientLayer(layer: self.layer)
      gradient.frame = dialogContainer.bounds
      gradient.colors = [UIColor(red: 218/255, green: 218/255, blue: 218/255, alpha: 1).cgColor,
                         UIColor(red: 233/255, green: 233/255, blue: 233/255, alpha: 1).cgColor,
                         UIColor(red: 218/255, green: 218/255, blue: 218/255, alpha: 1).cgColor]

      let cornerRadius = kPickerDialogCornerRadius
      gradient.cornerRadius = cornerRadius
      dialogContainer.layer.insertSublayer(gradient, at: 0)

      dialogContainer.layer.cornerRadius = cornerRadius
      dialogContainer.layer.borderColor = UIColor(red: 198/255, green: 198/255, blue: 198/255, alpha: 1).cgColor
      dialogContainer.layer.borderWidth = 1
      dialogContainer.layer.shadowRadius = cornerRadius + 5
      dialogContainer.layer.shadowOpacity = 0.1
      dialogContainer.layer.shadowOffset = CGSize(width:0 - (cornerRadius + 5) / 2, height:0 - (cornerRadius + 5) / 2)
      dialogContainer.layer.shadowColor = UIColor.black.cgColor
      dialogContainer.layer.shadowPath = UIBezierPath(roundedRect: dialogContainer.bounds, cornerRadius: dialogContainer.layer.cornerRadius).cgPath

      // There is a line above the button
      let lineView = UIView(frame: CGRect(x:0, y:dialogContainer.bounds.size.height - kPickerDialogDefaultButtonHeight - kPickerDialogDefaultButtonSpacerHeight, width:dialogContainer.bounds.size.width, height:kPickerDialogDefaultButtonSpacerHeight))
      lineView.backgroundColor = UIColor(red: 198/255, green: 198/255, blue: 198/255, alpha: 1)
      dialogContainer.addSubview(lineView)
      // ˆˆˆ
      //Title
      self.titleLabel = UILabel(frame: CGRect(x:10, y:10, width:280, height:30))
      self.titleLabel.textAlignment = NSTextAlignment.center
        self.titleLabel.textColor = UIColor(named: "#333333")
      self.titleLabel.font = UIFont(name: "AvenirNext-Medium", size: 16)
      dialogContainer.addSubview(self.titleLabel)

      self.picker = UIPickerView(frame: CGRect(x:0, y:30, width:0, height:0))
        self.picker.setValue(UIColor(named: "#333333"), forKeyPath: "textColor")
        self.picker.autoresizingMask = UIView.AutoresizingMask.flexibleRightMargin
      self.picker.frame.size.width = 300

      dialogContainer.addSubview(self.picker)

      // Add the buttons
      addButtonsToView(container: dialogContainer)

      return dialogContainer
    }

    /* Add buttons to container */
    private func addButtonsToView(container: UIView) {
      let buttonWidth = container.bounds.size.width / 2

        self.cancelButton = UIButton(type: UIButton.ButtonType.custom) as UIButton
      self.cancelButton.frame = CGRect(
        x:0,
        y:container.bounds.size.height - kPickerDialogDefaultButtonHeight,
        width:buttonWidth,
        height:kPickerDialogDefaultButtonHeight
      )
         self.cancelButton.setTitleColor(.black, for: .normal)
       // self.cancelButton.setTitleColor(UIColor(named: "#555555"), for: UIControl.State.normal)
      //  self.cancelButton.setTitleColor(UIColor(named: "#555555"), for: UIControl.State.highlighted)
      self.cancelButton.titleLabel!.font = UIFont(name: "AvenirNext-Medium", size: 18)
      self.cancelButton.layer.cornerRadius = kPickerDialogCornerRadius
        self.cancelButton.addTarget(self, action: #selector(buttonTapped(sender:)), for: UIControl.Event.touchUpInside)

      container.addSubview(self.cancelButton)

        self.doneButton = UIButton(type: UIButton.ButtonType.custom) as UIButton
      self.doneButton.frame = CGRect(
        x:buttonWidth,
        y:container.bounds.size.height - kPickerDialogDefaultButtonHeight,
        width:buttonWidth,
        height:kPickerDialogDefaultButtonHeight
      )
      self.doneButton.tag = kPickerDialogDoneButtonTag
        self.doneButton.setTitleColor(.black, for: .normal)
    //    self.doneButton.setTitleColor(UIColor(named: "#555555"), for: UIControl.State.normal)
    //    self.doneButton.setTitleColor(UIColor(named: "#555555"), for: UIControl.State.highlighted)
      self.doneButton.titleLabel!.font = UIFont(name: "AvenirNext-Medium", size: 18)
      self.doneButton.layer.cornerRadius = kPickerDialogCornerRadius
        self.doneButton.addTarget(self, action: #selector(buttonTapped(sender:)), for: UIControl.Event.touchUpInside)
      container.addSubview(self.doneButton)
    }

    @objc func buttonTapped(sender: UIButton!) {
      if sender.tag == kPickerDialogDoneButtonTag {
        let selectedIndex = self.picker.selectedRow(inComponent: 0)
        if self.pickerData.count != 0{
          let selectedValue = self.pickerData[selectedIndex]["value"]
          self.callback?(selectedValue!)
        }
        }
        close()
    
    }

    /* Helper function: count and return the screen's size */
     func countScreenSize() -> CGSize {
       let screenWidth = UIScreen.main.applicationFrame.size.width
       let screenHeight = UIScreen.main.bounds.size.height

       return CGSize(width:screenWidth, height:screenHeight)
     }
  deinit {
      NotificationCenter.default.removeObserver(self)
  }
}

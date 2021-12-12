//
//  ShowImageController.swift
//  Canvas
//
//  Created by RAC on 25/10/21.
//  Copyright © 2021 urmila reddy. All rights reserved.
//

import UIKit

class ShowImageController: UIViewController {
    
    @IBOutlet weak var showImage: UIImageView!
    var image:UIImage!

    @IBOutlet weak var closeBtn: UIButton!
    @IBOutlet weak var innerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        showImage.contentMode = .scaleToFill
        showImage.image = image
        closeBtn.layer.cornerRadius = closeBtn.frame.size.width/2
        closeBtn.clipsToBounds = true
    }
    
    @IBAction func onClickCancel(_ sender: UIButton) {
        self.dismiss(animated: false, completion: nil)
    }
    


}

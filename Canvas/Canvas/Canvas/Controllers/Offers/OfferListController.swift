//
//  OfferListController.swift
//  Canvas
//
//  Created by RAC on 28/09/21.
//  Copyright © 2021 urmila reddy. All rights reserved.
//

import UIKit

class OfferListController: UIViewController {
    let tab1 = "ShowOffersCell"
    var offerList = [[String: Any]]()
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        offerList = appDelegate.offerList
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        offerList = appDelegate.offerList
        tableView.reloadData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        offerList = appDelegate.offerList
        tableView.reloadData()
    }
}
extension OfferListController : UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return offerList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      

            let cell:ShowOffersCell = tableView.dequeueReusableCell(withIdentifier: tab1, for: indexPath) as! ShowOffersCell
            
            let offers = offerList[indexPath.row]
            let imageStr = offers["image"] as? String ?? ""
            let image1 = imageStr.base64ToImage()
            print(image1!)
            
            cell.img_thumbnail.contentMode = .scaleAspectFit
            
            cell.img_thumbnail.image = image1
            let descciption = offers["description"] as? String ?? ""
            cell.lbl_offerHeader.text = offers["title"] as? String ?? ""
            cell.lbl_offerDescription.attributedText = descciption.htmlToAttributedString
               return cell
            
        }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let offers = self.offerList[indexPath.row]
        let imageUrl = offers["externalUrl"] as? String ?? ""
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "OfferWebController") as! OfferWebController
        vc.str_url = imageUrl
        self.navigationController?.pushViewController(vc, animated: true)
        print(imageUrl)
    }
}
extension OfferListController : UITableViewDelegate
{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return tableView.estimatedRowHeight
    }
}

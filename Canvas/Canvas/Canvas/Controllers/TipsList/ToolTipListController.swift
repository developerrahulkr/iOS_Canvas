//
//  ToolTipListController.swift
//  Canvas
//
//  Created by RAC INFRA RENTAL LLP on 05/01/22.
//  Copyright © 2022 urmila reddy. All rights reserved.
//

import UIKit
import Alamofire
import MobileCoreServices
import AVFoundation
import AVKit
import Alamofire
import CoreMedia
import Photos

class ToolTipListController: UIViewController{
    var helpVideoList = [[String: Any]]()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       // tableView.delegate  = self
        tableView.backgroundColor = UIColor.darkGray
        tableView.dataSource = self
        tableView.delegate = self
       
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //  self.showSpinner(onView: self.view)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.rowHeight = UITableView.automaticDimension
        tableView.reloadData()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
}
extension ToolTipListController: UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return helpVideoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:ToolTopsCell = tableView.dequeueReusableCell(withIdentifier: "ToolTopsCell", for: indexPath) as! ToolTopsCell
        
        let tips = helpVideoList[indexPath.row]
        let content = tips["content"] as? String ?? ""

        let string = "  Click Here"
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white,
            .backgroundColor: UIColor.darkGray,
            .font: Global.shared.fontTopLbl,
        ]
        
        let indexValue :String = String(format: "%d. ", indexPath.row + 1)
        let attributes1: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white,
            .font: Global.shared.fontTopLbl,
        ]

        let attributedString = NSAttributedString(string: string, attributes: attributes)
      //  let attributedString1 = NSAttributedString(string: indexValue, attributes: attributes1)
        
        
        let number = NSMutableAttributedString(string: indexValue, attributes: attributes1)
        
        
        let partone = content.htmlToMutableAttributedString
        
        number.append(partone!)
        number.append(attributedString)
        
     //   partone?.append(attributedString1)
      //  partone?.append(attributedString)
        cell.lbl_tipContent.attributedText = number

        cell.lbl_tipContent.font = Global.shared.fontTopLbl
        cell.lbl_tipContent.textColor = UIColor.white
        cell.lbl_tipContent.sizeToFit()
        cell.lbl_tipContent.numberOfLines = 4
        
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        
        return cell
    }
    
}
extension ToolTipListController : UITableViewDelegate
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let tips = helpVideoList[indexPath.row]
        let videoUrl = tips["videoURL"] as? String ?? ""
      //  let urlString = videoUrl.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
        playDefaultSampleVideo(videoStr: videoUrl ?? "")
        print("You selected url #\(videoUrl)!")
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

            return UITableView.automaticDimension

    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func playDefaultSampleVideo(videoStr:String)
    {
        print(videoStr)
        let sampleUrl =  URL(string: videoStr)
        if sampleUrl != nil {
            let player = AVPlayer(url: sampleUrl! as URL)
            let vc = AVPlayerViewController()
            vc.player = player
            present(vc, animated: true) {
                vc.player?.play()
            }
            }
            else {
        
            }
    }
}

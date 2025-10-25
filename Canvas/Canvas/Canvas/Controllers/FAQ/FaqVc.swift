//
//  FaqVc.swift
//  Canvas
//
//  Created by urmila reddy on 26/08/20.
//  Copyright © 2020 urmila reddy. All rights reserved.
//

import UIKit
import Alamofire
import MobileCoreServices
import AVFoundation
import AVKit
import Alamofire
import CoreMedia
import Photos
import Kingfisher

class FaqVc: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, XMSegmentedControlDelegate {

    @IBOutlet weak var segmentHeight: NSLayoutConstraint!
    
    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var seg: XMSegmentedControl!
    var expandedCells = 1111111
    
    //hedr
    @IBOutlet weak var navHeaderLbl: UILabel!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    @IBOutlet weak var faqTableView: UITableView!
    
    var faqResponse = [Any]()
    var helpVideoList = [HelpSearch]()
    var helpSearchList = [HelpSearch]()
    var bannerList = [UIImage]()
    var checkBtn = "0"
   
    var faqList = [FaqSearch]()
    var faqSearchList = [FaqSearch]()
   
    var searching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        UISegmentedControl.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.darkGray], for: .normal)
        if #available(iOS 13.0, *) {
            segment.backgroundColor = UIColor.white
            self.segment.layer.backgroundColor = UIColor.white.cgColor
        }
        segment.font(name: "Avenir-Medium", size: 14)
        
//        if LocalizationSystem.sharedInstance.getLanguage() == "ar" {
//            let titles = [Global.shared.faqTxt! , "FAQ's"]
//            self.view.semanticContentAttribute = .forceRightToLeft
//            self.seg.delegate = self
//            self.seg.segmentTitle = titles
//        }
//        else {
//        let titles = [Global.shared.faqTxt! , "FAQ's"]
//        self.seg.delegate = self
//        self.seg.segmentTitle = titles
//        }
      
        segment.setTitle(Global.shared.helpTxt, forSegmentAt: 0)
        segment.setTitle(Global.shared.faqTxt, forSegmentAt: 1)
       self.navHeaderLbl.text = Global.shared.helpTxt
        
        self.faqTableView.estimatedRowHeight = 140
        self.faqTableView.rowHeight = UITableView.automaticDimension
        // Do any additional setup after loading the view.
        downloadFaq()
        getHelpList()
        if Connectivity.isConnectedToInternet
        {
            segment.setEnabled(true, forSegmentAt: 0)
            segment.selectedSegmentIndex = 0
            checkBtn = "0"
        }
        else
        {
            segment.setEnabled(false, forSegmentAt: 0)
            segment.selectedSegmentIndex = 1
            self.navHeaderLbl.text = Global.shared.faqTxt
            checkBtn = "1"
            self.setupdata()
        }

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    
    // Mark: Downloading Faq's
    func downloadFaq() {
        
        let paramaterPasing: [String:Any] = ["languageCode":LocalizationSystem.sharedInstance.getLanguage(), "type": 0]
        
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        NetWorkDataManager.sharedInstance.faqImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            if errorString == nil
            {
                if let faqJson = resonseTal?.value(forKey: "faqList") as? [[String:Any]]
                {
                    let obj = faqJson as NSObject
                    CDUtilityInfo.shared.saveFAQData(obj: obj)
                    self.setupdata()
                }
            }
            else
            {
//                let finalError = errorString?.components(separatedBy: ":")
//                let alert = ViewControllerManager.displayAlert(message: finalError?[1] ?? "", title:APPLICATIONNAME)
//                self.present(alert, animated: true, completion: nil)
                
            }
        }
    }
    
// MARK: -    Core Data SetUP
    func setupdata()
    {
        if let faqdata = CDUtilityInfo.shared.getAllFAQData()
        {
            if let dataDict = faqdata.faqData as? Faqs
            {
                self.faqList = FaqSearch.getFaqs(dataDict as! [[String : Any]])
            }
        }
        self.faqTableView.reloadData()
    }
    
    var index = 0
    func getHelpList() {
        let paramaterPasing: [String:Any] = [
              "helpTypes": 1,
              "language": LocalizationSystem.sharedInstance.getLanguage(),
              "screen": 0,
              "registrationId": ""
            
          ]
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
       // self.showSpinner(onView: self.view)
        NetWorkDataManager.sharedInstance.preLogingetHelpAndTips(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            
            if errorString == nil
            {
               print(resonseTal)
                self.removeSpinner()
                if let helpVideoList = resonseTal?.value(forKey: "helpAndTipsResponseList") as? [[String:Any]]
                {
                   // self.helpVideoList = helpVideoList as! [[String : Any]]
                    self.helpVideoList = HelpSearch.getHelps(helpVideoList)
                    print(self.helpVideoList)

//                    UIView.animate(withDuration: 0.9,
//                    delay: 0.2,
//                    options: UIView.AnimationOptions.transitionCurlDown,
//                    animations: {
                        self.faqTableView.reloadData()
                        self.removeSpinner()
                //    },completion: nil)
                    
                }
              
            }
            else
            {
                print(errorString!)
                self.removeSpinner()
                let finalError = errorString?.components(separatedBy: ":")
                if finalError?.count == 2
                {
                   let alert = ViewControllerManager.displayAlert(message: finalError?[1] ?? "", title:APPLICATIONNAME)
                    self.present(alert, animated: true, completion: nil)
                }
                else
                {
                    let alert = ViewControllerManager.displayAlert(message: errorString ?? "", title:APPLICATIONNAME)
                    self.present(alert, animated: true, completion: nil)
                }
                
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if checkBtn == "0"
        {

            if searching == true {
                return helpSearchList.count
             }
            else {
               return helpVideoList.count
            }
        }
        else
        {
         if searching == true {
             return faqSearchList.count
          }
         else {
            return faqList.count
         }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = faqTableView.dequeueReusableCell(withIdentifier: "FaqCell")! as! FaqCell
        /*    let eachObj = self.faqResponse[indexPath.row] as?NSDictionary
         
         cell.titleLabel.text = eachObj?.value(forKey: "question")  as? String
         cell.subTitleLabel.text = eachObj?.value(forKey: "answer") as? String*/
        if checkBtn == "1"
        {
        
           if searching == true {
              let eachObj = self.faqSearchList[indexPath.row]
              let serialNumber = "\(eachObj.serialNumber ?? 0)"
              let questionTxt = eachObj.question ?? ""
              cell.titleLabel.text = serialNumber + ". " +  questionTxt
              cell.subTitleLabel.text = eachObj.answer
        }
           else {
              let eachObj = self.faqList[indexPath.row]
              let serialNumber = "\(eachObj.serialNumber ?? 0)"
              let questionTxt = eachObj.question ?? ""
              cell.titleLabel.text = serialNumber + ". " +  questionTxt
              cell.subTitleLabel.text = eachObj.answer
        }
        }
        else{
            
            let cell:HelpVideoCell = tableView.dequeueReusableCell(withIdentifier: "HelpVideoCell", for: indexPath) as! HelpVideoCell
             cell.selectionStyle = .none
             cell.tag = indexPath.row
            
            if searching == true {
               let eachObj = self.helpSearchList[indexPath.row]

                cell.helpTitleLbl.text = eachObj.title ?? ""
                cell.helpDescriptionLbl.text = eachObj.content ?? ""
                 
                 // for thumb Image
                 let thumbImg = eachObj.thumbNailURL
                 cell.helpThumbImg.contentMode = .scaleToFill
                // cell.helpThumbImg.image = UIImage(named: "al-muzainilogo")
                 let image = UIImage(named: "al-muzainilogo")
                 let url = URL(string: thumbImg ?? "")
                // cell.helpThumbImg.kf.setImage(with: url)
                if url == nil
                {
                    cell.helpThumbImg.kf.setImage(with: url, placeholder: image, options: nil, completionHandler: nil)
                }
                else{
                    cell.helpThumbImg.kf.setImage(with: url, placeholder: nil, options: nil, completionHandler: nil)
                }
                 cell.helpThumbImg.backgroundColor = UIColor.clear
                
              //   cell.helpThumbImg.kf.setImage(with: url, placeholder: nil, options: nil, completionHandler: nil)
                 
                 // for less/more button
                 cell.btn_more.tag = indexPath.row
                 cell.btn_more.addTarget(self, action: #selector(self.btnAction(_:)), for: UIControl.Event.touchUpInside)
                 cell.helpTitleLbl.font = Global.shared.fontHeader
                 cell.helpDescriptionLbl.font = Global.shared.fontTopLbl
                 cell.helpDescriptionLbl.sizeToFit()
                 cell.btn_more.titleLabel?.font =  Global.shared.fontReqLbl
                 if expandedCells == indexPath.row
                 {
                     cell.btn_more.setTitle("Less", for: .normal)
                 }
                 else{
                     cell.btn_more.setTitle("More", for: .normal)
                 }
                 if eachObj.content!.count <= 160
                 {
                     cell.btn_more.setTitle("", for: .normal)
                 }
                     cell.selectionStyle = UITableViewCell.SelectionStyle.none
                     return cell
                     
                 }
         
            else {
               let eachObj = self.helpVideoList[indexPath.row]
                 cell.helpTitleLbl.text = eachObj.title ?? ""
                
                let description = eachObj.content ?? ""
                cell.helpDescriptionLbl.attributedText = description.htmlToAttributedString
                
                // for thumb Image
                let thumbImg = eachObj.thumbNailURL
              //  let urlString = thumbImg?.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
                cell.helpThumbImg.contentMode = .scaleToFill
               
                let image = UIImage(named: "al-muzainilogo")
                let url = URL(string: thumbImg ?? "")
                if url == nil
                {
                    cell.helpThumbImg.kf.setImage(with: url, placeholder: image, options: nil, completionHandler: nil)
                }
                else{
                    cell.helpThumbImg.kf.setImage(with: url, placeholder: nil, options: nil, completionHandler: nil)
                }
               // cell.helpThumbImg.kf.setImage(with: url)
                
                cell.helpThumbImg.backgroundColor = UIColor.clear
                
                // for less/more button
                cell.btn_more.tag = indexPath.row
                cell.btn_more.addTarget(self, action: #selector(self.btnAction(_:)), for: UIControl.Event.touchUpInside)
                cell.helpTitleLbl.font = Global.shared.fontHeader
                
                cell.helpDescriptionLbl.font = Global.shared.fontTopLbl
                cell.helpDescriptionLbl.sizeToFit()
                cell.btn_more.titleLabel?.font =  Global.shared.fontReqLbl
               
                if expandedCells == indexPath.row
                {
                    cell.btn_more.setTitle("Less..", for: .normal)
                }
                else{
                    cell.btn_more.setTitle("More..", for: .normal)
                }
                if eachObj.content!.count <= 160
                {
                    cell.btn_more.setTitle("", for: .normal)
                }
                    cell.selectionStyle = UITableViewCell.SelectionStyle.none
                    return cell
                    
                }
         }

        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if checkBtn == "0"
        {
            if searching == true
            {
                let eachObj = self.helpSearchList[indexPath.row]
                let videoUrl = eachObj.videoURL
              //  let urlString = videoUrl?.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
                playDefaultSampleVideo(videoStr:videoUrl ?? "")
                print("You selected cell #\(indexPath.row)!")
            }
            else{
                let eachObj = self.helpVideoList[indexPath.row]
                let videoUrl = eachObj.videoURL
             //   let urlString = videoUrl?.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
                playDefaultSampleVideo(videoStr:videoUrl ?? "")
                
                print("You selected cell #\(indexPath.row)!")
            }
          
        }
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
    

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if checkBtn == "0"
        {
             if expandedCells == indexPath.row
             {
                return UITableView.automaticDimension
             }
        

        else{
             return 150
           }
        }
        else
        {
            return UITableView.automaticDimension
        }
    }
    
    @objc func btnAction(_ sender: UIButton) {
       
        if sender.tag != expandedCells
        {
           expandedCells = sender.tag
            
        }
        else
        {
            expandedCells = 111111
        }
        
        faqTableView.reloadData()
       
   }
    @IBAction func backBtnActn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if checkBtn == "0"
        {
            helpSearchList = helpVideoList.filter({ (faq) -> Bool in
            let tmp:NSString = faq.title! as NSString
            // let tmp1:NSString = faq.answer! as NSString
            let range = tmp.range(of: searchText, options: NSString.CompareOptions.caseInsensitive)
            return range.location != NSNotFound
          })
      
           if (helpSearchList.count == 0) {
              searching = false
           }
           else {
              searching = true
           }
        }
        else{
          faqSearchList = faqList.filter({ (faq) -> Bool in
          let tmp:NSString = faq.question! as NSString
          // let tmp1:NSString = faq.answer! as NSString
          let range = tmp.range(of: searchText, options: NSString.CompareOptions.caseInsensitive)
          return range.location != NSNotFound
        })
    
         if (faqSearchList.count == 0) {
            searching = false
         }
         else {
            searching = true
         }
        }
      self.faqTableView.reloadData()
    }
    
    @IBAction func segmentValueChanged(_ sender: Any)
    {
        if segment.selectedSegmentIndex == 0 {
            print("Select 0")
            self.navHeaderLbl.text = Global.shared.helpTxt
            checkBtn = "0"
            
        } else {
            print("Select 1")
            self.navHeaderLbl.text = Global.shared.faqTxt
            checkBtn = "1"
        }
        self.faqTableView.reloadData()
    }
    func xmSegmentedControl(_ xmSegmentedControl: XMSegmentedControl, selectedSegment: Int) {
        if xmSegmentedControl == seg {
            print("SegmentedControl1 Selected Segment: \(selectedSegment)")
            //duelsView.isHidden=false
            if selectedSegment == 0 {
                print("Select 0")
               // self.navHeaderLbl.text = Global.shared.faqTxt
                self.navHeaderLbl.text = "Help"
                checkBtn = "0"
                
            } else {
                print("Select 1")
                self.navHeaderLbl.text = "FAQ's"
                checkBtn = "1"
            }
            self.faqTableView.reloadData()
        }
        
    }
    
    @IBAction func languageChangeActn(_ sender: Any) {
        Global.shared.languageChangeActn()
    }
    
}

extension UISegmentedControl {
    func font(name:String?, size:CGFloat?) {
        let attributedSegmentFont = NSDictionary(object: UIFont(name: name!, size: size!)!, forKey: NSAttributedString.Key.font as NSCopying)
        setTitleTextAttributes(attributedSegmentFont as [NSObject : AnyObject] as [NSObject : AnyObject] as? [NSAttributedString.Key : Any], for: .normal)
    }
}


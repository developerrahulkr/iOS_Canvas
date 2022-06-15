//
//  NewCustomerVc.swift
//  Canvas
//
//  Created by urmila reddy on 11/08/20.
//  Copyright © 2020 urmila reddy. All rights reserved.
//

import UIKit
import MobileCoreServices
import AVFoundation
import AVKit
import Alamofire
import CoreMedia
import Photos

class NewCustomerVc: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIPopoverControllerDelegate,UIDocumentPickerDelegate, EasyTipViewDelegate {
    
    
    
    @IBOutlet weak var seeTheSampleVideoBtnOtlt: UIButton!
    
    @IBOutlet weak var lblTwo: UILabel!
    
    @IBOutlet weak var lblThree: UILabel!
    
    @IBOutlet weak var lblFour: UILabel!
    
    @IBOutlet weak var uploadPdfBtnOtlt: UIButton!
    
    // @IBOutlet weak var uploadPhotoBtnOtlt: UIButton!
    
    @IBOutlet weak var uploadVideoBtnOtlt: UIButton!
    
    @IBOutlet weak var recordVideoBtnOtlt: UIButton!
    
    @IBOutlet weak var nextBtnOtlt: UIButton!
    
    @IBOutlet weak var backBtnOtlt: UIButton!
    
    @IBOutlet weak var headerLabel: UILabel!
    
    
    @IBOutlet weak var firstView: UIView!
    
    
    @IBOutlet weak var secndView: UIView!
    
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var scrollVieww: UIScrollView!
    
    @IBOutlet weak var firstViewLbl: UILabel!
    
    
    @IBOutlet weak var secndViewLbl: UILabel!
    
    @IBOutlet weak var firstPdfProgresView: UIView!
    
    @IBOutlet weak var secndPdfProgresView: UIView!
    
    @IBOutlet weak var videoProgresView: UIView!
    
    @IBOutlet weak var firstViewHeightConstrtt: NSLayoutConstraint!
    
    
    //default - 100, 150, 200
    
    @IBOutlet weak var secndViewHeightConstrt: NSLayoutConstraint!
    
    //default - 140, 190
    
    @IBOutlet weak var firstPdfHeightConstrt: NSLayoutConstraint!
    
    @IBOutlet weak var secndPdfHeightConstrt: NSLayoutConstraint!
    
    
    
    
    @IBOutlet weak var firstPdfPathLbl: UILabel!
    
    @IBOutlet weak var secndPdfPathLbl: UILabel!
    
    @IBOutlet weak var videoPathLbl: UILabel!
    
    
    @IBOutlet weak var uploadFrontImgeLbl: UILabel!
    
    @IBOutlet weak var uploadBckImgeLbl: UILabel!
    
    @IBOutlet weak var selectVideoLbl: UILabel!
    
    @IBOutlet weak var recordVideoLbl: UILabel!
    
    @IBOutlet weak var previewUplodVideoBtnOtlt: UIButton!
    
    
    @IBOutlet weak var firstPdfImg: UIImageView!
    
    @IBOutlet weak var secndPdfImg: UIImageView!
    
    var expandTipClickCivildId = true
    var expandTipClickSelfieVideo = true
    
    
    //for video
    var controller = UIImagePickerController()
    let videoFileName = "/video.mp4"
    var videoRecOrselect: String!
    
    var videoRecordedUrl:NSURL!
    var videoSelected:String = ""
    
    
    //for video upload
    var pickerImg:UIImagePickerController?=UIImagePickerController()
    //   var imgeXX:String = ""
    
    var pdf1Base64String:String = ""
    var pdf2Base64String:String = ""
    
    var videoSize:String = ""
    var videoDuration:String = ""
    
    var imagSize:String = ""
    var pdfSize:String = ""
    
    var frontOrBck = ""
    
    
    var popover:UIPopoverController?=nil
    
    var selectedImage: UIImage?
    
    //UIDocumentMenuDelegate,UIDocumentPickerDelegate,UINavigationControllerDelegate
    override func viewDidLoad() {
        super.viewDidLoad()
        
        downloadAccountConfig()
        
        firstView.layer.cornerRadius = 5
        secndView.layer.cornerRadius = 5
        nextBtnOtlt.layer.cornerRadius = 5
        backBtnOtlt.layer.cornerRadius = 5
        
        firstView.addDropShadowToView(targetView: firstView)
        secndView.addDropShadowToView(targetView: secndView)
        
        self.scrollVieww.backgroundColor = UIColor(patternImage: UIImage(named: "AppBckgroundImg")!)
        self.mainView.backgroundColor = UIColor(patternImage: UIImage(named: "AppBckgroundImg")!)
        
        pickerImg!.delegate=self as UIImagePickerControllerDelegate & UINavigationControllerDelegate
        // Do any additional setup after loading the view.
        
        self.lblTwo.layer.cornerRadius = self.lblTwo.frame.size.width / 2;
        self.lblTwo.clipsToBounds = true
        
        self.lblThree.layer.cornerRadius = self.lblThree.frame.size.width / 2;
        self.lblThree.clipsToBounds = true
        
        self.lblFour.layer.cornerRadius = self.lblFour.frame.size.width / 2;
        self.lblFour.clipsToBounds = true
        
        assignLabels()
        playDefaultSampleVideo()

    }
    
    
    
    func assignLabels() {
        uploadFrontImgeLbl.text = Global.shared.frontTxt
        uploadBckImgeLbl.text = Global.shared.backTxt
        selectVideoLbl.text = Global.shared.browseTxt
        recordVideoLbl.text = Global.shared.recordTxt
        previewUplodVideoBtnOtlt.setTitle(Global.shared.newPreviewVideoTxt, for: .normal)
        seeTheSampleVideoBtnOtlt.setTitle(Global.shared.seeSampleVideoTxt, for: .normal)
        
        
        headerLabel.text = Global.shared.uploadProfDocmntsTxt
        firstViewLbl.text = Global.shared.uploadCivildIdTxt
        secndViewLbl.text = Global.shared.uploadSelfieVideTxt
        nextBtnOtlt.setTitle(Global.shared.continueBtnTxt, for: .normal)
        backBtnOtlt.setTitle(Global.shared.backBtnTxt, for: .normal)
        
        
        
            }
     
    
    
    @objc func tappedMe()
    {
        if pdf1Base64String == "" || pdf2Base64String == ""{
            
            let alert:UIAlertController=UIAlertController(title: Global.shared.selectOptionTxt, message: nil, preferredStyle: UIAlertController.Style.actionSheet)
            
            let cameraAction = UIAlertAction(title: Global.shared.fileTxt, style: UIAlertAction.Style.default)
            {
                UIAlertAction in
                if  self.frontOrBck == "front" {
                  //  self.frontImageUpdate()
                }
                else {
                 //   self.backImageUpdate()
                }
                //   self.openCamera()
                self.clickFunction()
            }
            let camera1Action = UIAlertAction(title: Global.shared.cameraTxt, style: UIAlertAction.Style.default)
            {
                UIAlertAction in
                if  self.frontOrBck == "front" {
                  //  self.frontImageUpdate()
                }
                else {
                  //  self.backImageUpdate()
                }
                
                self.openCamera()
                //  self.clickFunction()
            }
            let gallaryAction = UIAlertAction(title: Global.shared.galryTxt, style: UIAlertAction.Style.default)
            {
                UIAlertAction in
                
                if  self.frontOrBck == "front" {
                  //  self.frontImageUpdate()
                }
                else {
                  //  self.backImageUpdate()
                }
                
                
                self.openGallary()
            }
            let cancelAction = UIAlertAction(title: Global.shared.cancelTxt, style: UIAlertAction.Style.cancel)
            {
                UIAlertAction in
            }
            
            // Add the actions
            pickerImg?.delegate = self
            alert.addAction(cameraAction)
            alert.addAction(camera1Action)
            alert.addAction(gallaryAction)
            alert.addAction(cancelAction)
            // Present the controller
            if UIDevice.current.userInterfaceIdiom == .phone
            {
                self.present(alert, animated: true, completion: nil)
            }
            else
            {
                popover=UIPopoverController(contentViewController: alert)
            }
        }
        else {
            let alert = ViewControllerManager.displayAlert(message: Global.shared.alrdySelFrntBckFiles, title:APPLICATIONNAME)
            self.present(alert, animated: true, completion: nil)
            
        }
        
        
    }
    /*   func openCamera()
     {
     
     self.videoRecOrselect = "gallary"
     if(UIImagePickerController .isSourceTypeAvailable(UIImagePickerController.SourceType.camera))
     {
     pickerImg!.sourceType = UIImagePickerController.SourceType.camera
     self .present(pickerImg!, animated: true, completion: nil)
     }
     else
     {
     openGallary()
     }
     }*/
    
    func openCamera()
    {
        //    self.imgeXX.removeAll()
        self.videoRecOrselect = "select photo"
        if(UIImagePickerController .isSourceTypeAvailable(UIImagePickerController.SourceType.camera))
        {
            pickerImg!.sourceType = UIImagePickerController.SourceType.camera
            self .present(pickerImg!, animated: true, completion: nil)
        }
        else
        {
            openGallary()
        }
    }
    
    
    func openGallary()
    {
        
        self.videoRecOrselect = "select photo"
        //  pickerImg!.sourceType = UIImagePickerController.SourceType.photoLibrary
        pickerImg!.sourceType = .photoLibrary
        pickerImg!.mediaTypes = [kUTTypeImage as String]
        if UIDevice.current.userInterfaceIdiom == .phone
        {
            self.present(pickerImg!, animated: true, completion: nil)
        }
        else
        {
            popover=UIPopoverController(contentViewController: pickerImg!)
            
        }
    }
    
    
    
    @objc func videoSaved(_ video: String, didFinishSavingWithError error: NSError!, context: UnsafeMutableRawPointer){
        if let theError = error {
            print("error saving the video = \(theError)")
        } else {
            DispatchQueue.main.async(execute: { () -> Void in
            })
        }
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        
        
        if(self.videoRecOrselect == "record video") {
            
            videoProgresView.isHidden = false
            secndViewHeightConstrt.constant = 190
            // picker.videoQuality = UIImagePickerControllerQualityType.TypeLow
            
            //    videoSelected = "selected"
            
            if let selectedVideo:URL = (info[UIImagePickerController.InfoKey.mediaURL] as? URL) {
                //  videoRecordedUrl = selectedVideo as NSURL
                
                let asset = AVURLAsset(url: selectedVideo)
                let durationInSeconds = asset.duration.seconds
                print(durationInSeconds)
                
                let filename =  selectedVideo.deletingPathExtension().lastPathComponent
                
                let fileData = NSData(contentsOf: selectedVideo as URL)!
                print(fileData)
                
                let  mbsize = Double(fileData.count) / 1024 / 1024
                print(mbsize)
                
                if Int(mbsize) > Int(videoSize) ?? 0 {
                    videoSelected = ""
                    videoProgresView.isHidden = true
                    secndViewHeightConstrt.constant = 140
                    
                    let alert = ViewControllerManager.displayAlert(message:"Cannot record/select video greater than 50 MB", title:APPLICATIONNAME)
                    self.present(alert, animated: true, completion: nil)
                    
                }
                else {
                    videoSelected = "selected"
                    videoRecordedUrl = selectedVideo as NSURL
                  //  self.videoConvert(videoURL: selectedVideo as URL)
                    videoPathLbl.text = filename
                    self.encodeVideo(selectedVideo)
                 //   NewUser.shared.videoUrl = videoRecordedUrl
                }
                
                
                // Save video to the main photo album
                let selectorToCall = #selector(NewCustomerVc.videoSaved(_:didFinishSavingWithError:context:))
                UISaveVideoAtPathToSavedPhotosAlbum(selectedVideo.relativePath, self, selectorToCall, nil)
                
                // Save the video to the app directory so we can play it later
                let videoData = try? Data(contentsOf: selectedVideo)
                let paths = NSSearchPathForDirectoriesInDomains(
                    FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
                let documentsDirectory: URL = URL(fileURLWithPath: paths[0])
                let dataPath = documentsDirectory.appendingPathComponent(videoFileName)
                try! videoData?.write(to: dataPath, options: [])
            }
            picker.dismiss(animated: true)
        }
            
        else  if(self.videoRecOrselect == "select video") {
            
            videoProgresView.isHidden = false
            secndViewHeightConstrt.constant = 190
            
            //  videoSelected = "selected"
            
           // let videoURL = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerMediaURL")] as? NSURL
            guard let videoURL = (info[UIImagePickerController.InfoKey.mediaURL] as? URL) else { return }
          
            //  print(videoURL)
            let asset = AVURLAsset(url: videoURL)
            let durationInSeconds = asset.duration.seconds
            print(durationInSeconds)
            let exportSession = AVAssetExportSession(asset: asset, presetName: AVAssetExportPresetPassthrough)
            
            exportSession?.outputURL = videoURL as URL?
            exportSession!.outputFileType = AVFileType.mp4
            exportSession!.shouldOptimizeForNetworkUse = true
            
            
            let filename =  videoURL.deletingPathExtension().lastPathComponent
            let fileData = NSData(contentsOf: videoURL as URL)!
            print(fileData)
            
            let  mbsize = Double(fileData.count) / 1024 / 1024
            print(mbsize)
            
            if Int(mbsize) > Int(videoSize) ?? 0 {
                videoSelected = ""
                videoProgresView.isHidden = true
                secndViewHeightConstrt.constant = 140
                
                let alert = ViewControllerManager.displayAlert(message:"Cannot record/select video greater than 50 MB", title:APPLICATIONNAME)
                self.present(alert, animated: true, completion: nil)
                
            }
            else {
                videoSelected = "selected"
                self.encodeVideo(videoURL)
               // self.videoConvert(videoURL: videoURL! as URL)
               // NewUser.shared.videoUrl = videoRecordedUrl
               // print("url is",NewUser.shared.videoUrl!)
                videoPathLbl.text = filename
            }
        
            picker .dismiss(animated: true, completion: nil)
        }
            
            
            
            
        else  if(self.videoRecOrselect == "select photo") {
            var fileName = "image"
            
            if let pickedImage = info[UIImagePickerController.InfoKey(rawValue: convertFromUIImagePickerControllerInfoKey(UIImagePickerController.InfoKey.originalImage))] as? UIImage
            {
                
                
                
                let fileUrl = info[UIImagePickerController.InfoKey.imageURL] as? URL
                
                let fileData = NSData(contentsOf: fileUrl! as URL)!
                print(fileData)
                
               // let filename =  fileUrl!.deletingPathExtension().lastPathComponent
                
                let  mbsize = Double(fileData.count) / 1024 / 1024
                print(mbsize)
                
                if Int(mbsize) > Int(imagSize) ?? 0 {
                    
                    let alert = ViewControllerManager.displayAlert(message:"pdf/image cannot exceed more than 2MB", title:APPLICATIONNAME)
                    self.present(alert, animated: true, completion: nil)
                    
                }
                
                else {
                
                if fileUrl != nil {
                    fileName = fileUrl?.deletingPathExtension().lastPathComponent as! String
                }
                else {
                    fileName = "image.png"
                }
                
               
                    if chekImagesorEqual(pickedImage) {
                      print("true")
                      //print alert here
                        picker .dismiss(animated: true, completion: nil)
                        let alert = ViewControllerManager.displayAlert(message: Global.shared.sameFileUploadTxt, title:APPLICATIONNAME)
                        self.present(alert, animated: true, completion: nil)
                        
                      return
                    }
                if  self.frontOrBck == "front" {
                    self.frontImageUpdate()
                }
                else {
                    self.backImageUpdate()
                }
                
                selectedImage = pickedImage
                picker .dismiss(animated: true, completion: nil)
                let imgeeDattta = pickedImage.jpegData(compressionQuality: 0.1)
                let strBjj:String = imgeeDattta!.base64EncodedString(options: .lineLength64Characters)
                print(strBjj)
                
                if pdf1Base64String == "" && pdf2Base64String == ""{
                    pdf1Base64String = strBjj
                    print(pdf1Base64String)
                    
                    NewUser.shared.DocumentFrontSide = pdf1Base64String
                    NewUser.shared.DocumentFrontSideExtension = ".jpeg"
                    
                    firstPdfPathLbl.text = fileName
                    
                    firstViewHeightConstrtt.constant = 150
                    firstPdfHeightConstrt.constant = 50
                    firstPdfProgresView.isHidden = false
                } else if pdf1Base64String == "" {
                    pdf1Base64String = strBjj
                    print(pdf1Base64String)
                    
                    NewUser.shared.DocumentFrontSide = pdf1Base64String
                    NewUser.shared.DocumentFrontSideExtension = ".jpeg"
                    
                    firstPdfPathLbl.text = fileName
                    
                    firstViewHeightConstrtt.constant = 200
                    firstPdfHeightConstrt.constant = 50
                    firstPdfProgresView.isHidden = false
                    
                    
                    secndPdfHeightConstrt.constant = 50
                    secndPdfProgresView.isHidden = false
                }
                else {
                    pdf2Base64String = strBjj
                    print(pdf2Base64String)
                    
                    NewUser.shared.DocumentBackSide = pdf2Base64String
                    NewUser.shared.DocumentBackSideExtension = ".jpeg"
                    
                    secndPdfPathLbl.text = fileName
                    
                    firstViewHeightConstrtt.constant = 200
                    firstPdfHeightConstrt.constant = 50
                    firstPdfProgresView.isHidden = false
                    secndPdfHeightConstrt.constant = 50
                    secndPdfProgresView.isHidden = false
                }
                
             }
            }
        }
        else {
            
            print("nothing")
            picker .dismiss(animated: true, completion: nil)
            
        }
        
    }
    var exportSession: AVAssetExportSession!
    func encodeVideo(_ videoURL: URL)  {
            let avAsset = AVURLAsset(url: videoURL, options: nil)

            //Create Export session
            exportSession = AVAssetExportSession(asset: avAsset, presetName: AVAssetExportPresetPassthrough)

            let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0] as URL
            let filePath = documentsDirectory.appendingPathComponent("rendered-Video.mp4")
        deleteFile(filePath: filePath as NSURL)

            exportSession!.outputURL = filePath
            exportSession!.outputFileType = AVFileType.mp4
            exportSession!.shouldOptimizeForNetworkUse = true
            let start = CMTimeMakeWithSeconds(0.0, preferredTimescale: 0)
            let range = CMTimeRangeMake(start: start, duration: avAsset.duration)
            exportSession.timeRange = range

            exportSession!.exportAsynchronously(completionHandler: {() -> Void in
                DispatchQueue.main.async {
                   

                    switch self.exportSession!.status {
                    case .failed:
                       // self.view.makeToast(self.exportSession?.error?.localizedDescription ?? "")
                        print("abc")
                    case .cancelled:
                       // self.view.makeToast("Export canceled")
                        print("abc")
                    case .completed:
                        if let url = self.exportSession.outputURL {
                            //Rendered Video URL
                            NewUser.shared.videoUrl = url as NSURL
                        }
                    default:
                        break
                    }
                }
            })
        }
    func videoConvert(videoURL: URL) {
        let avAsset = AVURLAsset(url: videoURL as URL, options: nil)
        let startDate = NSDate()
        //Create Export session

        let exportSession = AVAssetExportSession(asset: avAsset, presetName: AVAssetExportPresetPassthrough)
        // exportSession = AVAssetExportSession(asset: composition, presetName: mp4Quality)

        //Creating temp path to save the converted video
        let documentsDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let myDocumentPath = NSURL(fileURLWithPath: documentsDirectory).appendingPathComponent("temp.mp4")?.absoluteString
        let url = NSURL(fileURLWithPath: myDocumentPath!)

        let documentsDirectory2 = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0] as NSURL
        let filePath = documentsDirectory2.appendingPathComponent("Video.mp4")
        deleteFile(filePath: filePath! as NSURL)
        
        //Check if the file already exists then remove the previous file
        if FileManager.default.fileExists(atPath: myDocumentPath!) {
            do {
                try FileManager.default.removeItem(atPath: myDocumentPath!)
            }
            catch let error {
                print(error)
            }
        }
        //URL
        print(filePath!.absoluteString)
        exportSession!.outputURL = filePath
        exportSession!.outputFileType = AVFileType.mp4
        exportSession!.shouldOptimizeForNetworkUse = true
        let start = CMTimeMakeWithSeconds(0.0, preferredTimescale: 0)
        let range = CMTimeRangeMake(start: start, duration: avAsset.duration)
        exportSession!.timeRange = range
        exportSession!.exportAsynchronously(completionHandler: {() -> Void in
            switch exportSession!.status {
                case .failed:
                    print("%@",exportSession!.error ?? "Failed to get error")
                case .cancelled:
                    print("Export canceled")
                case .completed:
                    //Video conversion finished
                    let endDate = NSDate()
                    let time = endDate.timeIntervalSince(startDate as Date)
                    print(time)
                    print("Successful!")
                    //let filename =  videoURL?.deletingPathExtension?.lastPathComponent
                    self.videoRecordedUrl = exportSession!.outputURL as NSURL?
                    NewUser.shared.videoUrl = self.videoRecordedUrl
                    print(NewUser.shared.videoUrl!)
                default:
                    break
            }
        })
        
    }
    func deleteFile(filePath:NSURL) {
        guard FileManager.default.fileExists(atPath: filePath.path!) else {
            return
        }

        do {
            try FileManager.default.removeItem(atPath: filePath.path!)
        }catch{
            fatalError("Unable to delete file: \(error) : \(#function).")
        }
    }
    
    func chekImagesorEqual(_ image: UIImage) -> Bool {
      return selectedImage?.pngData() == image.pngData()

    }
    
    
    func uploadVideoToServer() {
        if let videoUrl = videoRecordedUrl
            
            
        {
            
            AF.upload(multipartFormData: { multipartFormData in
                multipartFormData.append(videoUrl as URL, withName:  "File")
                multipartFormData.append("urmilaGlobe".data(using: String.Encoding.utf8, allowLossyConversion: false)!, withName :"VideoName")
                
                //"http://amecwebwin.ap-south-1.elasticbeanstalk.com/api/1.0/amec/upload"
            }, to: CanvasUrls.baseUrl + CanvasUrls.versionNumber + CanvasUrls.videoUpload)
                .responseJSON { response in
                    debugPrint(response)
            }
            
        }
    }
   
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController)
    {
        print("picker cancel.")
        dismiss(animated: true, completion: nil)
    }
    
    func compressVideo(inputURL: URL, outputURL: URL, handler:@escaping (_ exportSession: AVAssetExportSession?)-> Void) {
        let urlAsset = AVURLAsset(url: inputURL, options: nil)
        guard let exportSession = AVAssetExportSession(asset: urlAsset, presetName: AVAssetExportPresetLowQuality) else {
            handler(nil)
            
            return
        }
        
        exportSession.outputURL = outputURL
        exportSession.outputFileType = AVFileType.mp4
        exportSession.shouldOptimizeForNetworkUse = true
        exportSession.exportAsynchronously { () -> Void in
            handler(exportSession)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if self.easyTipView == nil {
            print("nothing")
        }
        else {
            easyTipView.dismiss()
            self.easyTipView = nil
        }
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    
    // for pdf
    public func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        guard let myURL = urls.first else {
            return
        }
        print("import result : \(myURL)")
      
        let fileData = NSData(contentsOf: myURL as URL)!
        print(fileData)
        
        let filename =  myURL.deletingPathExtension().lastPathComponent
        
        let  mbsize = Double(fileData.count) / 1024 / 1024
        print(mbsize)
        
        if Int(mbsize) > Int(pdfSize) ?? 0 {
            
            let alert = ViewControllerManager.displayAlert(message:"pdf/image cannot exceed more than 2MB", title:APPLICATIONNAME)
            self.present(alert, animated: true, completion: nil)
            
        }
        else {
            let base64String = fileData.base64EncodedString(options: .lineLength64Characters)
            print(base64String)
            if  self.frontOrBck == "front" {
                self.frontImageUpdate()
            }
            else {
                self.backImageUpdate()
            }
            
            if pdf1Base64String == "" && pdf2Base64String == ""{
                pdf1Base64String = base64String
                print(pdf1Base64String)
                
                
                firstPdfPathLbl.text = filename
                
                NewUser.shared.DocumentFrontSide = pdf1Base64String
                NewUser.shared.DocumentFrontSideExtension = ".pdf"
                
                firstViewHeightConstrtt.constant = 150
                firstPdfHeightConstrt.constant = 50
                firstPdfProgresView.isHidden = false
            } else if pdf1Base64String == "" {
                pdf1Base64String = base64String
                print(pdf1Base64String)
                
                firstPdfPathLbl.text = filename
                
                NewUser.shared.DocumentFrontSide = pdf1Base64String
                NewUser.shared.DocumentFrontSideExtension = ".pdf"
                
                firstViewHeightConstrtt.constant = 200
                firstPdfHeightConstrt.constant = 50
                firstPdfProgresView.isHidden = false
                
                secndPdfHeightConstrt.constant = 50
                secndPdfProgresView.isHidden = false
            }
            else {
                pdf2Base64String = base64String
                print(pdf2Base64String)
                
                secndPdfPathLbl.text = filename
                
                NewUser.shared.DocumentBackSide = pdf2Base64String
                NewUser.shared.DocumentBackSideExtension = ".pdf"
                
                firstViewHeightConstrtt.constant = 200
                firstPdfHeightConstrt.constant = 50
                firstPdfProgresView.isHidden = false
                secndPdfHeightConstrt.constant = 50
                secndPdfProgresView.isHidden = false
            }
        }
        
    }
    
    
    public func documentMenu(_ documentMenu:UIDocumentPickerViewController, didPickDocumentPicker documentPicker: UIDocumentPickerViewController) {
        documentPicker.delegate = self
        present(documentPicker, animated: true, completion: nil)
    }
    
    
    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        print("view was cancelled")
       // self.presentingViewController?.dismiss(animated: false, completion:nil)
    }
    
    func clickFunction(){
        
        let importMenu = UIDocumentPickerViewController(documentTypes: [String(kUTTypePDF)], in: .import)
        importMenu.delegate = self
        if #available(iOS 11.0, *) {
            UINavigationBar.appearance(whenContainedInInstancesOf: [UIDocumentBrowserViewController.self]).tintColor = nil
        }
      //  importMenu.navigationController?.navigationBar.tintColor = ColorCodes.newAppRed
        importMenu.modalPresentationStyle = .formSheet
        self.present(importMenu, animated: true, completion: nil)
    }
    
    //Upload first frontside pdf
    @IBAction func uploadPdfBtnActn(_ sender: Any) {
        
        if self.easyTipView == nil {
            print("nothing")
        }
        else {
            easyTipView.dismiss()
            self.easyTipView = nil
        }
        //  clickFunction()
        frontOrBck = "front"
        if pdf1Base64String == "" &&  pdf2Base64String == ""{
            firstPdfImg.image = nil
            secndPdfImg.image = nil
        }
        
        if firstPdfImg.image == UIImage(named: "frontOneImg") || secndPdfImg.image == UIImage(named: "frontOneImg") {
            let alert = ViewControllerManager.displayAlert(message:  Global.shared.remveFrntImgToUpNewOne, title:APPLICATIONNAME)
            self.present(alert, animated: true, completion: nil)
        }
        else {
            
            
            tappedMe()
        }
        
        
        
        
    }
    
    
    func frontImageUpdate() {
        if pdf1Base64String == "" &&  pdf2Base64String == ""{
            firstPdfImg.image = UIImage(named: "frontOneImg")
            
        }
            
        else {
            secndPdfImg.image = UIImage(named: "frontOneImg")
            
        }
        
    }
    
    func backImageUpdate() {
        if pdf1Base64String == "" &&  pdf2Base64String == ""{
            firstPdfImg.image = UIImage(named: "backOneImg")
            
        }
            
        else {
            secndPdfImg.image = UIImage(named: "backOneImg")
            
        }
        
    }
    
    //upload second backside pdf
    @IBAction func uploadPhotBtnActn(_ sender: Any) {
        
        if self.easyTipView == nil {
            print("nothing")
        }
        else {
            easyTipView.dismiss()
            self.easyTipView = nil
        }
        if pdf1Base64String == "" &&  pdf2Base64String == ""{
            firstPdfImg.image = nil
            secndPdfImg.image = nil
            
        }
        
        frontOrBck = "back"
        if firstPdfImg.image == UIImage(named: "backOneImg") || secndPdfImg.image == UIImage(named: "backOneImg") {
            let alert = ViewControllerManager.displayAlert(message: Global.shared.remveBckImgToUpNewOne , title:APPLICATIONNAME)
            self.present(alert, animated: true, completion: nil)
        }
        else {
            
            tappedMe()
        }
        
        
    }
    
    
    
    //upload video Action
    
    func openGallaryVideo()
    {
        if videoSelected == "" {
            self.videoRecOrselect = "select video"
            //  self.imgeXX.removeAll()
            pickerImg!.sourceType = UIImagePickerController.SourceType.savedPhotosAlbum
            pickerImg!.mediaTypes = ["public.movie"]
            pickerImg!.videoQuality = .typeLow
            
            if UIDevice.current.userInterfaceIdiom == .phone
            {
                self.present(pickerImg!, animated: true, completion: nil)
            }
            else
            {
                popover=UIPopoverController(contentViewController: pickerImg!)
                //    popover!.present(from: profileeImagee.frame, in: self.view, permittedArrowDirections: UIPopoverArrowDirection.any, animated: true)
            }
        }
        else {
            let alert = ViewControllerManager.displayAlert(message: Global.shared.alrdySelctdVideo, title:APPLICATIONNAME)
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    @IBAction func uploadVideoActn(_ sender: Any) {
        
        if self.easyTipView == nil {
            print("nothing")
        }
        else {
            easyTipView.dismiss()
            self.easyTipView = nil
        }
        
        openGallaryVideo()
        
    }
    
    //For Recording video
    
    func recordAvideo() {
        if videoSelected == "" {
            self.videoRecOrselect = "record video"
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                //  pickerImg!.videoMaximumDuration = 30
                // 2 Present UIImagePickerController to take video
                controller.sourceType = .camera
                controller.cameraDevice = .front
                controller.mediaTypes = [kUTTypeMovie as String]
                controller.delegate = self
                controller.videoQuality = .typeLow
                controller.videoMaximumDuration = Double(videoDuration) ?? 0.0
                
                present(controller, animated: true, completion: nil)
            }
            else {
                print("Camera is not available")
            }
            
        }
        else {
            let alert = ViewControllerManager.displayAlert(message: Global.shared.alrdySelctdVideo, title:APPLICATIONNAME)
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    @IBAction func recordVideoBtnActn(_ sender: Any) {
        
        if self.easyTipView == nil {
            print("nothing")
        }
        else {
            easyTipView.dismiss()
            self.easyTipView = nil
        }
        recordAvideo()
    }
    
    
    @IBAction func nextBtnActn(_ sender: Any) {
        if self.easyTipView == nil {
            print("nothing")
        }
        else {
            easyTipView.dismiss()
            self.easyTipView = nil
        }
        
        if pdf1Base64String == "" || pdf2Base64String == "" {
            let alert = ViewControllerManager.displayAlert(message: Global.shared.selectFrontBackFilesAlert, title:APPLICATIONNAME)
            self.present(alert, animated: true, completion: nil)
        }
        else if  videoSelected == "" {
            let alert = ViewControllerManager.displayAlert(message: Global.shared.selectVideoFileAlert, title:APPLICATIONNAME)
            self.present(alert, animated: true, completion: nil)
        }
        else {
            Global.shared.fromNewExistUser = "New User"
            Global.shared.securityQuestnsReset = "new"
          self.pushViewController(controller: VerifyAcntThirdVc.initiateController(),isGestureEnable: false, animated: false)
        }
        //   uploadVideoToServer()
        
        /*  Global.shared.fromNewExistUser = "New User"
         let vc = self.storyboard?.instantiateViewController(identifier: "VerifyAcntThirdVc") as! VerifyAcntThirdVc
         self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
         self.navigationController?.pushViewController(vc, animated: false)*/
        
    }
    
    
    @IBAction func backBtnActn(_ sender: Any) {
        
        if self.easyTipView == nil {
            print("nothing")
        }
        else {
            easyTipView.dismiss()
            self.easyTipView = nil
        }
        
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        self.navigationController?.popViewController(animated: false)
    }
    
    
    @IBAction func previewAction(_ sender: Any) {
        if self.easyTipView == nil {
            print("nothing")
        }
        else {
            easyTipView.dismiss()
            self.easyTipView = nil
        }
        
        if videoRecordedUrl != nil {
            let player = AVPlayer(url: videoRecordedUrl as URL)
            let vc = AVPlayerViewController()
            vc.player = player
            
            present(vc, animated: true) {
                vc.player?.play()
            }
        }
        else {
            
        }
        
    }
    
    @IBAction func firstPdfCancelBtnActn(_ sender: Any) {
        
        if self.easyTipView == nil {
            print("nothing")
        }
        else {
            easyTipView.dismiss()
            self.easyTipView = nil
        }
        firstPdfImg.image = nil
        
       
        
        if  pdf2Base64String == "" {
            selectedImage = nil
            firstViewHeightConstrtt.constant = 100
            firstPdfHeightConstrt.constant = 0
            secndPdfHeightConstrt.constant = 0
            firstPdfProgresView.isHidden = true
            pdf1Base64String = ""
            
        }
        else {
            
            firstViewHeightConstrtt.constant = 150
            firstPdfHeightConstrt.constant = 0
            secndPdfHeightConstrt.constant = 50
            firstPdfProgresView.isHidden = true
            pdf1Base64String = ""
            
        }
        
        if  pdf2Base64String == "" && pdf1Base64String == "" {
            selectedImage = nil
        }
        
        
    }
    
    @IBAction func secndPdfCancelBtnActn(_ sender: Any) {
        
        if self.easyTipView == nil {
            print("nothing")
        }
        else {
            easyTipView.dismiss()
            self.easyTipView = nil
        }
       
        
        secndPdfImg.image = nil
        if  pdf1Base64String == "" {
          //  selectedImage = nil
            firstViewHeightConstrtt.constant = 100
            secndPdfHeightConstrt.constant = 0
            firstPdfHeightConstrt.constant = 0
            secndPdfProgresView.isHidden = true
            pdf2Base64String = ""
        }
        else {
            selectedImage = nil
            firstViewHeightConstrtt.constant = 150
            firstPdfHeightConstrt.constant = 50
            secndPdfHeightConstrt.constant = 0
            secndPdfProgresView.isHidden = true
            pdf2Base64String = ""
        }
        if  pdf2Base64String == "" && pdf1Base64String == "" {
            selectedImage = nil
        }
        
    }
    
    @IBAction func videoRecrdCancelBtnActn(_ sender: Any) {
        
        if self.easyTipView == nil {
            print("nothing")
        }
        else {
            easyTipView.dismiss()
            self.easyTipView = nil
        }
        videoSelected = ""
        videoProgresView.isHidden = true
        secndViewHeightConstrt.constant = 140
    }
    
    // Mark: For downloading video, image size configurations
    func downloadAccountConfig() {
        
        let paramaterPasing: [String:Any] = ["languageCode":LocalizationSystem.sharedInstance.getLanguage()]
        
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        NetWorkDataManager.sharedInstance.accountConfigsImplimentation(headersTobePassed: headers, postParameters: paramaterPasing) { resonseTal , errorString in
            
            if errorString == nil
            {
                
                print(resonseTal!)
                if let documentConfiguration = resonseTal?.value(forKey: "documentConfiguration") as? String {
                    let newObj = Global.shared.convertToAryDictionary(text: documentConfiguration)
                    for dataObj in newObj! {
                        if let name = dataObj["type"] as? String{
                            if name == "video" {
                                if let videosizemb = dataObj["size_mb"] as? String{
                                    self.videoSize = videosizemb
                                }
                                if let videoDuration = dataObj["duration_sec"] as? String{
                                    self.videoDuration = videoDuration
                                }
                                
                            }
                            if name == "document" {
                                if let imagePdfsizemb = dataObj["size_mb"] as? String{
                                    self.imagSize = imagePdfsizemb
                                    self.pdfSize = imagePdfsizemb
                                }
                            }
                        }
                        print(self.videoSize)
                        print(self.imagSize)
                        print(self.pdfSize)
                        print(self.videoDuration)
                        
                    }
                }
            }
                
            else
            {
                print(errorString!)
                self.removeSpinner()
                let finalError = errorString?.components(separatedBy: ":")
                let alert = ViewControllerManager.displayAlert(message: finalError?[1] ?? "", title:APPLICATIONNAME)
                self.present(alert, animated: true, completion: nil)
                
            }
            
            
        }
        
    }
    
    func playDefaultSampleVideo() {
        let sampleUrl =  URL(string: Global.shared.sampleVideoPathhhh)
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
    
    
    @IBAction func seeTheSampleVideoActn(_ sender: Any) {
        if self.easyTipView == nil {
            print("nothing")
        }
        else {
            easyTipView.dismiss()
            self.easyTipView = nil
        }
        
        let sampleUrl =  URL(string: Global.shared.sampleVideoPathhhh)
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
    
    @IBAction func civilIdTipActn(_ sender: Any) {
        
        var preferences = EasyTipView.Preferences()
        preferences.drawing.font = UIFont(name: "Futura-Medium", size: 13)!
        preferences.drawing.foregroundColor = UIColor.white
        preferences.drawing.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        preferences.drawing.arrowPosition = EasyTipView.ArrowPosition.top
        
        EasyTipView.globalPreferences = preferences
        
        
        
        if self.easyTipView == nil
        {
            self.easyTipView = EasyTipView(text: Global.shared.imageFileToolTip)
            self.easyTipView.show(animated: true, forView: sender as! UIView, withinSuperview: nil)
        }
        else
        {
            self.easyTipView.dismiss()
            self.easyTipView = nil
        }
    }
    
    var easyTipView : EasyTipView!
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // var touch: UITouch? = touches.first
        // var toolTip = EasyTipView()
        
        if self.easyTipView == nil {
            print("nothing")
        }
        else {
            easyTipView.dismiss()
            self.easyTipView = nil
        }
    }
    
    
    @IBAction func selfieVideoTipActn(_ sender: Any) {
        
        
        var preferences = EasyTipView.Preferences()
        preferences.drawing.font = UIFont(name: "Futura-Medium", size: 13)!
        preferences.drawing.foregroundColor = UIColor.white
        preferences.drawing.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        preferences.drawing.arrowPosition = EasyTipView.ArrowPosition.top
        
        EasyTipView.globalPreferences = preferences
        
        
        
        if self.easyTipView == nil
        {
            self.easyTipView = EasyTipView(text:  Global.shared.videoFileToolTip)
            self.easyTipView.show(animated: true, forView: sender as! UIView, withinSuperview: nil)
        }
        else
        {
            self.easyTipView.dismiss()
            self.easyTipView = nil
        }
        
    }
    
    func easyTipViewDidDismiss(_ tipView: EasyTipView) {
        
        tipView.dismiss()
    }
    
    @IBAction func languageChangeActn(_ sender: Any) {
        Global.shared.languageChangeActn()
    }
    
}
fileprivate func convertFromUIImagePickerControllerInfoKeyDictionary(_ input: [UIImagePickerController.InfoKey: Any]) -> [String: Any] {
    return Dictionary(uniqueKeysWithValues: input.map {key, value in (key.rawValue, value)})
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromUIImagePickerControllerInfoKey(_ input: UIImagePickerController.InfoKey) -> String {
    return input.rawValue
}

extension AVURLAsset {
    var fileSize: Int? {
        let keys: Set<URLResourceKey> = [.totalFileSizeKey, .fileSizeKey]
        let resourceValues = try? url.resourceValues(forKeys: keys)
        
        return resourceValues?.fileSize ?? resourceValues?.totalFileSize
    }
}


/*extension UIDocumentPickerViewController {
        open override func viewWillLayoutSubviews() {
            super.viewWillLayoutSubviews()
            self.navigationBar.topItem?.rightBarButtonItem?.tintColor = ColorCodes.newAppRed
            self.navigationBar.topItem?.rightBarButtonItem?.isEnabled = true
        }
    }*/

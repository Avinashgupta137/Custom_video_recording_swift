//
//  ViewController.swift
//  Camera_gallery
//
//  Created by MAC OS 14 on 29/06/22.
//

import UIKit
import AVFoundation
import MobileCoreServices
import Photos

class ViewController: UIViewController {

    @IBOutlet weak var picimg: UIImageView!
    var videoAndImageReview = UIImagePickerController()
    var videoURL: URL?

    @IBOutlet weak var btnView: CardView!
    override func viewDidLoad() {
        super.viewDidLoad()
        btnView.isHidden = true
        
    }
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        func alertCameraAccessNeeded() {
//            let settingsAppURL = URL(string: UIApplication.openSettingsURLString)!
//
//             let alert = UIAlertController(
//                 title: "Need Camera Access",
//                 message: "Camera access is required to make full use of this app.",
//                 preferredStyle: UIAlertController.Style.alert
//            )
//
//           alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
//            alert.addAction(UIAlertAction(title: "Allow Camera", style: .cancel, handler: { (alert) -> Void in
//               UIApplication.shared.open(settingsAppURL, options: [:], completionHandler: nil)
//           }))
//
//            present(alert, animated: true, completion: nil)
//        }
//    }


    @IBAction func btnClick(_ sender: Any) {
        btnView.isHidden = false
        
    
    }
    
    @IBAction func btnCamera(_ sender: Any) {
       
        AVCaptureDevice.requestAccess(for: .video) {
            (success) in
            if success{
                self.checkcameraPermission()
            } else {
                self.checkcameraPermission()
            }
        }
        btnView.isHidden = true
    }
    
    @IBAction func gallery(_ sender: Any) {
        PHPhotoLibrary.requestAuthorization(for: .readWrite) { [unowned self] (status) in
            if status == .authorized {
                checklibaryAcess()
            }else {
                checklibaryAcess()
            }
        }
       
        btnView.isHidden = true
    }
    
    @IBAction func btnCancel(_ sender: Any) {
        btnView.isHidden = true
        
        
    }
    @IBAction func recordingbtn(_ sender: Any) {
        AVCaptureDevice.requestAccess(for: .video) {
            (success) in
            if success{
                self.checkvideocameraPermission()
            } else {
                self.checkvideocameraPermission()
            }
        }
        btnView.isHidden = true
//        self.recording()
//        btnView.isHidden = true
    }
    
    @IBAction func videoPlaybtn(_ sender: Any) {
        self.videoplay()
        btnView.isHidden = true
        
    }
    
}

extension ViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    /*   new      */
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
      //  print("\(info)")
        
        // UIImagePickerControllerEditedImage
        if  let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as?  UIImage {
            picimg.image = image
            self.btnView.isHidden = true
        }
        
        picker.dismiss(animated: true, completion: nil)
        
    }
    
    
    
    /*   new      */
//    func presentCameraSetting() {
//        let alertController = UIAlertController(title: "GRANT PERMISSION", message: "TO ACCESS IN CAMERA", preferredStyle: .actionSheet)
////        alertController.addAction(UIAlertAction(title: "Gallery", style: .default, handler: {
////            (handler) in
////            self.gallery()
////
////
////        }))
////        alertController.addAction(UIAlertAction(title: "Camera", style: .default, handler: {
////            (handler) in
////            self.callcamera()
////        }))
//        alertController.addAction(UIAlertAction(title: "cancel", style: .cancel))
//        alertController.addAction(UIAlertAction(title: "Settings", style: .default) {
//            _ in
//            if let url = URL(string: UIApplication.openSettingsURLString){
//                UIApplication.shared.open(url, options: [:], completionHandler: {
//                    _ in
//                })
//            }
//        })
//        present(alertController, animated:  true)
//    }
    
//    func alertCameraAccessNeeded() {
//                let settingsAppURL = URL(string: UIApplication.openSettingsURLString)!
//
//                 let alert = UIAlertController(
//                     title: "Need Camera Access",
//                     message: "Camera access is required to make full use of this app.",
//                     preferredStyle: UIAlertController.Style.alert
//                )
//
//               alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
//                alert.addAction(UIAlertAction(title: "Allow Camera", style: .cancel, handler: { (alert) -> Void in
//                   UIApplication.shared.open(settingsAppURL, options: [:], completionHandler: nil)
//               }))
//
//                present(alert, animated: true, completion: nil)
//            }
    
    
    func checkcameraPermission(){
        let authStatus = AVCaptureDevice.authorizationStatus(for: .video)
        switch authStatus {
        case .authorized:
            print("Success")
            self.callcamera()
            break
        case .restricted:
            print("User Don't Allow")
            break
        case .denied:
            print("Denied status called")
          //  self.presentCameraSetting()
            if let url = URL(string: UIApplication.openSettingsURLString){
                UIApplication.shared.open(url, options: [:], completionHandler: {
                    _ in
                })
            }
            break
        case .notDetermined:
           
            print("")
            break
        }
    }
    func checkvideocameraPermission(){
        let authStatus = AVCaptureDevice.authorizationStatus(for: .video)
        switch authStatus {
        case .authorized:
            print("Success")
            self.recording()
            break
        case .restricted:
            print("User Don't Allow")
            break
        case .denied:
            print("Denied status called")
          //  self.presentCameraSetting()
            if let url = URL(string: UIApplication.openSettingsURLString){
                UIApplication.shared.open(url, options: [:], completionHandler: {
                    _ in
                })
            }
            break
        case .notDetermined:
           
            print("")
            break
        }
    }
    
    func checklibaryAcess(){
        let status = PHPhotoLibrary.authorizationStatus()
        
        switch status {
        case .notDetermined:
            break
        case .restricted:
            break
        case .denied:
          //  self.presentCameraSetting()
            if let url = URL(string: UIApplication.openSettingsURLString){
                UIApplication.shared.open(url, options: [:], completionHandler: {
                    _ in
                })
            }
            break
        case .authorized:
            gallery()
        case .limited:
            break
        }
    }
    
  
    
    
    func callcamera(){
        DispatchQueue.main.async {
            let myPickerController = UIImagePickerController()
            myPickerController.delegate = self
            myPickerController.sourceType = UIImagePickerController.SourceType.camera
            self.present(myPickerController, animated: true, completion:  nil)
            myPickerController.allowsEditing = true
        }
    }
    func gallery(){
        DispatchQueue.main.async {
            let vc = UIImagePickerController()
            vc.sourceType = .photoLibrary
            vc.delegate = self
            vc.allowsEditing = true
            self.present(vc, animated: true)
        }
    }
    func recording(){
//        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
//            print("Camera Available")
        DispatchQueue.main.async {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            imagePicker.mediaTypes = [kUTTypeMovie as String]
            imagePicker.allowsEditing = true
            
            self.present(imagePicker, animated: true, completion: nil)
        }
//        } else {
//            print("Camera UnAvaialable")
//        }
        
    }

    func videoplay(){

            videoAndImageReview.sourceType = .savedPhotosAlbum
            videoAndImageReview.delegate = self
            videoAndImageReview.mediaTypes = ["public.movie"]
            present(videoAndImageReview, animated: true, completion: nil)

    }
}

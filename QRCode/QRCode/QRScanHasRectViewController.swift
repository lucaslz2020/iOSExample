//
//  QRScanHasRectViewController.swift
//  QRCode
//
//  Created by lucas on 16/9/2.
//  Copyright © 2016年 三只小猪. All rights reserved.
//

import UIKit
import AVFoundation

class QRScanHasRectViewController: UIViewController {

    @IBOutlet weak var scanRectView: UIView!

    lazy var device: AVCaptureDevice = {
        return AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
    }()
    
    lazy var input: AVCaptureDeviceInput = {
        let result = try! AVCaptureDeviceInput(device: self.device)
        return result
    }()
    
    lazy var output: AVCaptureMetadataOutput = {
        let result = AVCaptureMetadataOutput()
        result.setMetadataObjectsDelegate(self, queue: dispatch_get_main_queue())
        return result
    }()
    
    lazy var session: AVCaptureSession = {
        let result = AVCaptureSession()
        result.sessionPreset = AVCaptureSessionPresetHigh
        if result.canAddInput(self.input) {
            result.addInput(self.input)
        }
        if result.canAddOutput(self.output) {
            result.addOutput(self.output)
        }
        return result
    }()
    
    lazy var previewLayer: AVCaptureVideoPreviewLayer = {
        let result = AVCaptureVideoPreviewLayer(session: self.session)
        result.frame = self.view.layer.bounds
        return result
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scanRectView.layer.borderColor = UIColor.blueColor().CGColor
        scanRectView.layer.borderWidth = 2.0
        scanRectView.backgroundColor = nil
        scanRectView.opaque = false
        
        let authorizationStatus = AVCaptureDevice.authorizationStatusForMediaType(AVMediaTypeVideo)
        switch authorizationStatus {
        case .NotDetermined:
            AVCaptureDevice.requestAccessForMediaType(AVMediaTypeVideo) { (granted) in
                if granted {
                    self.startCapture()
                } else {
                    print("没有授权访问相机")
                    UIApplication.sharedApplication().openURL(NSURL(string: UIApplicationOpenSettingsURLString)!)
                }
            }
            break;
        case .Restricted:
            
            break;
        case .Denied:
            UIApplication.sharedApplication().openURL(NSURL(string: UIApplicationOpenSettingsURLString)!)
            print("拒绝访问相机")
            break;
        case .Authorized:
            startCapture()
            break;
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(changeOutputRectOfInterest), name: AVCaptureInputPortFormatDescriptionDidChangeNotification, object: nil)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    @objc func changeOutputRectOfInterest(notification: NSNotification) {
        self.output.rectOfInterest = self.previewLayer.metadataOutputRectOfInterestForRect(self.scanRectView.frame)
    }
    
    private func startCapture() {
        self.view.layer.insertSublayer(self.previewLayer, atIndex: 0)
        
        self.output.metadataObjectTypes = [AVMetadataObjectTypeQRCode]
        self.session.startRunning()
    }
}

extension QRScanHasRectViewController: AVCaptureMetadataOutputObjectsDelegate {
    
    func captureOutput(captureOutput: AVCaptureOutput!,
                       didOutputMetadataObjects metadataObjects: [AnyObject]!,
                                                fromConnection connection: AVCaptureConnection!) {
        if metadataObjects.count > 0 {
            self.session.stopRunning()
            if let metadataObject = metadataObjects.first as? AVMetadataMachineReadableCodeObject {
                print(metadataObject)
            }
        }
    }
}

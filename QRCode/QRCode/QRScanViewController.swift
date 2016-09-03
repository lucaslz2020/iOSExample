//
//  QRScanViewController.swift
//  QRCode
//
//  Created by lucas on 16/9/2.
//  Copyright © 2016年 三只小猪. All rights reserved.
//

import UIKit
import AVFoundation

class QRScanViewController: UIViewController {

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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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

    private func startCapture() {
        let layer = AVCaptureVideoPreviewLayer(session: self.session)
        layer.frame = self.view.layer.bounds
        self.view.layer.insertSublayer(layer, atIndex: 0)
        
        self.output.metadataObjectTypes = [AVMetadataObjectTypeCode128Code, AVMetadataObjectTypeQRCode]
        self.session.startRunning()
    }
}

extension QRScanViewController: AVCaptureMetadataOutputObjectsDelegate {
    
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

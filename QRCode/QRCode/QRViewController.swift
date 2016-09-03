//
//  QRViewController.swift
//  QRCode
//
//  Created by lucas on 16/9/3.
//  Copyright © 2016年 三只小猪. All rights reserved.
//

import UIKit
import AVFoundation

class QRViewController: UIViewController {

    @IBOutlet weak var QRView: QRCodeView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    /**
     长按识别二维码
     */
    @IBAction func touchLongPressGesture(sender: UILongPressGestureRecognizer) {
        if NSFoundationVersionNumber <  NSFoundationVersionNumber_iOS_8_0 {
            return
        }
        let detector = CIDetector(ofType: CIDetectorTypeQRCode, context: nil, options: [CIDetectorAccuracy: CIDetectorAccuracyHigh])
        guard let QRCGImage = QRView.QRCodeImageView.image?.CGImage else {
            return
        }
        let image = CIImage(CGImage: QRCGImage)
        guard let features: [CIFeature] = detector.featuresInImage(image, options: [CIDetectorAccuracy: CIDetectorAccuracyHigh]),
            feature = features.first else {
            return
        }
        guard let QRCodeFeature = feature as? CIQRCodeFeature else {
            return
        }
        let QRCodeString = QRCodeFeature.messageString
        print("识别出来的二维码 = \(QRCodeString)")
    }
}

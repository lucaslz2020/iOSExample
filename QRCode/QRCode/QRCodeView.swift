//
//  QRCodeView.swift
//  QRCode
//
//  Created by lucas on 16/9/1.
//  Copyright © 2016年 三只小猪. All rights reserved.
//

import UIKit

/// 二维码
class QRCodeView: UIView {
    
    lazy var QRCodeImageView: UIImageView = {
        let result: UIImageView = UIImageView(frame: self.bounds)        
        result.image = QRCodeView.createQRCodeToSolveBlur("http://lucaslz.com", withSize: self.bounds.size)
        return result
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    func setupViews() {
        self.addSubview(self.QRCodeImageView)
    }
    
    class func createQRCode(QRCode: String) -> UIImage? {
        
        guard let data = QRCode.dataUsingEncoding(NSISOLatin1StringEncoding) else {
            return nil
        }
        
        guard let filter: CIFilter = CIFilter(name: "CIQRCodeGenerator") else {
            return nil
        }
        filter.setValue(data, forKey: "inputMessage")
        filter.setValue("L", forKey: "inputCorrectionLevel")
        
        guard let QRImage = filter.outputImage else {
            return nil
        }
        
       return UIImage(CIImage: QRImage)
    }
    
    /**
     解决模糊问题。
     */
    class func createQRCodeToSolveBlur(QRCode: String, withSize size: CGSize) -> UIImage? {
        
        guard let data = QRCode.dataUsingEncoding(NSISOLatin1StringEncoding) else {
            return nil
        }
        
        guard let filter: CIFilter = CIFilter(name: "CIQRCodeGenerator") else {
            return nil
        }
        filter.setValue(data, forKey: "inputMessage")
        filter.setValue("L", forKey: "inputCorrectionLevel")
        
        guard let QRImage = filter.outputImage else {
            return nil
        }
        
        let cgImage = CIContext().createCGImage(QRImage, fromRect: QRImage.extent)
        
        UIGraphicsBeginImageContext(size)
        let context = UIGraphicsGetCurrentContext()
        CGContextSetInterpolationQuality(context, .None)
        
        CGContextScaleCTM(context, 1.0, -1.0)
        
        CGContextDrawImage(context, CGContextGetClipBoundingBox(context), cgImage)
        let QRCodeImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return QRCodeImage
    }
}

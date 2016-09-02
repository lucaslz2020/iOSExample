//
//  QRCodeImageHasSeparatedView.swift
//  QRCode
//
//  Created by lucas on 16/9/2.
//  Copyright © 2016年 三只小猪. All rights reserved.
//

import UIKit

class QRCodeImageHasSeparatedView: UIView {

    lazy var QRCodeView: UIImageView = {
        let result: UIImageView = UIImageView(frame: self.bounds)
        
        let QRImage = QRCodeImageHasSeparatedView.createQRCodeToSolveBlur("http://lucaslz.com", withSize: self.bounds.size)
        
        let logoImage = UIImage(named: "avatar")
        result.image = QRCodeImageHasSeparatedView.addLogoImage(logoImage!, toImage: QRImage!, logoSize: CGSizeMake(50, 50))
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
        self.addSubview(self.QRCodeView)
    }
    
    class func createQRCodeToSolveBlur(QRCode: String, withSize size: CGSize) -> UIImage? {
        
        guard let data = QRCode.dataUsingEncoding(NSISOLatin1StringEncoding) else {
            return nil
        }
        
        guard let filter: CIFilter = CIFilter(name: "CIQRCodeGenerator") else {
            return nil
        }
        filter.setValue(data, forKey: "inputMessage")
        filter.setValue("H", forKey: "inputCorrectionLevel")
        
        guard let QRImage = filter.outputImage else {
            return nil
        }
        
        let scale = min(size.width / CGRectGetWidth(QRImage.extent),
                        size.height / CGRectGetHeight(QRImage.extent))
        let transform = CGAffineTransformMakeScale(scale, scale)
        return UIImage(CIImage: QRImage.imageByApplyingTransform(transform))
    }
    
    class func addLogoImage(logoImage: UIImage, toImage sourceImage: UIImage, logoSize size: CGSize) -> UIImage {
        
        UIGraphicsBeginImageContext(sourceImage.size)
        sourceImage.drawInRect(CGRectMake(0, 0, sourceImage.size.width, sourceImage.size.height))
        
        let logoImageRect = CGRectMake((sourceImage.size.width - size.width) * 0.5,
                                       (sourceImage.size.height - size.height) * 0.5,
                                       size.width,
                                       size.height)
        
        
        let context = UIGraphicsGetCurrentContext()
        let addWidth: CGFloat = 10.0
        CGContextSaveGState(context)
        CGContextSetFillColorWithColor(context, UIColor.whiteColor().CGColor)
        CGContextFillRect(context,
                          CGRectMake(CGRectGetMinX(logoImageRect) - addWidth,
                            CGRectGetMinY(logoImageRect) - addWidth,
                            size.width + addWidth * 2,
                            size.height + addWidth * 2))
        
        CGContextRestoreGState(context)
        
        logoImage.drawInRect(logoImageRect);
        
        let resultImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext()
        return resultImage;
    }
}

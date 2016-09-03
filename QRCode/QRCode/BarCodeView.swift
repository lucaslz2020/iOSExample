//
//  BarCodeView.swift
//  QRCode
//
//  Created by lucas on 16/9/3.
//  Copyright © 2016年 三只小猪. All rights reserved.
//

import UIKit

/// 条形码 也就是一维码。
class BarCodeView: UIView {
    
    @IBOutlet weak var barCodeContainerView: UIView!
    
    @IBOutlet weak var barCodeLabel: UILabel!
    
    static let barCode = "123131231231"
    
    lazy var barCodeImageView: UIImageView = {
        let result: UIImageView = UIImageView(frame: self.barCodeContainerView.bounds)
        result.image = BarCodeView.createQRCodeToSolveBlur(barCode, withSize: self.barCodeContainerView.bounds.size)
        return result
    }()
    
    override func awakeFromNib() {
        setupViews()
        setupDatas()
    }
    
    func setupViews() {
        self.barCodeContainerView.addSubview(self.barCodeImageView)
    }
    
    func setupDatas() {
        self.barCodeLabel.text = BarCodeView.barCode
    }
    
    class func createQRCodeToSolveBlur(QRCode: String, withSize size: CGSize) -> UIImage? {
        
        guard let data = QRCode.dataUsingEncoding(NSISOLatin1StringEncoding) else {
            return nil
        }
        
        guard let filter: CIFilter = CIFilter(name: "CICode128BarcodeGenerator") else {
            return nil
        }
        filter.setValue(data, forKey: "inputMessage")
        filter.setValue(20.0, forKey: "inputQuietSpace")
        
        guard let QRImage = filter.outputImage else {
            return nil
        }
        
        let scale = min(size.width / CGRectGetWidth(QRImage.extent),
                        size.height / CGRectGetHeight(QRImage.extent))
        let transform = CGAffineTransformMakeScale(scale, scale)
        return UIImage(CIImage: QRImage.imageByApplyingTransform(transform))
    }
}

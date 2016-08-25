//
//  PhoneViewCell.swift
//  Tips-01
//
//  Created by lucas on 16/8/25.
//  Copyright © 2016年 三只小猪. All rights reserved.
//

import UIKit

protocol PhoneViewCellDelegate: class {
    func phoneViewCell(phoneViewCell: PhoneViewCell, didClickSendMessageButton sender: UIButton)
}

class PhoneViewCell: UITableViewCell {
    
    static let identifier = "PhoneViewCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var detailLabel: UILabel!
    
    @IBOutlet weak var messageButton: UIButton!
    
    weak var delegate: PhoneViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func sendMessage(sender: UIButton) {
        guard let delegate = self.delegate else {
            return
        }
        delegate.phoneViewCell(self, didClickSendMessageButton: sender)
    }
}

//
//  AddressTableViewCell.swift
//  GME Remit
//
//  Created by InKwon Kim on 22/04/2019.
//  Copyright © 2019 Gobal Money Express Co. Ltd. All rights reserved.
//

import UIKit

class AddressTableViewCell: UITableViewCell {
  
  @IBOutlet weak var zipCodeLabel: UILabel!
  @IBOutlet weak var roadAddressLabel: UILabel!
  @IBOutlet weak var jibunAddressLabel: UILabel!
  @IBOutlet weak var korAddressLabel: UILabel!
  
  func setModel(with model: Juso) {
    roadAddressLabel.text = model.roadAddr
    jibunAddressLabel.text = model.jibunAddr
    zipCodeLabel.text = model.zipNo
    korAddressLabel.text = model.korAddr
    
    self.contentView.layer.cornerRadius = 10
  }
  
}

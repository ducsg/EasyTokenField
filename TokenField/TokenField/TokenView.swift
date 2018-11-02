//
//  TokenView.swift
//  TokenField
//
//  Created by Duc Ngo on 11/2/18.
//  Copyright © 2018 BuiAnh. All rights reserved.
//

import UIKit

class TokenView: UIView {
  @IBOutlet weak var lb: UILabel!
  @IBOutlet weak var contentView: UIView!
  
  var deleteTap:((_ model:TokenViewModel?) -> Void)?
  
  var model:TokenViewModel? {
    didSet {
      lb.text = model?.name
    }
  }
  
  override func awakeFromNib() {
    contentView.layer.cornerRadius = 5.0
  }
  
  @IBAction func btnDeleteTap(_ sender: Any) {
    deleteTap?(model)
  }
}

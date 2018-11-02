//
//  ViewController.swift
//  TokenField
//
//  Created by Duc Ngo on 11/1/18.
//  Copyright © 2018 BuiAnh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var tokenContainerView: UIView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    DispatchQueue.main.async {
      let tokenView:EasyTokenField = .fromNib()
      tokenView.frame = self.tokenContainerView.bounds
      self.tokenContainerView.addSubview(tokenView)
    }
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}


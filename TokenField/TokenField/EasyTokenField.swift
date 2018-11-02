//
//  TokenScrollView.swift
//  TokenField
//
//  Created by Duc Ngo on 11/1/18.
//  Copyright © 2018 BuiAnh. All rights reserved.
//

import UIKit
struct TokenViewModel {
  var name:String
  var tokenID:Int
}

class EasyTokenField: UIView , UITextFieldDelegate {
  
  @IBOutlet weak var scrollView: UIScrollView!
  @IBOutlet weak var tokenContainer: UIStackView!
  @IBOutlet weak var tfInput: UITextField!
  
  private var tokens:[TokenViewModel] = []
  
  override func awakeFromNib() {
    tfInput.delegate = self
    self.layer.cornerRadius = 2.0
    self.layer.borderWidth = 1.0
    self.layer.borderColor = UIColor.gray.cgColor
  }
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    insertString(str: textField.text ?? "")
    return true
  }
  
  private func insertString(str:String) {
    
    if str.count > 0 {
      
      let lastIndex = tokens.count
      
      let model = TokenViewModel(name: str,
                                 tokenID: lastIndex)
      insertModel(token: model)
    }
  }
  
  
  func insertModel(token:TokenViewModel) {
    if let mIndex = self.tokens.index(where: { (model) -> Bool in
      model.tokenID == token.tokenID
    }) {
      print("this ID : \(token.tokenID) is existed at Index \(mIndex)")
    } else {
      let lastIndex = tokens.count
      
      tokens.insert(token, at:lastIndex )
      
      let tokenView:TokenView = .fromNib()
      
      tokenView.model = token
      
      tokenView.deleteTap = { [unowned self] (model) in
        if let mIndex = self.tokens.index(where: { (token) -> Bool in
          token.tokenID == model?.tokenID
        }) {
          self.tokens.remove(at: mIndex)
          self.tokenContainer.removeArrangedSubview(tokenView)
        }
      }
      tokenContainer.insertArrangedSubview(tokenView, at: lastIndex)
      let XOffset = scrollView.contentSize.width - scrollView.bounds.size.width
      
      if (XOffset > 0) {
        let bottomOffset = CGPoint(x: XOffset + tfInput.frame.width , y:0)
        scrollView.setContentOffset(bottomOffset, animated: true)
      }
      
    }
  }
}


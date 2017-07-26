//
//  IBCustomButton.swift
//  iNFCReader
//
//  Created by Yuki.S on 2017/07/26.
//  Copyright © 2017年 Yuki.S. All rights reserved.
//
import UIKit

@IBDesignable
class IBCustomButton: UIButton {
  
  @IBInspectable var textColor: UIColor?
  
  @IBInspectable var cornerRadius: CGFloat = 0 {
    didSet {
      layer.cornerRadius = cornerRadius
    }
  }
  
  @IBInspectable var borderWidth: CGFloat = 0 {
    didSet {
      layer.borderWidth = borderWidth
    }
  }
  
  @IBInspectable var borderColor: UIColor = UIColor.clear {
    didSet {
      layer.borderColor = borderColor.cgColor
    }
  }
}

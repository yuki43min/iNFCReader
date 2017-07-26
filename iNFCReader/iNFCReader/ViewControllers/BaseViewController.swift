//
//  BaseViewController.swift
//  iNFCReader
//
//  Created by Yuki.S on 2017/07/26.
//  Copyright © 2017年 Yuki.S. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    setNavigationBackButton()
  }
  
  func setNavigationBackButton() {
    let backButtonItem = UIBarButtonItem(title: kBackButtonTitle, style: .plain, target: nil, action: nil)
    self.navigationItem.backBarButtonItem = backButtonItem
  }
}

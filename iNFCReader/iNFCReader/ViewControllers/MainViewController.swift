//
//  MainViewController.swift
//  iNFCReader
//
//  Created by Yuki.S on 2017/07/26.
//  Copyright © 2017年 Yuki.S. All rights reserved.
//

import UIKit

class MainViewController: BaseViewController {
  
  @IBOutlet var buttonReadStart: UIButton!
  @IBOutlet var buttonWriteStart: UIButton!
  @IBOutlet var imageView: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.navigationItem.title = kNavigationTitle
    self.buttonReadStart.setTitle(kButtonReadStartTitle, for: .normal)
    self.buttonReadStart.addTarget(self, action: #selector(buttonReadStartTapped), for: .touchUpInside)
    self.buttonWriteStart.setTitle(kButtonWriteStartTitle, for: .normal)
    self.buttonWriteStart.addTarget(self, action: #selector(buttonWriteStartTapped), for: .touchUpInside)
    
    self.imageView.image = UIImage(named: "NFC-logo-forum.jpg")!
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @objc func buttonReadStartTapped (){
    if #available(iOS 11.0, *) {
      // iOS11以降の場合
      self.performSegue(withIdentifier: kSegueIdentifier, sender: self)
    } else {
      // iOS10以前の場合
      ViewControllerHelper.showAlert(title: "エラー", message: "NFC機能はiOS11以降のみサポートされます。", vc: self)
    }
  }
  
  @objc func buttonWriteStartTapped (){
    ViewControllerHelper.showAlert(title: "エラー", message: "本機能は実装されていません。", vc: self)    
  }

}

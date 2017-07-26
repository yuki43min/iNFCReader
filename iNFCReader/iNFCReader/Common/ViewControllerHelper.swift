//
//  ViewControllerHelper.swift
//  iNFCReader
//
//  Created by Yuki.S on 2017/07/26.
//  Copyright © 2017年 Yuki.S. All rights reserved.
//

import CoreNFC
import UIKit

class ViewControllerHelper {
  
  static func typeNameFormatToString(format :NFCTypeNameFormat) -> String {
    switch format {
    case .empty:
      return "empty"
    case .nfcWellKnown:
      return "nfcWellKnown"
    case .media:
      return "media"
    case .absoluteURI:
      return "absoluteURI"
    case .nfcExternal:
      return "nfcExternal"
    case .unknown:
      return "unknown"
    case .unchanged:
      return "unchanged"
    }
  }
  
  static func showAlert(title :String, message :String, vc :UIViewController) {
    let alert: UIAlertController = UIAlertController(title: title, message: message,
                                                     preferredStyle:  UIAlertControllerStyle.alert)
    let defaultAction: UIAlertAction = UIAlertAction(title: kAlertOK, style: UIAlertActionStyle.default, handler:{
      // ボタンが押された時の処理を書く（クロージャ実装）
      (action: UIAlertAction!) -> Void in
      print("OK")
    })
    alert.addAction(defaultAction)
    vc.present(alert, animated: true, completion: nil)
  }
}

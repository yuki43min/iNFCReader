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
  
  /// NFCTypeNameFormatをStringに変換する
  ///
  /// - Parameter format: NFCTypeNameFormatの列挙値
  ///
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
  
  /// アラートを表示する
  /// OKボタンのみを持つアラート
  /// OKボタンをタップすると、アラートを閉じる
  ///
  /// - Parameter title: アラートのタイトル
  /// - Parameter message: アラートの本文
  /// - Parameter vc: 呼び出し元のViewController
  ///
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
  
 

  /// DataオブジェクトをString型に変換する.
  /// ASCIIかUTF-8でString型にエンコードした結果を返す。
  /// エンコードできなかった場合は、空文字""を返す。
  ///
  /// - Parameter data: 変換元のDataオブジェクト
  ///
  static func encodeToString (data :Data) -> String! {
    let strUTF8 = String(data: data, encoding: .utf8)
    let strASCII = String(data: data, encoding: .ascii)
    if(strASCII != nil) {
      // ASCII
      return strASCII!
    } else if (strUTF8 != nil) {
      // UTF-8
      return strUTF8!
    } else {
      // Others...
      return ""
    }
  }
  
}

//
//  NFCReaderViewController.swift
//  iNFCReader
//
//  Created by Yuki.S on 2017/07/26.
//  Copyright © 2017年 Yuki.S. All rights reserved.
//

import UIKit
import CoreNFC

@available(iOS 11.0, *)
class NFCReaderViewController : BaseViewController {
  
  @IBOutlet var labelExplanation: UILabel!
  @IBOutlet var textViewResult: UITextView!
  @IBOutlet var buttonRetry: UIButton!
  
  var session :NFCReaderSession!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.navigationItem.title = kNavigationTitle
    self.labelExplanation.text = klabelExplanationText;
    self.buttonRetry.setTitle(kButtonRetryTitle, for: .normal)
    self.buttonRetry.addTarget(self, action: #selector(buttonRetryTapped), for: .touchUpInside)
    self.textViewResult.text = ""
    self.textViewResult.isEditable = false
    sessionStart()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}

@available(iOS 11.0, *)
extension NFCReaderViewController: NFCNDEFReaderSessionDelegate {
  func readerSession(_ session: NFCNDEFReaderSession, didInvalidateWithError error: Error) {
    // API Error
    print(#function, error)
    
    DispatchQueue.main.async {
      self.textViewResult.text! += error.localizedDescription
    }
  }
  
  func readerSession(_ session: NFCNDEFReaderSession, didDetectNDEFs messages: [NFCNDEFMessage]) {
    // API Success
    var results :Array<NFCData> = []
    
    for message in messages {
      for record in message.records {
        let typeNameFormat = record.typeNameFormat
        let type = String(data: record.type, encoding: .utf8)
        let identifier = String(data: record.identifier, encoding: .utf8)
        let payload = String(data: record.payload, encoding: .ascii)
        
        let result = NFCData()

        print("typeNameFormat: \(ViewControllerHelper.typeNameFormatToString(format :typeNameFormat))")
        result.typeNameformat = typeNameFormat

        if(type != nil) {
          print("type: \(type!)")
          result.type = type!
        } else {
          print("type: nil")
          result.type = ""
        }
        
        if(identifier != nil) {
          print("identifier: \(identifier!)")
          result.identifier = identifier!
        } else {
          print("identifier: nil")
          result.identifier = ""
        }
        
        if(payload != nil) {
          print("payload: \(payload!)")
          result.payload = payload!
        } else {
          print("payload: nil")
          result.payload = ""
        }

        results.append(result)
      }
    }
    
    DispatchQueue.main.async {
      for result in results {
        self.textViewResult.text! += "typeNameFormat: \(ViewControllerHelper.typeNameFormatToString(format :result.typeNameformat)) \ntype: \(result.type) \nidentifier: \(result.identifier) \npayload: \(result.payload)\n"
        self.textViewResult.text! += "--------------------------\n"
      }
    }
  }
  
  func sessionStart() {
    self.session = NFCNDEFReaderSession(delegate: self, queue: nil, invalidateAfterFirstRead: true)
    self.session.begin()
  }
  
  @objc func buttonRetryTapped (){
    self.textViewResult.text = ""
    sessionStart();
  }
}


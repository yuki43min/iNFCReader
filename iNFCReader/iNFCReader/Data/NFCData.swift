//
//  NFCData.swift
//  iNFCReader
//
//  Created by Yuki.S on 2017/07/26.
//  Copyright © 2017年 Yuki.S. All rights reserved.
//

import Foundation
import CoreNFC

class NFCData {
  var typeNameformat :NFCTypeNameFormat
  var type :String
  var identifier :String
  var payload :String
  
  init() {
    self.typeNameformat = .empty
    self.type           = ""
    self.identifier     = ""
    self.payload        = ""
  }
}

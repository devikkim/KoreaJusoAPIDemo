//
//  JusoResult.swift
//  GME Remit
//
//  Created by InKwon Devik Kim on 22/04/2019.
//  Copyright © 2019 Gobal Money Express Co. Ltd. All rights reserved.
//

import ObjectMapper

class JusoResult: Mappable {
  var common: JusoCommon?
  var juso: [Juso]?
  
  required init?(map: Map) {}
  
  func mapping(map: Map) {
    common <- map["common"]
    juso <- map["juso"]
  }
}

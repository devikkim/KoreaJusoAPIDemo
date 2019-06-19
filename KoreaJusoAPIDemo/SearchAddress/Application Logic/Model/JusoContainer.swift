//
//  JusoContainer.swift
//  GME Remit
//
//  Created by InKwon Devik Kim on 22/04/2019.
//  Copyright © 2019 Gobal Money Express Co. Ltd. All rights reserved.
//

import ObjectMapper

class JusoContainer: Mappable {
  var results: JusoResult?
  
  required init?(map: Map) {}
  
  func mapping(map: Map) {
    results <- map["results"]
  }
}

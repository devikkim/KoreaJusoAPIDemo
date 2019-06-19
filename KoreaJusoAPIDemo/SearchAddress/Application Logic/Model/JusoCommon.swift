//
//  JusoContainer.swift
//  GME Remit
//
//  Created by InKwon Devik Kim on 22/04/2019.
//  Copyright © 2019 Gobal Money Express Co. Ltd. All rights reserved.
//

import ObjectMapper

class JusoCommon: Mappable {
  var totalCount: String?
  var currentPage: String?
  var countPerPage: String?
  var errorCode: String?
  var errorMessage: String?
  
  
  required init?(map: Map) {}
  
  func mapping(map: Map) {
    totalCount <- map["totalCount"]
    currentPage <- map["currentPage"]
    countPerPage <- map["countPerPage"]
    errorCode <- map["errorCode"]
    errorMessage <- map["errorMessage"]
  }
}

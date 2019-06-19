//
//  Address.swift
//  GME Remit
//
//  Created by InKwon Devik Kim on 22/04/2019.
//  Copyright © 2019 Gobal Money Express Co. Ltd. All rights reserved.
//

import ObjectMapper

class Juso: Mappable {
  var roadAddr: String?
  var jibunAddr: String?
  var zipNo: String?
  var admCd: String?
  var rnMgtSn: String?
  var bdKdcd: String?
  var siNm: String?
  var sggNm: String?
  var emdNm: String?
  var liNm: String?
  var rn: String?
  var udrtYn: String?
  var buldMnnm: String?
  var buldSlno: String?
  var mtYn: String?
  var lnbrMnnm: String?
  var lnbrSlno: String?
  var korAddr: String?
  
  required init?(map: Map) {}
  
  func mapping(map: Map) {
    roadAddr <- map["roadAddr"]
    jibunAddr <- map["jibunAddr"]
    zipNo <- map["zipNo"]
    admCd <- map["admCd"]
    rnMgtSn <- map["rnMgtSn"]
    bdKdcd <- map["bdKdcd"]
    siNm <- map["siNm"]
    sggNm <- map["sggNm"]
    emdNm <- map["emdNm"]
    liNm <- map["liNm"]
    rn <- map["rn"]
    udrtYn <- map["udrtYn"]
    buldMnnm <- map["buldMnnm"]
    buldSlno <- map["buldSlno"]
    mtYn <- map["mtYn"]
    lnbrMnnm <- map["lnbrMnnm"]
    lnbrSlno <- map["lnbrSlno"]
    korAddr <- map["korAddr"]
  }
}

//
//  AddressSearchService.swift
//  GME Remit
//
//  Created by InKwon Devik Kim on 22/04/2019.
//Copyright © 2019 Gobal Money Express Co. Ltd. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper

class SearchAddressService: SearchAddressServiceType {
  
  func fetchAddress(
    pageIndex: Int,
    interval: Int,
    keyword: String,
    success: @escaping (JusoResult?) -> Void,
    failure: @escaping (Error) -> Void
  ){
    let parameters = [
      "confmKey":"API-KEy",
      "currentPage":"\(pageIndex)",
      "countPerPage":"\(interval)",
      "keyword":"\(keyword)",
      "resultType": "json"
    ]
    let url = "http://www.juso.go.kr/addrlink/addrEngApi.do"
    
    Alamofire.request(
      url,
      method: .get,
      parameters: parameters
    )
    .responseObject { (response: DataResponse<JusoContainer>) in
      switch response.result {
      case .success(let value):
        guard
          let result = value.results,
          let errorCode = result.common?.errorCode,
          let errorMessage = result.common?.errorMessage else {
            return
          }
        
        if errorCode != "0" {
          let errorInfo: [String: Any]? = [NSLocalizedDescriptionKey: errorMessage]
          let error = NSError(domain: "API Error", code: 0, userInfo: errorInfo)
          failure(error)
          return
        }
        
        success(value.results)
        
      case .failure(let error):
        failure(error)
      }
    }
  }
}

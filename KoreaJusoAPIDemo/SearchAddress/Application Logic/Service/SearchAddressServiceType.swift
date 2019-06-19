//
//  AddressSearchServiceType.swift
//  GME Remit
//
//  Created by InKwon Devik Kim on 22/04/2019.
//Copyright © 2019 Gobal Money Express Co. Ltd. All rights reserved.
//

import Foundation

protocol SearchAddressServiceType: class {
  func fetchAddress(
    pageIndex: Int,
    interval: Int,
    keyword: String,
    success: @escaping (JusoResult?) -> Void,
    failure: @escaping (Error) -> Void
  )
}

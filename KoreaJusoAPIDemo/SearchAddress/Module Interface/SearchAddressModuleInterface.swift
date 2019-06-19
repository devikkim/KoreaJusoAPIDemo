//
//  AddressSearchModuleInterface.swift
//  GME Remit
//
//  Created by InKwon Devik Kim on 22/04/2019.
//Copyright © 2019 Gobal Money Express Co. Ltd. All rights reserved.
//

protocol SearchAddressModuleInterface: class {
  func fetchAddress(
    pageIndex: Int,
    interval: Int,
    keyword: String
  )
}

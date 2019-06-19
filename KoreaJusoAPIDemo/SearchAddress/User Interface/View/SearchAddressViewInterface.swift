//
//  AddressSearchViewInterface.swift
//  GME Remit
//
//  Created by InKwon Devik Kim on 22/04/2019.
//Copyright © 2019 Gobal Money Express Co. Ltd. All rights reserved.
//

protocol SearchAddressViewInterface: class {
  func setJusoModel(with model: JusoResult?)
  func failure(with error: Error)
  
  func startLoading()
  func endLoading()
}

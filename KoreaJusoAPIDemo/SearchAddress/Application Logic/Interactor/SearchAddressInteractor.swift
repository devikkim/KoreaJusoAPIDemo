//
//  AddressSearchInteractor.swift
//  GME Remit
//
//  Created by InKwon Devik Kim on 22/04/2019.
//Copyright © 2019 Gobal Money Express Co. Ltd. All rights reserved.
//

import Foundation

class SearchAddressInteractor {
  
  // MARK: Properties
  weak var output: SearchAddressInteractorOutput?
  private let service: SearchAddressServiceType
  
  // MARK: Initialization
  init(service: SearchAddressServiceType) {
    self.service = service
  }
}

// MARK: AddressSearch interactor input interface
extension SearchAddressInteractor: SearchAddressInteractorInput {
  func fetchAddress(
    pageIndex: Int,
    interval: Int,
    keyword: String
    ) {
    service.fetchAddress(
      pageIndex: pageIndex,
      interval: interval,
      keyword: keyword,
      success: {
        self.output?.setJusoModel(with: $0)
      },
      failure: {
        self.output?.failure(with: $0)
      }
    )
    
  }
}

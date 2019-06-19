//
//  AddressSearchPresenter.swift
//  GME Remit
//
//  Created by InKwon Devik Kim on 22/04/2019.
//Copyright © 2019 Gobal Money Express Co. Ltd. All rights reserved.
//

import Foundation

class SearchAddressPresenter {
  
  // MARK: Properties
  weak var view: SearchAddressViewInterface?
  var interactor: SearchAddressInteractorInput?
  var wireframe: SearchAddressWireframeInput?
  
}

// MARK: AddressSearch module interface
extension SearchAddressPresenter: SearchAddressModuleInterface {
  func fetchAddress(
    pageIndex: Int,
    interval: Int,
    keyword: String
  ) {
    view?.startLoading()
    interactor?.fetchAddress(pageIndex: pageIndex, interval: interval, keyword: keyword)
  }
}

// MARK: AddressSearch interactor output interface
extension SearchAddressPresenter: SearchAddressInteractorOutput {
  func setJusoModel(with model: JusoResult?) {
    view?.endLoading()
    view?.setJusoModel(with: model)
  }
  
  func failure(with error: Error) {
    view?.endLoading()
    view?.failure(with: error)
  }
  
}

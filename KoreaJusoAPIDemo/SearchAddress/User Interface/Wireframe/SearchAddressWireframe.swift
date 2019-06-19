//
//  AddressSearchWireframe.swift
//  GME Remit
//
//  Created by InKwon Devik Kim on 22/04/2019.
//Copyright © 2019 Gobal Money Express Co. Ltd. All rights reserved.
//

import UIKit

class SearchAddressWireframe {
  weak var view: UIViewController!
}

extension SearchAddressWireframe: SearchAddressWireframeInput {
  
  var storyboardName: String {return "SearchAddress"}
  
  func getMainView() -> UIViewController {
    let service = SearchAddressService()
    let interactor = SearchAddressInteractor(service: service)
    let presenter = SearchAddressPresenter()
    
    let viewController = UIStoryboard(name: "SearchAddress", bundle: nil)
      .instantiateViewController(withIdentifier: "SearchAddressViewController") as! SearchAddressViewController
    
    viewController.presenter = presenter
    interactor.output = presenter
    presenter.interactor = interactor
    presenter.wireframe = self
    presenter.view = viewController
    
    self.view = viewController
    return viewController
  }
  
  func openViewControllerWithNavigationWithDelegate(
    delegate: SearchAddressDelegate,
    source: UIViewController
  ) {
    
    let vc = self.getMainView()
    
    (vc as? SearchAddressViewController)?.delegate = delegate
    
    let navigationController = UINavigationController(rootViewController: vc)
    source.present(
      navigationController,
      animated: true,
      completion: nil
    )
  }
}

//
//  ViewController.swift
//  KoreaJusoAPIDemo
//
//  Created by InKwon Devik Kim on 19/06/2019.
//  Copyright © 2019 InKwon Devik Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var addressTextField: UILabel!
  @IBOutlet weak var zipcodeLabel: UILabel!
  
  @IBOutlet weak var jibunAddressLabel: UILabel!
  @IBOutlet weak var roadAddressLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationController?.navigationBar.prefersLargeTitles = true
  }

  @IBAction func touchSearchButton(_ sender: UIButton) {
    SearchAddressWireframe().openViewControllerWithNavigationWithDelegate(
      delegate: self,
      source: self
    )
  }
  
}

// MARK: - SearchAddressDelegate
extension ViewController: SearchAddressDelegate {
  func SearchAddress(viewController: SearchAddressViewController, didSelectedJuso juso: Juso) {
    
    zipcodeLabel.text = juso.zipNo
    roadAddressLabel.text = juso.roadAddr
    jibunAddressLabel.text = juso.jibunAddr
    addressTextField.text = juso.korAddr
    
    viewController.dismiss(animated: true, completion: nil)
  }
}


//
//  KoreaJusoAPIDemoTests.swift
//  KoreaJusoAPIDemoTests
//
//  Created by InKwon Devik Kim on 19/06/2019.
//  Copyright © 2019 InKwon Devik Kim. All rights reserved.
//

import XCTest
@testable import KoreaJusoAPIDemo

class KoreaJusoAPIDemoTests: XCTestCase {
  func testAPI() {
    let service = SearchAddressService()
    let expt = expectation(description: "TestAPI")
    
    service.fetchAddress(
      pageIndex: 0,
      interval: 10,
      keyword: "Jong-ro",
      success: {
        guard let count = $0?.juso?.count else {
          XCTAssert(false, "There are no address")
          expt.fulfill()
          return
        }
        XCTAssert(count == 10)
        expt.fulfill()
      },
      failure: {
        XCTAssert(false, $0.localizedDescription)
        expt.fulfill()
      }
    )
    
    wait(for: [expt], timeout: 2.0)
  }
  
}

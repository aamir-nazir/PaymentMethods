//
//  PaymentMethodListResourceTest.swift
//  PaymentMethodsTests
//
//  Created by Aamir Nazir
//

import XCTest
@testable import PaymentMethods

class PaymentMethodListResourceTest: XCTestCase {
    var paymentMethodListResource : PaymentMethodListResource!

    override func setUp() {
        paymentMethodListResource = PaymentMethodListResource()
    }

    override func tearDown() {
        paymentMethodListResource = nil
    }

    func testAPIResource() {
        XCTAssertEqual(paymentMethodListResource.params, [:])
        XCTAssertEqual(paymentMethodListResource.baseURL, ApiURL.baseUrl.rawValue)
        XCTAssertEqual(paymentMethodListResource.path, ApiURL.networkList.rawValue)
        XCTAssertEqual(paymentMethodListResource.httpMethod, .get)
        XCTAssert (paymentMethodListResource.dataParser is JSONParser)
    }
}

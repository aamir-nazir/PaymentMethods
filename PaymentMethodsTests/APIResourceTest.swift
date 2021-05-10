//
//  APIResourceTest.swift
//  PaymentMethodsTests
//
//  Created by Aamir Nazir
//

import XCTest
@testable import PaymentMethods

class APIResourceTest: XCTestCase {
    var validApiResource   : APIResource!
    var invalidApiResource : APIResource!

    override func setUp() {
        validApiResource   = MockAPIResource(internalBaseURL: "https://www.google.com", internalPath: "/search", internalHttpMethod: .get, params: ["q" : "abc"])
        invalidApiResource = MockAPIResource(internalBaseURL: "https://www.google.com", internalPath: "search", internalHttpMethod: .get, params: [:])
    }

    override func tearDown() {
        validApiResource   = nil
        invalidApiResource = nil
    }

    func testAPIResource() {
        XCTAssertNotNil(validApiResource.request)
        XCTAssertEqual(validApiResource.request?.url?.absoluteString, "https://www.google.com/search?q=abc")
    }
}

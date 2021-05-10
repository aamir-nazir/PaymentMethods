//
//  APIErrorTest.swift
//  PaymentMethodsTests
//
//  Created by Aamir Nazir
//

import XCTest
@testable import PaymentMethods

class APIErrorTest: XCTestCase {
    var unknowApiError    : APIError!
    var notFoundApiError  : APIError!
    var rateLimitApiError : APIError!

    override func setUp() {
        unknowApiError    = APIError(code: -1)
        notFoundApiError  = APIError(code: 404)
        rateLimitApiError = APIError(code: 403)
    }

    override func tearDown() {
        unknowApiError    = nil
        notFoundApiError  = nil
        rateLimitApiError = nil
    }

    func testAPIError() {
        XCTAssertNil(unknowApiError.errorMessage)
        XCTAssertEqual(notFoundApiError.errorMessage, "Not Found")
        XCTAssertEqual(rateLimitApiError.errorMessage, "API rate limit exceeded")
    }
}

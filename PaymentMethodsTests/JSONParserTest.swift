//
//  JSONParserTest.swift
//  PaymentMethodsTests
//
//  Created by Aamir Nazir
//

import XCTest
@testable import PaymentMethods

class JSONParserTest: XCTestCase {
    var jsonParser : DataParser!
    var jsonText : String!

    override func setUp() {
        jsonParser = JSONParser()
        jsonText   = "{ \"logo\" : \"http://test.com\" }"
    }

    override func tearDown() {
        jsonText   = nil
        jsonParser = nil
    }

    func testJSONParsing() {
        let link : LinkModel? = jsonParser.parse(jsonText.data(using: .utf8)!)
        XCTAssertEqual(link?.logo, URL(string: "http://test.com"))
    }
}

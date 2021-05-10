//
//  JSONParseTest.swift
//  PaymentMethodsTests
//
//  Created by Aamir Nazir
//


import XCTest
@testable import PaymentMethods

class JSONParseTest: XCTestCase, JSONParseProtocol {
    var jsonText : String!
    var keyNotFoundJsonText : String!
    var valueNotFoundJsonText : String!
    var typeMismatchJsonText : String!
    var invalidJsonText : String!

    override func setUp() {
        jsonText = "{ \"logo\" : \"http://test.com\" }"
        keyNotFoundJsonText = "{ \"invlaid_key\" : \"http://test.com\" }"
        valueNotFoundJsonText = "{ \"logo\" : null }"
        typeMismatchJsonText = "{ \"logo\" : 123 }"
        invalidJsonText = ""
    }

    override func tearDown() {
        jsonText = nil
        keyNotFoundJsonText = nil
        valueNotFoundJsonText = nil
        typeMismatchJsonText = nil
        invalidJsonText = nil
    }

    func testJSONParsing() {
        let network : LinkModel? = parseJSON(data: jsonText.data(using: .utf8)!)
        XCTAssertEqual(network?.logo, URL(string: "http://test.com"))

        let keyNotFoundNetwork : LinkModel? = parseJSON(data: keyNotFoundJsonText.data(using: .utf8)!)
        XCTAssertNil(keyNotFoundNetwork)

        let valueNotFoundNetwork : LinkModel? = parseJSON(data: valueNotFoundJsonText.data(using: .utf8)!)
        XCTAssertNil(valueNotFoundNetwork)

        let typeMismatchNetwork : LinkModel? = parseJSON(data: typeMismatchJsonText.data(using: .utf8)!)
        XCTAssertNil(typeMismatchNetwork)

        let invalidNetwork : LinkModel? = parseJSON(data: invalidJsonText.data(using: .utf8)!)
        XCTAssertNil(invalidNetwork)
    }
}

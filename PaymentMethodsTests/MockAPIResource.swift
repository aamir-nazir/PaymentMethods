//
//  MockAPIResource.swift
//  PaymentMethodsTests
//
//  Created by Aamir Nazir
//

import XCTest
@testable import PaymentMethods

class MockAPIResource: APIResource {
    var baseURL: String {
        return internalBaseURL
    }
    var path: String {
        return internalPath
    }
    var httpMethod: HTTPMethod {
        return internalHttpMethod
    }
    var dataParser: DataParser {
        return JSONParser()
    }
    var params: [String : String]

    let internalBaseURL    : String
    let internalPath       : String
    let internalHttpMethod : HTTPMethod

    init(internalBaseURL: String, internalPath: String, internalHttpMethod: HTTPMethod, params: [String : String]) {
        self.internalBaseURL    = internalBaseURL
        self.internalPath       = internalPath
        self.internalHttpMethod = internalHttpMethod
        self.params             = params
    }
}

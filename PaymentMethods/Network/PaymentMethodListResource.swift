//
//  PaymentMethodListResource.swift
//  PaymentMethods
//
//  Created by Aamir Nazir
//

import Foundation

// APIResource for fetching payment networks list
class PaymentMethodListResource: APIResource {
    init() {
        self.params = [:]
    }

    var params: [String : String]

    var baseURL: String {
        ApiURL.baseUrl.rawValue
    }

    var path: String {
        return ApiURL.networkList.rawValue
    }

    var httpMethod: HTTPMethod {
        return HTTPMethod.get
    }

    var dataParser: DataParser {
        return JSONParser()
    }
}

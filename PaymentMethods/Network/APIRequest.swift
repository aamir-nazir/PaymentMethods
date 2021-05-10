//
//  APIRequest.swift
//  PaymentMethods
//
//  Created by Aamir Nazir
//

import UIKit

// API request is a generic class which uses an APIResource to get URLRequest and performs an API call
// using 'apiRequest' method of 'NetworkProtocol'. Upon completion of the API call this class parses
// JSON response using 'parseJSON' method of 'JSONParseProtocol'
class APIRequest : NetworkProtocol, JSONParseProtocol {
    let resource : APIResource

    init(resource: APIResource) {
        self.resource = resource
    }

    func request<T: Codable>(completion: @escaping (_ parsedData: T?, _ error: APIError?) -> Void) {
        guard let urlRequest = resource.request else {
            return
        }

        apiRequest(urlRequest, completion: { (data, code) in
            guard let data = data else {
                completion(nil, nil)
                return
            }
            guard let code = code, (200..<300).contains(code) else {
                let error = APIError(code: code!)
                completion(nil, error)
                return
            }

            // Using generic data parser closes this class for further modification and open for extension
            // hence promoting Open-Close principle from SOLID principles
            let parsedData : T? = self.resource.dataParser.parse(data)
            completion(parsedData, nil)
        })
    }
}

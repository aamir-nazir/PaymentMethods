//
//  APIResource.swift
//  PaymentMethods
//
//  Created by Aamir Nazir
//

import Foundation

// API resource contains the necessary information to construct a valid URLRequest to be used to fetch data
protocol APIResource {
    var baseURL    : String { get }
    var path       : String { get }
    var httpMethod : HTTPMethod { get }
    var request    : URLRequest? { get }
    var params     : [String : String] { get set }
    var dataParser : DataParser { get }
}

extension APIResource {
    // This computed property constructs URLRequest with the property values of the conforming class
    var request : URLRequest? {
        guard var urlComps = URLComponents(string: baseURL + path) else {
            return nil
        }

        if httpMethod == .get, params.count > 0 {
            urlComps.queryItems = params.map({ URLQueryItem(name: $0, value: $1) })
        }

        guard let url = urlComps.url else {
            return nil
        }
        var urlRequest = URLRequest(url: url)

        if httpMethod == .post, params.count > 0 {
            guard let httpBody = try? JSONSerialization.data(withJSONObject: params) else {
                return nil
            }

            urlRequest.httpBody = httpBody
        }
        urlRequest.httpMethod = httpMethod.rawValue

        return urlRequest
    }
}

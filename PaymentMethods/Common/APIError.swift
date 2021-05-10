//
//  APIError.swift
//  PaymentMethods
//
//  Created by Aamir Nazir
//

import Foundation

class APIError {
    let code : Int

    init(code: Int) {
        self.code = code
    }

    var errorMessage : String? {
        switch code {
        case 403:
            return "API rate limit exceeded"

        case 404:
            return "Not Found"

        default:
            return nil
        }
    }
}

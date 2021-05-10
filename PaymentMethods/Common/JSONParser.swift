//
//  JSONParser.swift
//  PaymentMethods
//
//  Created by Aamir Nazir
//

import Foundation

// This class is used to parse JSON data
class JSONParser: DataParser, JSONParseProtocol {
    func parse<T: Codable>(_ data: Data) -> T? {
        return parseJSON(data: data)
    }
}

//
//  DataParserProtocol.swift
//  PaymentMethods
//
//  Created by Aamir Nazir
//

import Foundation

// Generic protocol to parse data of any type i.e JSON, XML etc
// Conforming class is respnsible of parsing the data to the specified type
protocol DataParser {
    func parse<T: Codable>(_ data: Data) -> T?
}

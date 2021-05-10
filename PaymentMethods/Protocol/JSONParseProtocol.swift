//
//  JSONParseProtocol.swift
//  PaymentMethods
//
//  Created by Aamir Nazir
//

import Foundation

// 'JSONParseProtocol' is a generic protocol which is used to parse data of JSON type
protocol JSONParseProtocol {}

extension JSONParseProtocol {
    func parseJSON<T: Codable>(data: Data, keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .convertFromSnakeCase) -> T? {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = keyDecodingStrategy

        do {
            let item = try decoder.decode(T.self, from: data)
            return item
        }
        catch DecodingError.dataCorrupted(let context) {
            print(context.debugDescription)
        } catch DecodingError.keyNotFound(let key, let context) {
            print("Key '\(key)' not Found")
            print("Debug Description:", context.debugDescription)
        } catch DecodingError.valueNotFound(let value, let context) {
            print("Value '\(value)' not Found")
            print("Debug Description:", context.debugDescription)
        } catch DecodingError.typeMismatch(let type, let context)  {
            print("Type '\(type)' mismatch")
            print("Debug Description:", context.debugDescription)
            print("Debug Description:", context.codingPath)
        } catch {
            print("error: ", error)
        }

        return nil
    }
}

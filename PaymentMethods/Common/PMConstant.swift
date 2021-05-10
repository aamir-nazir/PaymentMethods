//
//  PMConstant.swift
//  PaymentMethods
//
//  Created by Aamir Nazir
//

enum ApiURL : String {
    case baseUrl     = "https://raw.githubusercontent.com/optile/checkout-android/develop/shared-test/lists/"
    case networkList = "/listresult.json"
}

enum HTTPMethod : String {
    case get  = "GET"
    case post = "POST"
}

enum Cache {
    case inMemory
    case disk
}

//
//  NSObjectExtension.swift
//  PaymentMethods
//
//  Created by Aamir Nazir
//


import Foundation

// This extension can be used to get name of a clas
extension NSObject {
    var className: String {
        return String(describing: type(of: self))
    }

    class var className: String {
        return String(describing: self)
    }
}

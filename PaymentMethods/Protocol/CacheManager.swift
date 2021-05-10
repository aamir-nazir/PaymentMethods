//
//  CacheManager.swift
//  PaymentMethods
//
//  Created by Aamir Nazir
//

import UIKit

protocol CacheManager {
    func saveImage(image: UIImage, for url: URL, cache: Cache)
    func getImage(for url: URL, cache: Cache, completion: ((_ image: UIImage?) -> Void))
}

//
//  InMemoryCache.swift
//  PaymentMethods
//
//  Created by Aamir Nazir
//

import UIKit

class InMemoryCache : ImageCache {
    private let imageCache : NSCache<NSString, UIImage>
    init() {
        imageCache = NSCache<NSString, UIImage>()
        imageCache.totalCostLimit = 10 * 1024 * 1024 // 10Mb
    }

    func saveImage(image: UIImage, for url: URL) {
        imageCache.setObject(image, forKey: url.absoluteString as NSString)
    }

    func getImage(for url: URL, completion: ((_ image: UIImage?) -> Void)) {
        completion(imageCache.object(forKey: url.absoluteString as NSString))
    }
}

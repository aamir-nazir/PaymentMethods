//
//  ImageCacheManager.swift
//  PaymentMethods
//
//  Created by Aamir Nazir
//

import UIKit

class ImageCacheManager : CacheManager {
    private let inMemoryCache = InMemoryCache()
    private let diskCache     = DiskCache()

    static let shared : CacheManager = ImageCacheManager()
    private init() {}

    func saveImage(image: UIImage, for url: URL, cache: Cache = .inMemory) {
        switch cache {
        case .inMemory:
            inMemoryCache.saveImage(image: image, for: url)

        case .disk:
            diskCache.saveImage(image: image, for: url)
        }
    }

    func getImage(for url: URL, cache: Cache = .inMemory, completion: ((_ image: UIImage?) -> Void)) {
        switch cache {
        case .inMemory:
            inMemoryCache.getImage(for: url, completion: completion)

        case .disk:
            diskCache.getImage(for: url, completion: completion)
        }
    }
}

//
//  ImageDownloadManager.swift
//  PaymentMethods
//
//  Created by Aamir Nazir
//

import UIKit

class ImageDownloadManager {
    let cacheManager : CacheManager
    let cacheStore   : Cache

    init(cacheManager: CacheManager, cacheStore: Cache) {
        self.cacheManager = cacheManager
        self.cacheStore   = cacheStore
    }

    func getImageFor(url: URL, completion: @escaping ((UIImage?) -> Void)) {
        cacheManager.getImage(for: url, cache: cacheStore, completion: {
            image in

            guard image == nil else {
                completion(image)
                return
            }

            self.downloadImage(url: url, completion: completion)
        })
    }

    func downloadImage(url: URL, completion: @escaping ((UIImage?) -> Void)) {
        let imageRequest = ImageRequest(url: url)
        imageRequest.request(completion: {
            image, error in

            if let image = image {
                self.cacheManager.saveImage(image: image, for: url, cache: self.cacheStore)
            }
            completion(image)
        })
    }
}

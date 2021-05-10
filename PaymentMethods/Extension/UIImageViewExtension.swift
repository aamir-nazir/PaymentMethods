//
//  UIImageViewExtension.swift
//  PaymentMethods
//
//  Created by Aamir Nazir
//

import UIKit

extension UIImageView {
    func setImage(from url: URL, placeholder: UIImage, completion: @escaping ((UIImage?) -> Void)) {
        image = placeholder
        ImageDownloadManager(cacheManager: ImageCacheManager.shared, cacheStore: .inMemory).getImageFor(url: url, completion: completion)
    }
}

//
//  ImageCache.swift
//  PaymentMethods
//
//  Created by Aamir Nazir
//

import UIKit

protocol ImageCache {
    func saveImage(image: UIImage, for url: URL)
    func getImage(for url: URL, completion: ((_ image: UIImage?) -> Void))
}

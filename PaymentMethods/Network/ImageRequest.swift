//
//  ImageRequest.swift
//  PaymentMethods
//
//  Created by Aamir Nazir
//

import UIKit

class ImageRequest: NetworkProtocol {
    let url : URL

    init(url: URL) {
        self.url = url
    }

    func request(completion: @escaping (_ image: UIImage?, _ error: APIError?) -> Void) {
        let request = URLRequest(url: url)

        apiRequest(request, completion: { (data, code) in
            guard let data = data else {
                completion(nil, nil)
                return
            }

            guard let code = code, (200..<300).contains(code) else {
                let error = APIError(code: code!)
                completion(nil, error)
                return
            }

            let image = UIImage(data: data)
            completion(image, nil)
        })
    }

}

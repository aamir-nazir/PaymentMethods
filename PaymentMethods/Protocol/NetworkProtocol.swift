//
//  NetworkProtocol.swift
//  PaymentMethods
//
//  Created by Aamir Nazir
//

import Foundation

// 'NetworkProtocol' is a generic protocol to perform given nework request using URLSession
// Response of the network call is always returned on a main thread
protocol NetworkProtocol {}

extension NetworkProtocol {
    @discardableResult func apiRequest(_ request: URLRequest,
                                        completion: @escaping ((_ data: Data?, _ statusCode: Int?) -> Void))
                                        -> URLSessionDataTask {
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(data, nil)
                return
            }

            DispatchQueue.main.async {
                completion(data, httpResponse.statusCode)
            }
        }
        task.resume()
        return task
    }
}

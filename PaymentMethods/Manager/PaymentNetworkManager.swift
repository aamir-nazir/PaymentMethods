//
//  PaymentNetworkManager.swift
//  PaymentMethods
//
//  Created by Aamir Nazir
//

import Foundation

class PaymentNetworkManager {
    // This method is used to fetch payment networks list
    func fetchPaymentNetworks(completion: @escaping (PaymentMethodListModel?, APIError?) -> Void) {
        let paymentListRequest = PaymentMethodListResource()
        let apiRequest = APIRequest(resource: paymentListRequest)
        apiRequest.request(completion: { (_ parsedData: PaymentMethodListModel?, error: APIError?)  in
            completion(parsedData, error)
        })
    }
}

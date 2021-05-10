//
//  PaymentMethodViewModel.swift
//  PaymentMethods
//
//  Created by Aamir Nazir
//

import Foundation

typealias PaymentNetworkInfo = (name: String, logoUrl: URL)

protocol PaymentMethodListDelegate : AnyObject {
    func didLoadPaymentMethodList()
    func failedToLoadPaymentMethodList(error: APIError)
}

class PaymentMethodViewModel {
    var networkList    = [ApplicableModel]()
    let networkManager = PaymentNetworkManager()

    weak var paymentListDataDelegate : PaymentMethodListDelegate?

    var totalNetworks : Int {
        return networkList.count
    }

    func networkInfo(at indexPath: IndexPath) -> PaymentNetworkInfo {
        let network = networkList[indexPath.row]
        return (network.label, network.links.logo)
    }
}

//MARK:- Network Requests
extension PaymentMethodViewModel {
    func fetchPaymentNetworks() {
        networkManager.fetchPaymentNetworks(completion: {
            (paymentNetworksList, error) in

            if let paymentNetworksList = paymentNetworksList {
                self.networkList = paymentNetworksList.networks.applicable
                self.paymentListDataDelegate?.didLoadPaymentMethodList()
            } else if let error = error {
                self.paymentListDataDelegate?.failedToLoadPaymentMethodList(error: error)
            }
        })
    }
}

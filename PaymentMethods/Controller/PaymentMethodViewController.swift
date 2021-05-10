//
//  PaymentMethodViewController.swift
//  PaymentMethods
//
//  Created by Aamir Nazir
//

import UIKit

class PaymentMethodViewController: UIViewController {

    @IBOutlet weak var paymentMethodsTableView: UITableView!

    let paymentCellIdentifier = PaymentMethodTableViewCell.className
    let viewModel = PaymentMethodViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        viewModel.paymentListDataDelegate = self
        viewModel.fetchPaymentNetworks()
    }
}


//MARK:- Helper
extension PaymentMethodViewController {
    func setupUI() {
        title = "Payment methods"
        setupTableView()
    }

    func setupTableView() {
        paymentMethodsTableView.dataSource = self
        paymentMethodsTableView.register(UINib.init(nibName: paymentCellIdentifier, bundle: nil), forCellReuseIdentifier: paymentCellIdentifier)
    }
}

//MARK:- UITableViewDataSource
extension PaymentMethodViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.totalNetworks
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: paymentCellIdentifier, for: indexPath) as! PaymentMethodTableViewCell
        let networkInfo = viewModel.networkInfo(at: indexPath)
        cell.setupCell(networkInfo: networkInfo)
        cell.selectionStyle = .none

        return cell
    }
}

//MARK:- PaymentMethodListDelegate
extension PaymentMethodViewController: PaymentMethodListDelegate {
    func didLoadPaymentMethodList() {
        paymentMethodsTableView.reloadData()
    }

    func failedToLoadPaymentMethodList(error: APIError) {
        print("Failed to load payment networks. Code: \(error.code) Message: \(error.errorMessage ?? "")")
    }
}

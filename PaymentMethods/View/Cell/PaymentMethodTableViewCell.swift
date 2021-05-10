//
//  PaymentMethodTableViewCell.swift
//  PaymentMethods
//
//  Created by Aamir Nazir
//

import UIKit

class PaymentMethodTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var paymentImageView: UIImageView!

    private var logoUrl : URL!

    override func prepareForReuse() {
        super.prepareForReuse()

        paymentImageView.image = nil
    }

    func setupCell(networkInfo: PaymentNetworkInfo) {
        logoUrl        = networkInfo.logoUrl
        nameLabel.text = networkInfo.name

        paymentImageView.setImage(from: networkInfo.logoUrl, placeholder: #imageLiteral(resourceName: "credit_card"), completion: {
            image in

            if self.logoUrl == networkInfo.logoUrl {
                self.paymentImageView.image = image
            }
        })
    }

}

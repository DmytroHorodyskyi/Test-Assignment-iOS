//
//  CellViewController.swift
//  Test-Assignment-iOS
//
//  Created by Dmytro Horodyskyi on 13.07.2023.
//

import UIKit

class CellViewController: UITableViewCell {
    
    @IBOutlet weak var systemLogoImage: UIImageView!
    @IBOutlet weak var cardNumberLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setCellCardView(type: PaymentSystem, cardNumber: String) {
        switch type {
        case .mastercard:
            systemLogoImage.image = UIImage(named: "MastercardImage") ?? UIImage()
        case .visa:
            systemLogoImage.image = UIImage(named: "VisaImage") ?? UIImage()
        }
        self.cardNumberLabel.text = "**** **** **** \(cardNumber.suffix(4))"
    }
}

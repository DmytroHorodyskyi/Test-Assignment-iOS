//
//  CardViewController.swift
//  Test-Assignment-iOS
//
//  Created by Dmytro Horodyskyi on 12.07.2023.
//

import UIKit

class CardViewController: UIViewController {

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var systemLogoImage: UIImageView!
    @IBOutlet weak var cardNumberLabel: UILabel!
    
    var card: CardObject?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let card = card {
            setCardView(type: card.type, cardNumber: card.cardNumber)
        }
    }
    
    private func setCardView(type: PaymentSystem, cardNumber: String) {
        switch type {
        case .mastercard:
            cardView.backgroundColor = UIColor(named: "MastercardColor")
            systemLogoImage.image = UIImage(named: "MastercardImage") ?? UIImage()
        case .visa:
            cardView.backgroundColor = UIColor(named: "VisaColor")
            systemLogoImage.image = UIImage(named: "VisaImage") ?? UIImage()
        }
        self.cardNumberLabel.text = "**** **** **** \(cardNumber.suffix(4))"
    }
}

//
//  CardObject.swift
//  Test-Assignment-iOS
//
//  Created by Dmytro Horodyskyi on 12.07.2023.
//

import Foundation
import RealmSwift

class CardObject: Object {
    @Persisted var type: PaymentSystem
    @Persisted var cardNumber: String
    
    convenience required init(type: PaymentSystem, cardNumber: String) {
        self.init()
        self.type = type
        self.cardNumber = cardNumber
    }
    
    static private func createRandomTypeValue() -> PaymentSystem {
        let allCases = PaymentSystem.allCases
        let randomIndex = Int.random(in: 0..<allCases.count)
        return allCases[randomIndex]
    }
    
    static private func createRandomCardNumber(for type: PaymentSystem) -> String {
        var result = ""
        switch type {
        case .visa:
            result.append("4")
        case .mastercard:
            result.append("5")
        }
        for _ in 0..<15 {
            result.append("\(Int.random(in: 0..<10))")
        }
        return result
    }
    
    static func createRandomCard() -> CardObject {
        let type = createRandomTypeValue()
        let cardNumber = createRandomCardNumber(for: type)
        return CardObject(type: type, cardNumber: cardNumber)
    }
}

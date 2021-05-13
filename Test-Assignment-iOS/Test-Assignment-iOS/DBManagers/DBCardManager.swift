//
//  DBCardManager.swift
//  Test-Assignment-iOS
//
//  Created by Dmytro Horodyskyi on 13.07.2023.
//

import Foundation
import RealmSwift

class DBCardManager {
    
    private let realm: Realm
        
    init() {
        do {
            realm = try Realm()
        } catch {
            fatalError("Failed to create connection to Realm: \(error)")
        }
    }
    
    func saveCard(_ card: CardObject) {
        try? realm.write {
            realm.add(card)
        }
    }
    
    func getCards() -> [CardObject] {
        Array(realm.objects(CardObject.self))
    }
}

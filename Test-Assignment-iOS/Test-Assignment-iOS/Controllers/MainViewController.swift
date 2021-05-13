//
//  MainViewController.swift
//  Test-Assignment-iOS
//
//  Created by Dmytro Horodyskyi on 12.07.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var cardManager = DBCardManager()
    private var cards: [CardObject] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CellView", bundle: nil), forCellReuseIdentifier: "Cell")
        tableView.rowHeight = UIScreen.main.bounds.size.height / 8
        tableView.separatorColor = UIColor.clear
        cards = cardManager.getCards()
    }
    
    @IBAction func AddCardButtonAction(_ sender: UIBarButtonItem) {
        cardManager.saveCard(CardObject.createRandomCard())
        cards = cardManager.getCards()
        tableView.reloadData()
    }
}


extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cardManager.getCards().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? CellViewController
        cell?.selectionStyle = .none
        let card = cards[cards.count - indexPath.row - 1]
        cell?.setCellCardView(type: card.type, cardNumber: card.cardNumber)
        return cell ?? CellViewController()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "CardView", bundle: nil)
        if let destinationVC = storyboard.instantiateViewController(withIdentifier: "CardView") as? CardViewController {
            let card = cards[cards.count - indexPath.row - 1]
            destinationVC.card = card
            navigationController?.pushViewController(destinationVC, animated: true)
        }
    }
}

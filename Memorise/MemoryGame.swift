//
//  MemoryGame.swift
//  Memorise
//
//  Created by Ekaterina Systerova on 24.09.2021.
//

import Foundation

struct MemoryGame<CardContentType> {
    
    private(set) var cards: [Card]
    
    mutating func choose(_ choosenCard: Card) {
        let choosenIndex = cards.firstIndex { card in
            card.id == choosenCard.id
        } ?? 0
        cards[choosenIndex].isFaceUp.toggle()
    }
    
    init(numberOfPairOfCards: Int, createCardContent: (Int) -> CardContentType) {
        cards = [Card]()
        for pairIndex in 0..<numberOfPairOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex * 2))
            cards.append(Card(content: content, id: pairIndex * 2 + 1))
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp = false
        var isMatched = false
        var content: CardContentType
        var id: Int
    }
    
}

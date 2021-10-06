//
//  MemoryGame.swift
//  Memorise
//
//  Created by Ekaterina Systerova on 24.09.2021.
//

import Foundation

struct MemoryGame<CardContentType> where CardContentType: Equatable {
    
    private(set) var cards: [Card]
    private(set) var score: Int = 0

    private var indexOfLastFacedUpCard: Int? {
        get {
            let indicesOfFaceUpCards = cards.indices.filter { cards[$0].isFaceUp }
            return indicesOfFaceUpCards.count == 1 ? indicesOfFaceUpCards.first : nil
        }
        set { cards.indices.forEach { cards[$0].isFaceUp = ($0 == newValue) } }
    }
    
    mutating func choose(_ card: Card) {
        if let choosenIndex = cards.firstIndex(where: { $0.id == card.id })
           , !cards[choosenIndex].isMatched
           , !cards[choosenIndex].isFaceUp {
            if let potentialMatchIndex = indexOfLastFacedUpCard {
                if cards[potentialMatchIndex].content == cards[choosenIndex].content {
                    cards[choosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    score += 2
                } else {
                    score -= 1
                }
                cards[choosenIndex].isFaceUp = true
            } else {
                indexOfLastFacedUpCard = choosenIndex
            }
        }
    }
    
    init(numberOfPairOfCards: Int, cardsContent: [CardContentType]) {
        cards = []
        
        let shuffledCardsContent = cardsContent.shuffled()

        for pairIndex in 0..<numberOfPairOfCards {
            let content = shuffledCardsContent[pairIndex]
            cards.append(Card(content: content, id: pairIndex * 2))
            cards.append(Card(content: content, id: pairIndex * 2 + 1))
        }
        cards.shuffle()
    }
    
    struct Card: Identifiable {
        var isFaceUp = false
        var isMatched = false
        let content: CardContentType
        let id: Int
    }
    
}

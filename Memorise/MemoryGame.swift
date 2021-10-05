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

    private var indexOfLastFacedUpCard: Int?
    
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
                indexOfLastFacedUpCard = nil
            } else {
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                indexOfLastFacedUpCard = choosenIndex
            }
            cards[choosenIndex].isFaceUp.toggle()
        }
    }
    
    init(numberOfPairOfCards: Int, cardsContent: [CardContentType]) {
        cards = [Card]()
        
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
        var content: CardContentType
        var id: Int
    }
    
}

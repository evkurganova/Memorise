//
//  EmojiMemoryGame.swift
//  Memorise
//
//  Created by Ekaterina Systerova on 24.09.2021.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    static var gameTheme: EmojiGameTheme = .sweeties

    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairOfCards: gameTheme.minimalNumberOfPairOfCards, cardsContent: gameTheme.emojis)
    }
    
    @Published private var model = createMemoryGame()
    
    var cards: [MemoryGame<String>.Card] {
//        model.cards.filter { !$0.isMatched }
        model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}



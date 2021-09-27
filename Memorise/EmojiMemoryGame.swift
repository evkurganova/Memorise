//
//  EmojiMemoryGame.swift
//  Memorise
//
//  Created by Ekaterina Systerova on 24.09.2021.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    static let sportEmojis = ["🎾", "⚽️", "🏀", "🏈", "⚾️", "🏐", "🏉", "🎱", "🥏", "🏓", "🛼"]
    static let sweetiesEmojis = ["🍡", "🍧", "🍨", "🍦", "🥧", "🧁", "🍰", "🎂", "🍮", "🍭", "🍬", "🍫", "🍩", "🍪", "🍯"]
    static let animalsEmojis = ["🦖", "🐙", "🦑", "🐠", "🐳", "🐬", "🦓", "🐈", "🐈‍⬛", "🦒", "🦘", "🐖", "🦩", "🐿", "🐁", "🦥", "🦔"]

    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairOfCards: 5 /*sportEmojis.count*/) { pairIndex in
            sportEmojis[pairIndex]
        }
    }
    
    @Published private var model = createMemoryGame()
    
    var cards: [MemoryGame<String>.Card] {
        model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}



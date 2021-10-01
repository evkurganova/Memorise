//
//  EmojiMemoryGame.swift
//  Memorise
//
//  Created by Ekaterina Systerova on 24.09.2021.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    var gameTheme: EmojiGameTheme = .animals
    
    @Published private var model: MemoryGame<String>
    
    var cards: [MemoryGame<String>.Card] {
//        model.cards.filter { !$0.isMatched }
        model.cards
    }
    
    var color: Color {
        switch gameTheme.color {
        case "red":
            return .red
        case "green":
            return .green
        case "pink":
            return .pink
        case "yellow":
            return .yellow
        case "gray":
            return .gray
        case "blue":
            return .blue
        default:
            return .black
        }
    }
    
    var title: String {
        return gameTheme.title
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
    func changeTheme() {
//        objectWillChange.send()
        gameTheme = EmojiGameTheme.allCases.randomElement() ?? .animals
        model = MemoryGame<String>(numberOfPairOfCards: gameTheme.minimalNumberOfPairOfCards, cardsContent: gameTheme.emojis)
    }

    
    init() {
        model = MemoryGame<String>(numberOfPairOfCards: gameTheme.minimalNumberOfPairOfCards, cardsContent: gameTheme.emojis)
    }
}



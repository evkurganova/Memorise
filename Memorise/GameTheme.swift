//
//  GameTheme.swift
//  Memorise
//
//  Created by Ekaterina Systerova on 28.09.2021.
//

import Foundation

struct GameTheme {
    
    var title: String
    var color: String
    var numberOfPairOfCards: Int
    var emojis: [String]
    
}

enum EmojiGameTheme: CaseIterable {
    case sport
    case sweeties
    case animals
    
    var title: String {
        switch self {
        case .sport:
            return "sport theme"
        case .sweeties:
            return "sweeties theme"
        case .animals:
            return "animals theme"
        }
    }
    
    var color: String {
        switch self {
        case .sport:
            return "red"
        case .sweeties:
            return "pink"
        case .animals:
            return "green"
        }
    }

    var numberOfPairOfCards: Int {
        switch self {
        case .sport:
            return 11
        case .sweeties:
            return 5
        case .animals:
            return 20
        }
    }

    var emojis: [String] {
        switch self {
        case .sport:
            return ["🎾", "⚽️", "🏀", "🏈", "⚾️", "🏐", "🏉", "🎱", "🥏", "🏓", "🛼"]
        case .sweeties:
            return ["🍡", "🍧", "🍨", "🍦", "🥧", "🧁", "🍰", "🎂", "🍮", "🍭", "🍬", "🍫", "🍩", "🍪", "🍯"]
        case .animals:
            return ["🦖", "🐙", "🦑", "🐠", "🐳", "🐬", "🦓", "🐈", "🐈‍⬛", "🦒", "🦘", "🐖", "🦩", "🐿", "🐁", "🦥", "🦔"]
        }
    }

    var minimalNumberOfPairOfCards: Int {
        return min(self.numberOfPairOfCards, self.emojis.count)
    }
}

//
//  GameTheme.swift
//  Memorise
//
//  Created by Ekaterina Systerova on 28.09.2021.
//

import Foundation

enum EmojiGameTheme: CaseIterable {
    
    case sport
    case sweeties
    case animals
    case food
    case transport
    case city

    var title: String {
        switch self {
        case .sport:
            return "sport theme"
        case .sweeties:
            return "sweeties theme"
        case .animals:
            return "animals theme"
        case .food:
            return "food theme"
        case .transport:
            return "transport theme"
        case .city:
            return "city theme"
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
        case .food:
            return "grey"
        case .transport:
            return "yellow"
        case .city:
            return "blue"
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
        case .food:
            return 4
        case .transport:
            return 5
        case .city:
            return 3
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
        case .food:
            return ["🥞", "🍕", "🥩", "🍣", "🍱", "🍙", "🥘", "🍜"]
        case .transport:
            return ["✈️", "🚀", "⛵️", "🚁", "🚆", "🚠", "🚖", "🚎", "🛵", "🚋"]
        case .city:
            return ["🌇", "🏙", "🌃", "🛣", "🌉"]
        }
    }

    var minimalNumberOfPairOfCards: Int {
        return min(self.numberOfPairOfCards, self.emojis.count)
    }
}

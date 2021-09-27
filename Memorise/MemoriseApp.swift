//
//  MemoriseApp.swift
//  Memorise
//
//  Created by Ekaterina Systerova on 17.09.2021.
//

import SwiftUI

@main
struct MemoriseApp: App {
    var body: some Scene {
        let game = EmojiMemoryGame()
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}

//
//  EmojiMemoryGameView.swift
//  Memorise
//
//  Created by Ekaterina Systerova on 17.09.2021.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    
    private struct Constants {
        static let cardSizeScale: CGFloat = 5.0
    }

    @ObservedObject var game: EmojiMemoryGame
    
    var body: some View {
        VStack {
            HStack {
                Text(game.title)
                Spacer()
                Text(game.score)
            }
            .font(.title)
            ScrollView {
                GeometryReader { geometry in
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: geometry.size.width / Constants.cardSizeScale))]) {
                        ForEach(game.cards) { card in
                            CardView(content: card.content, isFaceUp: card.isFaceUp, isMatched: card.isMatched)
                                .aspectRatio(1, contentMode: .fit)
                                .onTapGesture {
                                    game.choose(card)
                                }
                        }
                    }
                    .foregroundColor(game.color)
                }
            }
            Spacer()
            shuffleButton
        }
        .font(.largeTitle)
        .padding()
    }
    
    var shuffleButton: some View {
        Button {
            game.changeTheme()
        } label: {
            VStack {
                Image(systemName: "tortoise")
                Text("random theme").font(.body)
            }
        }
    }

}

struct CardView: View {
    
    private struct Constants {
        static let cornerRadiusScale: CGFloat = 3
        static let lineWidth: CGFloat = 2
        static let fontScale: CGFloat = 0.7
    }

    let content: String
    let isFaceUp: Bool
    let isMatched: Bool
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                let shape = RoundedRectangle(cornerRadius: cornerRadius(in: geometry.size))
                if isFaceUp {
                    shape.fill().foregroundColor(.white)
                    shape.strokeBorder(lineWidth: Constants.lineWidth)
                    Text(content).font(font(in: geometry.size))
                } else if isMatched {
                    shape.opacity(0)
                } else {
                    shape.fill()
                }
            }
        }
    }
    
    func font(in size: CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * Constants.fontScale)
    }
    
    func cornerRadius(in size: CGSize) -> CGFloat {
        min(size.width, size.height) / Constants.cornerRadiusScale
    }
}

















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        Group {
            EmojiMemoryGameView(game: game)
                .preferredColorScheme(.light)
                .previewDevice("iPhone 12 mini")
            EmojiMemoryGameView(game: game)
                .preferredColorScheme(.dark)
                .previewDevice("iPhone 12 mini")
            EmojiMemoryGameView(game: game)
                .preferredColorScheme(.dark)
                .previewDevice("iPhone 12 Pro Max")
        }
            
    }
}

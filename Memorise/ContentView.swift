//
//  ContentView.swift
//  Memorise
//
//  Created by Ekaterina Systerova on 17.09.2021.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            Text("MemoRise")
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
                    ForEach(viewModel.cards) { card in
                        CardView(content: card.content, isFaceUp: card.isFaceUp, isMatched: card.isMatched)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.choose(card)
                            }
                    }
                }
                .foregroundColor(.red)
            }
//            Spacer()
//            HStack {
//                sportButton
//                Spacer()
//                sweetiesButton
//                Spacer()
//                animalsButton
//            }
        }
        .font(.largeTitle)
        .padding()
    }
    
//    var sportButton: some View {
//        Button {
//            emojis = sportEmojis.shuffled()
//        } label: {
//            VStack {
//                Image(systemName: "sportscourt")
//                Text("sport").font(.body)
//            }
//        }
//    }
//
//    var sweetiesButton: some View {
//        Button {
//            emojis = sweetiesEmojis.shuffled()
//        } label: {
//            VStack {
//                Image(systemName: "bolt.heart")
//                Text("sweeties").font(.body)
//            }
//        }
//    }
//
//    var animalsButton: some View {
//        Button {
//            emojis = animalsEmojis.shuffled()
//        } label: {
//            VStack {
//                Image(systemName: "tortoise")
//                Text("animals").font(.body)
//            }
//        }
//    }

}

struct CardView: View {
        
    var content: String
    var isFaceUp: Bool
    var isMatched: Bool
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 25.0)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 2.0)
                Text(content).font(.largeTitle)
            } else if isMatched {
                shape.opacity(0)
            } else {
                shape.fill()
            }
        }
    }
}

















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        Group {
            ContentView(viewModel: game)
                .preferredColorScheme(.light)
                .previewDevice("iPhone 12 mini")
            ContentView(viewModel: game)
                .preferredColorScheme(.dark)
                .previewDevice("iPhone 12 mini")
        }
            
    }
}

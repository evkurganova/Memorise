//
//  ContentView.swift
//  Memorise
//
//  Created by Ekaterina Systerova on 17.09.2021.
//

import SwiftUI

let sportEmojis = ["🎾", "⚽️", "🏀", "🏈", "⚾️", "🏐", "🏉", "🎱", "🥏", "🏓", "🛼"]
let sweetiesEmojis = ["🍡", "🍧", "🍨", "🍦", "🥧", "🧁", "🍰", "🎂", "🍮", "🍭", "🍬", "🍫", "🍩", "🍪", "🍯"]
let animalsEmojis = ["🦖", "🐙", "🦑", "🐠", "🐳", "🐬", "🦓", "🐈", "🐈‍⬛", "🦒", "🦘", "🐖", "🦩", "🐿", "🐁", "🦥", "🦔"]

struct ContentView: View {
    
    @State var emojis: [String] = sportEmojis

    var body: some View {
        VStack {
            Text("MemoRise")
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
                    ForEach(emojis, id: \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
                .foregroundColor(.red)
            }
            Spacer()
            HStack {
                sportButton
                Spacer()
                sweetiesButton
                Spacer()
                animalsButton
            }
        }
        .font(.largeTitle)
        .padding()
    }
    
    var sportButton: some View {
        Button {
            emojis = sportEmojis.shuffled()
        } label: {
            VStack {
                Image(systemName: "sportscourt")
                Text("sport").font(.body)
            }
        }
    }
    
    var sweetiesButton: some View {
        Button {
            emojis = sweetiesEmojis.shuffled()
        } label: {
            VStack {
                Image(systemName: "bolt.heart")
                Text("sweeties").font(.body)
            }
        }
    }
    
    var animalsButton: some View {
        Button {
            emojis = animalsEmojis.shuffled()
        } label: {
            VStack {
                Image(systemName: "tortoise")
                Text("animals").font(.body)
            }
        }
    }

}

struct CardView: View {
    
    var content: String
    @State var isFaceUp = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 25.0)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 2.0)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .preferredColorScheme(.light)
                .previewDevice("iPhone 12 mini")
            ContentView()
                .preferredColorScheme(.dark)
                .previewDevice("iPhone 12 mini")
        }
            
    }
}

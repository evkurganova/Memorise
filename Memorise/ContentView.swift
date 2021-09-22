//
//  ContentView.swift
//  Memorise
//
//  Created by Ekaterina Systerova on 17.09.2021.
//

import SwiftUI

struct ContentView: View {
    
    var sportEmojis = ["🎾", "⚽️", "🏀", "🏈", "⚾️", "🏐", "🏉", "🎱", "🥏", "🏓", "🛼"]
    var sweetiesEmojis = ["🍡", "🍧", "🍨", "🍦", "🥧", "🧁", "🍰", "🎂", "🍮", "🍭", "🍬", "🍫", "🍩", "🍪", "🍯"]
    var animalsEmojis = ["🦖", "🐙", "🦑", "🐠", "🐳", "🐬", "🦓", "🐈", "🐈‍⬛", "🦒", "🦘", "🐖", "🦩", "🐿", "🐁", "🦥", "🦔"]

    @State var emojisCount = 4
    
    var body: some View {
        VStack {
            Text("MemoRise")
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
                    ForEach(sportEmojis[0..<emojisCount], id: \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
                .foregroundColor(.red)
            }
            Spacer()
            HStack {
                removeButton
                Spacer()
                addButton
            }
        }
        .font(.largeTitle)
        .padding()
    }
    
    var removeButton: some View {
        Button {
            if emojisCount > 0 {
                emojisCount -= 1
            }
        } label: {
            Image(systemName: "minus")
        }
    }
    
    var addButton: some View {
        Button {
            if emojisCount < sportEmojis.count {
                emojisCount += 1
            }
        } label: {
            Image(systemName: "plus")
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

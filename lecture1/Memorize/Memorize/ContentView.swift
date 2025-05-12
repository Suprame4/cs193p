//
//  ContentView.swift
//  Memorize
//
//  Created by Adrian GC on 4/6/25.
//

import SwiftUI
// this struct called ContentView behaves like a View
// ContentView conforms to the View protocol
struct ContentView: View {
    
    let emojis: [String] = ["👻","🕷️","🎃","😈","👻","🕷️","🎃","😈"]
    @State var cardCount = 4
    /*
     the value of the body variable is not
     stored anywhere, it's computed,
     it runs over and over again every time it's called
     
     "some View" means it can be any struct
     in the world aslong as it behaves like a view
     */
    var body: some View {
        // VStack(content: { ... })
        VStack {
            ScrollView {
                cards
            }
            Spacer()
            cardAdjuster
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<cardCount, id: \.self){ index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }
    
    var cardAdjuster: some View {
        HStack {
            cardRemover
            Spacer()
            cardAdder
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var cardAdder: some View {
        cardCountAdjuster(by: +1, symbol: "rectangle.stack.badge.plus.fill")
    }
    // you must use some View for a computed property like cardRemover if you want the return type to be treated as a View
    var cardRemover: some View {
        cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
    }
}

struct CardView: View {
    let content: String
// a state variable allows the view to be recreated dynamically at runtime, without needing to recompile the code
    @State var isFaceUp: Bool = false
    
    var body: some View {
// inside the view, you can only do if, lists, and variable assignments
        let base: RoundedRectangle = RoundedRectangle(cornerRadius: 12)
        ZStack {
            Group {
                // trailing closure syntax is applied to ZStack
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
//booleans are struct, meaning they have methods associated - isFaceUp.toggle() would also work
        }
    }
}

#Preview {
    ContentView()
}
/*
 Every UI element in SwiftUI is a struct that conforms to the View protocol
 */


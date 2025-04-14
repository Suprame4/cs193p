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
    
    /*
     the value of the body variable is not
     stored anywhere, it's computed,
     it runs over and over again every time it's called
     
     "some View" means it can be any struct
     in the world aslong as it behaves like a view
     */
    var body: some View {
        // VStack(content: { ... })
        HStack {
            CardView(isFaceUp: true)
            CardView()
            CardView(isFaceUp: true)
            CardView()
        }
        .foregroundColor(.orange)
        .padding()
    }
}
//comment

struct CardView: View {
    var isFaceUp: Bool = false
    
    var body: some View {
        if isFaceUp {
            ZStack(content: {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(lineWidth: 2)
                Text("👻").font(.largeTitle)
            })
        } else {
            RoundedRectangle(cornerRadius: 12)
        }
    }
}

#Preview {
    ContentView()
}
/*
 Every UI element in SwiftUI is a struct that conforms to the View protocol
 */

//
//  ContentView.swift
//  Memorize
//
//  Created by Mohamed Sugal on 12/26/22.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["🚊", "✈️", "🚌", "🚴‍♀️"]
    
    var body: some View {
        HStack {
            ForEach(emojis, id: \.self) {emoji in
                CardView(content: emoji)
            }
        }
        .padding(.horizontal)
        .foregroundColor(.red)
    }
}

struct CardView : View {
    var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        let shape = RoundedRectangle(cornerRadius: 25)
        ZStack {
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.stroke(lineWidth: 3)
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
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.light)
    }
}

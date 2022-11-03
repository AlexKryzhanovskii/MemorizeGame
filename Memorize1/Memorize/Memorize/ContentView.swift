//
//  ContentView.swift
//  Memorize
//
//  Created by Алексей on 02.11.2022.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["🚀","🚘","🛵","🚜", "🚗","🚖", "🏍", "🛩", "✈️", "🚆", "🚊"]
    @State var emojisCount = 6
    var body: some View {
        VStack {
            HStack {
                ForEach(emojis[0..<emojisCount], id: \.self) { emoji in
                    CardView(content: emoji)
                }
          }
            Spacer()
            HStack {
                removeCard
                Spacer()
                addCard
            }
            .font(.largeTitle)
            .padding(.horizontal)
    }
        .foregroundColor(/*@START_MENU_TOKEN@*/Color.red/*@END_MENU_TOKEN@*/)
        .padding()
    }
    var removeCard: some View {
        Button {
            if emojisCount > 1 {
                emojisCount -= 1}
        } label: {
            Image(systemName: "minus.circle")
        }
    }
    var addCard: some View {
        Button {
            if emojisCount < emojis.count {
                emojisCount += 1
            }
        } label: {
            Image(systemName: "plus.circle")
        }
    }
}

struct CardView: View {
    var content: String
    @State var faceIsUp: Bool = true
    let shape = RoundedRectangle(cornerRadius: 20)
    var body: some View {
        ZStack {
            if faceIsUp {
                shape.fill().foregroundColor(.white)
                shape.stroke(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            faceIsUp = !faceIsUp
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

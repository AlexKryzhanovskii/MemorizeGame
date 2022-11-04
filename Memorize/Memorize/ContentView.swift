//
//  ContentView.swift
//  Memorize
//
//  Created by Алексей on 02.11.2022.
//

import SwiftUI

struct ContentView: View {
    @State var startPosition = ["😗", "😙", "😚", "😘", "😛", "😝", "😜", "🤪"]
    @State var cars = ["🚀","🚘","🛵","🚜", "🚗","🚖", "🏍", "🛩", "✈️", "🚆", "🚊"]
    @State var emojis = ["😗", "😙", "😚", "😘", "😛", "😝", "😜", "🤪"]
    @State var enimals = ["🐭", "🐹", "🐼", "🐻‍❄️", "🐨", "🐵", "🐷", "🙈", "🐮"]
    @State var emojisCount = 8
    var body: some View {
        VStack {
            Text("Memorize!").font(.largeTitle)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(startPosition[0..<emojisCount], id: \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(/*@START_MENU_TOKEN@*/Color.red/*@END_MENU_TOKEN@*/)
            Spacer()
            HStack {
                emojisButton
                Spacer()
                carButton
                Spacer()
                enimalsButton
            }
            .font(.largeTitle)
            .padding(.horizontal)
    }
        .padding()
    }
    var emojisButton: some View {
        Button {
            startPosition = emojis.shuffled()
            emojisCount = startPosition.count
        } label: {
            VStack {
                Image(systemName: "face.smiling")
                Text("emojis").font(.title3)
            }
        }
    }
    var enimalsButton: some View {
        Button {
            startPosition = enimals.shuffled()
            emojisCount = startPosition.count
        } label: {
            VStack {
                Image(systemName: "pawprint")
                Text("Enimals").font(.title3)
            }
        }
    }
    
    var carButton: some View {
        Button {
            startPosition = cars.shuffled()
            emojisCount = startPosition.count
        } label: {
            VStack {
                Image(systemName: "car")
                Text("Car").font(.title3)
            }
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
                shape.strokeBorder(lineWidth: 3)
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

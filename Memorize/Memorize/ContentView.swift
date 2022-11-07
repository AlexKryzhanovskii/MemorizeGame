//
//  ContentView.swift
//  Memorize
//
//  Created by Алексей on 02.11.2022.
//
// @State var emojis = ["😗", "😙", "😚", "😘", "😛", "😝", "😜", "🤪"]
//@State var enimals = ["🐭", "🐹", "🐼", "🐻‍❄️", "🐨", "🐵", "🐷", "🙈", "🐮"]
import SwiftUI

struct ContentView: View {
    
   @ObservedObject var viewModel: EmojiMemoryGame
   
    
    var body: some View {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(viewModel.cards) { card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.choose(card)
                        }
                    }
                }
                .foregroundColor(/*@START_MENU_TOKEN@*/Color.red/*@END_MENU_TOKEN@*/)
                .padding()
        }
    }
}

struct CardView: View {
    let card: MemoryGame<String>.Card
    let shape = RoundedRectangle(cornerRadius: 20)
    var body: some View {
        ZStack {
            if card.isFaseUp{
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.largeTitle)
            } else if card.isMatched {
                shape.opacity(0)
            }
            else {
                shape.fill()
            }
        }
    }
}






















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
            .preferredColorScheme(.dark)
        ContentView(viewModel: game)
            .preferredColorScheme(.light)
    }
}

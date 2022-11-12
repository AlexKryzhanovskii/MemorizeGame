//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Алексей on 02.11.2022.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    
    @ObservedObject var game: EmojiMemoryGame
    
    
    var body: some View {
        VStack{
            AspectVGrid(items: game.cards, aspectRatio: 2/3) { card in
                if card.isMatched && !card.isFaseUp {
                    Rectangle().opacity(0)
                } else {
                    CardView(card: card)
                        .padding(3)
                        .onTapGesture {
                            game.choose(card)
                        }
                }
            }
            .foregroundColor(.red)
            .padding()
            
        }
    }
    
    
    struct CardView: View {
        let card: MemoryGame<String>.Card
        let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
        var body: some View {
            GeometryReader { geometry in
                ZStack {
                    if card.isFaseUp{
                        shape.fill().foregroundColor(.white)
                        shape.strokeBorder(lineWidth: DrawingConstants.lineWidth)
                        Pie(startAngle: Angle(degrees: 0-90), endAngle: Angle(degrees: 120-90))
                            .opacity(DrawingConstants.pieOpacity).padding(DrawingConstants.piePadding)
                        Text(card.content).font(font(in: geometry.size))
                    } else if card.isMatched {
                        shape.opacity(0)
                    }
                    else {
                        shape.fill()
                    }
                }
            }
        }
        private func font(in size: CGSize) -> Font {
            Font.system(size: min(size.width, size.height) * DrawingConstants.fontScale)
        }
        private struct DrawingConstants {
            static let cornerRadius: CGFloat = 13
            static let lineWidth: CGFloat = 2
            static let fontScale: CGFloat = 0.67
            static let piePadding: CGFloat = 3
            static let pieOpacity: CGFloat = 0.3
        }
    }
}






















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        EmojiMemoryGameView(game: game)
            .preferredColorScheme(.dark)
        EmojiMemoryGameView(game: game)
            .preferredColorScheme(.light)
    }
}

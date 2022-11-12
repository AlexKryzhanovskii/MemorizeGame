//
//  EmojiMemoryGameVM.swift
//  Memorize
//
//  Created by Алексей on 05.11.2022.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    static var cars = ["🚀","🚘","🛵","🚜", "🚗","🚖", "🏍", "🛩", "✈️", "🚆", "🚊"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 9) { pairIndex in
            cars[pairIndex]
        }
    }
    @Published private var model = createMemoryGame()
    
    var cards: Array<Card> {
        model.cards
    }
    
    
    
    //MARK: - Intent(s)
    
    func choose(_ card: Card) {
        model.choose(card)
    }
}

/* struct Theme {
   static var cars = ["🚀","🚘","🛵","🚜", "🚗","🚖", "🏍", "🛩", "✈️", "🚆", "🚊"]
    static var emojis = ["😗", "😙", "😚", "😘", "😛", "😝", "😜", "🤪"]
    static var enimals = ["🐭", "🐹", "🐼", "🐻‍❄️", "🐨", "🐵", "🐷", "🙈", "🐮"]
    
    
 }*/

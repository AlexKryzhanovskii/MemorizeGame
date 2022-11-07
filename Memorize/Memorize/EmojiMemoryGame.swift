//
//  EmojiMemoryGameVM.swift
//  Memorize
//
//  Created by Алексей on 05.11.2022.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject {
    static var cars = ["🚀","🚘","🛵","🚜", "🚗","🚖", "🏍", "🛩", "✈️", "🚆", "🚊"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
            cars[pairIndex]
        }
    }
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    
    
    //MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}

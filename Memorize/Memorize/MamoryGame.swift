//
//  MamoryGame.swift
//  Memorize
//
//  Created by Алексей on 04.11.2022.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    private var indexOfOneAndOnlyOneFaceUpCard: Int? {
        get {cards.indices.filter({cards[$0].isFaseUp}).oneAndOnly}
        set {cards.indices.forEach{cards[$0].isFaseUp = ($0 == newValue)}}
    }
    
   mutating func choose(_ card: Card) {
       if let chosenIndex = cards.firstIndex(where: {$0.id == card.id}),
          !cards[chosenIndex].isFaseUp,
          !cards[chosenIndex].isMatched
       {
           if let potentialMatchIndex = indexOfOneAndOnlyOneFaceUpCard {
               if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                   cards[chosenIndex].isMatched = true
                   cards[potentialMatchIndex].isMatched = true
               }
               cards[chosenIndex].isFaseUp = true
           } else {
               indexOfOneAndOnlyOneFaceUpCard = chosenIndex
           }
       }
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = []
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
    }
    struct Card: Identifiable {
        
        var isFaseUp = true 
        var isMatched = false
        let content: CardContent
        let id: Int
                
    }
}

extension Array {
    var oneAndOnly: Element? {
        if count == 1 {
            return self.first
        } else {
            return nil
        }
    }
}

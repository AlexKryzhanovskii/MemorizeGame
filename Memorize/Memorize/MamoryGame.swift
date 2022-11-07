//
//  MamoryGame.swift
//  Memorize
//
//  Created by Алексей on 04.11.2022.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    private var indexOfOneAndOnlyOneFaceUpCard: Int?
    
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
               indexOfOneAndOnlyOneFaceUpCard = nil
           }else {
                   for index in 0..<cards.count{
                       cards[index].isFaseUp = false
                   }
               indexOfOneAndOnlyOneFaceUpCard = chosenIndex
               }
           cards[chosenIndex].isFaseUp.toggle()
           print()
       }
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
    }
    struct Card: Identifiable {
        
        var isFaseUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
                
    }
}

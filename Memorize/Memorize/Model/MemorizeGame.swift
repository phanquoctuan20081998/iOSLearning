//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Phan Quốc Tuấn on 07/07/2021.
//

import Foundation

struct MemorizeGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    
    private var indexOfTheOneAndOnlyFaceUpCard: Int?
    
    init(numberOfPairOfCard: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairOfCard {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2 + 1))
        }
    }
    
    mutating func choose(_ card: Card) {
        if let chooseIndex = cards.firstIndex(where: {$0.id == card.id}),
              !cards[chooseIndex].isMatched,
              !cards[chooseIndex].isFaceUp
        {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[potentialMatchIndex].content == cards[chooseIndex].content {
                    cards[potentialMatchIndex].isMatched = true
                    cards[chooseIndex].isMatched = true
                }
                indexOfTheOneAndOnlyFaceUpCard = nil
            }
            else {
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                indexOfTheOneAndOnlyFaceUpCard = chooseIndex
            }
            cards[chooseIndex].isFaceUp.toggle()
        }
        
        print("\(cards)")
    }

    struct Card: Identifiable{
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        
        var id: Int
    }
    
}

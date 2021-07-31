//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Phan Quốc Tuấn on 07/07/2021.
//

import Foundation

struct MemorizeGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    
    private var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get {cards.indices.filter{cards[$0].isFaceUp}.oneAndOnly}
        set {cards.indices.forEach{cards[$0].isFaceUp = ($0 == newValue)}}
    }
    
    init(numberOfPairOfCard: Int, createCardContent: (Int) -> CardContent) {
        cards = []
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
                cards[chooseIndex].isFaceUp = true
            }
            else {
                indexOfTheOneAndOnlyFaceUpCard = chooseIndex
            }
        }
    }

    struct Card: Identifiable{
        var isFaceUp = false
        var isMatched = false
        let content: CardContent
        let id: Int
    }
    
}

extension Array {
    var oneAndOnly: Element?{
        if count == 1 {
            return first
        } else {
                return nil
        }
    }
}

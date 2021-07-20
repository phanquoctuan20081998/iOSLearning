//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Phan Quốc Tuấn on 07/07/2021.
//

import Foundation

struct MemorizeGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    private(set) var theme: Theme
    
    private var indexOfTheOneAndOnlyFaceUpCard: Int?
    
    init(nameOfTheme: String,
         setOfEmojis: [CardContent],
         numberOfPairOfCard: Int,
         cardColor: [Int],
         createCardContent: (Int) -> CardContent
    ) {
        theme = Theme(name: nameOfTheme,
                      setOfEmojis: setOfEmojis,
                      numberOfPairOfCard: numberOfPairOfCard,
                      cardColor: cardColor, id: 0)
        
        cards = Array<Card>()
        
        for pairIndex in 0..<theme.numberOfPairOfCard {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2 + 1))
        }
        cards = cards.shuffled()
    }
    
    mutating func chooseCard(_ card: Card) {
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
    }
    mutating func changeTheme(_ newTheme: MemorizeGame<CardContent>)  {
        theme = newTheme.theme
        cards = newTheme.cards
    }
    
    struct Card: Identifiable{
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        
        var id: Int
    }
    
    struct Theme: Identifiable{
        var name: String
        var setOfEmojis: [CardContent]
        var numberOfPairOfCard: Int
        var cardColor: [Int]

        var id: Int
    }
    
}

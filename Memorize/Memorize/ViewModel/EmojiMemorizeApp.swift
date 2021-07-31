//
//  EmojiMemorizeApp.swift
//  Memorize
//
//  Created by Phan Quốc Tuấn on 07/07/2021.
//

import SwiftUI

class EmojiMemorizeGame: ObservableObject {
    typealias Card = MemorizeGame<String>.Card
    
    private static let emojis = ["🚑", "🚒", "🚐", "🛻", "🚛", "🚜", "🛺", "🚂",
                "🚟", "✈️", "🚞", "🚝", "🚲", "🚀", "🛸", "🚁", "⛵️", "🛴", "🛵"]
    
    static func createMemorizeGame() -> MemorizeGame<String> {
        MemorizeGame<String>(numberOfPairOfCard: 6) {pairIndex in emojis[pairIndex]}
    }

    @Published private var model = createMemorizeGame()
    
    var cards: Array<Card>{
        model.cards
    }
    
    //MARK: - Intent(s)
    func choose(_ card: Card) {
        model.choose(card)
    }
    
    
}

//
//  EmojiMemorizeApp.swift
//  Memorize
//
//  Created by Phan Quốc Tuấn on 07/07/2021.
//

import SwiftUI

class EmojiMemorizeGame: ObservableObject {
    static let emojis = ["🚑", "🚒", "🚐", "🛻", "🚛", "🚜", "🛺", "🚂",
                "🚟", "✈️", "🚞", "🚝", "🚲", "🚀", "🛸", "🚁", "⛵️", "🛴", "🛵"]
    
    static func createMemorizeGame() -> MemorizeGame<String> {
        MemorizeGame<String>(numberOfPairOfCard: 4) {pairIndex in emojis[pairIndex]}
    }

    @Published private var model: MemorizeGame<String> = createMemorizeGame()
    
    var cards: Array<MemorizeGame<String>.Card>{
        model.cards
    }
    
    //MARK: - Intent(s)
    func choose(_ card: MemorizeGame<String>.Card) {
        model.choose(card)
    }
    
    
}

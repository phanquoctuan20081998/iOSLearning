//
//  EmojiMemorizeApp.swift
//  Memorize
//
//  Created by Phan Quα»c TuαΊ₯n on 07/07/2021.
//

import SwiftUI

class EmojiMemorizeGame: ObservableObject {
    typealias Card = MemorizeGame<String>.Card
    
    private static let emojis = ["π", "π", "π", "π»", "π", "π", "πΊ", "π",
                "π", "βοΈ", "π", "π", "π²", "π", "πΈ", "π", "β΅οΈ", "π΄", "π΅"]
    
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

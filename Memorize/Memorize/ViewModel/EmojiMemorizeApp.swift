//
//  EmojiMemorizeApp.swift
//  Memorize
//
//  Created by Phan Quốc Tuấn on 07/07/2021.
//

import SwiftUI

class EmojiMemorizeGame: ObservableObject {
    static let themes = ["Transportation", "Animal", "Plant", "Face", "Sign", "Flag"]
    static let emojis = [0: ["🚑", "🚒", "🚐", "🛻", "🚛", "🚜", "🛺", "🚂",
                "🚟", "✈️", "🚞", "🚝", "🚲", "🚀", "🛸", "🚁", "⛵️", "🛴", "🛵"],
                         1:["🐙", "🐢", "🦄", "🐶", "🐱", "🐭", "🐹", "🐻", "🐍", "🐫", "🦖", "🦍", "🐳", "🦐", "🦞", "🦀", "🐡", "🐠", "🐋", "🐳", "🦍", "🐊", "🦏", "🦚", "🦜"],
                         2:["🌵", "🎄", "🌲", "🌳", "🌴", "🌿", "☘️", "🍀", "🍂", "🍄", "🌷", "🌸", "🌼", "🌻"],
                         3:["😝", "😇", "😉", "😡", "🤧", "😣", "😧", "😨", "😮", "🙄", "😤", "😨", "😱"],
                         4:["🚺", "🚻", "🔁", "📵", "🆙", "🆚", "🈷️", "🈚️", "☣️", "♒️", "☸️", "❣️", "💞", "💘"],
                         5:["🇦🇿", "🇨🇮", "🇲🇵", "🇮🇱", "🇵🇬", "🇳🇿" ,"🇱🇧", "🇬🇶", "🇧🇦", "🇲🇭", "🇻🇳"]]
    
    static let rand = Int.random(in: 0..<themes.count)
    
    static func createMemorizeGame(theme: Int, numberOfPairOfCard: Int) -> MemorizeGame<String> {
        var num = numberOfPairOfCard
        if num > emojis[theme]!.count {
            num = emojis[theme]!.count
        }
        
        let emoji = emojis[theme]!.shuffled()
        
        return MemorizeGame<String>(nameOfTheme: themes[theme],
                             setOfEmojis: emojis[theme]!,
                             numberOfPairOfCard: num,
                             cardColor: [1, 2, 3]) {pairIndex in emoji[pairIndex]}
    }

    @Published private var model: MemorizeGame<String> = createMemorizeGame(theme: rand, numberOfPairOfCard: 10)
    
    var cards: Array<MemorizeGame<String>.Card>{
        model.cards
    }
    
    var theme: MemorizeGame<String>.Theme {
        model.theme
    }
    
    //MARK: - Intent(s)
    func chooseCard(_ card: MemorizeGame<String>.Card) {
        model.chooseCard(card)
    }
    
    func changeTheme() {
        let rand = Int.random(in: 0..<EmojiMemorizeGame.themes.count)
        let theme: MemorizeGame<String> = EmojiMemorizeGame.createMemorizeGame(theme: rand, numberOfPairOfCard: 10)
        
        model.changeTheme(theme)
    }
    
    
}

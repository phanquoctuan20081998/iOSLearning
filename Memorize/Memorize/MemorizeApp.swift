//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Phan Quốc Tuấn on 05/07/2021.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemorizeGame()
    
    var body: some Scene {
        WindowGroup {
            MainView(viewModel: game)
        }
    }
}

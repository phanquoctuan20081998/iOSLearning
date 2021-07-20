//
//  ContentView.swift
//  Memorize
//
//  Created by Phan Quốc Tuấn on 05/07/2021.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel: EmojiMemorizeGame
    
    var body: some View{
        VStack {
            Text(viewModel.theme.name).font(.largeTitle)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 85))]) {
                    ForEach(viewModel.cards){ card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.chooseCard(card)
                            }
                    }
                }
            }
            Text("New game")
                .font(.largeTitle)
                .onTapGesture {
                    viewModel.changeTheme()
                }
        }
        .padding(.horizontal)
        
    }
}

struct CardView: View {
    var card: MemorizeGame<String>.Card
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.largeTitle)
            } else if card.isMatched {
                shape.opacity(0)
            } else {
                shape.fill()
            }
        }
        .foregroundColor(.red)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemorizeGame()
        
        MainView(viewModel: game)
            .previewDevice("iPhone 12")
        
        MainView(viewModel: game)
            .preferredColorScheme(.dark)
            .previewDevice("iPhone 12")
    }
}

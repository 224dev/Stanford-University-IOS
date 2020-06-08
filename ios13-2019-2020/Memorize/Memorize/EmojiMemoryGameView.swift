//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Abdoulaye Diallo on 5/28/20.
//  Copyright © 2020 Abdoulaye Diallo. All rights reserved.
//

import SwiftUI


struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        Grid(viewModel.cards){ card in
            CardView(card: card).onTapGesture {
                self.viewModel.choose(card: card)
            }
        }
        .padding()
        .foregroundColor(Color.orange)
    }
}


struct CardView: View {
    var card: MemoryGame<String>.Card
    
    //MARK: - Drawing Constants
    let cornerRadius: CGFloat = 10.0
    let edgeLineWidth: CGFloat = 3
    let fontScaleFactor: CGFloat = 0.75
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    func body(for size: CGSize) -> some View {
        
        ZStack {
            if self.card.isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                Text(self.card.content)
            } else{
                RoundedRectangle(cornerRadius: cornerRadius).fill()
            }
        }
        .font(Font.system(size: min(size.width, size.width) * fontScaleFactor))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}


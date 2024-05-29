//
//  ConcentrationGame.swift
//  My game
//
//  Created by Kirill Burtsev on 15.08.2021.
//

import Foundation

class ConcentrationGame {
    
    var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchingIndex = indexOfOneAndOnlyFaceUpCard, matchingIndex != index{
                if cards[matchingIndex].identifier == cards[index].identifier{
                    cards[matchingIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceup = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                for flipDown in cards.indices{
                    cards[flipDown].isFaceup = false
                }
                cards[index].isFaceup = true
                indexOfOneAndOnlyFaceUpCard = index
            }
            
            
        }
    }
    
    init(numberOfPairsOfCards: Int){
        for _ in 1...numberOfPairsOfCards{
            let card = Card()
            cards += [card,card]
        }
    }
}

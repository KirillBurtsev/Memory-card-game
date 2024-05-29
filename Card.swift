//
//  Card.swift
//  My game
//
//  Created by Kirill Burtsev on 15.08.2021.
//

import Foundation

struct Card {
    var isFaceup = false
    var isMatched = false
    var identifier: Int
    
    static var identifierNumber = 0
    
    static func identifierGenerator() -> Int {
        identifierNumber += 1
        return identifierNumber
    }

    init(){
        self.identifier = Card.identifierGenerator()
    }
}

//
//  ViewController.swift
//  My game
//
//  Created by Kirill Burtsev on 05.07.2021.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = ConcentrationGame(numberOfPairsOfCards: buttonCollecthion.count + 1 / 2)
    
    var touches = 0 {
        didSet{
            touchLabel.text = "Touches: \(touches)"
        }
    }
    
    func flipButton(emoji: String, button: UIButton){
        if button.currentTitle == emoji{
            button.setTitle("", for: .normal)
            button.backgroundColor = #colorLiteral(red: 0, green: 0.5091747046, blue: 0, alpha: 1)
        } else{
            button.setTitle(emoji, for: .normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
    
    var emojiCollecthion = ["🐸", "🐼", "🦄", "🦈", "🐈", "🐍", "🦍", "🦙", "🕊", "🦩", "🐠", "🐌"]
    
    var emojiDictionary = [Int:String]()
    
    func emojiIdentifier(for card: Card) -> String{
        if emojiDictionary[card.identifier] == nil{
            let randomIndex = Int(arc4random_uniform(UInt32(emojiCollecthion.count)))
            emojiDictionary[card.identifier] = emojiCollecthion.remove(at: randomIndex)
        }
        return emojiDictionary[card.identifier] ?? "?"
    }
    
    func updateViewFromModal(){
        for index in buttonCollecthion.indices{
            let button = buttonCollecthion[index]
            let card = game.cards[index]
            if card.isFaceup {
                button.setTitle(emojiIdentifier(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else{
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 0, green: 0.5091747046, blue: 0, alpha: 1)
            }
        }
    }
    
    @IBOutlet var buttonCollecthion: [UIButton]!
    @IBOutlet weak var touchLabel: UILabel!
    @IBAction func buttonActhion(_ sender: UIButton) {
        touches += 1
        if let buttonIndex = buttonCollecthion.firstIndex(of: sender){
            game.chooseCard(at: buttonIndex)
            updateViewFromModal()
        }
    }
}

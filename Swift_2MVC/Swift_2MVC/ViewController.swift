//
//  ViewController.swift
//  Swift_2MVC
//
//  Created by Tony on 2018/11/8.
//  Copyright © 2018年 quanyoubao. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    lazy var game: Concentration = Concentration(numberOfPairsOfCards: (cardButtons.count + 1)/2)
    
    
    var flipCount = 0{
        didSet{
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
//    var emojiChoices = ["🎃", "👻", "🎃", "👻"]
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender){
//            flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("chosen card was not in cardButtons")
        }
    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices{
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp{
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    
    var emojiChoices = ["🦇", "😱", "🙀", "😈", "🎃", "👻", "🍭", "🍬", "🍎"]
    
//    var emoji = Dictionary<Int, String>()
    var emoji = [Int:String]()
    
    func emoji(for card:Card) -> String {
        if emoji[card.identifier] != nil {
            if emojiChoices.count > 0 {
                let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
                //            emoji[card.identifier] = emojiChoices[randomIndex]
                emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
            }
        }
        
        
//        if emoji[card.identifier] != nil {
//            return emoji[card.identifier]!
//        } else{
//            return "?"
//        }
        return emoji[card.identifier] ?? "?"
    }
    
    
    func flipCard(withEmoji emoji:String, on button:UIButton){
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        } else {
            button.setTitle(emoji, for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
    
    

}


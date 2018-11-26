//
//  ViewController.swift
//  Swift_1Concentration
//
//  Created by Tony on 2018/11/8.
//  Copyright © 2018年 quanyoubao. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    //var flipCount: Int = 0
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    // var emojiChoices: Array<String> = ["🎃", "👻", "🎃", "👻"]
    var emojiChoices = ["🎃", "👻", "🎃", "👻"]
    
    // _ 代表实参的标签 例如下面withEmoji  on 没有则用_占位
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
//        flipCard(withEmoji: "👻", on: sender)
        // ? 表示可能有值也可能没有值 例 下面有可能从数组中找到对用button的索引,但如果button不在数组中,就找不到,返回nil 故用?来表示可能找到,也可能没找到
        // ! 如果在可选类型的后面加上一个感叹号,就表示假设这个可选类型有值并且赋予关联值
        if let cardNumber = cardButtons.index(of: sender) {
//            print("cardNUmber = \(cardNumber)")
            flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
        } else{
            print("chosen card was not in cardButtons")
        }
        
    }
    
    
    func flipCard(withEmoji emoji: String, on button: UIButton){
        
        print("flipCard(withEmoji: \(emoji))")
        
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        } else {
            button.setTitle(emoji, for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
    
}


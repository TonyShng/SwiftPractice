//
//  Concentration.swift
//  Swift_2MVC
//
//  Created by Tony on 2018/11/8.
//  Copyright © 2018年 quanyoubao. All rights reserved.
//

import Foundation



class Concentration
{
    
    //var cards = Array<Card>()
    var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    
    func chooseCard(at index: Int){
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // check if card match
            } else {
                // either no cards or 2 cards are face up
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        
        // ... 从0到另一个数 包含那个数   <==> 0..<numberOfPairsOfCards
        for _ in 0...numberOfPairsOfCards {
            let card = Card()
//            let matchingCard = card
//            cards.append(card)
//            cards.append(matchingCard)
            cards += [card, card]
        }
        // TODO: Shuffle the cards
        
    }
    
    
}





//
//  Card.swift
//  Swift_2MVC
//
//  Created by Tony on 2018/11/8.
//  Copyright © 2018年 quanyoubao. All rights reserved.
//

import Foundation

struct Card
{
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier()->Int{
        Card.identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
    
    
}




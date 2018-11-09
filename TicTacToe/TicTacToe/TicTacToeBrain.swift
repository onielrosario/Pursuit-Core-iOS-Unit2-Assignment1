//
//  TicTacToeBrain.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

class TicTacToeBrain {
    var playerTurn = Turn.playerOne
    
    
    enum Turn: String {
        case playerOne = "X"
        case playerTwo = "O"
        mutating func toggle() {
            switch self {
            case .playerOne: self = .playerTwo
            case .playerTwo: self = .playerOne
            }
        }
    }
    
    func updateBrain(x: Int, y: Int){
        playerTurn.toggle()
        let square: Square
        switch playerTurn {
        case .playerOne: square = .x
        case .playerTwo: square = .o
        }
        
    }
    
    enum Square {
        case x
        case o
        case empty
        
    }
    
    var gameboard =  [[Square]](repeating: [Square](repeating: .empty, count: 3), count: 3)
    
    
    
}

//
//  TicTacToeBrain.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

enum Square {
    case x
    case o
    case empty
    
}
var playerOneWin = 0
var playerTwoWin = 0
var round = 0

enum Turn: String, CaseIterable {
    case playerOne
    case playerTwo
    
    func image() -> UIImage {
        var buttonImage: UIImage!
        switch self {
        case .playerOne:
            buttonImage = UIImage(named:"X")
        default:
            buttonImage = UIImage(named: "O")
        }
        
        return buttonImage
    }
    mutating func toggle() {
        switch self {
        case .playerOne: self = .playerTwo
        case .playerTwo: self = .playerOne
        }
    }
}

class TicTacToeBrain {
    var playerTurn = Turn.playerOne
    
    
    func updateBrain(row: Int, col: Int) {
        let square: Square
        switch playerTurn {
        case .playerOne: square = .x
        case .playerTwo: square = .o
        }
        gameboard[row][col] = square
        print(gameboard)
        
        playerTurn.toggle()
    }
    
    func checkForVictory() -> GameStatus {
        
        
        //diagonal wins//
        var diagonal1 = [Square]()
        for i in 0..<gameboard.count {
            diagonal1.append(gameboard[i][i])
        }
        
        if diagonal1 == [.x,.x,.x] {
          playerOneWin += 1
            return .playerOneVictory
           
        } else if diagonal1 == [.o,.o,.o] {
         playerTwoWin += 1
            return .playerTwoVictory
            
        }
        
        var diagonal2 = [Square]()
        for i in 0..<gameboard.count {
            diagonal2.append(gameboard[i][gameboard.count - 1 - i])
        }
        if diagonal2 == [.x,.x,.x] {
            playerOneWin += 1
            return .playerOneVictory
          
        } else if diagonal2 == [.o,.o,.o] {
            playerTwoWin += 1
            return .playerTwoVictory
           
        }
        
        
        //row wins
        for row in gameboard {
            if row == [.x, .x, .x] {
              playerOneWin += 1
                return .playerOneVictory
               
            } else if row == [.o,.o,.o] {
              playerTwoWin += 1
                return .playerTwoVictory
               
            }
        }
        
        
        //column wins
        for columnIndex in 0..<gameboard[0].count {
            var column = [Square]()
            for rowIndex in 0..<gameboard.count {
                column.append(gameboard[rowIndex][columnIndex])
                if column == [.x,.x,.x] {
                 playerOneWin += 1
                    return .playerOneVictory
                   
                } else  if column == [.o,.o,.o]{
                  playerTwoWin += 1
                    return .playerTwoVictory
                    
                }
            }
        }
        return .inProgress
    }
    
    
    
    enum GameStatus {
        case playerOneVictory, playerTwoVictory, tie, inProgress
    }
    
    
    
    var gameboard =  [[Square]](repeating: [Square](repeating: .empty, count: 3), count: 3)
    
    
    
    
    
}


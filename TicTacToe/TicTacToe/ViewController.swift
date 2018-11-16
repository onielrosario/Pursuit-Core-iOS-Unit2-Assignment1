//
//  ViewController.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit


class ViewController: UIViewController
{
    
    @IBOutlet var AllButtons: [GameButton]!
    
    @IBOutlet var resetGame: UIButton!
    
    
    
    var gameBrain: TicTacToeBrain = TicTacToeBrain()
    
    @IBOutlet weak var GameScore: UILabel!
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    //update brain checks who player it is
    
    @IBOutlet weak var gameResult: UILabel!
    @IBAction func buttonPressed(_ sender: GameButton) {
        let turn = gameBrain.playerTurn
        sender.setImage(turn.image(), for: .normal)
        gameBrain.updateBrain(row: sender.row, col: sender.col)
       // print(gameBrain.checkForVictory())
        switch gameBrain.checkForVictory() {
        case .playerOneVictory:
            gameResult.text = "Player One Wins"
            AllButtons.forEach { (button) in
                button.isEnabled = false
               
            }
        case .playerTwoVictory:
            gameResult.text = "Player Two Wins"
            AllButtons.forEach { (button) in
                button.isEnabled = false
              
            }
        case .tie:
            gameResult.text = "No Winner"
            AllButtons.forEach { (button) in
                button.isEnabled = false
            }
        case .inProgress:
            print("default")
        }
        print(gameBrain)
        sender.isEnabled = false
        GameScore.text = "Player 1: \(playerOneWin) -- Player 2: \(playerTwoWin)"
        ///sender.backgroundColor = .black
    }
    
    //reset button function
    @IBAction func nextRoundButton(_ sender: UIButton) {
        //this sets the board back to empty image
        round += 1
        gameBrain.gameboard = [[Square]](repeating: [Square](repeating: .empty, count: 3), count: 3)
        _ = gameBrain.playerTurn
        AllButtons.forEach{$0.isEnabled = true}
        AllButtons.forEach { (button) in
            button.setImage(UIImage(), for: .normal)
            gameBrain.playerTurn = .playerOne
            gameResult.text = "Click Anywhere to Start"
        }
        
    }
    
    @IBAction func ResetGameButton(_ sender: UIButton) {
        gameBrain.gameboard = [[Square]](repeating: [Square](repeating: .empty, count: 3), count: 3)
        _ = gameBrain.playerTurn
        AllButtons.forEach{$0.isEnabled = true}
        AllButtons.forEach { (button) in
            button.setImage(UIImage(), for: .normal)
            gameBrain.playerTurn = .playerOne
            playerOneWin = 0
            playerTwoWin = 0
            GameScore.text = "Player 1: \(playerOneWin) -- Player 2: \(playerTwoWin)"
            gameResult.text = "Click Anywhere to Start"
    
    }
    }
    
    
    
}


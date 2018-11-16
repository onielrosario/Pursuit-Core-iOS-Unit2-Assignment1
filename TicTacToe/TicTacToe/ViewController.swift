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
    
    
    var gameBrain: TicTacToeBrain = TicTacToeBrain()
    
    
    
    
    
    
    
    
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    }
    //update brain checks who player it is
    
    @IBOutlet weak var gameResult: UILabel!
    @IBAction func buttonPressed(_ sender: GameButton) {
        let turn = gameBrain.playerTurn
        sender.setImage(turn.image(), for: .normal)
        gameBrain.updateBrain(row: sender.row, col: sender.col)
        print(gameBrain.checkForVictory())
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
        ///sender.backgroundColor = .black
    }
    
    @IBAction func resetButton(_ sender: UIButton) {
   gameBrain.gameboard = [[Square]](repeating: [Square](repeating: .empty, count: 3), count: 3)
        let turn = gameBrain.playerTurn
        //sender.setImage(turn.image(), for: .normal)
        AllButtons.forEach{$0.isEnabled = true}
        AllButtons.forEach { (button) in
            button.setImage(UIImage(), for: .normal)
            gameResult.text = "Click Anywhere to Start"
        }
    
    }
    


}


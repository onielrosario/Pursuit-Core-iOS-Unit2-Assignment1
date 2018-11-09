//
//  ViewController.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    var gameBrain: TicTacToeBrain = TicTacToeBrain()
    
    
    
    
    
    
    
    
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func buttonPressed(_ sender: GameButton) {
        let turn = gameBrain.playerTurn
        
        sender.setTitle(turn.rawValue, for: .normal)
        
        gameBrain.updateBrain(x: sender.row, y: sender.col)
        
        print(sender)
       
        sender.isEnabled = false
        ///sender.backgroundColor = .black
    }
    
    


}


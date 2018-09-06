//
//  ViewController.swift
//  TTT
//
//  Created by Amanda Demetrio on 9/5/18.
//  Copyright © 2018 Amanda Demetrio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var game:[Int] = [
        0,0,0,
        0,0,0,
        0,0,0
    ]
    
    @IBOutlet var myButtons: [UIButton]!
    
    @IBOutlet weak var winLabel: UILabel!
    
    var player = 1;
    
    @IBAction func PressedButton(_ sender: UIButton) {
        var checkForWin: String?
        
        if game[sender.tag] == 0 {
            game[sender.tag] = player;
            sender.backgroundColor = player == 1 ? .purple: .blue;
            
            checkForWin = checkingWin(game)
            
            if checkForWin == nil {
              player *= -1
            }
            else {
              print(checkForWin!)
              winLabel.isHidden = false;
            }
        }
    }
    
    @IBAction func pressedReset(_ sender: UIButton) {
        
        game = [
            0,0,0,
            0,0,0,
            0,0,0
        ]
        
        myButtons.forEach{
            button in
            button.backgroundColor = .darkGray
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        winLabel.isHidden = true;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func checkingWin(_ board: [Int]) -> String? {
        var win: String? = nil
        
        for i in [0,3,6] {
            if board[i] != 0 && board[i] == board[i+1] && board[i+1] == board[i+2] {
                win = "win";
                break
            }
        }
        
        for i in [0,1,2] {
            print(i)
            if board[i] != 0 && board[i] == board[i+3] && board[i+3] == board[i+6] {
                win = "win";
                break
            }
        }
        
        if board[0] != 0 && board[0] == board[4] && board[4] == board[8] {
            win = "win";
        }
        
        if board[2] != 0 && board[2] == board[4] && board[4] == board[6] {
            win = "win";
        }
        
        return win;
        
        
    }
    


}


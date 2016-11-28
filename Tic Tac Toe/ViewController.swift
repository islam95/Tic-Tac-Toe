//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Islam on 29/07/2016.
//  Copyright © 2016 Islam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var active = 1 // 1 = crosses, 2 = noughts.
    var state = [0, 0, 0, 0, 0, 0, 0, 0, 0] // tags 0,1,2,3,4,5,6,7,8
    let win = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    var isOver = true
    var countCrosses = 0
    var countNoughts = 0
    
    @IBOutlet var noughtsCount: UILabel!
    @IBOutlet var crossesCount: UILabel!
    
    @IBOutlet var button: UIButton!
    @IBOutlet var finishGame: UILabel!
    @IBOutlet var restartButton: UIButton!
    
    @IBAction func restart(_ sender: AnyObject) {
        
        state = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        active = 1
        isOver = true
        
        finishGame.isHidden = true
        finishGame.center = CGPoint(x: finishGame.center.x - 500, y: finishGame.center.y)
        
        restartButton.isHidden = true
        restartButton.center = CGPoint(x: restartButton.center.x - 500, y: restartButton.center.y)
        
        var buttonToClear : UIButton
        
        for i in 0 ..< 9 {
            buttonToClear = view.viewWithTag(i) as! UIButton
            buttonToClear.setImage(nil, for: UIControlState())
        }
    }
    
    @IBAction func buttonPressed(_ sender: AnyObject) {
        
        if (state[sender.tag] == 0 && isOver == true) {
            state[sender.tag] = active
        
            if active == 1 {
                sender.setImage(UIImage(named: "cross.png"), for: UIControlState())
                active = 2
            } else {
                sender.setImage(UIImage(named: "nought.png"), for: UIControlState())
                active = 1
            }
            
            for w in win {
                if (state[w[0]] != 0 && state[w[0]] == state[w[1]] && state[w[1]] == state[w[2]]) {
                    isOver = false
                    if state[w[0]] == 1 {
                        finishGame.text = "Crosses have won!"
                        countCrosses += 1
                        crossesCount.text = "\(countCrosses)"
                    } else {
                        finishGame.text = "Noughts have won!"
                        countNoughts += 1
                        noughtsCount.text = "\(countNoughts)"
                    }
                    endGame()
                }
            }
            
            if isOver == true {
                isOver = false
                for buttonState in state {
                    if buttonState == 0 {
                        isOver = true
                    }
                }
                if isOver == false {
                    finishGame.text = "It's a draw!"
                    endGame()
                }
            }
        }
    }
    
    func endGame() {
        
        finishGame.isHidden = false
        restartButton.isHidden = false
        
        UIView.animate(withDuration: 0.5, animations: {
            self.finishGame.center = CGPoint(x: self.finishGame.center.x + 500, y: self.finishGame.center.y)
            self.restartButton.center = CGPoint(x: self.restartButton.center.x + 500, y: self.restartButton.center.y)
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        finishGame.isHidden = true
        finishGame.center = CGPoint(x: finishGame.center.x - 500, y: finishGame.center.y)
        
        restartButton.isHidden = true
        restartButton.center = CGPoint(x: restartButton.center.x - 500, y: restartButton.center.y)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


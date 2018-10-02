//
//  GameScene.swift
//  Game-Starter-Empty
//
//  Created by mitchell hudson on 9/13/18.
//  Copyright © 2018 Make School. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var countingPoints = 0
    let counts = SKLabelNode(fontNamed: "Helvetica")
    
    override func didMove(to view: SKView) {
        // called when the scene has been displayed
        
        countScore()
        
        let action1 = SKAction.run {
            self.createSquare()
        }
        
        let wait = SKAction.wait(forDuration: 1)
        
        
        // generate squares
        let sequence = SKAction.sequence([action1, wait])
        
        let repeatingSquaresCreated = SKAction.repeatForever(sequence)
        self.run(repeatingSquaresCreated)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touches = touches.first {
            let location = touches.location(in: self)
            let node = atPoint(location)
            if node.name == "pink squares"{
                node.removeFromParent()
                updatePoints(with: +1)
                
                
            }
        }
    }
    
    private func updatePoints(with newValue: Int) {
        countingPoints += newValue
        counts.text = "your score is: \(countingPoints)"
    }
    
    
    
    func countScore() {
        counts.position = CGPoint(x: (view?.bounds.width)! / 2, y: (view?.bounds.height)! - 30)
        counts.fontSize = 25
        counts.text = "your score is: \(countingPoints)"
        addChild(counts)
    }
    
    
  
    override func update(_ currentTime: TimeInterval) {
        // * part of the rendering loop
        // Called before each frame is rendered
    }
    
    
    func createSquare() {
        let squareSize = CGSize(width: 50, height: 50)
        
        
        // sqaure object on the screen
        let square = CreateSquare(name: "pink squares", size: squareSize, color: Colors.pink)
        square.position.x = CGFloat(arc4random_uniform(UInt32((view?.bounds.width)!)))
        square.position.y = 0
        
        // move boxes up to top and dissapear from screen.
        let moveUpToTop = SKAction.moveTo(y: (view?.bounds.height)!, duration: 2)
        let removeNode = SKAction.removeFromParent()
        // if it removes, minus the points
        let minusPoints = SKAction.run {
            self.updatePoints(with: -1)
//            self.countingPoints -= 1
//            self.updatePoints(with: self.countingPoints)
        }
        // sequence
        let seq = SKAction.sequence([moveUpToTop, removeNode, minusPoints])
        
        // add the square to the screen
        addChild(square)
        // run the sequence on the screen
        square.run(seq)
        // create a name to use it over functions
        square.name = "pink squares"
    }
    
    
}

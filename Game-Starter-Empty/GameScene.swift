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
        
        let sequence = SKAction.sequence([action1, wait])
        
        let repeatingSquaresCreated = SKAction.repeatForever(sequence)
        self.run(repeatingSquaresCreated)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touches = touches.first {
            let location = touches.location(in: self)
            let node = atPoint(location)
            if node.name == "red squares"{
                node.removeFromParent()
                countingPoints += 1
                counts.text = "your score is: \(countingPoints)"
                
            }
        }
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
        let square = SKSpriteNode(texture: nil, color: .red, size: squareSize)
        square.position.x = CGFloat(arc4random_uniform(UInt32((view?.bounds.width)!)))
        square.position.y = 0
        
        let moveUpToTopScreen = SKAction.moveTo(y: (view?.bounds.height)!, duration: 2)
//        let wait = SKAction.wait(forDuration: 1)
        let deleteNode = SKAction.removeFromParent()
        
        let seq = SKAction.sequence([moveUpToTopScreen, deleteNode])
        addChild(square)
        square.run(seq)
        
        square.name = "red squares"
    }
    
    
}

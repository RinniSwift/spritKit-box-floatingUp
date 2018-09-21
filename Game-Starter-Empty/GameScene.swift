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
  
  
  
    override func didMove(to view: SKView) {
        // Called when the scene has been displayed
//        let action = SKAction.run {
//            self.createSquare(width: 40, height: 40, divideWidth: 2, divideHeight: 2)
//            self.createSquare(width: 40, height: 40, divideWidth: 4, divideHeight: 2)
//            self.createSquare(width: 40, height: 40, divideWidth: 1.355, divideHeight: 2)
//        }
//        self.run(action)
        
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
            }
        }
    }
    
    
  
    override func update(_ currentTime: TimeInterval) {
        // * part of the rendering loop
        // Called before each frame is rendered

    }
    
//    func createSquare(width: Int, height: Int, divideWidth: CGFloat, divideHeight: CGFloat) {
//        let size = CGSize(width: width, height: height)
//        let square = SKSpriteNode(texture: nil, color: .cyan, size: size)
//
//
//        if let view = self.view {
//            let width = square.position.x = view.bounds.width / divideWidth
//            let height = square.position.y = view.bounds.height / divideHeight
//        }
//
//        // > was actaully square.position.x = self.view?.bounds.width / 2
//        addChild(square)
//    }
    
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

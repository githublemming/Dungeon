//
//  OverlayScene.swift
//  Dungeon
//
//  Created by Mark Haskins on 01/06/2018.
//  Copyright © 2018 Mark Haskins. All rights reserved.
//

import UIKit
import SpriteKit

protocol OverlaySceneDelegate: AnyObject {
    func move(direction: HudMessage)
}

class OverlayScene: SKScene {
    
    var forwardNode: SKSpriteNode!
    var turnLeftNode: SKSpriteNode!
    var turnRightNode: SKSpriteNode!
    
    weak var overlayDelegate : OverlaySceneDelegate?
    
    override init(size: CGSize) {

        super.init(size: size)
        
        let spriteSize = size.width/12
        self.turnLeftNode = SKSpriteNode(imageNamed: "TurnLeft")
        self.turnLeftNode.name = "turnLeft"
        self.turnLeftNode.size = CGSize(width: spriteSize, height: spriteSize)
        self.turnLeftNode.position = CGPoint(x: spriteSize + 8, y: spriteSize + 8)
        
        
        self.forwardNode = SKSpriteNode(imageNamed: "Forward")
        self.forwardNode.name = "forward"
        self.forwardNode.size = CGSize(width: spriteSize, height: spriteSize)
        self.forwardNode.position = CGPoint(x: spriteSize + 64, y: spriteSize + 8)
        
        
        self.turnRightNode = SKSpriteNode(imageNamed: "TurnRight")
        self.turnRightNode.name = "turnRight"
        self.turnRightNode.size = CGSize(width: spriteSize, height: spriteSize)
        self.turnRightNode.position = CGPoint(x: spriteSize + 128, y: spriteSize + 8)
        
        
        self.addChild(self.turnLeftNode)
        self.addChild(self.forwardNode)
        self.addChild(self.turnRightNode)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {

        if let touch = touches.first  {

            let touchedNode = atPoint(touch.location(in: self)) as SKNode

            switch touchedNode.name {
            case "turnLeft":
                overlayDelegate?.move(direction: HudMessage.turnLeft)
                break
            case "forward":
                overlayDelegate?.move(direction: HudMessage.forward)
                break
            case "turnRight":
                overlayDelegate?.move(direction: HudMessage.turnRight)
                break
            default:
                print("Unhanded touch")
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

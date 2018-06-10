//
//  NodeComponent.swift
//  Dungeon
//
//  Created by Mark Haskins on 02/06/2018.
//  Copyright © 2018 Mark Haskins. All rights reserved.
//

import GameplayKit
import SceneKit

class MonsterNodeComponent: GKComponent {
    
    let node: SCNReferenceNode
    
    var nextGridPosition: vector_int2 = vector_int2(0,0)
    
    init(texture: String, pos: SCNVector3) {
        
        let path = Bundle.main.path(forResource: texture, ofType: "scn", inDirectory: "art.scnassets")
        let referenceUrl = NSURL(fileURLWithPath: path!)
        
        node = SCNReferenceNode(url: (referenceUrl as URL?)!)!
        
        super.init()
        
        node.load()
        node.position = pos
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setNextGridPosition(nextGridPosition: vector_int2) {
        
        if (self.nextGridPosition.x != nextGridPosition.x || self.nextGridPosition.y != nextGridPosition.y) {
            self.nextGridPosition = nextGridPosition
        }
        
        let newPos = SCNVector3(x:Float(nextGridPosition.x), y:0, z:Float(nextGridPosition.y))
        let move = SCNAction.move(to: newPos, duration: 0.5)
        
        node.runAction(move) {
            let monsterEntity = self.entity as! MonsterEntity
            monsterEntity.gridPosition = nextGridPosition
        }
    }
    
    func faceDirecion(direction: Direction) {
        
        let face = CGFloat(direction.rawValue)
        let xx = Float(DungeonUtils.degreesToRadians(degrees: face))
        
        node.eulerAngles = SCNVector3(x:0, y:xx, z:0)
    }
    
}

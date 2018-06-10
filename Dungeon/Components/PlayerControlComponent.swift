//
//  PlayerControlComponent.swift
//  Dungeon
//
//  Created by Mark Haskins on 02/06/2018.
//  Copyright © 2018 Mark Haskins. All rights reserved.
//

import GameplayKit

class PlayerControlComponent: GKComponent, OverlaySceneDelegate {

    var facing: Int = 0
    var moving: Bool = false

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init() {
        super.init()
    }

    var nodeComponent: PlayerNodeComponent? {
        return entity?.component(ofType: PlayerNodeComponent.self)
    }
    
    func move(direction: HudMessage) {
        
        switch direction {
        case HudMessage.forward:
            moveForward()
            break
        case HudMessage.turnLeft:
            turnleft()
            break
        case HudMessage.turnRight:
            turnRight()
            break
        }
    }
    
    func moveForward() {

        let map = entity?.component(ofType: LevelComponent.self)?.getMap()

        let pos = (nodeComponent?.cameraNode.position)!
        
        let north = Direction.north.rawValue
        let south = Direction.south.rawValue
        let east = Direction.east.rawValue
        let west = Direction.west.rawValue
        
        let mapX = Int(pos.x - 1)
        let mapZ = Int(pos.z - 1)
        
        var directionSquare = 0
        var moveAction = SCNVector3(0, 0, 0)
        switch(facing) {
        case north:
            directionSquare = map![mapZ - 1][mapX]
            moveAction = SCNVector3(pos.x, 0.5, pos.z - 1)
            break;
        case west:
            directionSquare = map![mapZ][mapX - 1]
            moveAction = SCNVector3(pos.x-1, 0.5, pos.z)
            break;
        case south:
            directionSquare = map![mapZ + 1][mapX]
            moveAction = SCNVector3(pos.x, 0.5, pos.z + 1)
            break;
        case east:
            directionSquare = map![mapZ][mapX + 1]
            moveAction = SCNVector3(pos.x+1, 0.5, pos.z)
            break;
        default:
            print("Unkown Direction")
        }
        
        if (directionSquare != 1) {
            let forward = SCNAction.move(to: moveAction, duration: 0.25)
            moveForward(forward: forward)
        }
    }
    
    func moveForward(forward: SCNAction) {
        
        if !moving {
            moving = true
            nodeComponent?.cameraNode.runAction(forward) {
                self.moving = false
            }
        }
    }
    
    func turnleft() {
        
        if (facing <= 270) {
            facing += 90
            if (facing == 360) {
                facing = 0
            }
        } else {
            facing = 0
        }
        
        let turnleft = SCNAction.rotateBy(x: 0, y: DungeonUtils.degreesToRadians(degrees: 90), z: 0, duration: 0.25)
        nodeComponent?.cameraNode.runAction(turnleft)
    }
    
    func turnRight() {
        
        if (facing >= 90) {
            facing -= 90
        } else {
            facing = 270
        }
        
        let turnright = SCNAction.rotateBy(x: 0, y: DungeonUtils.degreesToRadians(degrees: -90), z: 0, duration: 0.25)
        nodeComponent?.cameraNode.runAction(turnright)
    }
}

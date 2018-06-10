//
//  Player.swift
//  Dungeon
//
//  Created by Mark Haskins on 01/06/2018.
//  Copyright © 2018 Mark Haskins. All rights reserved.
//

import SceneKit

class Player: SCNNode {
    
    var cameraNode:SCNNode!
    
    var facing: Int
    var pos: SCNVector3
    
    var moving: Bool
    
    override init() {
        
        facing = 0
        
        cameraNode = SCNNode()
        cameraNode.scale = SCNVector3(x: 0.5, y: 0.5, z: 0.5)
        cameraNode.position = SCNVector3(x: 8, y: 0.5, z: 2)
        
        pos = cameraNode.position
        
        moving = false
        
        super.init()
        
        // create camera
        let camera = SCNCamera()
        camera.zNear = 0.25
        cameraNode.camera = camera
        
        // add light to camera
        let light = SCNLight()
        light.type = SCNLight.LightType.omni
        light.attenuationStartDistance = 2
        light.attenuationEndDistance = 5
        light.attenuationFalloffExponent = 2
        cameraNode.light = light
        
        self.addChildNode(cameraNode)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func moveForward(forward : SCNAction) {
        
        if !moving {
            moving = true
            cameraNode.runAction(forward) {
                self.pos = self.cameraNode.position
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
        
        let turnleft = SCNAction.rotateBy(x: 0, y: degreesToRadians(degrees: 90), z: 0, duration: 0.25)
        cameraNode.runAction(turnleft)
    }
    
    func turnRight() {
        
        if (facing >= 90) {
            facing -= 90
        } else {
            facing = 270
        }
        
        let turnright = SCNAction.rotateBy(x: 0, y: degreesToRadians(degrees: -90), z: 0, duration: 0.25)
        cameraNode.runAction(turnright)
    }
    
    func degreesToRadians(degrees: CGFloat) -> CGFloat {
        return degrees * CGFloat(Double.pi) / 180
    }
    
}

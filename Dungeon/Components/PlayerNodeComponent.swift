//
//  PlayerNodeComponent.swift
//  Dungeon
//
//  Created by Mark Haskins on 02/06/2018.
//  Copyright © 2018 Mark Haskins. All rights reserved.
//

import GameplayKit

class PlayerNodeComponent: GKComponent {
    
    let cameraNode: SCNNode = SCNNode()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init() {
        
        super.init()
        
        cameraNode.scale = SCNVector3(x: 0.5, y: 0.5, z: 0.5)
        cameraNode.position = SCNVector3(x: 8, y: 0.5, z: 2)
        
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
    }
}

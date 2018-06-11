//
//  GameController.swift
//  Dungeon Shared
//
//  Created by Mark Haskins on 30/05/2018.
//  Copyright © 2018 Mark Haskins. All rights reserved.
//

import SceneKit
import SpriteKit
import GameplayKit

class GameController: NSObject, SCNSceneRendererDelegate, HomeSceneDelegate {

    var stateMachine: GKStateMachine?

    init(sceneView: SCNView) {
        
        super.init()

        stateMachine = GKStateMachine(states:[
            HomeScreenState(view: sceneView, listener: self),
            GameActiveState(view: sceneView)]
        )

        stateMachine?.enter(HomeScreenState.self)

        sceneView.delegate = self
        sceneView.isPlaying = true
    }

    func startGame() {
        stateMachine?.enter(GameActiveState.self)
    }

    func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
        stateMachine?.update(deltaTime: time)
    }

}

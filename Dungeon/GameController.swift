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

    let sceneRenderer: SCNSceneRenderer

    var stateMachine: GKStateMachine?

    init(sceneRenderer renderer: SCNSceneRenderer) {
        
        sceneRenderer = renderer

        super.init()

        stateMachine = GKStateMachine(states:[
            HomeScreenState(sceneRenderer: sceneRenderer, listener: self),
            GameActiveState(sceneRenderer: sceneRenderer)]
        )

        stateMachine?.enter(HomeScreenState.self)

        sceneRenderer.delegate = self
        sceneRenderer.isPlaying = true
    }

    func startGame() {
        stateMachine?.enter(GameActiveState.self)
    }

    func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
        stateMachine?.update(deltaTime: time)
    }

}

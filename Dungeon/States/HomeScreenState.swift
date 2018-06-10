//
//  GomeScreenState.swift
//  Dungeon iOS
//
//  Created by Mark Haskins on 10/06/2018.
//  Copyright © 2018 Mark Haskins. All rights reserved.
//

import GameplayKit

class HomeScreenState: GKState {

    unowned let scene: SCNSceneRenderer
    let listener: HomeSceneDelegate

    init(sceneRenderer renderer: SCNSceneRenderer, listener: HomeSceneDelegate) {
        self.scene = renderer
        self.listener = listener
    }

    override func didEnter(from previousState: GKState?) {
        super.didEnter(from: previousState)
        self.scene.scene = HomeScene(sceneRenderer: self.scene, listener: listener)
    }

    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        return stateClass is GameActiveState.Type
    }

    override func willExit(to nextState: GKState) {
        super.willExit(to: nextState)

        let sceneView = scene as? SCNView
        sceneView?.overlaySKScene = SKScene()

    }
}

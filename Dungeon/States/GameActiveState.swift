//
//  GameActiveState.swift
//  Dungeon iOS
//
//  Created by Mark Haskins on 10/06/2018.
//  Copyright © 2018 Mark Haskins. All rights reserved.
//

import GameplayKit

class GameActiveState: GKState {

    unowned let scene: SCNSceneRenderer
    unowned let level: LevelScene

    init(sceneRenderer renderer: SCNSceneRenderer) {
        self.scene = renderer
        self.level = LevelScene(sceneRenderer: self.scene)
    }

    override func didEnter(from previousState: GKState?) {
        super.didEnter(from: previousState)
        self.scene.scene = self.level
    }

    override func willExit(to nextState: GKState) {
        super.willExit(to: nextState)
    }

    override func update(deltaTime seconds: TimeInterval) {
        super.update(deltaTime: seconds)
        self.level.update(deltaTime: seconds)

    }
}
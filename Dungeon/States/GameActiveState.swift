//
//  GameActiveState.swift
//  Dungeon iOS
//
//  Created by Mark Haskins on 10/06/2018.
//  Copyright © 2018 Mark Haskins. All rights reserved.
//

import GameplayKit

class GameActiveState: GKState {

    let sceneView: SCNView
    
    let level: LevelScene
    let overlay: GameOverlayScene

    init(view: SCNView) {
        self.sceneView = view
        
        self.overlay = GameOverlayScene(size: view.bounds.size)
        self.level = LevelScene(view: self.sceneView, overlayScene: overlay)
    }

    override func didEnter(from previousState: GKState?) {
        super.didEnter(from: previousState)
        
        self.sceneView.scene = self.level
        self.sceneView.overlaySKScene = overlay
    }

    override func willExit(to nextState: GKState) {
        super.willExit(to: nextState)
        
        self.sceneView.overlaySKScene = SKScene()
    }

    override func update(deltaTime seconds: TimeInterval) {
        super.update(deltaTime: seconds)
        
        self.level.update(deltaTime: seconds)
    }
}

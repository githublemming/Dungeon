//
//  GomeScreenState.swift
//  Dungeon iOS
//
//  Created by Mark Haskins on 10/06/2018.
//  Copyright © 2018 Mark Haskins. All rights reserved.
//

import GameplayKit

class HomeScreenState: GKState {

    let sceneView: SCNView
    
    let homeScene: HomeScene
    let homeOverlay: HomeOverlayScene
    
    init(view: SCNView, listener: HomeSceneDelegate) {
        
        self.sceneView = view
        
        self.homeOverlay = HomeOverlayScene(size: view.bounds.size)
        self.homeOverlay.homeOverlayDelegate = listener
        
        self.homeScene = HomeScene()
    }

    override func didEnter(from previousState: GKState?) {
        super.didEnter(from: previousState)
        
        self.sceneView.scene = self.homeScene
        self.sceneView.overlaySKScene = homeOverlay
    }

    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        return stateClass is GameActiveState.Type
    }

    override func willExit(to nextState: GKState) {
        super.willExit(to: nextState)

        sceneView.overlaySKScene = SKScene()
    }
}

//
// Created by Mark Haskins on 10/06/2018.
// Copyright (c) 2018 Mark Haskins. All rights reserved.
//

import SceneKit
import SpriteKit

protocol HomeSceneDelegate: AnyObject {
    func startGame()
}

class HomeScene: SCNScene {

    override init() {

        super.init()

//        let sceneView = renderer as? SCNView
//        let overLay = HomeSceneOverlay(size: (sceneView?.bounds.size)!)
//        overLay.overlayDelegate = listener
//        sceneView?.overlaySKScene = overLay
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}

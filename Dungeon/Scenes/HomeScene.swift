//
// Created by Mark Haskins on 10/06/2018.
// Copyright (c) 2018 Mark Haskins. All rights reserved.
//

import SceneKit
import SpriteKit

protocol HomeSceneDelegate: AnyObject {
    func startGame()
}

class HomeSceneOverlay: SKScene {

    weak var overlayDelegate : HomeSceneDelegate?

    override init(size: CGSize) {
        super.init(size: size)

        addLabel()
    }

    func addLabel() {

        let label = SKLabelNode()
        label.text = "Play"
        label.zPosition = 100
        addChild(label)
        label.position = CGPoint(x: 50, y: 50)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        overlayDelegate?.startGame()
    }
}

class HomeScene: SCNScene {

    init(sceneRenderer renderer: SCNSceneRenderer, listener: HomeSceneDelegate) {

        super.init()

        let sceneView = renderer as? SCNView
        let overLay = HomeSceneOverlay(size: (sceneView?.bounds.size)!)
        overLay.overlayDelegate = listener
        sceneView?.overlaySKScene = overLay
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}

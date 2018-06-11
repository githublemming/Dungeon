//
//  HomeOverlayScene.swift
//  Dungeon iOS
//
//  Created by Mark Haskins on 11/06/2018.
//  Copyright © 2018 Mark Haskins. All rights reserved.
//

import SpriteKit

class HomeOverlayScene: SKScene {

    weak var homeOverlayDelegate : HomeSceneDelegate?

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
        homeOverlayDelegate?.startGame()
    }
}

//
//  PlayerEntity.swift
//  Dungeon iOS
//
//  Created by Mark Haskins on 02/06/2018.
//  Copyright © 2018 Mark Haskins. All rights reserved.
//

import GameplayKit

class PlayerEntity: GKEntity {

    init(overlayScene: OverlayScene) {

        super.init()

        let playerControlComponent = PlayerControlComponent()
        addComponent(playerControlComponent)

        let playerNodeComponent = PlayerNodeComponent()
        addComponent(playerNodeComponent)

        overlayScene.overlayDelegate = playerControlComponent
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

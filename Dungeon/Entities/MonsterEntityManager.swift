//
// Created by Mark Haskins on 08/06/2018.
// Copyright (c) 2018 Mark Haskins. All rights reserved.
//

import GameplayKit
import SceneKit

class MonsterEntityManager {

    var entities = Set<GKEntity>()

    let scene: SCNScene
    let levelComponent: LevelComponent

    init(scene: SCNScene, levelComponent: LevelComponent) {
        self.scene = scene
        self.levelComponent = levelComponent
    }

    func add(_ entity: GKEntity) {

        entities.insert(entity)

        if let node = entity.component(ofType: MonsterNodeComponent.self)?.node {
            scene.rootNode.addChildNode(node)
        }

        entity.addComponent(levelComponent)
    }

    func update(_ deltaTime: CFTimeInterval) {

        for entity in entities {

            if let wander = entity.component(ofType: MonsterWanderComponent.self) {
                wander.update(deltaTime: deltaTime)
            }
        }
    }
}

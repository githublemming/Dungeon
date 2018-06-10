//
// Created by Mark Haskins on 10/06/2018.
// Copyright (c) 2018 Mark Haskins. All rights reserved.
//

import GameplayKit
import SceneKit

class LevelScene: SCNScene {

    var level: Level
    let overlayScene: OverlayScene

    var player: PlayerEntity!
    var entityManager: MonsterEntityManager!

    init(sceneRenderer renderer: SCNSceneRenderer) {

        let sceneView = renderer as? SCNView
        overlayScene = OverlayScene(size: (sceneView?.bounds.size)!)
        sceneView?.overlaySKScene = overlayScene

        self.level = Level1()

        super.init()

        let levelComponent = LevelComponent(level: level)

        entityManager = MonsterEntityManager(scene: self, levelComponent: levelComponent)

        createLevel()

        player = PlayerEntity(overlayScene: overlayScene)
        addPlayer(levelComponent: levelComponent)

        addMonsters()
    }

    required init?(coder aDecoder: NSCoder) {

        self.overlayScene = OverlayScene(size: CGSize(width:10,height:10))
        self.level = Level1()

        super.init(coder: aDecoder)
    }

   func addPlayer(levelComponent: LevelComponent) {

        player.addComponent(levelComponent)
        if let node = player.component(ofType: PlayerNodeComponent.self)?.cameraNode {
            self.rootNode.addChildNode(node)
        }
    }

    func addMonsters() {

        for monsters in level.monsters {

            var entity: GKEntity

            let monster = monsters.value

            let destination = Int(arc4random_uniform(UInt32(monster.wanderPoints.count)))
            let graphNode = monster.wanderPoints[destination]
            let start = SCNVector3(x:Float(graphNode.gridPosition.x), y:0, z: Float(graphNode.gridPosition.y))

            // create entity
            switch(monster.type) {
            case MonsterType.oink:
                entity = OinkEntity(id: monster.id, texture: monster.texture, position: start)
            break
            }

            entityManager.add(entity)
        }
    }

    func createLevel() {
        DungeonUtils.buildDungeon(scene:self, level:level)
    }

    func update(deltaTime seconds: TimeInterval) {
        entityManager.update(seconds)
    }

}

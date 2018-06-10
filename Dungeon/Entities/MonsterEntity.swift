//
//  MonsterEntity.swift
//  Dungeon
//
//  Created by Mark Haskins on 04/06/2018.
//  Copyright © 2018 Mark Haskins. All rights reserved.
//

import GameplayKit

class MonsterEntity: GKEntity {
    
    var id = 0
    var gridPosition: vector_int2!

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    required init(id: Int, texture: String, position: SCNVector3) {
        
        self.id = id
        
        super.init()

        gridPosition = vector_int2(Int32(position.x), Int32(position.z))

        let node = MonsterNodeComponent(texture: texture, pos: position)
        addComponent(node)

        let wanderingMonster = MonsterWanderComponent()
        addComponent(wanderingMonster)
    }
}


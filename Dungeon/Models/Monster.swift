//
//  Monster.swift
//  Dungeon iOS
//
//  Created by Mark Haskins on 08/06/2018.
//  Copyright © 2018 Mark Haskins. All rights reserved.
//

import GameplayKit

struct Monster {
    
    let id: Int
    let type: MonsterType
    let texture: String
    let wanderPoints: [GKGridGraphNode]
    
    init(id: Int, type: MonsterType, texture: String, wanderPoints: [GKGridGraphNode]) {
        self.id = id
        self.type = type
        self.texture = texture
        self.wanderPoints = wanderPoints
    }
    
}

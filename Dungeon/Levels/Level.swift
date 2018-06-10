//
//  Level.swift
//  Dungeon iOS
//
//  Created by Mark Haskins on 02/06/2018.
//  Copyright © 2018 Mark Haskins. All rights reserved.
//

import GameplayKit

enum LevelLegend : Int {
    case open = 0, wall, door
}

protocol Level: AnyObject {
    
    var map: [[Int]] { get }
    var monsters: [Int: Monster] { get }
    var pathFindGraph: GKGridGraph<GKGridGraphNode> { get set }
    
}

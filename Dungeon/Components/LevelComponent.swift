//
// Created by Mark Haskins on 08/06/2018.
// Copyright (c) 2018 Mark Haskins. All rights reserved.
//

import GameplayKit

class LevelComponent: GKComponent {

    var level: Level

    init(level: Level) {
        self.level = level

        super.init()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func getMap() -> [[Int]] {
        return level.map
    }

    func getPath() -> GKGridGraph<GKGridGraphNode> {
        return level.pathFindGraph
    }

    func getMonsters() -> [Int: Monster] {
        return level.monsters
    }

}

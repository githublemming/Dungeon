//
//  DungeonUtils.swift
//  Dungeon
//
//  Created by Mark Haskins on 31/05/2018.
//  Copyright © 2018 Mark Haskins. All rights reserved.
//

import GameplayKit
import SceneKit

class DungeonUtils {
    
    static func buildDungeon(scene: SCNScene, level: Level) {
        
        let map = level.map
        
        let BoxGeometry = SCNBox(width:1, height:1, length:1, chamferRadius: 0)
        
        let imageMaterial = SCNMaterial()
        imageMaterial.diffuse.contents = UIImage(named:"art.scnassets/bricks_detail.jpg")
        
        let graph = GKGridGraph(
            fromGridStartingAt: vector2(1,1),
            width: Int32(map[0].count) + 1,
            height: Int32(map.count) + 1,
            diagonalsAllowed: false)
        
        var walls = [GKGridGraphNode]()
        
        for var y in 0..<map.count {
            for var x in 0..<map[y].count {
                
                let object = map[y][x]
                
                if object == LevelLegend.wall.rawValue {
                    
                    let node = SCNNode(geometry: BoxGeometry)
                    node.position = SCNVector3(x: Float(x+1), y: 0.5, z: Float(y+1))
                    node.geometry?.materials = [imageMaterial]
                    scene.rootNode.addChildNode(node)
                    
                    walls.append( graph.node(atGridPosition: vector2(Int32(x) + 1, Int32(y) + 1))! )
                    
                } else if object == LevelLegend.door.rawValue{
                    walls.append( graph.node(atGridPosition: vector2(Int32(x) + 1, Int32(y) + 1))! )
                }
            }
        }
        
        graph.remove(walls)
        level.pathFindGraph = graph
    }
    
    static func degreesToRadians(degrees: CGFloat) -> CGFloat {
        return degrees * CGFloat(Double.pi) / 180
    }
}

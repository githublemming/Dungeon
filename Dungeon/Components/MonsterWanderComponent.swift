//
//  MonsterWanderComponent.swift
//  Dungeon
//
//  Created by Mark Haskins on 05/06/2018.
//  Copyright © 2018 Mark Haskins. All rights reserved.
//

import GameplayKit

class MonsterWanderComponent: GKComponent {

    var target: GKGridGraphNode?

    var levelComponent: LevelComponent? {
        return entity?.component(ofType: LevelComponent.self)
    }
    
    override init() {
        super.init()
    }
    
    override func update(deltaTime seconds: TimeInterval) {
        
        super.update(deltaTime: seconds)
        
        let monster = entity as! MonsterEntity
        let position = monster.gridPosition
        
        if (target == nil ||  (position?.x == self.target?.gridPosition.x && position?.y == self.target?.gridPosition.y)) {
            nextDestination()
        }
        
        startFollowingPath(path: pathToNode(destination: self.target!))
    }
    
    func pathToNode(destination: GKGridGraphNode) -> [GKGridGraphNode] {
        
        let graph = levelComponent?.getPath()
        
        let monsterEnt = entity as! MonsterEntity
        let monster = graph?.node(atGridPosition: monsterEnt.gridPosition)
        
        let start = graph?.node(atGridPosition: vector_int2(monster!.gridPosition.x, monster!.gridPosition.y))
        let end = graph?.node(atGridPosition: vector_int2(destination.gridPosition.x, destination.gridPosition.y))
        
        faceDirectionOfTravel(start: monster!.gridPosition, end: destination.gridPosition)
        
        let path = graph?.findPath(from: start!, to: end!) as? [GKGridGraphNode]
        
        return path!
    }
    
    func startFollowingPath(path : [GKGridGraphNode]) {
        
        if path.count > 1 {
            
            let firstMove = path[1]
            let component = entity?.component(ofType: MonsterNodeComponent.self)
            component?.setNextGridPosition(nextGridPosition: firstMove.gridPosition)
        }
    }
    
    func faceDirectionOfTravel(start: vector_int2, end: vector_int2) {
        
        var face: Direction
        
        if (start.x != end.x) {
            
            if (start.x < end.x) {
                face = Direction.west
            } else {
                face = Direction.east
            }
            
        } else {
            
            if (start.y < end.y) {
                face = Direction.north
            } else {
                face = Direction.south
            }
        }
        
        let component = entity?.component(ofType: MonsterNodeComponent.self)
        component?.faceDirecion(direction: face)
    }
    
    func nextDestination() {
        
        let monsterEnt = entity as! MonsterEntity
        
        let monster = levelComponent?.getMonsters()[monsterEnt.id]
        let destination = Int(arc4random_uniform(UInt32(monster!.wanderPoints.count)))
        self.target = monster?.wanderPoints[destination]
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

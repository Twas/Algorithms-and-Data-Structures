//
//  Dijkstra.swift
//  AlgorithmsAndDataStructures
//
//  Created by Евгений on 22.10.2019.
//  Copyright © 2019 Евгений. All rights reserved.
//

import Foundation

extension Graph {
    
    /// Recursively contains path from source to destination vertices.
    class Path<Data: Hashable> {
        
        let cumulativeCost: Double
        let vertex: Vertex<Data>
        let previousPath: Path<Data>?
        
        init(to vertex: Vertex<Data>, costing cost: Double = 0, previousPath: Path<Data>? = nil) {
            let previousCost = previousPath?.cumulativeCost ?? 0
            self.cumulativeCost = previousCost + cost
            
            self.vertex = vertex
            self.previousPath = previousPath
        }
        
        // MARK: - Public
        
        /// Returns the array of vertices, sorted from source to destination
        func vertices() -> [Vertex<Data>] {
            var array = [vertex]
            
            var iterativePath = self
            while let path = iterativePath.previousPath {
                array.append(path.vertex)
                iterativePath = path
            }
            
            return array.reversed()
        }
    }
}

// MARK: - Dijkstra Algorithm

extension Graph {
    
    /// Finds shortest path between two vertices in a graph.
    /// - Parameter source: staring point of the path.
    /// - Parameter destination: ending point of the path.
    /// - Returns: shortest path between two vertices or nil, if path doesn't exist.
    /// - Complexity: O(*n* * *n*) where n is the number of vertices in the graph.
    func findShortestPath(from source: Vertex<Data>, to destination: Vertex<Data>) -> Path<Data>? {
        var frontier: [Path<Data>] = [] {
            didSet {
                frontier.sort { $0.cumulativeCost < $1.cumulativeCost }
            }
        }
        
        // the frontier is made by a path that starts nowhere and ends in the source
        frontier.append(Path(to: source))
            
        while !frontier.isEmpty {
            let shortestPath = frontier.removeFirst()
            guard shortestPath.vertex.traversalState != .visited else { continue }
            
            if shortestPath.vertex === destination {
                return shortestPath
            }
            
            shortestPath.vertex.traversalState = .visited
            
            let vertexEdges = edges(from: shortestPath.vertex) ?? []
            for edge in vertexEdges where edge.destination.traversalState != .visited {
                frontier.append(Path(to: edge.destination, costing: edge.weight ?? 0, previousPath: shortestPath))
            }
        }
        
        return nil
    }
}

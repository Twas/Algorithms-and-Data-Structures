//
//  Vertex.swift
//  AlgorithmsAndDataStructures
//
//  Created by Евгений on 16.10.2019.
//  Copyright © 2019 Евгений. All rights reserved.
//

import Foundation

extension Graph {
    
    class Vertex<Data: Hashable> {
        let data: Data
        var traversalState: TraversalState
        
        init(data: Data) {
            self.data = data
            self.traversalState = .notDiscovered
        }
    }
}

// MARK: - Traversal state

extension Graph.Vertex {
    
    enum TraversalState {
        case notDiscovered
        case notVisited
        case visited
    }
}

// MARK: - Hashable

extension Graph.Vertex: Hashable {
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(data)
    }

    static func == (lhs: Graph.Vertex<Data>, rhs: Graph.Vertex<Data>) -> Bool {
        lhs.data == rhs.data
    }
}

// MARK: - CustomStringConvertible

extension Graph.Vertex: CustomStringConvertible {
    
    var description: String { "\(data)" }
}

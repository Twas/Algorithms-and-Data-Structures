//
//  Edge.swift
//  AlgorithmsAndDataStructures
//
//  Created by Евгений on 16.10.2019.
//  Copyright © 2019 Евгений. All rights reserved.
//

import Foundation

extension Graph {
    
    class Edge<Data: Hashable> {
        let source: Vertex<Data>
        let destination: Vertex<Data>
        let weight: Double?
        
        init(source: Vertex<Data>, destination: Vertex<Data>, weight: Double?) {
            self.source = source
            self.destination = destination
            self.weight = weight
        }
    }
}

// MARK: Edge type

extension Graph.Edge {
    
    enum DirectionType {
        case directed
        case undirected
    }
}

// MARK: Hashable

extension Graph.Edge: Hashable {
    
    func hash(into hasher: inout Hasher) {
        hasher.combine("\(source)\(destination)\(weight ?? 0)")
    }
    
    static func == (lhs: Graph.Edge<Data>, rhs: Graph.Edge<Data>) -> Bool {
        lhs.source == rhs.source &&
            lhs.destination == rhs.destination &&
            lhs.weight == rhs.weight
    }
}

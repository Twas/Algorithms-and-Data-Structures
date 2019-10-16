//
//  Edge.swift
//  AlgorithmsAndDataStructures
//
//  Created by Евгений on 16.10.2019.
//  Copyright © 2019 Евгений. All rights reserved.
//

import Foundation

extension Graph {
    
    struct Edge<T: Hashable> {
        let source: Vertex<T>
        let destination: Vertex<T>
        let weight: Double?
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
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.source == rhs.source &&
            lhs.destination == rhs.destination &&
            lhs.weight == rhs.weight
    }
}

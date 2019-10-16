//
//  Vertex.swift
//  AlgorithmsAndDataStructures
//
//  Created by Евгений on 16.10.2019.
//  Copyright © 2019 Евгений. All rights reserved.
//

import Foundation

extension Graph {
    
    struct Vertex<T: Hashable> {
        let data: T
    }
}

// MARK: Hashable

extension Graph.Vertex: Hashable {
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(data)
    }

    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.data == rhs.data
    }
}

// MARK: CustomStringConvertible

extension Graph.Vertex: CustomStringConvertible {
    
    var description: String { "\(data)" }
}

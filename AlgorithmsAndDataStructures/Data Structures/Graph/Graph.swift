//
//  Graph.swift
//  AlgorithmsAndDataStructures
//
//  Created by Евгений on 16.10.2019.
//  Copyright © 2019 Евгений. All rights reserved.
//

import Foundation

/// Data structure made up of a set of vertices paired with a set of edges.
///
/// Implemented with the help of adjacency list. Internal structure - dictionary of arrays.
/// Each key in the dictionary is a vertex, and each value is the corresponding array of edges.
class Graph<Element: Hashable> {
    
    private var adjacencyDict: [Vertex<Element>: [Edge<Element>]] = [:]
    
    init() {}
    
    // MARK: - Public
    
    func createVertex(data: Element) -> Vertex<Element> {
        let vertex = Vertex(data: data)
        
        if adjacencyDict[vertex] == nil {
            adjacencyDict[vertex] = []
        }
        
        return vertex
    }
    
    func add(_ type: Edge<Element>.DirectionType, from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?) {
        switch type {
        case .directed:
            addDirectedEdge(from: source, to: destination, weight: weight)
        case .undirected:
            addUndirectedEdge(vertices: (source, destination), weight: weight)
        }
    }
    
    func weight(from source: Vertex<Element>, to destination: Vertex<Element>) -> Double? {
        guard let edges = adjacencyDict[source] else { return nil }
        
        let edge = edges.first(where: { $0.destination == destination })
        
        return edge?.weight
    }
    
    func edges(from source: Vertex<Element>) -> [Edge<Element>]? {
        adjacencyDict[source]
    }
    
    // MARK: - Private
    
    private func addDirectedEdge(from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?) {
        let edge = Edge(source: source, destination: destination, weight: weight)
        adjacencyDict[source]?.append(edge)
    }
    
    private func addUndirectedEdge(vertices: (Vertex<Element>, Vertex<Element>), weight: Double?) {
        let (source, destination) = vertices
        addDirectedEdge(from: source, to: destination, weight: weight)
        addDirectedEdge(from: destination, to: source, weight: weight)
    }
}

// MARK: - CustomStringConvertible

extension Graph: CustomStringConvertible {
    
    var description: String {
        var result = ""
        for (vertex, edges) in adjacencyDict {
            let edgeString = edges.map { "\($0.destination)" }.joined(separator: ", ")
            result.append("\(vertex) ---> [ \(edgeString) ] \n")
        }

        return result
    }
}

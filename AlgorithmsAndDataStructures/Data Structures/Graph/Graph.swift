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
class Graph<Data: Hashable> {
    
    private var adjacencyDict: [Vertex<Data>: [Edge<Data>]] = [:]
    
    init() {}
    
    // MARK: - Public
    
    func createVertex(data: Data) -> Vertex<Data> {
        let vertex = Vertex(data: data)
        
        if adjacencyDict[vertex] == nil {
            adjacencyDict[vertex] = []
        }
        
        return vertex
    }
    
    func add(_ type: Edge<Data>.DirectionType, from source: Vertex<Data>, to destination: Vertex<Data>, weight: Double?) {
        switch type {
        case .directed:
            addDirectedEdge(from: source, to: destination, weight: weight)
        case .undirected:
            addUndirectedEdge(vertices: (source, destination), weight: weight)
        }
    }
    
    func weight(from source: Vertex<Data>, to destination: Vertex<Data>) -> Double? {
        guard let edges = adjacencyDict[source] else { return nil }
        
        let edge = edges.first(where: { $0.destination == destination })
        
        return edge?.weight
    }
    
    func edges(from source: Vertex<Data>) -> [Edge<Data>]? {
        adjacencyDict[source]
    }
    
    // MARK: - Private
    
    private func addDirectedEdge(from source: Vertex<Data>, to destination: Vertex<Data>, weight: Double?) {
        let edge = Edge(source: source, destination: destination, weight: weight)
        adjacencyDict[source]?.append(edge)
    }
    
    private func addUndirectedEdge(vertices: (Vertex<Data>, Vertex<Data>), weight: Double?) {
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

// MARK: - Traversal

extension Graph {
    
    typealias VertexHandler = (Vertex<Data>) -> Void
    
    /// Visits each vertex of the graph so that all neighbours are visited before neighbour's neighbours.
    /// - Parameter vertexHandler: This closure is called for each vertex when it is visited.
    /// - Complexity: O(*V* +* E*) where *V* is the number of vertices and *E* is the number of edges.
    func breadthFirstSearch(vertexHandler: VertexHandler?) {
        guard let startingVertex = adjacencyDict.keys.first else { return }
        
        var queue = Queue<Vertex<Data>>()
        queue.enqueue(startingVertex)
        
        while let currentVertex = queue.dequeue() {
            // add unvisited vertices to the queue
            let vertexEdges = edges(from: currentVertex) ?? []
            for edge in vertexEdges where edge.destination.traversalState == .notDiscovered {
                edge.destination.traversalState = .notVisited
                queue.enqueue(edge.destination)
            }
            
            // process current vertex
            currentVertex.traversalState = .visited
            vertexHandler?(currentVertex)
        }
    }
}

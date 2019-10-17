//
//  GraphTests.swift
//  AlgorithmsAndDataStructuresTests
//
//  Created by Евгений on 16.10.2019.
//  Copyright © 2019 Евгений. All rights reserved.
//

import XCTest
@testable import AlgorithmsAndDataStructures

class GraphTests: XCTestCase {

    var graph: Graph<String>!
    
    override func setUp() {
        graph = Graph()
        
        let singapore = graph.createVertex(data: "Singapore")
        let tokyo = graph.createVertex(data: "Tokyo")
        let hongKong = graph.createVertex(data: "Hong Kong")
        let detroit = graph.createVertex(data: "Detroit")
        let sanFrancisco = graph.createVertex(data: "San Francisco")
        let washingtonDC = graph.createVertex(data: "Washington DC")
        let austinTexas = graph.createVertex(data: "Austin Texas")
        let seattle = graph.createVertex(data: "Seattle")

        graph.add(.undirected, from: singapore, to: hongKong, weight: 300)
        graph.add(.undirected, from: singapore, to: tokyo, weight: 500)
        graph.add(.undirected, from: hongKong, to: tokyo, weight: 250)
        graph.add(.undirected, from: tokyo, to: detroit, weight: 450)
        graph.add(.undirected, from: tokyo, to: washingtonDC, weight: 300)
        graph.add(.undirected, from: hongKong, to: sanFrancisco, weight: 600)
        graph.add(.undirected, from: detroit, to: austinTexas, weight: 50)
        graph.add(.undirected, from: austinTexas, to: washingtonDC, weight: 292)
        graph.add(.undirected, from: sanFrancisco, to: washingtonDC, weight: 337)
        graph.add(.undirected, from: washingtonDC, to: seattle, weight: 277)
        graph.add(.undirected, from: sanFrancisco, to: seattle, weight: 218)
        graph.add(.undirected, from: austinTexas, to: sanFrancisco, weight: 297)
    }
    
    override func tearDown() {
        graph = nil
    }
    
    // MARK: - Traversal
    
    func testThatBFSVisitsAllVertices() {
        var counter = 0
        graph.breadthFirstSearch { _ in counter += 1 }
        
        XCTAssertEqual(counter, 8, "Incorrect number of vertices visited.")
    }
    
    func testBFSOnEmptyGraph() {
        var counter = 0
        let emptyGraph = Graph<Int>()
        emptyGraph.breadthFirstSearch { _ in counter += 1 }
        
        XCTAssertEqual(counter, 0, "Empty graph does not contain vertices to visit.")
    }
    
    func testThatDFSVisitsAllVertices() {
        var counter = 0
        graph.depthFirstSearch { _ in counter += 1 }
        
        XCTAssertEqual(counter, 8, "Incorrect number of vertices visited.")
    }
    
    func testDFSOnEmptyGraph() {
        var counter = 0
        let emptyGraph = Graph<Int>()
        emptyGraph.depthFirstSearch { _ in counter += 1 }
        
        XCTAssertEqual(counter, 0, "Empty graph does not contain vertices to visit.")
    }
}

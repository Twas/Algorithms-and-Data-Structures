//
//  QueueTests.swift
//  AlgorithmsAndDataStructuresTests
//
//  Created by Евгений on 08.10.2019.
//  Copyright © 2019 Евгений. All rights reserved.
//

import XCTest
@testable import AlgorithmsAndDataStructures

class QueueTests: XCTestCase {

    func testThatDequeueReturnsElementsInDirectOrder() {
        var queue = Queue<UIColor>()
        queue.enqueue(.red)
        queue.enqueue(.green)
        queue.enqueue(.blue)
        
        XCTAssertEqual(queue.dequeue(), .red, "Incorrect order of elements.")
        XCTAssertEqual(queue.dequeue(), .green, "Incorrect order of elements.")
        XCTAssertEqual(queue.dequeue(), .blue, "Incorrect order of elements.")
    }
    
    func testThatDequeueReturnsNilForEmptyQueue() {
        var queue = Queue<String>()
        
        XCTAssertNil(queue.dequeue(), "Empty queue should return nil.")
    }
    
    func testEmptyQueue() {
        var queue = Queue<Int>()
        XCTAssertTrue(queue.isEmpty)
        
        queue.enqueue(1)
        queue.enqueue(2)
        XCTAssertFalse(queue.isEmpty)
        
        _ = queue.dequeue()
        _ = queue.dequeue()
        XCTAssertTrue(queue.isEmpty)
    }
}

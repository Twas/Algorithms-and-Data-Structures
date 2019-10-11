//
//  HeapTests.swift
//  AlgorithmsAndDataStructuresTests
//
//  Created by Евгений on 10.10.2019.
//  Copyright © 2019 Евгений. All rights reserved.
//

import XCTest
@testable import AlgorithmsAndDataStructures

class HeapTests: XCTestCase {
    
    private var minHeap: Heap<Int>!
    private var maxHeap: Heap<Int>!
    
    override func setUp() {
        minHeap = Heap(elements: [1, 3, 17, 9, 4, 7, 2], priorityFunction: <)
        maxHeap = Heap(elements: [1, 3, 17, 9, 4, 7, 2], priorityFunction: >)
    }
    
    override func tearDown() {
        minHeap = nil
        maxHeap = nil
    }
    
    // MARK: - Initialization
    
    func testInitializedHeaps() {
        XCTAssertEqual(minHeap.elements, [1, 3, 2, 9, 4, 17, 7])
        XCTAssertEqual(maxHeap.elements, [17, 9, 7, 1, 4, 3, 2])
    }

    // MARK: - Modification
    
    func testEnqueueNewElementWithHigherPriorityThanRoot() {
        minHeap.enqueue(0)
        XCTAssertEqual(minHeap.peek()!, 0)
        
        maxHeap.enqueue(20)
        XCTAssertEqual(maxHeap.peek()!, 20)
    }
    
    func testEnqueueNewElementWithLowerPriorityThanRoot() {
        minHeap.enqueue(5)
        XCTAssertEqual(minHeap.peek()!, 1)
        
        maxHeap.enqueue(10)
        XCTAssertEqual(maxHeap.peek()!, 17)
    }
    
    func testEnqueueNewElementIntoEmptyHeap() {
        var emptyHeap = Heap<Int>(elements: [], priorityFunction: <)
        XCTAssertTrue(emptyHeap.isEmpty)
        
        emptyHeap.enqueue(5)
        
        XCTAssertEqual(emptyHeap.elements, [5])
    }
    
    func testDequeueElement() {
        let removedMinElement = minHeap.dequeue()
        
        XCTAssertEqual(removedMinElement!, 1, "Wrong element dequeued.")
        XCTAssertEqual(minHeap.peek()!, 2, "Wrong element dequeued.")
        
        let removedMaxElement = maxHeap.dequeue()
        
        XCTAssertEqual(removedMaxElement, 17, "Wrong element dequeued.")
        XCTAssertEqual(maxHeap.peek()!, 9, "Wrong element dequeued.")
    }
    
    func testDequeuElementFromEmptyHeap() {
        var emptyHeap = Heap<Int>(elements: [], priorityFunction: <)
        XCTAssertTrue(emptyHeap.isEmpty)
        
        let removedElement = emptyHeap.dequeue()
        
        XCTAssertTrue(emptyHeap.isEmpty)
        XCTAssertNil(removedElement)
    }
}

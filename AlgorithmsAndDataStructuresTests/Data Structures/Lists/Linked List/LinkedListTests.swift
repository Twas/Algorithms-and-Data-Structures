//
//  LinkedListTests.swift
//  AlgorithmsAndDataStructuresTests
//
//  Created by Евгений on 9/2/19.
//  Copyright © 2019 Евгений. All rights reserved.
//

import XCTest
@testable import AlgorithmsAndDataStructures

class LinkedListTests: XCTestCase {
    
    var list: LinkedList<Int>!
    
    override func setUp() {
        let thirdNode = LinkedList.Node(value: 3)
        let secondNode = LinkedList.Node(value: 2, next: thirdNode)
        let firstNode = LinkedList.Node(value: 1, next: secondNode)
        
        list = LinkedList(first: firstNode, last: thirdNode)
    }
    
    override func tearDown() {
        list = nil
    }
    
    // MARK: - Search

    func testSearchingExistingNodes() {
        let firstNode = list.findFirstNode(with: 1)
        XCTAssertNotNil(firstNode, "Node should be found.")
        XCTAssertEqual(firstNode!.value, 1, "Incorrent node found.")
        
        let secondNode = list.findFirstNode(with: 2)
        XCTAssertNotNil(secondNode, "Node should be found.")
        XCTAssertEqual(secondNode!.value, 2, "Incorrent node found.")

        let thirdNode = list.findFirstNode(with: 3)
        XCTAssertNotNil(thirdNode, "Node should be found.")
        XCTAssertEqual(thirdNode!.value, 3, "Incorrent node found.")
    }
    
    func testSearchingNotExistingNodes() {
        let node = list.findFirstNode(with: 10)
        
        XCTAssertNil(node, "Node should not be found.")
    }
    
    func testSearchingInEmptyList() {
        list = LinkedList()
        let node = list.findFirstNode(with: 1)
        
        XCTAssertNil(node, "Node should not be found in empty list.")
    }
    
    // MARK: - Add
    
    func testAddingNode() {
        list.append(100)
        
        XCTAssertNotNil(list.findFirstNode(with: 100), "New node has not been added.")
        XCTAssertEqual(list.last!.value, 100, "Appended value should be last.")
    }
    
    func testAppendingNodeToEmptyList() {
        list = LinkedList()
        list.append(-20)
        
        XCTAssertNotNil(list.findFirstNode(with: -20), "New node has not been added.")
        XCTAssertEqual(list.first!.value, -20, "Value appended to the empty list should be first.")
        XCTAssertEqual(list.last!.value, -20, "Appended value should be last.")
    }
    
    // MARK: - Delete
    
    func testDeletingNode() {
        let secondNode = list.findFirstNode(with: 2)
        list.delete(secondNode!)
        
        XCTAssertNil(list.findFirstNode(with: 2), "Node with value 2 should have been deleted.")
    }
    
    func testDeletingFirstNode() {
        list.delete(list.first!)
        
        XCTAssertEqual(list.first!.value, 2, "First node should have been updated.")
    }
    
    func testDeletingLastNode() {
        list.delete(list.last!)
        
        XCTAssertEqual(list.last!.value, 2, "Last node should have been updated.")
    }
    
    func testDeletingNodeFromEmptyList() {
        list = LinkedList()
        let node = LinkedList.Node(value: 56)
        list.delete(node)
        
        XCTAssertNil(list.first, "List should remain empty.")
        XCTAssertNil(list.last, "List should remain empty.")
    }
    
    func testDeletingFromListWithOneNode() {
        let singleNode = LinkedList.Node(value: 1000)
        list = LinkedList(first: singleNode, last: singleNode)
        
        list.delete(singleNode)
        
        XCTAssertNil(list.first, "List should become empty.")
        XCTAssertNil(list.last, "List should become empty.")
    }
}

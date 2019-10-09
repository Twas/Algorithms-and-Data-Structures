//
//  BinarySearchTreeTests.swift
//  AlgorithmsAndDataStructuresTests
//
//  Created by Евгений on 08.10.2019.
//  Copyright © 2019 Евгений. All rights reserved.
//

import XCTest
@testable import AlgorithmsAndDataStructures

class BinarySearchTreeTests: XCTestCase {
    
    private var tree: BinarySearchTree<Int>!

    override func setUp() {
        tree = BinarySearchTree(50)
        tree.insert(70)
        tree.insert(10)
        tree.insert(20)
        tree.insert(40)
        tree.insert(60)
        tree.insert(30)
    }
    
    override func tearDown() {
        tree = nil
    }
    
    // MARK: - Search
    
    func testSearchingForExisitingElement() {
        let node = tree.search(for: 60)
        
        XCTAssertEqual(node!.value, 60, "Incorrect node found.")
    }
    
    func testSearchingForNotExistingElement() {
        let node = tree.search(for: 1000)
        
        XCTAssertNil(node, "Not existing node found.")
    }
    
    func testSearchingForElementInEmptyTree() {
        deleteAllElementsFromTree()
        
        let node = tree.search(for: 40)
        XCTAssertNil(node, "Not existing node found.")
    }
    
    func testFindingMinimumValue() {
        let min = tree.min()
        
        XCTAssertEqual(min?.value, 10, "Incorrect node found.")
    }
    
    func testFindingMinimumValueInEmptyTree() {
        deleteAllElementsFromTree()
        
        let min = tree.min()
        
        XCTAssertNil(min, "Not existing node found.")
    }
    
    func testFindingMaximumValue() {
        let max = tree.max()
        
        XCTAssertEqual(max!.value, 70, "Incorrect node found.")
    }
    
    func testFindingMaximumValueInEmptyTree() {
        deleteAllElementsFromTree()
        
        let max = tree.max()
        
        XCTAssertNil(max, "Not existing node found.")
    }
    
    // MARK: - Traverse
    
    func testThatTraversedTreeIsOrderedArray() {
        let values = tree.traverse()
        
        XCTAssertEqual(values, values.sorted(), "Traversed binary search tree should be ordered.")
    }
    
    func testTraversingEmptyTree() {
        deleteAllElementsFromTree()
        
        XCTAssertTrue(tree.traverse().isEmpty, "Traversed empty binary search tree should be also empty.")
    }
    
    // MARK: Modification
    
    func testThatInsertingExistingValueDoesNotModifyTree() {
        let values = tree.traverse()
        tree.insert(40)
        
        XCTAssertEqual(values, tree.traverse(), "Inserting existing element should not modify tree.")
    }
    
    func testThatInsertingIntoEmptyTreeCreatesRootNode() {
        deleteAllElementsFromTree()
        
        tree.insert(100)
        
        XCTAssertEqual(tree.traverse(), [100], "Tree should have new root node.")
    }
    
    func testDeletingNodeWithAtMostOneChild() {
        var values = tree.traverse()
        tree.delete(20)
        values.removeAll(where: { $0 == 20 })
        
        XCTAssertEqual(tree.traverse(), values, "Element should be deleted from the tree, and the tree should be reorganized.")
    }
    
    func testDeletingNodeWithTwoChildren() {
        var values = tree.traverse()
        tree.delete(40)
        values.removeAll(where: { $0 == 40 })
        
        XCTAssertEqual(tree.traverse(), values, "Element should be deleted from the tree, and the tree should be reorganized.")
    }
    
    func testDeletingNotExistingElements() {
        let values = tree.traverse()
        tree.delete(1000)
        
        XCTAssertEqual(tree.traverse(), values, "Tree should not change after deleting not existing element.")
    }
    
    func testDeletingRootNode() {
        var values = tree.traverse()
        tree.delete(50)
        values.removeAll(where: { $0 == 50 })
        
        XCTAssertEqual(tree.traverse(), values, "Root node should be deleted, and the tree should be reorganized.")
    }
    
    func testDeletingAllElements() {
        deleteAllElementsFromTree()
        
        XCTAssertTrue(tree.traverse().isEmpty, "Tree should be empty after deleting all elements.")
    }
    
    // MARK: - Private
    
    private func deleteAllElementsFromTree() {
        tree.delete(10)
        tree.delete(20)
        tree.delete(30)
        tree.delete(40)
        tree.delete(50)
        tree.delete(60)
        tree.delete(70)
    }
}

//
//  CollectionBinarySearchTests.swift
//  AlgorithmsAndDataStructuresTests
//
//  Created by Евгений on 16.10.2019.
//  Copyright © 2019 Евгений. All rights reserved.
//

import XCTest
@testable import AlgorithmsAndDataStructures

class CollectionBinarySearchTests: XCTestCase {

    func testSearchingInCollection() {
        let collection = [1, 2, 3, 4]
        let index = collection.binarySearch(for: 2)
        
        XCTAssertEqual(index!, 1, "Incorrect index found.")
    }
    
    func testSearchingEdgeCases() {
        let collection = [1, 2, 3, 4]
        
        let firstElementIndex = collection.binarySearch(for: 1)
        XCTAssertEqual(firstElementIndex, 0, "Incorrect index found.")
        
        let lastElementIndex = collection.binarySearch(for: 4)
        XCTAssertEqual(lastElementIndex, 3, "Incorrect index found.")
    }
    
    func testSearchingInCollectionWithSingleElement() {
        let collection = ["test"]
        let index = collection.binarySearch(for: "test")
        
        XCTAssertEqual(index!, 0, "Incorrect index found.")
    }
    
    func testSearchingInEmptyCollection() {
        let collection: [String] = []
        let index = collection.binarySearch(for: "test")
        
        XCTAssertNil(index)
    }
    
    func testSearchingForNotExistingElement() {
        let collection = [1, 3, 5, 19]
        let index = collection.binarySearch(for: 2)
        
        XCTAssertNil(index)
    }
}

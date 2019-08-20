//
//  ArrayMergeSortTests.swift
//  AlgorithmsAndDataStructuresTests
//
//  Created by Евгений on 8/20/19.
//  Copyright © 2019 Евгений. All rights reserved.
//

import XCTest
@testable import AlgorithmsAndDataStructures

class ArrayMergeSortTests: XCTestCase {

    func testThatArrayWithEvenNumberOfElementsIsSorted() {
        var array = [2, -5, 1, 7, 3, 19]
        
        array.mergeSort()
        
        XCTAssertEqual(array, [-5, 1, 2, 3, 7, 19], "Array should be sorted.")
    }
    
    func testThatArrayWithOddNumberOfElementsIsSorted() {
        var array = [2, -5, 1, 19, 3]
        
        array.mergeSort()
        
        XCTAssertEqual(array, [-5, 1, 2, 3, 19], "Array should be sorted.")
    }
    
    func testThatSortedArrayRemainsSorted() {
        var array = [1, 2, 4, 5, 20]
        
        array.mergeSort()
        
        XCTAssertEqual(array, [1, 2, 4, 5, 20], "Array should remain sorted.")
    }
    
    func testThatEmptyArrayRemainsEmpty() {
        var array: [Int] = []
        
        array.mergeSort()
        
        XCTAssertTrue(array.isEmpty, "Array should remain empty.")
    }
    
    func testThatArrayWithSingleElementDoesNotChange() {
        var array = [1]
        
        array.mergeSort()
        
        XCTAssertEqual(array, [1], "Array should not change.")
    }
    
    func testThatArrayWithEqualElementsDoesNotChange() {
        var array = [2, 2, 2, 2]
        
        array.mergeSort()
        
        XCTAssertEqual(array, [2, 2, 2, 2], "Array should not change.")
    }
}

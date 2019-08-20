//
//  SortingArrayTests.swift
//  AlgorithmsAndDataStructuresTests
//
//  Created by Евгений on 8/20/19.
//  Copyright © 2019 Евгений. All rights reserved.
//

import XCTest

// swiftlint:disable private_unit_test

typealias ArrayHandler = (inout [Int]) -> Void

class SortingArrayTests: XCTestCase {
    
    private var sortProvider: ArrayHandler?
    
    override func setUp() {
        sortProvider = nil
    }
    
    // MARK: - Public
    
    func runSortingTests(using sortProvider: @escaping ArrayHandler) {
        self.sortProvider = sortProvider
        
        testThatArrayWithEvenNumberOfElementsIsSorted()
        testThatArrayWithOddNumberOfElementsIsSorted()
        testThatSortedArrayRemainsSorted()
        testThatEmptyArrayRemainsEmpty()
        testThatArrayWithSingleElementDoesNotChange()
        testThatArrayWithEqualElementsDoesNotChange()
    }

    // MARK: - Private
    
    private func testThatArrayWithEvenNumberOfElementsIsSorted() {
        var array = [2, -5, 1, 7, 3, 19]
        
        sortProvider?(&array)
        
        XCTAssertEqual(array, [-5, 1, 2, 3, 7, 19], "Array should be sorted.")
    }
    
    private func testThatArrayWithOddNumberOfElementsIsSorted() {
        var array = [2, -5, 1, 19, 3]
        
        sortProvider?(&array)
        
        XCTAssertEqual(array, [-5, 1, 2, 3, 19], "Array should be sorted.")
    }
    
    private func testThatSortedArrayRemainsSorted() {
        var array = [1, 2, 4, 5, 20]
        
        sortProvider?(&array)
        
        XCTAssertEqual(array, [1, 2, 4, 5, 20], "Array should remain sorted.")
    }
    
    private func testThatEmptyArrayRemainsEmpty() {
        var array: [Int] = []
        
        sortProvider?(&array)
        
        XCTAssertTrue(array.isEmpty, "Array should remain empty.")
    }
    
    private func testThatArrayWithSingleElementDoesNotChange() {
        var array = [1]
        
        sortProvider?(&array)
        
        XCTAssertEqual(array, [1], "Array should not change.")
    }
    
    private func testThatArrayWithEqualElementsDoesNotChange() {
        var array = [2, 2, 2, 2]
        
        sortProvider?(&array)
        
        XCTAssertEqual(array, [2, 2, 2, 2], "Array should not change.")
    }
}

// swiftlint:enable private_unit_test

//
//  ArrayInsertionSortTests.swift
//  AlgorithmsAndDataStructuresTests
//
//  Created by Евгений on 8/14/19.
//  Copyright © 2019 Евгений. All rights reserved.
//

import XCTest
@testable import AlgorithmsAndDataStructures

class ArrayInsertionSortTests: SortingArrayTests {

    func testInsertionSort() {
        runSortingTests { $0.insertionSort() }
    }
}

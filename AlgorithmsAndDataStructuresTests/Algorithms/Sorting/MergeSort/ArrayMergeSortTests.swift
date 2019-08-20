//
//  ArrayMergeSortTests.swift
//  AlgorithmsAndDataStructuresTests
//
//  Created by Евгений on 8/20/19.
//  Copyright © 2019 Евгений. All rights reserved.
//

import XCTest
@testable import AlgorithmsAndDataStructures

class ArrayMergeSortTests: SortingArrayTests {

    func testMergeSort() {
        runSortingTests { $0.mergeSort() }
    }
}

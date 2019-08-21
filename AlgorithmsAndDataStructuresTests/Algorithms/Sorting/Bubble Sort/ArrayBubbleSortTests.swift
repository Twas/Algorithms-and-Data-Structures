//
//  ArrayBubbleSortTests.swift
//  AlgorithmsAndDataStructuresTests
//
//  Created by Евгений on 8/21/19.
//  Copyright © 2019 Евгений. All rights reserved.
//

import XCTest
@testable import AlgorithmsAndDataStructures

class ArrayBubbleSortTests: SortingArrayTests {

    func testBubbleSort() {
        runSortingTests { $0.bubbleSort() }
    }
}

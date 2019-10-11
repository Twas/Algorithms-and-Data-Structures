//
//  ArrayHeapsortTests.swift
//  AlgorithmsAndDataStructuresTests
//
//  Created by Евгений on 11.10.2019.
//  Copyright © 2019 Евгений. All rights reserved.
//

import XCTest
@testable import AlgorithmsAndDataStructures

class ArrayHeapsortTests: SortingArrayTests {

    func testHeapsort() {
        runSortingTests { $0.heapSort() }
    }
}

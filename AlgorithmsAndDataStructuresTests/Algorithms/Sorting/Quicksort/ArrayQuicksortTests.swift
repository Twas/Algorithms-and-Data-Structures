//
//  ArrayQuicksortTests.swift
//  AlgorithmsAndDataStructuresTests
//
//  Created by Евгений on 11.10.2019.
//  Copyright © 2019 Евгений. All rights reserved.
//

import XCTest
@testable import AlgorithmsAndDataStructures

class ArrayQuicksortTests: SortingArrayTests {

    func testQuicksort() {
        runSortingTests { $0.quicksort() }
    }
}

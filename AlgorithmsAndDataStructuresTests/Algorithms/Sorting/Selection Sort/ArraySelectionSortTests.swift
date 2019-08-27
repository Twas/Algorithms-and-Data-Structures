//
//  ArraySelectionSortTests.swift
//  AlgorithmsAndDataStructuresTests
//
//  Created by Евгений on 8/27/19.
//  Copyright © 2019 Евгений. All rights reserved.
//

import XCTest
@testable import AlgorithmsAndDataStructures

class ArraySelectionSortTests: SortingArrayTests {

    func testSelectionSort() {
        runSortingTests { $0.selectionSort() }
    }
}

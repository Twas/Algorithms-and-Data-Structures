//
//  StackTests.swift
//  AlgorithmsAndDataStructuresTests
//
//  Created by Евгений on 08.10.2019.
//  Copyright © 2019 Евгений. All rights reserved.
//

import XCTest
@testable import AlgorithmsAndDataStructures

class StackTests: XCTestCase {

    func testThatPopReturnsElementsInReverseOrder() {
        var stack = Stack<Int>()
        stack.push(1)
        stack.push(2)
        stack.push(3)
        
        XCTAssertEqual(stack.pop(), 3, "Incorrect order of elements.")
        XCTAssertEqual(stack.pop(), 2, "Incorrect order of elements.")
        XCTAssertEqual(stack.pop(), 1, "Incorrect order of elements.")
    }

    func testThatPopReturnsNilForEmptyStack() {
        var stack = Stack<String>()
        
        XCTAssertNil(stack.pop(), "Empty stack should return nil.")
    }
}

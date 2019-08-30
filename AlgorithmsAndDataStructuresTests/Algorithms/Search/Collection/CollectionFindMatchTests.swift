//
//  CollectionFindMatchTests.swift
//  AlgorithmsAndDataStructuresTests
//
//  Created by Евгений on 8/29/19.
//  Copyright © 2019 Евгений. All rights reserved.
//

import XCTest
@testable import AlgorithmsAndDataStructures

class CollectionFindMatchTests: XCTestCase {
    
    func testFindingMatchForDifferentTypesOfCollections() {
        // int
        let intCollection = [1, 2, 3, 4, 5]
        
        let intMatchIndex = intCollection.findMatch([2, 3])
        
        XCTAssertNotNil(intMatchIndex, "Index should be found for non-empty match.")
        XCTAssertEqual(intMatchIndex!, 1, "Match is at index 1.")
        
        // string
        let stringCollection = "abcdefg"
        
        let stringMatchIndex = stringCollection.findMatch("abc")
        
        XCTAssertNotNil(stringMatchIndex, "Index should be found for non-empty match.")
        XCTAssertEqual(stringMatchIndex!, stringCollection.startIndex, "Match is at start index.")
    }

    func testThatIndexIsNilForEmptyMatch() {
        let collection = [1, 2, 3, 4, 5]
        
        let matchIndex = collection.findMatch([])
        
        XCTAssertNil(matchIndex, "Index should be nil for empty match.")
    }

    func testFindingSingleValue() {
        let collection = [1, 2, 3, 4, 5]
        
        let matchIndex = collection.findMatch([3])
        
        XCTAssertNotNil(matchIndex, "Index should be found for single value match.")
        XCTAssertEqual(matchIndex!, 2, "Sinble value match is at index 2.")
    }
    
    func testFindingPrefix() {
        let collection = [1, 2, 3, 4, 5]
        
        let matchIndex = collection.findMatch([1, 2, 3])
        
        XCTAssertNotNil(matchIndex, "Index should be found for prefix.")
        XCTAssertEqual(matchIndex!, 0, "Match for prefix is at index 0.")
    }
    
    func testFindingSuffix() {
        let collection = [1, 2, 3, 4, 5]
        
        let matchIndex = collection.findMatch([4, 5])
        
        XCTAssertNotNil(matchIndex, "Index should be found for suffix.")
        XCTAssertEqual(matchIndex!, 3, "Match for suffix is at index 2.")
    }
    
    func testFindingSameCollection() {
        let collection = [1, 2, 3, 4, 5]
        
        let matchIndex = collection.findMatch(collection)
        
        XCTAssertNotNil(matchIndex, "Index should be found for same collection.")
        XCTAssertEqual(matchIndex!, 0, "Match for same collection is at index 0.")
    }
    
    func testFindingLongerMatch() {
        let collection = [1, 2, 3, 4, 5]
        
        let matchIndex = collection.findMatch([1, 2, 3, 4, 5, 6, 7, 8])
        
        XCTAssertNil(matchIndex, "Index should not be found when match is longer than collection.")
    }
}

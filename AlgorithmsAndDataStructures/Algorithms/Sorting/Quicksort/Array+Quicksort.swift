//
//  Array+Quicksort.swift
//  AlgorithmsAndDataStructures
//
//  Created by Евгений on 11.10.2019.
//  Copyright © 2019 Евгений. All rights reserved.
//

import Foundation

extension Array where Element: Comparable {
    
    /// Sorts the collection.
    ///
    /// You can sort any mutable collection of elements that conform to the
    /// `Comparable` protocol by calling this method. Elements are sorted in
    /// ascending order.
    ///
    /// Here's an example of sorting a list of integers.
    ///
    ///     var numbers = [2, -5, 1, 7, 3, 19]
    ///     numbers.quicksort()
    ///     print(numbers)
    ///     // Prints "[-5 , 1, 2, 3, 7, 19]"
    ///
    /// - Complexity: O(*n* * log*n*), where *n* is the length of the collection.
    mutating func quicksort() {
        guard let first = first else { return }
        
        var smallerOrEqual = dropFirst().filter { $0 <= first }
        var larger = dropFirst().filter { $0 > first }
        
        smallerOrEqual.quicksort()
        larger.quicksort()
        self = [smallerOrEqual, [first], larger].flatMap { $0 }
    }
}

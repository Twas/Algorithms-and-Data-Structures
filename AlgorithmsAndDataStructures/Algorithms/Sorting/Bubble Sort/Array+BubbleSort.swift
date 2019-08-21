//
//  Array+BubbleSort.swift
//  AlgorithmsAndDataStructures
//
//  Created by Евгений on 8/21/19.
//  Copyright © 2019 Евгений. All rights reserved.
//

import Foundation

extension Array where Element: Comparable {
    
    /// Sorts the collection in place.
    ///
    /// You can sort any mutable collection of elements that conform to the
    /// `Comparable` protocol by calling this method. Elements are sorted in
    /// ascending order.
    ///
    /// Here's an example of sorting a list of integers.
    ///
    ///     var numbers = [2, -5, 1, 7, 3, 19]
    ///     numbers.bubbleSort()
    ///     print(numbers)
    ///     // Prints "[-5 , 1, 2, 3, 7, 19]"
    ///
    /// The sorting algorithm is not guaranteed to be stable. A stable sort
    /// preserves the relative order of elements that compare equal.
    ///
    /// - Complexity: O(*n* * *n*), where *n* is the length of the collection.
    mutating func bubbleSort() {
        for i in 0..<count { // swiftlint:disable:this identifier_name
            // swiftlint:disable:next identifier_name
            for j in stride(from: count - 1, to: i, by: -1) where self[j] < self[j-1] {
                swapAt(j, j-1)
            }
        }
    }
}

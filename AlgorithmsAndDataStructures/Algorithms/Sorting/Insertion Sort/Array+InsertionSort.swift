//
//  Array+InsertionSort.swift
//  AlgorithmsAndDataStructures
//
//  Created by Евгений on 8/14/19.
//  Copyright © 2019 Евгений. All rights reserved.
//

import Foundation

extension Array where Element: Comparable {
        
    /// Sorts the array in place.
    ///
    /// You can sort any mutable collection of elements that conform to the
    /// `Comparable` protocol by calling this method. Elements are sorted in
    /// ascending order.
    ///
    /// Here's an example of sorting a list of integers.
    ///
    ///     var numbers = [2, -5, 1, 7, 3, 19]
    ///     numbers.insertionSort()
    ///     print(numbers)
    ///     // Prints "[-5 , 1, 2, 3, 7, 19]"
    ///
    /// The sorting algorithm is not guaranteed to be stable. A stable sort
    /// preserves the relative order of elements that compare equal.
    ///
    /// - Complexity: O(*n* * *n*), where *n* is the length of the array.
    mutating func insertionSort() {
        guard count > 1 else { return }
                
        for index in 1..<count {
            let currentElement = self[index]
            var previousIndex = index - 1
            while previousIndex >= 0 && self[previousIndex] > currentElement {
                self[previousIndex+1] = self[previousIndex]
                previousIndex -= 1
            }
            
            self[previousIndex+1] = currentElement
        }
    }
}

//
//  Array+SelectionSort.swift
//  AlgorithmsAndDataStructures
//
//  Created by Евгений on 8/27/19.
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
    ///     numbers.selectionSort()
    ///     print(numbers)
    ///     // Prints "[-5 , 1, 2, 3, 7, 19]"
    ///
    /// - Complexity: O(*n* * *n*), where *n* is the length of the collection.
    mutating func selectionSort() {
        guard count > 1 else { return }
        
        for i in 0..<count { // swiftlint:disable:this identifier_name
            var min = i
            for j in i+1..<count where self[j] < self[min] { // swiftlint:disable:this identifier_name
                min = j
            }
            swapAt(i, min)
        }
    }
}

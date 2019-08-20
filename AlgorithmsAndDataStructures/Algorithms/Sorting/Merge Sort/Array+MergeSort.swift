//
//  Array+MergeSort.swift
//  AlgorithmsAndDataStructures
//
//  Created by Евгений on 8/20/19.
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
    ///     numbers.mergeSort()
    ///     print(numbers)
    ///     // Prints "[-5 , 1, 2, 3, 7, 19]"
    ///
    /// The sorting algorithm is not guaranteed to be stable. A stable sort
    /// preserves the relative order of elements that compare equal.
    ///
    /// - Complexity: O(*n* log *n*), where *n* is the length of the collection.
    mutating func mergeSort() {
        let low = startIndex
        let high = endIndex - 1
        guard low < high else { return }
        
        let mid = (low + high) / 2
        var leftSlice = Array(self[low...mid])
        leftSlice.mergeSort()
        var rightSlice = Array(self[mid+1...high])
        rightSlice.mergeSort()
        
        self = merge(left: leftSlice, right: rightSlice)
    }
    
    private func merge(left: [Element], right: [Element]) -> [Element] {
        var leftCounter = 0
        var rightCounter = 0
        var sortedResult: [Element] = []
        // count is constant time, because Array extends RandomAccessCollection protocol
        while leftCounter < left.count || rightCounter < right.count {
            // if all elements from one of the arrays have already beed added to sortedResult,
            // add all remaining elements from the other array
            if leftCounter >= left.count {
                sortedResult.append(contentsOf: right[rightCounter...])
                break
            }
            if rightCounter >= right.count {
                sortedResult.append(contentsOf: left[leftCounter...])
                break
            }
            
            // add the smallest element to sortedResult and continue
            if left[leftCounter] <= right[rightCounter] {
                sortedResult.append(left[leftCounter])
                leftCounter += 1
            } else {
                sortedResult.append(right[rightCounter])
                rightCounter += 1
            }
        }
        
        return sortedResult
    }
}

//
//  Collection+BinarySearch.swift
//  AlgorithmsAndDataStructures
//
//  Created by Евгений on 16.10.2019.
//  Copyright © 2019 Евгений. All rights reserved.
//

import Foundation

extension Collection where Element: Comparable {
    
    /// Searches for `element` in pre-sorted collection
    /// - Parameter element:
    /// - Returns: index of the element or nil, if element is not present in the collection.
    /// - Complexity: O(log*n*) where *n* is the number of elements in the collection.
    func binarySearch(for element: Element) -> Index? {
        guard !isEmpty else { return nil }
        
        if count == 1 {
            return self[startIndex] == element ? startIndex : nil
        }
        
        let middlePoint = distance(from: startIndex, to: endIndex) / 2
        let middleIndex = index(startIndex, offsetBy: middlePoint)
        
        if self[middleIndex] == element {
            return middleIndex
        } else if element < self[middleIndex] {
            return self[startIndex..<middleIndex].binarySearch(for: element)
        } else {
            return self[middleIndex..<endIndex].binarySearch(for: element)
        }
    }
}

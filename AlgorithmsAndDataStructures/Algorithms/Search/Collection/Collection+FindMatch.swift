//
//  Collection+FindMatch.swift
//  AlgorithmsAndDataStructures
//
//  Created by Евгений on 8/29/19.
//  Copyright © 2019 Евгений. All rights reserved.
//

import Foundation

extension Collection where Element: Comparable {
    
    /// Finds out if collection contains subsequence
    ///
    /// - Parameter subsequence: The match that needs to be found in the collection.
    /// - Returns: Index of the first element of the matching subsequence. `nil`, if match has not been found.
    /// - Complexity: O(*n* * *m*) where *n* is the length of the collection and *m* is the length of the subsequence.
    func findMatch(_ subsequence: Self) -> Index? {
        guard !isEmpty, !subsequence.isEmpty else { return nil }
        
        let searchLimit = index(endIndex, offsetBy: -subsequence.count)
        var currentIndex = startIndex
        while currentIndex <= searchLimit {
            var matchCounter = 0
            while matchCounter < subsequence.count {
                let collectionElementIndex = index(currentIndex, offsetBy: matchCounter)
                let subsequenceElementIndex = index(subsequence.startIndex, offsetBy: matchCounter)
                if self[collectionElementIndex] != subsequence[subsequenceElementIndex] {
                    break
                }
                matchCounter += 1
            }
            
            if matchCounter == subsequence.count {
                return currentIndex
            }
            
            currentIndex = index(after: currentIndex)
        }
        
        return nil
    }
}

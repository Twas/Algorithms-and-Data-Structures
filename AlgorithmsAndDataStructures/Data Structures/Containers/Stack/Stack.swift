//
//  Stack.swift
//  AlgorithmsAndDataStructures
//
//  Created by Евгений on 08.10.2019.
//  Copyright © 2019 Евгений. All rights reserved.
//

import Foundation

/// Generic container type supporting LIFO (last-in-first-out) order
///
/// Stacks are better used when the order of extracting data is not relevant.
struct Stack<Item> {
    
    private var items: [Item] = []
    
    /// Adds `item` to stack
    /// - Parameter item: the item to be added to the stack
    /// - Complexity: O(1) on average
    mutating func push(_ item: Item) {
        items.append(item)
    }
    
    /// Removed and returns the last element
    /// - Returns: the last element or `nil` if the collection is empty.
    /// - Complexity: O(1)
    mutating func pop() -> Item? {
        guard !items.isEmpty else { return nil }
        
        return items.removeLast()
    }
}

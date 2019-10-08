//
//  Queue.swift
//  AlgorithmsAndDataStructures
//
//  Created by Евгений on 08.10.2019.
//  Copyright © 2019 Евгений. All rights reserved.
//

import Foundation

/// Generic container type supporting FIFO (first-in-first-out) order
///
/// Queues are better used when the order of extracting data is important.
struct Queue<Item> {
    
    private var items: [Item] = []
    
    /// Adds `item` to the end of the queue
    /// - Parameter item: the item to be added to the queue
    /// - Complexity: O(1) on average
    mutating func enqueue(_ item: Item) {
        items.append(item)
    }
    
    /// Removed and returns the first element.
    /// - Returns: the first element or `nil` if the collection is empty.
    /// - Complexity: O(*n*) where *n* is the number of elements in the queue.
    mutating func dequeue() -> Item? {
        guard !items.isEmpty else { return nil }
        
        return items.removeFirst()
    }
}

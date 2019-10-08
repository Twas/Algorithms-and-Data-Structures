//
//  LinkedList.swift
//  AlgorithmsAndDataStructures
//
//  Created by Евгений on 9/2/19.
//  Copyright © 2019 Евгений. All rights reserved.
//

import Foundation

/// Linked data structure consisting of nodes. Each node holds value and reference to the next node.
struct LinkedList<Value> {
    
    var first: Node?
    var last: Node?
}

// MARK: - Node

extension LinkedList {
    
    /// Element of `LinkedList`. Each node holds value and reference to the next node.
    class Node {
        
        var value: Value
        var next: Node?
        
        init(value: Value, next: Node? = nil) {
            self.value = value
            self.next = next
        }
    }
}

// MARK: - Search

extension LinkedList where Value: Comparable {
    
    /// Searches for the first node that holds `value`
    ///
    /// Generic type `Value` should conform to `Comparable` protocol.
    /// - Parameter value: value of the node
    /// - Complexity: O(*n*) where *n* is the number of nodes in the list.
    func findFirstNode(with value: Value) -> Node? {
        var currentNode = first
        while let node = currentNode {
            if node.value == value {
                return node
            } else {
                currentNode = node.next
            }
        }
        
        return nil
    }
}

// MARK: - Add

extension LinkedList {
    
    /// Appends new node holding `value` to the end of the list.
    /// - Parameter value: value that newly created node should hold
    /// - Complexity: O(1)
    mutating func append(_ value: Value) {
        let newNode = Node(value: value)
        
        guard first != nil, last != nil else {
            first = newNode
            last = newNode
            return
        }
        
        last?.next = newNode
        last = newNode
    }
}

// MARK: - Delete

extension LinkedList {
    
    /// Deletes `node` from the list
    /// - Parameter node: the node to be deleted
    /// - Complexity: O(*n*) where *n* is the number of nodes in the list
    mutating func delete(_ node: Node) {
        guard first != nil, last != nil else { return }
        
        guard node !== first else {
            if first === last {
                first = nil
                last = nil
            } else {
                first = node.next
            }
            return
        }
        
        var previousNode = first
        while previousNode?.next !== node {
            previousNode = previousNode?.next
        }
        
        previousNode?.next = node.next
        if node === last {
            last = previousNode
        }
    }
}

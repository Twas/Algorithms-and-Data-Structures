//
//  LinkedList.swift
//  AlgorithmsAndDataStructures
//
//  Created by Евгений on 9/2/19.
//  Copyright © 2019 Евгений. All rights reserved.
//

import Foundation

struct LinkedList<Value> {
    
    var first: Node?
    var last: Node?
}

// MARK: - Node

extension LinkedList {
    
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
    
    // TODO - insert(_ value:,at index:)
}

// MARK: - Delete

extension LinkedList {
    
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
        
        guard previousNode != nil else { return }
        
        previousNode?.next = node.next
        if node === last {
            last = previousNode
        }
    }
    
    // TODO - add convenience methods deleteFirst(), deleteLast()
}

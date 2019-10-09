//
//  BinarySearchTree.swift
//  AlgorithmsAndDataStructures
//
//  Created by Евгений on 08.10.2019.
//  Copyright © 2019 Евгений. All rights reserved.
//

import Foundation

/// Recursive data structure each element of which can be either empty or contain references to 2 children (also trees): left and right, and parent.
/// If node's `parent` is `nil`, then this element is the root of the tree.
///
/// Every node of the binary search tree contains `value`.
/// For any node, values of all nodes in its left subtree are less than its `value`, while values in its right subree are higher than its `value`.
struct BinarySearchTree<Value: Comparable> {

    var root: Node?
    
    init(_ value: Value) {
        self.root = Node(value: value)
    }
}

// MARK: - Node

extension BinarySearchTree {
    
    /// Element of the binary search tree.
    class Node {
        var value: Value
        
        var parent: Node?
        var left: Node?
        var right: Node?
        
        init(value: Value, parent: Node? = nil, left: Node? = nil, right: Node? = nil) {
            self.value = value
            self.parent = parent
            self.left = left
            self.right = right
        }
        
        // MARK: - Fileprivate
        
        fileprivate func search(for value: Value) -> Node? {
            if value == self.value {
                return self
            } else if value < self.value {
                return left?.search(for: value)
            } else {
                return right?.search(for: value)
            }
        }
        
        fileprivate func traverse() -> [Value] {
            let leftValues = left?.traverse() ?? []
            let rightValues = right?.traverse() ?? []
            
            return [leftValues, [value], rightValues].flatMap { $0 }
        }
        
        fileprivate func insert(_ value: Value) {
            guard value != self.value else { return }
            
            // define wether new node should be placed to the left or right
            var leaf = value < self.value ? left : right
            // if node exists, continue search
            // otherwise, add new node
            if let leaf = leaf {
                leaf.insert(value)
            } else {
                leaf = Node(value: value, parent: self, left: nil, right: nil)
            }
        }
        
        fileprivate func delete(_ value: Value) -> Node? {
            // deletes the node with `value` and returns new root
            
            guard value != self.value else { return delete() }
            
            if value < self.value {
                // the node to be deleted lies in the left subtree
                left = left?.delete(value)
            } else if value > self.value {
                // the node to be deleted lies in the right subree
                right = right?.delete(value)
            }
            
            return self
        }
        
        private func delete() -> Node? {
            // deletes itself from the tree sctructure and returns the new root
            
            guard left != nil else {
                // this is the node with only one child (right) or no children
                let temp = right
                right = nil
                return temp
            }
            
            guard let right = right else {
                // this is the node with only one child (left)
                let temp = left
                left = nil
                return temp
            }
            
            // this is the node with 2 children
            
            // get the inorder successor (smallest in the right subtree)
            var successor = right
            while let leftNode = successor.left {
                successor = leftNode
            }
            
            // copy the inorder successor to this node
            self.value = successor.value
            
            // delete the inorder successor
            self.right = delete(successor.value)
            
            return self
        }
    }
}

// MARK: - Search

extension BinarySearchTree {
    
    /// Searches for a node with the `value` in the binary search tree.
    /// - Parameter value: value to search
    /// - Returns: node containing `value` or nil if it does not exist.
    /// - Complexity: O(*h*) where *h* is the height of the tree.
    func search(for value: Value) -> Node? {
        return root?.search(for: value)
    }
    
    /// Finds minimum value in the tree. This is the value of the leftmost node.
    /// - Returns: the node with the smallest value or nil for empty binary search tree
    /// - Complexity: O(*h*) where *h* is the height of the tree.
    func min() -> Node? {
        var min = root
        while let leftNode = min?.left {
            min = leftNode
        }
        
        return min
    }
    
    /// Finds maximum value in the tree. This is the value of the rightmost node.
    /// - Returns: the node with the largest value or nil for empty binary search tree
    /// - Complexity: O(*h*) where *h* is the height of the tree.
    func max() -> Node? {
        var max = root
        while let rightNode = max?.right {
            max = rightNode
        }
        
        return max
    }
}

// MARK: - Traversal

extension BinarySearchTree {
    
    /// Visits all nodes of the tree in-order.
    /// - Returns: sorted array of all values
    /// - Complexity: O(*n*) where *n* is the number of nodes in the tree
    func traverse() -> [Value] {
        return root?.traverse() ?? []
    }
}

// MARK: - Modification

extension BinarySearchTree {
    
    /// Searches for a place to insert the new node and inserts it
    ///
    /// Algorithms first searches for a missing node where the value would be. Then it inserts new node to that place.
    /// If the node with `value` is already present in the binary search tree, method returns.
    /// - Parameter value: the value of the new node
    /// - Complexity: O(*h*) where *h* is the height of the binary search tree
    mutating func insert(_ value: Value) {
        root?.insert(value)
    }
    
    /// Removes the node containing `value` and reorganizes the tree to preserve sorted order.
    /// - Parameter value: value of the node to be deleted
    /// - Complexity: O(*h*) where *h* is the height of the binary search tree
    mutating func delete(_ value: Value) {
        root = root?.delete(value)
    }
}

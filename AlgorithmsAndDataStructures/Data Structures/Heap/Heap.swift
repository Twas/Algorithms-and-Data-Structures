//
//  Heap.swift
//  AlgorithmsAndDataStructures
//
//  Created by Евгений on 10.10.2019.
//  Copyright © 2019 Евгений. All rights reserved.
//

import Foundation

/// Data structure based on "partially sorted" principle.
/// Heap can be represented with a binary tree where each node dominates its children.
/// In min-heap dominating node has smaller value than its children.
/// In max-heap dominating node has larger value than its childre.
///
/// Below is the implementation of the heap with the help of array where the root node of the tree is stored as the first element of the array,
/// and its left and right children are stored as the second and third elements, etc.
///
/// To find the element and its children, follow the below rules:
/// - children of element at index `k`: left child is at index `2k + 1`, right child is at index `(2k+1) + 1`
/// - parent of element at index `n` is at index `n/2`.
///
/// Element indeces are incremented (+1) to compensate for the fact that countring starts from 0.
struct Heap<Element> {
    
    private(set) var elements: [Element] = []
    private let priorityFunction: (Element, Element) -> Bool
    
    /// A `Boolean` value indicating if the heap is empty
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    /// The number of elements in the heap
    var count: Int {
        return elements.count
    }
    
    /// Builds a heap.
    ///
    /// The heap will be either min-heap or max-heap depending on the provided priority function.
    /// - Parameter elements: Elements to be stored in the heap
    /// - Parameter priorityFunction: Given two elements this function decides which of them has the higher priority.
    /// - Complexity: O(*n* * log*n*) where *n* is the number of elements.
    init(elements: [Element] = [], priorityFunction: @escaping (Element, Element) -> Bool) {
        self.priorityFunction = priorityFunction
        elements.forEach { enqueue($0) }
    }
    
    // MARK: - Public
    
    /// The first element of the heap
    /// - Returns: the first element or nil, if the heap is empty
    /// - Complexity: O(1)
    func peek() -> Element? {
        return elements.first
    }
    
    // MARK: - Private
    
    private func isRoot(_ index: Int) -> Bool {
        return index == 0
    }
    
    private func leftChild(ofElementAt index: Int) -> Int {
        return 2 * index + 1
    }
    
    private func rightChild(ofElementAt index: Int) -> Int {
        return 2 * index + 2
    }
    
    private func parent(ofElementAt index: Int) -> Int {
        return (index - 1) / 2
    }
    
    private func isHigherPriority(at firstIndex: Int, than secondIndex: Int) -> Bool {
        return priorityFunction(elements[firstIndex], elements[secondIndex])
    }
    
    private func highestPriorityIndex(of parentIndex: Int, and childIndex: Int) -> Int {
        guard childIndex < count && isHigherPriority(at: childIndex, than: parentIndex) else { return parentIndex }
        return childIndex
    }
    
    private func highestPriorityIndex(for parent: Int) -> Int {
        let leftChildIndex = leftChild(ofElementAt: parent)
        let rightChildIndex = rightChild(ofElementAt: parent)
        return highestPriorityIndex(of: highestPriorityIndex(of: parent, and: leftChildIndex),
                                    and: rightChildIndex)
    }
    
    private mutating func swap(at firstIndex: Int, with secondIndex: Int) {
        guard firstIndex != secondIndex else { return }
        elements.swapAt(firstIndex, secondIndex)
    }
    
    private mutating func siftUp(elementAt index: Int) {
        let parentIndex = parent(ofElementAt: index)
        guard !isRoot(index),
            isHigherPriority(at: index, than: parentIndex) else {
                return
        }
        
        swap(at: index, with: parentIndex)
        siftUp(elementAt: parentIndex)
    }
    
    private mutating func siftDown(elementAt index: Int) {
        let childIndex = highestPriorityIndex(for: index)
        guard index != childIndex else { return }
        
        swap(at: index, with: childIndex)
        siftDown(elementAt: childIndex)
    }
}

// MARK: - Modification

extension Heap {
    
    /// Inserts new element to the end of the heap, then reorganizes the heap to establish dominating relations.
    /// - Parameter element: new element to be inserted.
    /// - Complexity: O(log*n*) where *n* is the number of elements in the heap.
    mutating func enqueue(_ element: Element) {
        elements.append(element)
        siftUp(elementAt: count - 1)
    }
    
    /// Deletes and returns the top priority element from the heap, then reorganizes the heap to establich dominating relations.
    /// - Returns: top priority element or nil, if the heap is empty
    /// - Complexity: O(log*n*) where *n* is the number of elements in the heap.
    mutating func dequeue() -> Element? {
        guard !isEmpty else { return nil }
        
        swap(at: 0, with: count - 1)
        let element = elements.removeLast()
        if !isEmpty {
            siftDown(elementAt: 0)
        }
        
        return element
    }
}

//
//  MutableCollection+Extensions.swift
//  Swift Utilities
//
//  Created by Tre`Von McKay on 10/24/16.
//

import Foundation

extension MutableCollection where Index == Int {
    mutating func shuffleInPlace() {
        if count < 2 { return }
        
        for index in startIndex..<endIndex-1 {
            let randomIndex:Int = Int(arc4random_uniform(UInt32(count.toIntMax() - index))) + index
            guard index != randomIndex else { continue }
            swap (&self[index], &self[randomIndex])
        }
    }
}

extension Collection {
    /// Return a copy of `self` with its elements shuffled.
    func shuffle() -> [Iterator.Element] {
        var list = Array(self)
        list.shuffleInPlace()
        return list
    }
}

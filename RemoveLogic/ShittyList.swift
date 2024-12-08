//
//  RemoveFromList.swift
//  RemoveLogic
//
//  Created by Nicky Taylor on 12/8/24.
//

import Foundation

class ShittyList {
    
    
    var list = [Int]()
    var count = 0
    
    func add(_ number: Int) {
        while list.count <= count {
            list.append(number)
        }
        list[count] = number
        count += 1
    }
    
    func remove(_ number: Int) {
        
        var numberRemoved = 0
        var removeIndex = 0
        var removeLoopIndex = 0
        while removeLoopIndex < count {
            if list[removeLoopIndex] == number {
                break
            } else {
                removeLoopIndex += 1
            }
        }
        while removeLoopIndex < count {
            if list[removeLoopIndex] == number {
                numberRemoved += 1
            } else {
                list[removeLoopIndex - numberRemoved] = list[removeLoopIndex]
            }
            removeLoopIndex += 1
        }
        count -= numberRemoved
    }
    
    
    
    
}

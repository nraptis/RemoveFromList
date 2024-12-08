//
//  RemoveLogicTests.swift
//  RemoveLogicTests
//
//  Created by Nicky Taylor on 12/8/24.
//

import Testing
@testable import RemoveLogic

struct RemoveLogicTests {
    
    func compare(list: ShittyList, array: [Int]) -> Bool {
        
        if list.count != array.count {
            print("list.count: \(list.count) array.count: \(array.count)")
            return false
        }
        
        for index in 0..<list.count {
            let numberA = list.list[index]
            let numberB = array[index]
            if numberA != numberB {
                print("list[\(index)] = \(numberA)")
                print("array[\(index)] = \(numberB)")
                return false
            }
        }
        
        return true
    }

    @Test func testAddOne() async throws {
        let list = ShittyList()
        var array = [Int]()
        list.add(0)
        array.append(0)
        if compare(list: list, array: array) == false {
            #expect(Bool(false))
            return
        }
    }
    
    @Test func testAddThree() {
        let list = ShittyList()
        var array = [Int]()
        list.add(0)
        list.add(1)
        list.add(0)
        
        array.append(0)
        array.append(1)
        array.append(0)
        
        if compare(list: list, array: array) == false {
            #expect(Bool(false))
            return
        }
    }
    
    @Test func testAddThreeRemoveOne_A() {
        let list = ShittyList()
        var array = [Int]()
        list.add(0)
        list.add(1)
        list.add(0)
        
        array.append(0)
        array.append(1)
        array.append(0)
        
        if compare(list: list, array: array) == false {
            #expect(Bool(false))
            return
        }
        
        list.remove(0)
        array.removeAll { $0 == 0 }
        
        if compare(list: list, array: array) == false {
            #expect(Bool(false))
            return
        }
    }
    
    @Test func testManySmallLists() {
        
        for trialNumber in 0..<180_000 {
            
            let numberToAdd = Int.random(in: 0..<10)
            let numberToRemove = Int.random(in: 0..<10)
            
            let list = ShittyList()
            var array = [Int]()
            
            for _ in 0..<numberToAdd {
                let number = Int.random(in: 0...5)
                list.add(number)
                array.append(number)
            }
            
            if compare(list: list, array: array) == false {
                #expect(Bool(false))
                return
            }
            
            for _ in 0..<numberToRemove {
                let number = Int.random(in: 0...5)
                list.remove(number)
                array.removeAll { $0 == number }
                
                if compare(list: list, array: array) == false {
                    #expect(Bool(false))
                    return
                }
            }
        }
    }
    
    @Test func testManyMoreLists() {
        
        for trialNumber in 0..<100_000 {
            
            let numberToAddA = Int.random(in: 0..<10)
            let numberToRemoveA = Int.random(in: 0..<5)
            
            let numberToAddB = Int.random(in: 0..<10)
            let numberToRemoveB = Int.random(in: 0..<5)
            
            let numberToAddC = Int.random(in: 0..<10)
            let numberToRemoveC = Int.random(in: 0..<5)
            
            let list = ShittyList()
            var array = [Int]()
            
            for _ in 0..<numberToAddA {
                let number = Int.random(in: 0...25)
                list.add(number)
                array.append(number)
            }
            
            if compare(list: list, array: array) == false {
                #expect(Bool(false))
                return
            }
            
            for _ in 0..<numberToRemoveA {
                let number = Int.random(in: 0...25)
                list.remove(number)
                array.removeAll { $0 == number }
                
                if compare(list: list, array: array) == false {
                    #expect(Bool(false))
                    return
                }
            }
            
            for _ in 0..<numberToAddB {
                let number = Int.random(in: 0...50)
                list.add(number)
                array.append(number)
            }
            
            if compare(list: list, array: array) == false {
                #expect(Bool(false))
                return
            }
            
            for _ in 0..<numberToRemoveB {
                let number = Int.random(in: 0...50)
                list.remove(number)
                array.removeAll { $0 == number }
                
                if compare(list: list, array: array) == false {
                    #expect(Bool(false))
                    return
                }
            }
            
            for _ in 0..<numberToAddC {
                let number = Int.random(in: 0...10)
                list.add(number)
                array.append(number)
            }
            
            if compare(list: list, array: array) == false {
                #expect(Bool(false))
                return
            }
            
            for _ in 0..<numberToRemoveC {
                let number = Int.random(in: 0...10)
                list.remove(number)
                array.removeAll { $0 == number }
                
                if compare(list: list, array: array) == false {
                    #expect(Bool(false))
                    return
                }
            }
            
        }
    }
}

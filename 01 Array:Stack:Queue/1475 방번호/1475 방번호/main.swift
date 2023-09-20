//
//  main.swift
//  1475 방번호
//  https://www.acmicpc.net/problem/1475
//  Created by Jinah Park on 2023/09/20.
//

let numbers = Array(readLine()!).map {Int(String($0))!}

func countNumbers(numbers: [Int]) -> [Int] {
    var counts = Array(repeating: 0, count: 10)
    
    for number in numbers {
        counts[number] += 1
    }
    
    return counts
}

func convertToNine(_ counts: [Int]) -> [Int] {
    var newCounts = Array(repeating: 0, count: 10)
    
    for index in 0..<counts.count {
        if index == 6 {
            newCounts[9] += counts[6]
        } else {
            newCounts[index] += counts[index]
        }
    }
    
    return newCounts
}

func findMax(counts: [Int]) -> [Int: Int] {
    var maximum = -1
    var maximumDictionary = [Int: Int]()
    
    for index in 0..<counts.count {
        maximum = max(maximum, counts[index])
    }
    
    for index in 0..<counts.count {
        if maximum == counts[index] {
            maximumDictionary[index] = maximum
        }
    }
    
    print(maximumDictionary)
    
    return maximumDictionary
}
 
//111996 넣을 시 [1: 3, 9: 3]가 되어 답이 2가 됨 그래서 틀림
func configureSet(dict: [Int: Int]) -> Int {
    guard dict.keys.contains(9) else {
        return dict.values.first!
    }
    
    return (dict.values.first!+1)/2
}

let counts = countNumbers(numbers: numbers)
let convertedNumbers = convertToNine(counts)
let maximum = findMax(counts: convertedNumbers)
let set = configureSet(dict: maximum)

print(set)

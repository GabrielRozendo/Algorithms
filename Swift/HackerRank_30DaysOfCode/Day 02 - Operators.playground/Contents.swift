// Day 02: Operators
// https://www.hackerrank.com/challenges/30-operators/problem

import UIKit
import XCTest

class MyTest: XCTestCase {
    func test() {
        let result = calc(total: 12, tip: 20, tax: 8)
        XCTAssertEqual(result, 15)
    }
}

// Complete the solve function below.
func solve(meal_cost: Double, tip_percent: Int, tax_percent: Int) {
    let result = calc(total: meal_cost, tip: Double(tip_percent), tax: Double(tax_percent))
    print(result)
}

func calc(total: Double, tip tip_percent: Double, tax tax_percent: Double) -> Int {
    let tip = total * tip_percent / 100
    let tax = total * tax_percent / 100

    let sum = total + tip + tax
    let result = Int(round(sum))
    return result
}

guard let meal_cost = Double((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

guard let tip_percent = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

guard let tax_percent = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

solve(meal_cost: meal_cost, tip_percent: tip_percent, tax_percent: tax_percent)

MyTest.defaultTestSuite.run()

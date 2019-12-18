// Day 01: Data Types
// https://www.hackerrank.com/challenges/30-data-types/problem

import UIKit
import XCTest

class MyTest: XCTestCase {
    func testInteger() {
        let result = sum(4, 12)
        XCTAssertEqual(result, 16, "Int sum")
    }

    func testDouble() {
        let result = sum(4.0, 4.0)
        XCTAssertEqual(result, 8.0, "Double sum")
    }

    func testString() {
        let result = sum("HackerRank", " is the best place to learn and practice coding!")
        XCTAssertEqual(result, "HackerRank is the best place to learn and practice coding!", "String sum")
    }
}

// Complete the divisibleSumPairs function below.
func dataType() {
    let i = 4
    let d = 4.0
    let s = "HackerRank "
    // Declare second integer, double, and String variables.

    // Read and save an integer, double, and String to your variables.
    guard
        let iInput = readLine(), let i2 = Int(iInput),
        let dInput = readLine(), let d2 = Double(dInput),
        let s2 = readLine()
    else { return }

    // Print the sum of both integer variables on a new line.
    print(sum(i, i2))
    // Print the sum of the double variables on a new line.
    print(sum(d, d2))
    // Concatenate and print the String variables on a new line
    // The 's' variable above should be printed first.
    print(sum(s, s2))
}

protocol Addable {
    static func +(lhs: Self, rhs: Self) -> Self
}

extension Int: Addable {}
extension Double: Addable {}
extension String: Addable {}

func sum<T: Addable>(_ item1: T, _ item2: T) -> T {
    return item1 + item2
}

MyTest.defaultTestSuite.run()

dataType()

// Day 03: Intro to Conditional Statements
// https://www.hackerrank.com/challenges/30-conditional-statements/problem

import UIKit
import XCTest

class MyTest: XCTestCase {
    func testIsOdd1() {
        XCTAssertTrue(1.isOdd)
    }

    func testIsOdd3() {
        XCTAssertTrue(3.isOdd)
    }

    func testIsNotOdd2() {
        XCTAssertFalse(2.isOdd)
    }

    func testIsNotOdd4() {
        XCTAssertFalse(4.isOdd)
    }

    func testAreWeird() {
        let result = [1, 3, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20].allSatisfy { $0.isWeird }
        XCTAssertTrue(result)
    }

    func testIsNotWeird() {
        let result = [2, 4, 22, 24, 26, 98].allSatisfy { $0.isNotWeird }
        XCTAssertTrue(result)
    }
}

extension Int {
    var isOdd: Bool {
        return self % 2 == 1
    }

    var isNotWeird: Bool {
//        return !self.isWeird

        return !self.isOdd && (2 ... 5 ~= self || self > 20)
    }

    var isWeird: Bool {
        return self.isOdd || 6 ... 20 ~= self
    }
}

// guard let N = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
// else { fatalError("Bad input") }
let N = 1

if N.isWeird {
    print("Weird")
} else {
    print("Not Weird")
}

MyTest.defaultTestSuite.run()

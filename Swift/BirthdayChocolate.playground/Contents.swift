// https://www.hackerrank.com/challenges/the-birthday-bar/problem

import UIKit
import XCTest

class BirthdayChocolateTests: XCTestCase {
    func testSampleOutput1() {
        let result = BirthdayChocolate().birthday(s: [], d: 1, m: 1)
        XCTAssertEqual(result, 2)
    }
}

class BirthdayChocolate {
    // Complete the birthday function below.
    func birthday(s: [Int], d: Int, m: Int) -> Int {
        return 0
    }
}

BirthdayChocolateTests.defaultTestSuite.run()

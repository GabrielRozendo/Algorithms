// https://www.hackerrank.com/challenges/divisible-sum-pairs/problem
import UIKit
import XCTest

class MyTest: XCTestCase {
  func testShouldPass() {
    let expected = 5
    let result = divisibleSumPairs(n: 6, k: 3, ar: [1, 3, 2, 6, 1, 2])

    XCTAssertEqual(expected, result, "Example test!")
  }
}

// Complete the divisibleSumPairs function below.
func divisibleSumPairs(n: Int, k: Int, ar: [Int]) -> Int {
  var count = 0

  for i in 0 ..< n - 1 {
    let current = ar[i]
    for j in (i + 1) ..< n {
      let next = ar[j]

      let isSmaller = current < next
      let isSumEqual = (i + j) == k
      if isSmaller, isSumEqual {
        count += 1
      }
    }
  }
  return count
}

MyTest.defaultTestSuite.run()

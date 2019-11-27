// https://www.hackerrank.com/challenges/divisible-sum-pairs/problem

import Foundation

let nkTemp = "6 3"
let arTemp = "1 3 2 6 1 2"
main(nkTemp, arTemp)

// Complete the divisibleSumPairs function below.
func divisibleSumPairs(n: Int, k: Int, ar: [Int]) -> Int {
  return -1
}

func main(_ nkTemp: String, _ arTemp: String) {
  let nk = nkTemp.split(separator: " ").map { String($0) }

  guard let n = Int(nk[0].trimmingCharacters(in: .whitespacesAndNewlines))
  else { fatalError("Bad input") }

  guard let k = Int(nk[1].trimmingCharacters(in: .whitespacesAndNewlines))
  else { fatalError("Bad input") }

  let ar: [Int] = arTemp.split(separator: " ").map {
    if let arItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
      return arItem
    } else { fatalError("Bad input") }
  }

  let result = divisibleSumPairs(n: n, k: k, ar: ar)
  print(result)
}

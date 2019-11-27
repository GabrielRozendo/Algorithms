import Foundation

// Complete the formingMagicSquare function below.
func formingMagicSquare(s: [[Int]]) -> Int {
  var sumRows: [Int] = []
  var index = 0

  //rows
  s.map {
    sumMatrix[index] = $0.reduce(0, +)
    index += 1
  }
  
  //columns
  
  
  [ 1 2 3 ]
  [ 1 2 3 ]
  [ 1 2 3 ]
  
  [ 3 6 9 ]
  [ ]
  [ 6 ]

  return -1
}

let input = ["4 9 2", "3 5 7", "8 1 5"]
let s: [[Int]] = input.prefix(3).map {
  let sRow: [Int] = $0.split(separator: " ").map {
    if let sItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
      return sItem
    } else { fatalError("Bad input") }
  }

  guard sRow.count == 3 else { fatalError("Bad input") }

  return sRow
}

guard s.count == 3 else { fatalError("Bad input") }

let result = formingMagicSquare(s: s)
print(result)

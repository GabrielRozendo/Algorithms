import UIKit

let input = [42,5,12,21,5,24,-5]

var result: Int?

for i in input {
    
    guard let temp = result  else { result = i
        continue
    }
    if abs(i) <= abs(temp) {
        
    
    if abs(i) == abs(temp), i<temp {
        continue
    }
        result = i
        
    }
}

print(result ?? 0)

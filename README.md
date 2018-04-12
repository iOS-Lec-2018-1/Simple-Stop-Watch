# 클로져(Closure) 예

//: Playground 
// Simple Closure Test

import UIKit

//func backwards(left: String, right: String) -> Bool {

//    print("(left) (right) 비교중")

//    return left > right

//}

let names: [String] = ["hana", "eric", "yagom", "kim"]

//let reversed: [String] = names.sorted(by: backwards)

let reversed: [String] = names.sorted(by: { (left: String, right: String) -> Bool
    in return left > right
})

print(reversed) // ["yagom", "kim", "hana", "eric"]

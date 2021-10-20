import UIKit

// For-In 循环 遍历一个集合中的所有元素
let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names {
    print("Hello, \(name)!")
}
for index in 1...5 {  // ... 闭区间操作符
    print("\(index) times 5 is \(index * 5) ")
}
let minutes = 60
for tickMark in 0..<minutes { // 半开区间 ..<
    print("\(tickMark)")
}


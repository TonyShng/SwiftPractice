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
let minuteInterval = 5
for tickMark in stride(from: 0, to: minutes, by: minuteInterval) {  // 跳过不需要的标记
    print("\(tickMark)") // 0 5 10 15
}
let hours = 12
let hourInterval = 3
for tickMark in stride(from: 3, through: hours, by: hourInterval) {  // 闭区间使用这个
    print("\(tickMark)") // 3 6 9 12
}

// While 循环 每次在循环开始时计算条件是否合格  repeat-while 每次在循环结束时计算条件是否合格
/*
 while condition{
    statements
 }
 */
// Repeat-While  类比 do-while 先执行一次循环的代码块，然后重复循环
/*
repeat {
    statements
} while condition
 */

// 条件语句  if switch
    // if  只包含一个条件 只有当该条件为 true 时 才会执行相关代码
var temperatureInfahrenheit = 30
if temperatureInfahrenheit <= 32 {
    print("It's very cold. Consider wearng a scarf.")
} else if temperatureInfahrenheit >= 86 {
    print("It's really warm. Don't forget to wear sunscreen.")
}  else {
    print("It's not that cold. Wear a t-shirt.")
}
    // switch 由多个 case 构成，每个由 case 关键字开始。 当匹配的 case 分支中的代码执行完毕后，程序会终止 switch 语句，而不会继续执行下一个 case 分支。 不需要显式地使用 break 语句
/*
 switch some value to consider {
 case value 1:
 default:
     break
 }
 */
let anotherCharacter: Character = "a"
switch anotherCharacter {
case "a", "A": // 复合匹配  如果想要贯穿 case 分支 使用 fallthrough 语句
    print("The letter A")
default:
    print("Not the letter A")
}
let approximateCount = 62
let naturalCount: String
switch approximateCount {
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 5..<12:
    naturalCount = "several"
case 12..<100:
    naturalCount = "dozens of"
case 100..<1000:
    naturalCount = "hunreds of"
default:
    naturalCount = "many"
}
// 元组
let somePoint = (1, 1)
switch somePoint {
case (0, 0):
    print("\(somePoint) is at the origin")
case (_, 0):
    print("\(somePoint) is on the x-axis")
case (0, _):
    print("\(somePoint) is on the y-axis")
case (-2...2, -2...2):
    print("\(somePoint) is inside the box")
default:
    print("\(somePoint) is outside of the box")
}
// 值绑定 case 分支允许将匹配的值声明为临时常量或变量，并在 case 分支体内使用
let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axis with a y value of \(y)")
case let (x, y):
    print("somewhere else at (\(x), \(y))")
}
// Where  case 分支的模式可以使用 where 语句来判断额外的条件  当且仅当 where 语句的条件为 true 时，匹配到的 case 分支才会被执行
let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
    print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
    print("(\(x), \(y)) is just some arbitrary point")
}
// 复合型 Case 即多个条件可以使用同一种方法来处理时，可以将这几种可能放在同一种 case 后面，并且用逗号隔开


// 控制转移语句  continue  break  fallthrough  return  throw
    // continue  立刻停止本次循环，重新开始下次循环
    // break  立刻结束整个控制流的执行。  用来提前结束 switch 或循环语句
    // Fallthrough switch 语句不会从上一个 case 分支跳转到下一个 case 分支中。如果需要贯穿需要在case 分支中使用 fallthrough 关键字
let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"
switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += " a prime number, and also"
    fallthrough
default:
    description += " an integer."
}
print(description)
    // 带标签的语句 声明一个带标签的语句是通过在该语句的关键词的同一行前面放置一个标签，作为这个语句的前导关键字 并且该标签后面跟随一个冒号
let finalSquare = 25
var board = [Int](repeating: 0, count: finalSquare + 1)
board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
var square = 0
var diceRoll = 0
gameLoop: while square != finalSquare {
    diceRoll += 1
    if diceRoll == 7 { diceRoll = 1 }
    switch square + diceRoll {
    case finalSquare:
        // 骰子数刚好使玩家移动到最终的方格里，游戏结束。
        break gameLoop  // 使用标签 可直观看出中断的是 while 循环还是 switch 语句
    case let newSquare where newSquare > finalSquare:
        // 骰子数将会使玩家的移动超出最后的方格，那么这种移动是不合法的，玩家需要重新掷骰子
        continue gameLoop
    default:
        // 合法移动，做正常处理
        square += diceRoll
        square += board[square]
    }
}
print("Game over!")

// 提前退出  像 if 语句一样，guard 的执行取决于一个表达式的布尔值。当要求条件为真时，执行guard 语句后面的代码 不同于 if 语句， 一个 guard 语句总是有一个 else 从句，如果条件不为真则执行 else 从句中的代码
func greet(person: [String: String]) {
    guard let name = person["name"] else {
        return
    }
    print("Hello \(name)!")
    guard let location = person["location"] else {
        print("I hope the weather is nice is nice near you.")
        return
    }
    print("I hope the weather is nice in \(location).")
}

// 检测 API 可用性 if #available(平台名称 版本号, ..., *)  *是必须的
if #available(iOS 10, *) {
} else {
}

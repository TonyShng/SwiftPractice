import UIKit

/* 简单值 */

var str = "Hello, playground"

print(str)

// MARK: let 声明常量 只能赋值一次  var 声明变量
var myVariable = 42
myVariable = 50
let myConstant = 42

// MARK: 编译器会自动推断类型 如果初始值没有提供足够的信息（或没有初始值），就需要在变量后面声明类型，用冒号分割
let implicitInteger = 70
let implicitDouble = 70.0
let explicitDouble: Double = 70

// MARK: 值永远不会被隐式转换为其他类型。需要显性转换 值转换为字符串的方法：把值写到括号中，并且在括号之前写一个反斜杠(\)
let label = "The width is "
let width = 94
let widthLabel = label + String(width)

let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit."

// MARK: 使用三个双引号（"""） 来包含多行字符串内容。每行行首的缩进会被去除，直到和结尾引号的缩进相匹配
let quotation = """
Isaid "I have \(apples) apples."
And then I said "I have \(apples + oranges) pieces of fruit."
"""

// MARK: 使用方括号 [] 来创建数组和字典，并使用下标或者键(key)来访问元素。最后一个元素后面允许有个逗号。
var shoppingList = ["catfish", "water", "tulips", "blue paint"]
shoppingList[1] = "bottle of water"

var occupations = [
    "Malcolm": "Captain",
    "Kaylee": "Mechainc",
]

occupations["Jayne"] = "Public Relations"

shoppingList.append("blue paint")

// MARK: 使用初始化语法来创建一个空数组或者空字典
let emptyArray = [String]()
let emptyDictionary = [String: Float]()

// MARK: 如果类型信息可以被推断出来，你可以用 [] 和 [:] 来创建空数组和 空字典
shoppingList = []
occupations = [:]



/* 控制流 */

// MARK: 使用 if 和 switch 来进行条件操作，使用 for-in 、 while 和 repeat-while 来进行循环  包裹条件和循环变量的括号可以省略，但是语句体的大括号是必须的
let inidividualScores = [75, 43, 193, 87, 12]
var teamScore = 0
for score in inidividualScores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
print(teamScore)

// MARK: 在 if 语句中，条件必须是一个布尔表达式 if socre {...} 这样是错误的。可以使用 if 和 let 一起来处理值缺失的情况。这些值可由可选值来代表。一个可选的值是一个具体的值或者是 nil 以表示值缺失。在类型后面加一个问号(?) 来标记这个变量的值是可选的
var optionalString:String? = "Hello"
print(optionalString == nil)

var optionalName:String? = nil //"John Appleseed"
var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(name)"
}

// MARK: 另一种处理可选值的方法是通过 ?? 操作符来提供一个默认值。如果可选值缺失的话，可以使用默认值来代替
let nickName:String? = nil
let fullName:String = "John Appleseed"
let informalGreeting = "Hi \(nickName ?? fullName)"

// MARK: switch 支持任意类型的数据以及各种比较操作
let vegetable = "red pepper"
switch vegetable {
case "celery":
    print("Add some raisins and make ants on a log.")
case "cucumber", "watercress":
    print("That would make a good tea sandwich.")
case let x where x.hasSuffix("pepper"):
    print("Is it a spicy \(x)")
default:
    print("Everything tastes good in soup")
}

// MARK: 运行 switch 中匹配到 case 语句之后，程序会退出 switch 语句，并不会继续向下运行，所以不需要在每个子句结尾写 break
// MARK: 可以使用 for-in 来遍历字典，需要一对儿变量来表示每个键值对。字典是一个无序的集合，所以他们的键和值以任意顺序迭代结束
let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]

var largest = 0
var type:String?
for (kind, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
            type = kind
        }
    }
}
print(largest,  type ?? "Notype")

var n = 2
while n < 100 {
    n *= 2
}
print(n)

// MARK: 保证能至少循环一次
var m = 2
repeat {
    m *= 2
} while m < 100
print(m)

// MARK: 可以在循环中使用 ..< 来表示下标范围
var total = 0
for i in 0..<4 {
    total += i
}
print(total)
// MARK: 使用 ..< 创建的范围不包含上界，如果想包含的话需要使用 ...


/* 函数和闭包 */
// MARK: 使用 func 来声明一个函数，使用名字和参数来调用函数。 使用 -> 来指定函数返回值的类型
func greet(person: String, day: String) ->String {
    return "Hello \(person), today is \(day)"
}

greet(person: "Bob", day: "Tuesday")

// MARK: 默认情况下，函数使用它们的参数名称作为它们参数的标签，在参数名称前可以自定义参数标签，或者使用 _ 表示不使用参数标签。
func greet(_ person:String, on day: String) -> String {
    return "Hello \(person), today is \(day)"
}
greet("John", on: "Wednesday")

// MARK: 使用元组来生成复合值，比如让一个函数返回多个值。该元组的元素可以用名称活着数字来获取
func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }
    
    return (min, max, sum)
}

let statistics = calculateStatistics(scores: [5, 3, 100, 3, 9])
print(statistics.sum)
print(statistics.2)

// MARK: 函数可以嵌套。被嵌套的函数可以访问外侧函数的变量，可以使用嵌套函数来重构一个太长或者太复杂的函数
func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}
returnFifteen()

// MARK: 函数是第一等类型，这意味着函数可以作为另一个函数的返回值
func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
increment(7)

// MARK: 函数也可以当作参数传入另一个函数
func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}

func lessThanTen(number: Int) -> Bool{
    return number < 10
}

var numbers = [20, 19, 7, 12]
hasAnyMatches(list: numbers, condition: lessThanTen)

// MARK: 函数实际上就是一种特殊的闭包：他是一段能之后被调取的代码。闭包中的代码能访问闭包作用域的变量和函数，即使闭包是在一个不同的作用域被执行的 —— 你已经在嵌套函数的例子中看过了。 可以使用 {} 来创建一个匿名闭包。使用 in 将参数和返回值类型的声明与闭包函数体进行分离
numbers.map({
    (number: Int) -> Int in
    let result = 3 * number
    return result
})

// MARK: 有很多种创建更简洁的闭包的方法。如果一个闭包的类型已知，比如作为一个代理的回调，你可以忽略参数，返回值，甚至两个都忽略。单个语句闭包会把它语句的值当作结果返回
let mappedNumbers = numbers.map({ number in 3 * number })
print(mappedNumbers)

// MARK: 可以通过参数位置而不是参数名称来引用参数 —— 这个方法在非常短的闭包中非常有用。当一个闭包作为最后一个参数传给一个函数的时候，它可以直接跟在圆括号后面。当一个闭包是传给函数的唯一参数，可以完全忽略圆括号
let sortedNumbers = numbers.sorted{ $0 > $1 }
print(sortedNumbers)


/* 对象和类 */

// MARK: 使用 class 和类名来创建一个类。类中属性的声明和常量、变量声明一样，唯一的区别就是它们的上下文是类。同样，方法和函数声明也一样
class Shape {
    var numberOfSides = 0
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

// MARK: 要创建一个类的实例，在类名后面加上括号。使用点语法来访问实例的属性和方法
var shape = Shape()
shape.numberOfSides = 7
var shapeDescription = shape.simpleDescription()

// MARK: 这个版本的 Shaper 类缺少了一些重要的东西：一个构造函数来初始化类实例。使用 init 来创建一个构造起
class NameShape{
    var numberOfSides: Int = 0
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "Ashape with \(numberOfSides) sides."
    }
}

// MARK: 如果需要在对象释放之前进行一些清理工作，使用 deinit 创建一个析构函数。
// 子类的定义方法是在它们的类名后面加上一个父类的名字，用冒号分割。创建类的时候并不需要一个标准的根类，所以可以根据需要添加或者忽略父类. 子类如果要重写父类的方法的话，需要用 override 标记 —— 如果没有添加 override 就重写父类方法的话编译器会报错. 编译器同样会检测 override 标记的方法是否确实在父类中

class Square: NameShape {
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() -> Double {
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
}

let test = Square(sideLength: 5.2, name: "my test square")
test.area()
test.simpleDescription()

// MARK: 除了简单的存储属性，还有使用 getter  和 setter 的计算属性 在permeter 的 setter 中，新值的名字是 newValue。 可以在 set 之后的圆括号中显式的设置一个名字
class EquilateralTriangle: NameShape {
    var sideLength: Double = 0.0
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
    var permeter:Double {
        get {
            return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3.0
        }
    }
    
    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)."
    }
}
// 在 EquilateralTriangle 类的构造器执行了三步 1. 设置子类声明的属性值  2.调用父类的构造器  3.改变父类定义的属性值。

// MARK: 如果不需要计算属性，但是仍然需要在设置一个新值之前或者之后运行代码，使用 willSet 和 didSet 。写入的代码会在属性值发生改变时调用，但不包含构造器中发生值的改变的情况
class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    
    var square: Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}
var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
print(triangleAndSquare.square.sideLength)
print(triangleAndSquare.triangle.sideLength)
triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
print(triangleAndSquare.triangle.sideLength)

// MARK: 处理变量的可选值时，你可以在操作（比如方法、属性和子脚本）之前加 ？ 如果 ？ 之前的值是 nil , ? 后面的东西都会被忽略，并且表达式返回 nil。否则，可选值会被解包，之后的缩哟代码都会按照解包后的值运行。在这两种情况下，整个表达式的值也是一个可选值。
let optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
let sideLength = optionalSquare?.sideLength


/* 枚举和结构体 */

// MARK: 使用 enum 来创建一个枚举，就像类和其他所有命名类型一样，枚举可以包含方法。
enum Rank: Int{
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    func simpleDescription() -> String {
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}
let ace = Rank.ace
let aceRawValue = ace.rawValue

// MARK: 默认情况下，Swift按照从0开始每次加1的方式为原始值进行赋值，不过可以通过显式赋值进行改变。例如上面中 Ace被显式赋值为1，并且剩下的原始值会按照顺序赋值。也可以使用字符串或者浮点数作为枚举的原始值。使用 rawValue 属性来访问一个枚举成员的原始值
// MARK: 使用 init?(rawValue:) 初始化构造器来从原始值创建一个枚举实例。如果存在与原始值相应的枚举成员就返回该枚举成员，否则就返回 nil
if let convertedRank = Rank(rawValue: 3) {
    let threeDescription = convertedRank.simpleDescription()
}

// 枚举的关联值是实际值，并不是原始值的另一种表达方式。实际上，如果没有比较有意义的原始值，你就不需要提供原始值
enum Suit {
    case spades, hearts, diamonds, clubs
    func simpleDescription() -> String {
        switch self {
        case .spades:
            return "spades"
        case .hearts:
            return "hearts"
        case .diamonds:
            return "diamonds"
        case .clubs:
            return "clubs"
        }
    }
}
let hearts = Suit.hearts
let heartsDescription = hearts.simpleDescription()
// 给 hearts 常量赋值时，枚举成员 Suit.hearts 需要用全名来引用，因为常量没有显式指定类型。在 switch里，枚举成员使用缩写 .hearts 来引用，因为 self 的值已经是一个 suit 类型。在任何已知变量类型的情况下都可以使用缩写
// 如果枚举成员的实例有原始值，那么这些值是在声明的时候就已经决定了，这意味着不同枚举实例的枚举成员总会有一个相同的原始值。当然我们也可以为枚举成员设定关联值，关联值是在创建实例时决定的。这意味着同一枚举成员不同实例的关联值可以不相同。可以把关联值想象成枚举成员实例的存储属性。
enum ServerResponse {
    case result(String, String)
    case failure(String)
}

let success = ServerResponse.result("6:00 am", "8:09 pm")
let failure = ServerResponse.failure("Out of cheese.")

switch success {
case let .result(sunrise, sunset):
    print("Sunrise is at \(sunrise) and sunset is at \(sunset)")
case let .failure(message):
    print("Failure... \(message)")
}

// MARK: 使用 struct 来创建一个结构体。结构体和类有很多相同的地方，包括方法和构造器，它们之间最大的一个区别就是结构体是传值，类是传引用
struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}
let threeOfSpades = Card(rank: .three, suit: .spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()



/* 协议和扩展 */

// MARK: 使用 protocol 来声明一个协议
protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}

// 类、枚举和结构体都可以遵循协议
class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A vary simple class."
    var anotherProperty: Int = 69105
    func adjust() {
        simpleDescription += " Now 100% adjusted."
    }
}

var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription

struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure"
    mutating func adjust() {
        simpleDescription += "  (adjusted)"
    }
}
var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription
// 注意声明 SimpleStructure 时候 mutating 关键字用来标记一个会修改结构体的方法。 SimpleClass 的声明不需要标记任何方法，因为类中的方法通常可以修改类属性（类的性质）
// MARK: 使用 extension 来为现有的类型添加功能，比如新的方法和计算属性。可以使用扩展让某个在别处声明的类型来遵守某个协议，这同样适用于从外部库或者框架引入的类型
extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
}
print(7.simpleDescription)
// 可以像使用其他命名类型一样使用协议名 —— 例如，创建一个有不同类型但是都实现一个协议的对象集合。当你处理类型是协议的值时，协议外定义的方法不可用
let protocolValue: ExampleProtocol = a
print(protocolValue.simpleDescription)
//print(protocolValue.anotherProperty)
// 即使 protocolValue 变量运行的类型是 simpleClass, 编译器还是会把它的类型当作 ExampleProtocol 这表示你不能调用协议之外的方法或者属性



/* 错误处理 */
// MARK: 使用采用 Error 协议的类型来表示错误
enum PrinterError: Error {
    case outOfPaper
    case noToner
    case onFire
}
// 使用 throw 来抛出一个错误和使用 throws 来表示一个可以抛出错误的函数。如果在函数中抛出一个错误，这个函数会立刻返回并且调用该函数的代码会进行错误处理
func send(job: Int, toPrinter printerName: String) throws -> String {
    if printerName == "Never Has Toner" {
        throw PrinterError.noToner
    }
    return "Job sent"
}

// 有多种方式可以用来进行错误处理。一种方式是使用 do-catch. 在 do 代码块中，使用 try 来标记可以抛出错误的代码。在 catch 代码块中，除非你另外命名，否则错误会自动命名为 error
do {
    let printerResponse = try send(job: 1040, toPrinter: "Bi Sheng")
    print(printerResponse)
} catch {
    print(error)
}
// 可以使用多个 catch 块来处理特定的错误。参照 switch 中的 case 风格来写 catch
do {
    let printerResponse = try send(job: 1440, toPrinter: "Gutenberg")
    print(printerResponse)
} catch PrinterError.onFire {
    print("I'll just put this over here, with the rest of the fire.")
} catch let printerError as PrinterError {
    print("Printer error:\(printerError)")
} catch {
    print(error)
}

// MARK: 另一种处理错误的方式使用 try?  将结果转换为可选的。如果函数抛出错误，该错误会被抛弃并且结果为 nil。否则结果会是一个包含函数返回值的可选值
let printerSuccess = try? send(job: 1884, toPrinter: "Mergenthaler")
let printerFailure = try? send(job: 1885, toPrinter: "Never Has Toner")

// MARK: 使用 defer 代码块来表示在函数返回前，函数中最后执行的代码。无论函数是否会抛出错误，这段代码都将执行。使用 defer，可以把函数调用之初就要执行的代码和函数调用结束时的扫尾代码写在一起，虽然这两者的执行时机截然不同
var fridgeIsOpen = false
let fridgeContent = ["milk", "eggs", "leftovers"]

func fridgeContains(_ food: String) -> Bool {
    fridgeIsOpen = true
    defer {
        fridgeIsOpen = false
    }
    let result = fridgeContent.contains(food)
    return result
}
fridgeContains("Banana")
print(fridgeIsOpen)


/* 泛型 */
// MARK: 在尖括号里写一个名字来创建一个泛型函数或者类型
func makeArray<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
    var result = [Item]()
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    return result
}
makeArray(repeating: "knock", numberOfTimes: 4)

// 也可以创建泛型函数、方法、类、枚举和结构体
enum OptionalValue<Wrapped> {
    case none
    case some(Wrapped)
}
var possibleInteger: OptionalValue<Int> = .none
possibleInteger = .some(100)

// 在类型名后面使用 where 来制定对类型的一系列需求，比如，限定类型实现某一个协议，限定两个类型是相同的，或者限定某个类必须有一个特定的父类
func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool where T.Element: Equatable, T.Element == U.Element {
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
    }
    return false
}
anyCommonElements([1, 2, 3], [3])

// <T: Equatable> 和 <T> ... where T: Equatable 的写法是等价的


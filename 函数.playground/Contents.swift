import UIKit

// 函数是一段完成特定任务多独立代码片段。 Swift 统一的函数语法非常的灵活，可以用来表示任何函数，包括最简单的没有参数名字的 C 风格函数，到复杂的带局部和外部参数名的 OC 风格函数。 参数可以提供默认值，以简化函数调用。参数也可以既当做传入参数，也当作传出参数，也就是说，一旦函数执行结束，传入的参数值将被修改。

// 函数的定义与调用  作为函数的输入，称为参数，也可以定义某种类型的值作为函数执行结束时的输出，称为返回类型。 每个函数又个函数名，用来描述函数执行的任务。要使用一个函数时，用函数名来“调用”这个函数，并传给它匹配的输入值（称作实参）。函数的实参必须与函数参数表里参数的顺序一致

func greet(person: String) -> String {  // func 为前缀  指定函数返回类型时，用返回箭头 -> 后跟返回类型的名称的方式来表示。  该定义描述了函数的功能，它期望接受什么作为参数和执行结束时它返回的结果时什么类型。
    let greeting = "Hello, " + person + "!"
    return greeting
}
print(greet(person: "Anna"))
print(greet(person: "Brian"))

func greetAgain(person: String) -> String {
    return "Hello agin, " + person + "!"  //简化版本
}

// 函数的参数与返回值
    // 无参数函数  函数可以没有参数
func sayHelloWorld() -> String {
    return "Hello, world"
}
print(sayHelloWorld())  // 尽管这个函数没有参数，但是定义中的函数名后还是需要一对圆括号。被调用时，也需要在函数名后写一对圆括号
    // 多参数函数 函数可以有多种输入参数 这些参数被包含在函数的括号之中，以逗号分隔
func greet(person: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return greetAgain(person: person)
    } else {
        return greet(person: person)
    }
}
print(greet(person: "Tim", alreadyGreeted: true))
    // 无返回值函数 严格来说，即使没有明确定义返回值，该 greet(Person:) 函数仍然返回一个值。没有明确定义返回类型的函数返回一个 Void 类型特殊值，该值为一个空元组，写成()
//func greet(person: String) {
//    print("Hello, \(person)!")
//}
func printAndCount(string: String) -> Int {
    print(string)
    return string.count
}
func printWithoutCounting(string: String) {
    let _ = printAndCount(string: string) // 调用函数时，可以忽略该函数的返回值。 函数值可以被忽略，但定义了有返回值的函数必须返回一个值，如果在函数定义底部没有返回任何值，将导致编译时错误
}
    // 多重返回值函数  可以用元组 (tuple) 类型让多个值作为一个复合值从函数中返回
/*
func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}
let bounds = minMax(array: [8, -6, 2, 109, 3, 71])
print("min is \(bounds.min) and max is \(bounds.max)")*/ // 元组的成员不需要在元组从函数中返回时命名，因为他们的名字已经在函数返回类型中指定了
    // 可选元组返回类型 即 可选的元组返回类型反映整个元组可以时 nil 的事实  (Int, Int)?  (String, Int, Bool)? 可选元组类型如 (Int, Int)? 与元组包含可选类型如 (Int?, Int?) 是不同的。可选的元组类型，整个元组是可选的，而不只是元组中的每个元素值
func minMax(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty { return nil }
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}
if let bounds = minMax(array: [8, -6, 2, 109, 3, 71]) {
    print("min is \(bounds.min) and max is \(bounds.max)")
}
    // 隐式返回的函数 如果一个函数的整个函数体是一个单行表达式，这个函数可以隐式地返回这个表达式
func greeting(for person: String) -> String {
    "Hello, " + person + "!"  // 忽略 return。类比 Getter 声明
}

// 函数参数标签和参数名称  每个函数参数都有一个参数标签 以及一个参数名称。参数标签在调用函数的时候使用 调用的时候需要将函数的参数标签写在对应的参数前面。 参数名称在函数的实现中使用。默认情况下，函数参数使用参数名称来作为他们的参数标签
func someFunction(firstParameterName: Int, secondParameterName: Int) {
}
someFunction(firstParameterName: 1, secondParameterName: 2)
    // 指定参数标签。可以在参数名称前指定他的参数标签 中间以空格分隔  参数标签的使用能够让一个函数在调用时更有表达力，更类似自然语言，并且仍保持了函数内部的可读性以及清晰的意图
func someFunction(argumentLabel parameterName: Int) {
}
    // 忽略参数标签  如果你不希望为某个参数添加一个标签 可以使用一个下划线 (_) 来代替一个明确的参数标签
func someFunction(_ firstParameterName: Int, secondParameterName: Int) {
}
    // 默认参数值  可以在函数体中通过给参数赋值来为任意一个参数定义默认值
func someFunction(parameterWithoutDefault: Int, parameterWithDefault: Int = 12) { // 将不带默认值的参数放在函数参数列表的最前。
}
    // 可变参数  一个可变参数可以接受零个或多个值。函数调用时，可以用可变参数来制定函数参数可以被传入不确定数量的输入值。通过在变量类型后面加入 (...) 的方式来定义可变参数。可变参数的传入值在函数体中变为此类型的一个数组
func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
    // 一个函数能够拥有多个可变参数。可变参数后的第一行行参前必须加上实参标签。实参标签用于区分实参是传递给可变参数，还是后面的行参
    // 输入输出参数。 函数参数默认是常量。试图在函数体中更改参数值将会导致编译错误。这意味着你不能错误地更改参数值 如果想要一个函数可以修改参数的值，并且想要在这些修改在函数调用结束后仍然存在，那么就应该把这个参数定义为输入输出参数
    // 定义一个输入输出参数时，在参数定义前加 inout 关键字 一个输入输出参数 有传入函数的值，这个值被函数修改，然后被传出函数，替换原来的值
    // 你只能传递变量给输入输出参数。不能传入常量或者字面量，因为这些量是不能被修改的。当传入的参数作为输入输出参数时，需要在参数名前加 & 符，表示这个值可以被函数修改。  输入输出参数不能有默认值，而且可变参数不能用 inout 标记
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}
    // 可以用两个 Int 型的变量来调用 swapTwoInts(_:_:) 需要注意的是 someInt 和 anotherInt 在传入 swapTwoInts(_:_:)函数前，都加了 & 前缀
var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")
    // someInt 和 anotherInt 的原始值在 swapTwoInts() 函数中被修改，尽管他们的定义在函数体外。 输入输出参数和返回值不一样的。输入输出参数是函数对函数体外产生影响的另一种方式

//函数类型  函数的类型由函数的参数类型和返回类型组成。 (Int, Int) -> Int   () -> Void
    // 使用函数类型
func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}
var mathFunction: (Int, Int) -> Int = addTwoInts
print("Result: \(mathFunction(2, 3))")
    // 函数类型作为参数类型 可以用 (Int, Int) -> Int 这样的函数类型作为另一个函数的参数类型。
func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a, b))")
}
printMathResult(addTwoInts, 3, 5)
    // 函数类型作为返回类型  可以用函数类型作为另一个函数的返回类型。需要在返回箭头 (->) 后写一个完整的函数类型
func stepForward(_ input: Int) -> Int{
    return input + 1
}
func stepBackward(_ input: Int) -> Int{
    return input - 1
}
func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    return backward ? stepBackward : stepForward
}
var currentValue = 3
let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
print("Counting to zero:")
while currentValue != 0 {
    print("\(currentValue)...")
    currentValue = moveNearerToZero(currentValue)
}
print("zero!")

// 嵌套函数。 把函数定义在别的函数体内，称作 嵌套函数。默认嵌套函数是对外界不可见的，但是可以被他们的外围函数调用。一个外围函数也可以返回它的某一个嵌套函数，使得这个函数可以在其他域中被使用
//func chooseStepFunction(backward: Bool) -> (Int) -> Int {
//    func stepForward(input: Int) -> Int { return input + 1 }
//    func stepBackward(input: Int) -> Int { return input - 1 }
//    return backward ? stepBackward : stepForward
//}




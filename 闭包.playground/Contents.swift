import UIKit

// 闭包 是自包含的函数代码块，可以在代码中被传递和使用。 闭包可以捕获和存储其所在上下文中任意常量和变量的引用。被称为包裹常量和变量。Swift会为你管理在捕获过程中涉及的所有内存操作
// 上一章中介绍的全局和嵌套函数实际上也是特殊的闭包，闭包采用如下的三种形式之一:
    // 全局函数是一个有名字但不会捕获任何值的闭包
    // 嵌套函数是一个有名字并可以捕获其封闭函数域内值的闭包
    // 闭包表达式是一个利用轻量级语法所写的可以捕获上下文中变量或常量值的匿名闭包
    // 主要优化：
    // 利用上下文推断参数和返回值类型
    // 隐式返回单表达式闭包，即单表达式闭包可以省略 return 关键字
    // 参数名称缩写
    // 尾随闭包语法

// 闭包表达式 是一种构建内联闭包的方式，它的语法简洁。在保证不丢失它语法清晰明了的同时，闭包表达式提供了几种优化的语法简写形式
    // 排序方法  使用 sorted(by:) 对一个 String 类型的数组进行字幕逆序排序
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
    // sorted(by:) 接受一个闭包，该闭包函数需要传入与数组元素类型相同的两个值，并返回一个布尔类型值来表明当排序结束后传入的第一个参数排在第二个参数前面还是后面
func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}
var reversedNames = names.sorted(by: backward)
print("\(reversedNames)")
    // 闭包表达式语法。 闭包表达式参数可以是 in-out 参数，但不能设定默认值。如果命名了可变参数，也可以使用此可变参数。元组也可以作为参数和返回值
/*
{ (parameters) -> return type in
    statements
}
 */
reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})
    // 内联闭包参数和返回值类型声明与 backward(_:_:) 函数类型声明相同。即 (s1: String, s2: String) -> Bool 。然而在内联闭包表达式中，函数和返回值类型都写在大括号内，而不是大括号外。闭包的函数体部分由关键字 in 引入。该关键字表示闭包的参数和返回值类型定义已经完成，闭包函数体即将开始
    // 根据上下文推断类型 Swift 可以推断其参数和返回值的类型
reversedNames = names.sorted(by: { s1, s2 in return s1 > s2 } )
    // 通过内联闭包表达式构造的闭包作为参数传递给函数或方法时，总是能够推断出闭包的参数和返回值类型。这意味着闭包作为函数或者方法的参数时，几乎不需要利用完整格式构造内联闭包。尽管如此，仍可以明确写出有着完整格式的闭包。
    // 单表达式闭包的隐式返回  单行表达式可以通过省略 return 关键字来隐式返回单行表达式的结果
reversedNames = names.sorted(by: {s1, s2 in s1 > s2 })
    // 参数名称缩写  Swift 自动为内联闭包提供了参数名称缩写功能，你可以直接通过 $0 $1 $2 来顺序调用闭包的参数，以此类推。 如果在闭包表达式中使用参数名称缩写，可以在闭包中省略参数列表，并且对应参数名称缩写的类型会通过函数类型进行推断。闭包接受的参数数量取决于所使用的缩写参数的最大编号。 in 关键字也同样可以被省略
reversedNames = names.sorted(by: { $0 > $1 })
    // 运算符方法  实际上还有一种更简短的方式来编写上面的闭包表达式
reversedNames = names.sorted(by: >)


// 尾随闭包。如果你需要将一个很长的闭包表达式作为最后一个参数传递给函数，将这个闭包替换成尾随闭包的形式很有用。尾随闭包是一个书写在函数圆括号之后的闭包表达式，函数支持将其作为最后一个参数调用。
func someFunctionThatTakesAClosure(closure: () -> Void) {
}
// 以下是不使用尾随闭包进行函数调用
someFunctionThatTakesAClosure(closure: {
    // 闭包主体部分
})
// 以下是使用尾随闭包进行函数调用
someFunctionThatTakesAClosure() {
    // 闭包主体部分
}
    // 上面 sorted 改成尾随包的形式
reversedNames = names.sorted() { $0 > $1 }
    // 如果闭包表达式是函数或方法的唯一参数，则当你使用尾随闭包时，甚至可以把 () 省略掉
reversedNames = names.sorted { $0 > $1 }

let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]

let strings = numbers.map { (number) -> String in
    var number = number
    var output = ""
    repeat {
        output = digitNames[number % 10]! + output  // digitNames 下标后跟着一个叹号 因为字典下标返回一个可选值，表明该键不存在时会查找失败。我们确定 number%10为有效下标，因此叹号可以用于强制解包 存储在下标的可选类型的返回值中的 String 类型的值
        number /= 10
    } while number > 0
    return output
}
print("\(strings)")
    // 这个例子，通过尾随闭包语法，优雅地在函数后封装了闭包的具体功能，而不再需要将整个闭包包裹在 map(_:) 方法的括号内


// 值捕获 闭包可以被其定义的上下文中 捕获常量或变量。即使定义这些常量或变量的原作用域已经不存在，闭包仍然可以在闭包函数体内引用和修改这些值。 嵌套函数可以捕获其外部函数所有的参数以及定义的常量和变量
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount // 从外围函数捕获了 runningTotal 和 amount 变量的引用
        return runningTotal
    }
    return incrementer
}
    // 为了优化，如果一个值不会被闭包改变，或者在闭包创建后不会改变，Swift 可能会改为捕获并保存一份对值的拷贝  Swift 也会负责被捕获变量的所有内存管理工作，包括释放不再需要的变量
let incrementByTen = makeIncrementer(forIncrement: 10)
print("\(incrementByTen())")
let incrementBySeven = makeIncrementer(forIncrement: 7)
print("\(incrementByTen()) \(incrementBySeven())")
    // 如果你将闭包赋值给一个类实例的属性，并且该闭包通过访问该实例或其他成员而捕获了该实例，你将在闭包和该实例间创建一个循环强引用。Swift 使用捕获列表来打破这种循环强引用

// 闭包是引用类型。无论你将函数或闭包赋值给一个常量还是变量，你实际上都是将常量或变量的值设置为对应函数或闭包的引用。
let alsoIncrementByTen = incrementByTen
print("\(alsoIncrementByTen())") // 两个值都会指向同一个闭包


// 逃逸闭包。 当一个闭包作为参数传到一个函数中，但是这个闭包在函数返回之后才被执行，我们称该闭包从函数中逃逸。 可以在参数名之前标注 @escaping,用来指明这个闭包是允许 "逃逸" 出这个函数的
    // 一种能使闭包“逃逸”出函数的方法是，将这个闭包保存在一个函数外部定义的变量中。 即 启动异步操作的函数接受一个闭包参数作为 completion handler 这类函数会在异步操作开始之后立刻返回，但是闭包直到异步操作结束后才会被调用。在这种情况下，闭包需要“逃逸”出函数，因为闭包需要在函数返回之后被调用。
var completionHandlers: [() -> Void] = []
func somFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}
    // 将一个闭包标记为 @escaping 意味着你必须在闭包中显式地引用 self
func someFunctionWithNonescapingClosure(closure: () -> Void) {
    closure()
}

class SomeClass {
    var x = 10
    func doSomething() {
        somFunctionWithEscapingClosure { self.x = 100 } // 这里传递的闭包是一个逃逸闭包，意味着它需要显式地引用 self
        someFunctionWithNonescapingClosure { x = 200 } // 这里的闭包是一个非逃逸闭包，这意味着它可以隐式引用self
    }
}
let instance = SomeClass()
instance.doSomething()
print(instance.x)

completionHandlers.first?()
print(instance.x)

// 自动闭包。自动闭包是一种自动创建的闭包，用于包装传递给函数作为参数的表达式。这种闭包不接受任何参数，当它被调用的时候，会返回被包装在其中的表达式的值。这种便利语法让你能够省略闭包的花括号，用一个普通的表达式来代替显式的闭包
    // 自动闭包让你能够延迟求值，因为直到你调用这个闭包，代码段才会被执行。延迟求值对于那些有副作用（Side Effect）和高计算成本的代码来说是很有益处的，因为它使得你能控制代码的执行时机。
var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(customersInLine.count)

let customerProvider = { customersInLine.remove(at: 0) } // 在这个闭包的代码中， customersInLine 的第一个元素被移除了，不过在闭包被调用之前，这个元素是不会被移除的。如果这个闭包永远不被调用，那么在闭包里的表达式将永远不会被执行，那意味着列表中的元素永远不会被移除。  customerProvider 的类型不是 String 而是 () -> String 一个没有参数且返回值为 String 的函数
print(customersInLine.count)

print("Now serving \(customerProvider())!")
print(customersInLine.count)

func server(customer customerProvider: () -> String) {
    print("Now serving \(customerProvider())!")
}
server(customer: { customersInLine.remove(at: 0) })  // 接受一个返回顾客名字的显式的闭包

func serve(customer customerProvider: @autoclosure () -> String) {
    print("Now serving \(customerProvider())!")
}
serve(customer: customersInLine.remove(at: 0))
// 这里通过将参数标记为 @autoclosure 来接收一个自动闭包。 现在可以将该函数当作接受 String 类型参数（而非闭包）的函数来调用。 customerProvider 参数将自动转化为一个闭包，因为该参数被标记了 @autoclosure 特性  注意过度使用 autoclosures 会让你的代码变得难以理解。上下文和函数名应该能够清晰地表明求值是被延迟执行的。
    // 如果你想让一个自动闭包可以“逃逸”，则应该同时使用@autoclosure 和 @escaping 属性
var customerProviders: [() -> String] = []
func collectCustomerProviders(_ customerProvider: @autoclosure @escaping () -> String ) {
    customerProviders.append(customerProvider)
}
collectCustomerProviders(customersInLine.remove(at: 0))
collectCustomerProviders(customersInLine.remove(at: 0))

print("Collected \(customerProviders.count) closures.")

for customerProvider in customerProviders {
    print("Now serving \(customerProvider())!")
}
// 上面的代码中，collectCustomerProviders(_:) 函数并没有调用传入的 customerProvider 闭包，而是将闭包追加到了 customerProviders 数组中。这个数组定义在函数作用域范围外，这意味着数组内的闭包能够在函数返回之后被调用。因此 customerProvider 参数必须允许“逃逸”出函数作用域

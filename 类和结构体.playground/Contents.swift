import UIKit

// 结构体和类对比
/*
 共同点：
 定义属性用于存储值
 定义方法用于提供功能
 定义下标操作用于通过下标语法访问它们的值
 定义构造器用于设置初始值
 通过扩展以增加默认实现之外的功能
 遵循协议以提供某种标准功能
 
 类的附加功能：
 继承允许一个类继承另一个类的特征
 类型转换允许在运行时检查和解释一个类实例的类型
 析构器允许一个类实例释放任何其所被分配的资源
 引用计数允许对一个类的多次引用
 
 一般准则 优先使用结构体，仅在适当或必要时才使用类。即意味着你的大多数自定义数据类型都会是结构体和枚举
 */

    // 类型定义的语法
struct SomeStructure {
    // 这里定义结构体
}

class SomeClass {
    // 这里定义类
}
// 每当你定义一个新的结构体或者类时，都是定义了一个新的 Swift 类型。请使用 UpperCamelCase 这种方式来命名类型，以便符合标准 Swift 类型的大写命名风格。请使用 lowerCamelCase 这种方式来命名属性和方法，以便和类型名区分。
struct Resolution {
    var width = 0
    var height = 0
}

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

    // 结构体和类的实例  构造器语法的最简单形式是在结构体或者类的类型名称后跟随一对空括号。通过这种方式所创建的类或者结构体实例，其属性均会被初始化为默认值。
let someResolution = Resolution()
let someVideoMode = VideoMode()
    // 属性访问 可以使用点语法访问实例的属性。 规则，实例名后面紧跟属性名，两者以点号 (.) 分隔，不带空格
print("The width of someResolution is \(someResolution.width)")
    // 也可以使用点语法为可变属性赋值
someVideoMode.resolution.width = 1280
print("The width of someVideoMode is now \(someVideoMode.resolution.width)")

    // 结构体类型的成员逐一构造器 所有结构体都有一个自动生成的成员逐一构造器，用于初始化新结构体实例中成员的属性。新实例中各个属性的初始值可以通过属性和名称传递到成员逐一构造器之中
let vge = Resolution(width: 640, height: 480)
    // 与结构体不同，类实例没有默认的成员逐一构造器。


// 结构体和枚举是值类型  值类型是这样一种类型，当它被赋值给一个变量、常量或者被传递给一个函数的时候，其值会被拷贝。 Swift 中所有的结构体和枚举类型都是值类型。这意味着它们的实例，以及实例中所包含的任何值类型的属性，在代码中传递的时候都会被复制。
    // 这里集合都对复制进行了优化以降低性能成本。即不会立即复制，而是跟原集合共享同一份内存，共享同样的元素。在集合的某个副本要被修改前，才会复制它的元素
let hd = Resolution(width: 1920, height: 1080)
var cinema = hd
cinema.width = 2048
print("\(hd.width) --- \(cinema.width)")

// 类是引用类型 与值类型不同，引用类型在被赋予到一个变量、常量或者被传递到一个函数时，其值不会被拷贝。因此，使用的是已经存在实例的引用，而不是其拷贝。
let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0
print("The frameRate property of tenEighty is now \(tenEighty.frameRate)")
    // 恒等运算符 因为类是引用类型，所以多个常量和变量可能在幕后同时引用同一个类实例。（对于结构体和枚举来说，这并不成立。因为它们作为值类型，在被赋予到常量、变量或者传递到函数时，其值总是会被拷贝）
    // 判定两个常量或者变量是否引用同一个类实例有时很有用。Swift 提供了两个恒等运算符: === 相同  !== 不相同
if tenEighty === alsoTenEighty {
    print("tenEighty and alsoTenEighty refer to the same VideoMode instance.")
}
    // 相同 (===) 等于 (==) 是不同的。 相同 表示两个类类型的常量或者变量引用同一个类实例。 等于 表示两个实例的值"相等"或"等价"，判定时要遵照设计者定义的评判标准


// 指针  指针来引用内存中的地址. Swift 中引用了某个引用类型实例的常量或变量，与C语言中的指针类似，不过它并不直接指向某个内存地址，也不要求你使用星号(*) 来表明你在创建一个引用。相反，Swift 中引用的定义方式与其他的常量或变量的一样。

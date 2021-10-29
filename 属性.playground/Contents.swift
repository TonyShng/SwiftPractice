import UIKit

// 属性 将值与特定的类、结构体或枚举关联。存储属性将常量和变量存储为实例的一部分，而计算属性则是直接计算（而不是存储）值。计算属性可以用于类、结构体和枚举，而存储属性只能用于类和结构体。
    // 存储属性和计算属性通常与特定类型的实例关联。但是，属性也可以直接与类型本身关联，这种属性称为类型属性。 另外，还可以定义属性观察器来监控属性值的变化，以此来触发自定义的操作。属性观察器可以添加到类本身定义的存储属性上，也可以添加到父类继承的属性上。

// 存储属性。 简单来说，一个存储属性就是存储在特定类或结构体实例里的一个常量或变量。存储属性可以是变量存储属性(var)，也可以是常量存储属性(let)
struct FixedLengthRange {
    var firstValue: Int
    var length: Int
}
var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
rangeOfThreeItems.firstValue = 6

    // 常量结构体实例的存储属性
let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)
//rangeOfFourItems.firstValue = 6 尽管属性可变 但仍会报错 这里结构体是常量 因为结构体属于值类型。当值类型的实例被声明为常量的时候，它的所有属性也就成了常量。

    // 延时加载存储属性  在属性声明前面使用 lazy 来标示一个延时加载存储属性。 必须将延时加载属性声明为变量(var)，因为属性的初始值可能在实例构造完成之后才会得到。而常量属性在构造完成之前必须要有初始值，因此无法声明为延时加载

    // 当属性的值依赖于一些外部因素且这些外部因素只有在构造过程结束之后才会知道的时候，延时加载属性就会很有用。或者当获得属性的值因为需要复杂或者大量的计算，而需要采用需要的时候再计算的方式，延时加载属性也会很有用。
class DataImporter {
    var fileName = "data.txt"
}

class DataManager {
    lazy var importer = DataImporter()
    var data: [String] = []
}

let manager = DataManager()
manager.data.append("Some data")
manager.data.append("Some more data")  // DataManager 实例的 importer 属性还没有被创建

print(manager.importer.fileName) // importter 属性现在被创建了
    // 注意 如果一个被标记为 lazy 的属性在没有初始化时就同时被多个线程访问，则无法保证该属性只会被初始化一次
    // 存储属性和实例变量  Swift 中的属性没有对应的实例变量，属性的备份存储也无法直接访问。这就避免了不同场景下访问方式的困扰，同时也将属性的定义简化成一个语句。属性的全部信息——包括命名、类型和内存管理特征—— 作为类型定义的一部分，都定义在一个地方。


// 计算属性  除存储属性外，类、结构体和枚举可以定义计算属性。计算属性不直接存储值，而是提供一个 getter 和一个可选的 setter，来间接获取和设置其他属性或变量的值
struct Point {
    var x = 0.0, y = 0.0
}
struct Size {
    var width = 0.0, height = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}
var square = Rect(origin: Point(x: 0.0, y: 0.0),
                  size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center
print("square.origin is now at (\(square.origin.x), \(square.origin.y)")
    // 简化 Setter 声明  如果计算属性的 setter 没有定义表示新值的参数名，则可以使用默认名称 newValue.
struct AlternativeRect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set {
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
}
    // 简化 Getter 声明 如果整个 getter 是单一表达式，getter 会隐式地返回这个表达式结果.
struct CompactRect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            Point(x: origin.x + (size.width / 2),
                  y: origin.y + (size.height / 2))
        }
        set {
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
}
    // 只读计算属性  只有 getter 没有 setter 的计算属性叫 只读计算属性。 只读计算属性总是返回一个值，可以通过点运算符访问，但不能设置新的值 必须使用 var 关键字定义计算属性，包括只读计算属性，因为它们的值不是固定的。 let关键字只用来声明常量属性，表示初始化后再也无法修改的值
struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        return width * height * depth
    }
}
let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
print("the volume of fourByFiveByTwo is \(fourByFiveByTwo.volume)")

// 属性观察器

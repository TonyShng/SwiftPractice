import UIKit

// 枚举为一组相关的值定义了一个共同的类型，使你可以在你的代码中以类型安全的方式来使用这些值

// 枚举语法
enum SomeEnumeration {
    // 枚举定义放在这里
}
    // 与 C 与 OC 不同，Swift 的枚举成员在被创建时不会被赋予一个默认的整型值。相反，这些枚举成员本身就是完备的值，这些值的类型是已经明确定义好的 CompassPoint 类型。
enum CompassPoint {
    case north
    case south
    case east
    case west
}

enum Planet {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune // 多个成员可以出现在同一行上，用逗号隔开
}
var directionToHead = CompassPoint.west
directionToHead = .east  // 可以被推断出来 直接使用点语法将其设置为另一个 CompassPoint 的值 当 directionToHead 的类型已知时，再次为其赋值可以省略枚举类型名。在使用具有显式类型的枚举值时，这种写法让代码具有更好的可读性

// 使用 Switch 语句匹配枚举值
directionToHead = .south
switch directionToHead {
case .north:
    print("Lots of planets have a north")
case .south:
    print("Watch out for penguins")
case .east:
    print("Where the sun rises")
case .west:
    print("Where the skies are blue")
}

    // 当不需要匹配每个枚举成员的时候，你可以提供一个 default 分支涵盖所有未明确处理的枚举成员
let somePlanet = Planet.earth
switch somePlanet {
case .earth:
    print("Mostly harmless")
default:
    print("Not a safe place for humans")
}

// 枚举成员的遍历。 令枚举遵循 CaseIterable 协议。Swift 会生成一个 allCases 属性，用于表示一个包含枚举所有成员的集合。
enum Beverage: CaseIterable {
    case coffee, tea, juice
}
let numberOfChoices = Beverage.allCases.count
print("\(numberOfChoices) beverages available")

for beverage in Beverage.allCases {
    print(beverage)
}

// 关联值  可以定义 Swift 枚举来存储任意类型的关联值，如果需要的话，每个枚举成员的关联值类型可以各不相同。枚举的这种特性跟其他语言中的可识别联合，标签联合或者变体相似
enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

var productBarcode = Barcode.upc(8, 85909, 51226, 3)
productBarcode = .qrCode("ABCDEFG")

// 可以在case 分支代码中提取每个关联值作为一个常量 (用 let 前缀) 或者作为一个变量 (用 var 前缀) 来使用
switch productBarcode {
case .upc(let numberSystem, let manufacturer, let product, let check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
case .qrCode(let productCode):
    print("QR code: \(productCode).")
}
// 如果一个枚举成员的所有关联值都被提取为常量，或者都被提取为变量，为了简洁，可以只在成员名称前标注一个 let 或者 var
switch productBarcode {
case let .upc(numberSystem, manufacturer, product, check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
case let .qrCode(productCode):
    print("QR code: \(productCode).")
}

// 原始值 原始值可以是字符串、字符或者任意整型值或浮点型值。每个原始值在枚举声明中必须是唯一的。 原始值和关联值是不同的。原始值是在定义枚举时被预先填充的值。对于一个特定的枚举成员，它的原始值始终不变。关联值是创建一个基于枚举成员的常量或变量时才设置的值，枚举成员的关联值可以变化。
enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}
    // 原始值的隐式赋值 在使用原始值为整数或者字符串类型的枚举时，不需要显式的为每个枚举成员设置原始值, Swift 将会自动为你赋值
enum PlanetTwo: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune // venus =2 earth = 3 ...
}
    // 当使用字符串作为枚举类型的原始值时，每个枚举成员的隐式原始值为该枚举成员的名称
enum CompassPointTwo: String {
    case north, south, ease, west
}
print(PlanetTwo.earth.rawValue)
print(CompassPointTwo.west.rawValue)
    // 使用原始值初始化枚举实例
let possiblePlanet = PlanetTwo(rawValue: 7)

// 递归枚举 递归枚举时一种枚举类型，它有一个或多个枚举成员使用该枚举类型的实例作为关联值。使用递归枚举时，编译器会插入一个间接层。可以在枚举成员前加上 indirect 来表示该成员可递归
enum ArithmeticExpression {
    case number(Int)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
}
// 也可以在枚举类型开头加上 indirect 关键字来表明它的所有成员都是可递归的
//indirect enum ArithmeticExpression {
//    case number(Int)
//    case addition(ArithmeticExpression, ArithmeticExpression)
//    case multiplication(ArimeticExpression, ArithmeticExpression)
//}



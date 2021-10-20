import UIKit

// Array 有序数据的集  Set 无序无重复数据的集  Dictionary 无序的键值对的集

// 集合的可变性 var let

// 数组 Arrays 使用有序列表存储同一类型的多个值。相同的值可以多次出现在一个数组的不同位置中。
    // 简单语法  Array<Element>  [Element]
    // 空数组
var someInts: [Int] = []
someInts.append(3)
someInts = []
    // 创建一个带有默认值的数组  count 数据项数量   repeating 适当类型的初始值
var threeDoubles = Array(repeating: 0.0, count: 3) // [0.0, 0.0, 0.0]
    // 通过两个数组相加创建一个数组
var anotherThreeDoubles = Array(repeating: 2.5, count: 3) //[2.5, 2.5, 2.5]
var sixDoubles = threeDoubles + anotherThreeDoubles  // [0.0, 0.0, 0.0, 2.5, 2.5, 2.5]
    // 用数组字面量构造数组 [value 1, value 2, value 3]
    // 访问和修改数组
print("\(sixDoubles.count)") // count 获取数组中的数据项数量
if sixDoubles.isEmpty { // isEmpty 检查 count 属性是否为 0
    print("sixDoubles is empty")
}
    // append(_:) += 添加数组  insert(_:at:) 在某个指定索引值之前添加数据项  remove(at:) 移除数组中的某一项 removeLast() 移除最后一项
    // 数组的遍历 for-in  如果同时需要数据项的值和索引值 使用 enumerated() 方法来进行数组遍历
for (index, value) in sixDoubles.enumerated() {
    print("Item \(String(index + 1)): \(value)")
}


// 集合 Sets 存储相同类型并且没有确定顺序的值
    // 集合类型的哈希值
    // 集合类型语法 Set<Element>
    // 创建和构造一个空的集合
var letters = Set<Character>()
letters = []  // 现在是一个空的 Set 但仍然是 Set<Character> 类型
    // 用数组字面量创建集合
var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
    // 访问和修改一个集合
print("\(favoriteGenres.count)") // isEmpty 判断是否为0
favoriteGenres.insert("Jazz") // insert(_:) 添加一个新元素
favoriteGenres.remove("Rock") // remove(_:) 删除一个元素  removeAll() 删除所有元素
favoriteGenres.contains("Funk") // contains(_:) 是否包含一个特定的值
    // 使用 for-in 循环中遍历一个集合中的所有值
for genre in favoriteGenres {
    print("\(genre)")
}

// 集合操作
let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]
print("\(oddDigits.union(evenDigits).sorted())")  // union(_:) 两个集合的所有值创建一个新的集合
print("\(oddDigits.intersection(evenDigits).sorted())") // intersection(_:) 两个集合的交集创建一个新的集合
print("\(oddDigits.subtracting(singleDigitPrimeNumbers).sorted())") // 前一个不在另一个集合中的值创建一个新的集合
print("\(oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted())") // 两个集合不想交的值创建一个新的集合
    // 集合成员关系和相等
    // ==  来判断两个集合包含的值是否全部相同
    // isSubset(of:) 判断一个集合中的所有值是否也被包含在另一个集合中
    // isSuperset(of:) 判断一个集合是否包含另一个集合中所有的值
    // isStrictSubset(of:) 判断一个集合是否是另一个集合的自己和或者父集合并且两个集合并不相等
    // isDisjoint(with:) 方法来判断两个集合是否不含有相同的值 (是否没有交集)


// 字典 无序的集合，存储的是键值对之间的关系，所有键的值需要是相同的类型，所有值的类型也需要相同。每个值都关联一个键
    // 字典类型简化语法  Dictionary<Key, Value>  [Key: Value]
    // 创建一个空字典
var nameOfIntegers: [Int: String] = [:]
    // 用字典字面量创建字典
var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
    // 访问和修改字典 count isEmpty
airports["LHR"] = "London"
airports["LHR"] = "London Heathrow"
if let oldValue = airports.updateValue("Doblin Airport", forKey: "DUB") {
    print("The old value for DUB was \(oldValue).")
}
airports["APL"] = nil // 移除
if let removedValue = airports.removeValue(forKey: "DUB") {
    print("The removed airport's name is \(removedValue)")
}
    // 字典遍历 for-in
for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}
    // 也可以通过 keys 或者 values 属性，遍历字典的键或者值

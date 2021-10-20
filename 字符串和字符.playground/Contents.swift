import UIKit

// 字符串字面量 "" 即双引号包裹着的具有固定顺序的字符集

// 多行字符串字面量 """ """ 可以用 \ 作为续行符

// 字符串字面量的特殊字符 \0（空字符）  \\（反斜线）  \t（水平制表符）  \n（换行符）  \r（回车符）  \"（双引号）  \'（单引号）

// 扩展字符串分隔符 ## 特殊字符将会被直接包含而非转义后的效果 如果需要字符串文字中字符的特殊效果，请匹配转义字符(\)后面添加与起始位置个数相匹配的 # 符 \#n 换行

// 初始化空字符串 ""  isEmpty 判断

// 字符串可变性 var 声明

// 字符串是值类型  可以使用 for in 遍历其中的字符 Character 字符类型

// 连接字符串 和 字符  +  +=  append()

// 字符串插值  \()

// Unicode
    // Unicode 标量 对应字符或者修饰符的唯一的21位数字
    // 可扩展的字形群集 是由一个或多个(当组合时)Unicode标量的序列组成  将许多复杂的脚本字符表示为单个字符值的灵活方式
    // 计算字符数量  count属性 coung 与NSString 的length 属性不一定相同 length属性是利用 UTF-15 表示的十六位代码但愿数字，而不是 Unicode可扩展的字符群集

// 访问和修改字符串 可以通过 属性 方法 来访问和修改 也可以用下标语法
    // 字符串索引。Index 对应字符串中的每一个 Character 的位置  startIndex 第一个 endIndex 最后一个 index(before:) index(after:) index(_:offsetBy:) 对应偏移量的索引 indices属性会创建一个包含全部索引的范围(Range)
    // 插入和删除 insert(_: at:) insert(contentsOf: at:)  remove(at:)  removeSubarnge(_:)

// 子字符串 SubString不适合长期存储 重用了原String的内存空间 长期使用建议转为String类型 prefix(_:)

// 比较字符串
    // 字符串/字符相等 ==  != 来判断
    // 前缀/后缀相等  hasPrefix(_:)  hasSuffix(_:) 检查前缀/后缀

// 字符串的 Unicode 表现形式
    // UTF-8 表示 UTF8View 是无符号 8 位值的集合
    // UTF-16 表示 UTF16View
    // Unicode 标量表示 UnicodeScalarView

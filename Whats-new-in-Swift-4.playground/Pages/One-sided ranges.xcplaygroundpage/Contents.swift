/*:
 [首页](Table%20of%20contents) • [上一页](@previous) • [下一页](@next)
 
 ## 开区间

 [SE-0172][SE-0172] 带来一种新的 `RangeExpression` 协议和一组前缀/后缀操作符给开区间. 比如现在区间无论是上界还是下界都可以不指定.

 [SE-0172]: https://github.com/apple/swift-evolution/blob/master/proposals/0172-one-sided-ranges.md "Swift Evolution Proposal SE-0172: One-sided Ranges"
 
 ### 无限序列
 
你可以用开区间来造一个无限序列, 对长期使用 `enumerated()` 方法的同学来说,这是一个福音,尤其是当你不想序号从0开始的时候:
 */
let 字母表 = ["a","b","c","d"]
let 加序号的字母表 = zip(1..., 字母表)
Array(加序号的字母表)
/*:
 ### 集合的下标
 
 在集合的下标中用开区间的话, 集合的 `startIndex` or `endIndex` 会“智能填充” 缺失的那一边.
 */
let numbers = [1,2,3,4,5,6,7,8,9,10]
numbers[5...] // 取代 numbers[5..<numbers.endIndex]

/*:
 ### 方式匹配
 
 开区间可用于方式匹配, 比如一个 `switch` 语句中`case` 表达式 . 不过, 编译器好像还不能(暂时?) 判定`switch` 已被穷尽.
 */
let value = 5
switch value {
case 1...:
    print("大于0")
case 0:
    print("0")
case ..<0:
    print("小于0")
default:
    fatalError("不可到达")
}
/*: [首页](Table%20of%20contents) • [下一页](@previous) • [下一页](@next) */

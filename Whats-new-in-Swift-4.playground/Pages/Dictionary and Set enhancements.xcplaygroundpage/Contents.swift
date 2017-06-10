/*:
 [首页](Table%20of%20contents) • [上一页](@previous) • [下一页](@next)

 ## 字典(`Dictionary`) 和 集合(`Set`) 的增强

 [SE-0165][SE-0165] 加了一些很奶死的 `Dictionary` 和 `Set`增强.

 [SE-0165]: https://github.com/apple/swift-evolution/blob/master/proposals/0165-dict.md "Swift Evolution Proposal SE-0165: Dictionary and Set Enhancements"
 
 ### 基于序列(Sequence)的构造器
 
 从一个键值对序列构造字典.
 */
let 热门编程语言 = ["Swift", "Python", "Kotlin"]
let 热门编程语言排行 = Dictionary(uniqueKeysWithValues: zip(1..., 热门编程语言))
热门编程语言排行[2]


/*:
 ### 合并(merge)构造器 & `merge` 方法
 
 当从一个序列构造字典,或把一个序列合并到字典中,描述如何处理重复的键.
 */
let 热门技术 = [("苹果", "Swift"), ("谷歌", "TensorFlow"), ("苹果", "Swift Playgrouds"),
                    ("苹果", "ARKit"), ("谷歌", "TensorFlowLite"),("谷歌", "Kotlin"),("苹果", "Core ML")]
let 厂商 = Dictionary(热门技术, uniquingKeysWith: { (第一, 最后) in 最后 })
厂商

/*:
 合并构造器或 `merge` 方法遇到一个字典时就没那么舒服了. 因为字典的元素类型是一个 _带标签的_ 元组型 `(key: Key, value: Value)` 但上述2个方法却要求一个 _无标签的_ 元组型 `(Key, Value)`, 不得已要手工转换. 希望这个今后能完善. 见 [SR-922](https://bugs.swift.org/browse/SR-922) 和 [SR-4969](https://bugs.swift.org/browse/SR-4969).
 */
let 默认设置 = ["自动登录": false, "已绑定手机": false, "蓝牙开启": false]
var 用户设置 = ["自动登录": true, "已绑定手机": false]

// 会产生一个烦人的类型转换警告
//let 合并的设置 = 用户设置.merge(默认设置) { (old, _) in old }

// 只能使用以下替代:
用户设置.merge(默认设置.map { $0 }) { (old, _) in old }
用户设置

/*:
 ### 下标的默认值
 
 你现在可以给下标中加一个默认值参数, 当key不存在时会返回这个值, 这样便可让返回类型非Optional.
 */
热门编程语言排行[4, default: "(未知)"]

/*:
 在你想通过下标更新一个值时,这个功能就非常有用:
 */
import Foundation
var 词组 = """
    天姥连天向天横 势拔五岳掩赤城
    天台四万八千丈 对此欲倒东南倾
    我欲因之梦吴越 一夜飞度镜湖月
    湖月照我影 送我至剡溪
    """
var 出现频率: [Character: Int] = [:]
for 词 in 词组.components(separatedBy: .whitespacesAndNewlines).joined() {
    出现频率[词, default: 0] += 1
}
for (词, 次数) in 出现频率 {
    if 次数 > 1 {
        print(词,次数)
    }
}


/*:
 ### Dictionary相关的 `map` 和 `filter`
 
 `filter` 返回一个 `Dictionary` 而非 `Array`. 相似的, 新方法`mapValues`转换值的同时保持字典结构.
 */
let filtered = 热门编程语言排行.filter {
    $0.key % 2 == 0
}
type(of: filtered)

let mapped = 热门编程语言排行.mapValues { value in
    value.uppercased()
}
mapped

/*:
 `Set.filter` 现在同样返回一个 `Set` 而不是 `Array`.
 */
let set: Set = [1,2,3,4,5]
let filteredSet = set.filter { $0 % 2 == 0 }
type(of: filteredSet)

/*:
 ### 分组一个序列
 
 把一个序列分成几组, 比如联系人按姓分组.
 */
let 联系人 = ["张三丰", "李思思", "张素芳", "李白", "王飞飞", "张小军"]
let 通讯录 = Dictionary(grouping: 联系人, by: { $0.first! })
通讯录

/*: [首页](Table%20of%20contents) • [上一页](@previous) • [下一页](@next) */

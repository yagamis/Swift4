/*:
 [首页](Table%20of%20contents) • [上一页](@previous) • [下一页](@next)

 ## 协议相关类型的约束

 [SE-0142][SE-0142]: 协议的相关类型可以用`where`语句约束. 看似一小步,却是类型系统表达能力的一大步,让标准库可以大幅简化. 喜大普奔的是, `Sequence` 和 `Collection` 在Swift 4中用上这个就更直观了.

 [SE-0142]: https://github.com/apple/swift-evolution/blob/master/proposals/0142-associated-types-constraints.md "Swift Evolution Proposal SE-0142: Permit where clauses to constrain associated types"

 ### `Sequence.Element`

 `Sequence` 现在有了自己的相关类型 `Element` . 原先Swift 3中到处露脸的 `Iterator.Element` , 现在瘦身成`Element`:
 */
extension Sequence where Element: Numeric {
    var 求和: Element {
        var 结果: Element = 0
        for 单个元素 in self {
            结果 += 单个元素
        }
        return 结果
    }
}

[1,2,3,4].求和

/*:
 ### 当扩展 `Sequence` 和 `Collection` 时所需约束更少
 */
// 在Swift 3时代, 这种扩展需要很多的约束:
//extension Collection where Iterator.Element: Equatable,
//    SubSequence: Sequence,
//    SubSequence.Iterator.Element == Iterator.Element
//
// 而在Swift 4, 编译器已经提前知道了上述3个约束中的2个, 因为可以用相关类型的where语句来表达它们.
extension Collection where Element: Equatable {
    func 头尾镜像(_ n: Int) -> Bool {
        let 头 = prefix(n)
        let 尾 = suffix(n).reversed()
        return 头.elementsEqual(尾)
    }
}

[1,2,3,4,2,1].头尾镜像(2)

/*: [首页](Table%20of%20contents) • [上一页](@previous) • [下一页](@next) */

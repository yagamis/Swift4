/*:
 [首页](Table%20of%20contents) • [上一页](@previous) • [下一页](@next)

 ## `MutableCollection.swapAt` 方法

 [SE-0173][SE-0173] 介绍了一种交换一个集合中两个元素的新方法. 与既有的 `swap(_:_:)` 方法不同, `swapAt(_:_:)` 接受一个要交换的元素切片, 而不是整个元素本身 (通过 `inout` 参数).
 
 加这个的目的是 `swap` 方法带2个 `inout` 参数 不再兼容新的独占式内存访问规则,见 [SE-0176][SE-0176]. 既有的 `swap(_:_:)` 方法不能再交换同一个集合中的两个元素.

 [SE-0173]: https://github.com/apple/swift-evolution/blob/master/proposals/0173-swap-indices.md "Swift Evolution Proposal SE-0173: Add `MutableCollection.swapAt(_:_:)`"
 [SE-0176]: https://github.com/apple/swift-evolution/blob/master/proposals/0176-enforce-exclusive-access-to-memory.md "Swift Evolution Proposal SE-0176: Enforce Exclusive Access to Memory"
 */
var numbers = [1,2,3,4,5]
numbers.swapAt(0,1)

// Swift 4中非法
//swap(&numbers[3], &numbers[4])
//numbers

/*: [首页](Table%20of%20contents) • [上一页](@previous) • [下一页](@next) */

/*:
 [首页](Table%20of%20contents) • [上一页](@previous) • [下一页](@next)

 ## `reduce` 和 `inout`

 [SE-0171][SE-0171] 新增 `reduce` 的一个变体, 让部分结果以 `inout` 传递给组合函数. 如此一来可以通过消除中间结果的副本来递增一个序列,大幅提升`reduce`算法的性能.

 [SE-0171]: https://github.com/apple/swift-evolution/blob/master/proposals/0171-reduce-with-inout.md "Swift Evolution Proposal SE-0171: Reduce with `inout`"
 
 SE-0171 为实现.
 */
// 尚未实现
//extension Sequence where Element: Equatable {
//    func uniq() -> [Element] {
//        return reduce(into: []) { (result: inout [Element], element) in
//            if result.last != element {
//                result.append(element)
//            }
//        }
//    }
//}
////
//[1,1,1,2,3,3,4].uniq()


/*: [首页](Table%20of%20contents) • [上一页](@previous) • [Next page](@next) */

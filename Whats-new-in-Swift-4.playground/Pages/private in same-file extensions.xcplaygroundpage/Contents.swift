/*:
 [首页](Table%20of%20contents) • [上一页](@previous) • [下一页](@next)

 ## 同文件内的扩展, 私有声明可见

 [SE-0169][SE-0169] 更改了访问控制规则,比如在同文件内的扩展中,原类型的`private`声明也是可见的. 这种改进可让同文件内保持使用`private`分割类型定义成为可能 , 减少不受欢迎的 `fileprivate` 关键词的使用.

 [SE-0169]: https://github.com/apple/swift-evolution/blob/master/proposals/0169-improve-interaction-between-private-declarations-and-extensions.md "Swift Evolution Proposal SE-0169: Improve Interaction Between private Declarations and Extensions"
 */
struct SortedArray<Element: Comparable> {
    private var storage: [Element] = []
    init(unsorted: [Element]) {
        storage = unsorted.sorted()
    }
}

extension SortedArray {
    mutating func insert(_ element: Element) {
        // storage 此处可见
        storage.append(element)
        storage.sort()
    }
}

let array = SortedArray(unsorted: [3,1,2])
// storage 此处不可见 (不像 fileprivate)
//array.storage // error: 'storage' is inaccessible due to 'private' protection level

/*: [首页](Table%20of%20contents) • [上一页](@previous) • [下一页](@next) */

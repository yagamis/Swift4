/*:
 [首页](Table%20of%20contents) • [上一页](@previous) • [下一页](@next)

 ## 智能key path

 [SE-0161][SE-0161]描述的新式key path有可能搞了个Swift 4的大新闻. 不像Cocoa中基于字符串的那样too simple, Swift中的可是强类型的, 你们要认真学习.

 [SE-0161]: https://github.com/apple/swift-evolution/blob/master/proposals/0161-key-paths.md "Swift Evolution Proposal SE-0161: Smart KeyPaths: Better Key-Value Coding for Swift"
 */
struct 人 {
    var 名字: String
}

struct 书 {
    var 标题: String
    var 作者: [人]
    var 第一作者: 人 {
        return 作者.first!
    }
}

let 小波 = 人(名字: "小波")
let 小弟 = 人(名字: "小弟")
let Kotlin快速入门书 = 书(标题: "Kotlin快速入门", 作者: [小波, 小弟])

/*:
 Key path由一个根类型开始,和其下任意深度的属性链和下标名组成.
 
 你可以写一个key path由一个反斜杠开始: `\书.标题`. 每个类型自动获取一个 `[keyPath: …]` 下标可以设置或获取指定key path的值.
 */
Kotlin快速入门书[keyPath: \书.标题]
// Key path 可深入并支持计算属性
Kotlin快速入门书[keyPath: \书.第一作者.名字]

/*:
 Key path 是可被存储和操作的对象. 比如, 你可以给一个key path加上额外字段深入到作者.
 */
let 作者KeyPath = \书.第一作者
type(of: 作者KeyPath)
let 名字KeyPath = 作者KeyPath.appending(path: \.名字) // 可以省略类型名, 如果编译器能推断的话
Kotlin快速入门书[keyPath: 名字KeyPath]

/*:
 ### 下标Key path
 
 Key paths 也支持下标. 如此一来可以非常便捷的深入到数组或字典这些集合类型中. 
 不过这功能在当前snapshot还未实现.
 */
//Kotlin快速入门书[keyPath: \书.作者[0].名字]
// error: key path support for subscript components is not implemented

/*: [首页](Table%20of%20contents) • [上一页](@previous) • [下一页](@next) */

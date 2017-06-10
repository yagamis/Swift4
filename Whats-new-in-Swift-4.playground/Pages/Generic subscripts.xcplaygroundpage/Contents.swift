/*:
 [首页](Table%20of%20contents) • [上一页](@previous) • [下一页](@next)

 ## 泛型下标

 托 [SE-0148][SE-0148] 的福, 下标现在可以有泛型参数和返回类型.
 
 [SE-0148]: https://github.com/apple/swift-evolution/blob/master/proposals/0148-generic-subscripts.md "Swift Evolution Proposal SE-0148: Generic Subscripts"
 
 最权威的例子莫过于表示 JSON 数据: 你可以定义一个泛型下标来保持调用者期望类型的内容.
 */
struct JSON {
    fileprivate var storage: [String:Any]

    init(dictionary: [String:Any]) {
        self.storage = dictionary
    }

    subscript<T>(key: String) -> T? {
        return storage[key] as? T
    }
}

let json = JSON(dictionary: [
    "城市名": "北京",
    "国家代码": "cn",
    "人口": 21_710_000
    ])

// 没必要用 as? Int
let population: Int? = json["人口"]

/*:
 另一个例子: `Collection` 的一个下标接受一个泛型索引序列, 并返回一个这些索引所在的数组:
 */
extension Collection {
    subscript<Indices: Sequence>(indices: Indices) -> [Element] where Indices.Element == Index {
        var result: [Element] = []
        for index in indices {
            result.append(self[index])
        }
        return result
    }
}

let words = "我 思 故 我 在".split(separator: " ")
words[[1,2]]

/*: [首页](Table%20of%20contents) • [上一页](@previous) • [下一页](@next) */

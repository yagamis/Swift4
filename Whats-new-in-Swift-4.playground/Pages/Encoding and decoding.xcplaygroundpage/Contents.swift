/*:
 [首页](Table%20of%20contents) • [上一页](@previous) • [下一页](@next)

 ## 压缩化 和 序列化

 [SE-0166: Swift Archival & Serialization][SE-0166] 定义了一种为任意Swift类型 (class, struct, 和 enum) 来描述自身如何压缩和序列化的方法. 类型可遵从 `Codable` 协议让自身可(解)压缩.
 
 大多数情况下添加 `Codable` 协议就可以让你的自定义类型完美解压缩, 因为编译器可以生成一个默认的实现,前提是所有成员类型都是`Codable`的. 当然你可以覆盖默认方法如果需要优化自定义类型的编码. 这个说来话长 — 还请研读SE-0166.
 
 [SE-0166]: https://github.com/apple/swift-evolution/blob/master/proposals/0166-swift-archival-serialization.md "Swift Evolution Proposal SE-0166: Swift Archival & Serialization"

 */
// 遵从Codable协议, 让一个自定义类型 (和其所有成员) 可压缩
struct 扑克: Codable {
    enum 全部花色: String, Codable {
        case 黑桃, 梅花, 红心, 方片
    }

    enum 全部点数: Int, Codable {
        case 尖 = 1, 二, 三, 四, 五, 六, 七, 八, 九, 十, 金钩, 皮蛋, 老K
    }

    var 花色: 全部花色
    var 点数: 全部点数
}

let 我的牌 = [扑克(花色: .黑桃, 点数: .尖), 扑克(花色: .红心, 点数: .皮蛋)]

/*:
 ### 编码
 
 一旦有一个`Codable`值, 你要把它传递给一个编码器以便压缩 .
 
 利用`Codable`协议的基础设施可以写自己的编解码器, 不过Swift同时为JSON提供一个内置的编解码器 (`JSONEncoder` 和 `JSONDecoder`) 和属性列表 (`PropertyListEncoder` 和 `PropertyListDecoder`). 这些是在 [SE-0167][SE-0167] 中定义的. `NSKeyedArchiver` 同样支持所有的 `Codable` 类型.

 [SE-0167]: https://github.com/apple/swift-evolution/blob/master/proposals/0167-swift-encoders.md "Swift Evolution Proposal SE-0167: Swift Encoders"
 */
import Foundation

var encoder = JSONEncoder()

// JSONEncoder提供的可定制化属性
encoder.dataEncodingStrategy
encoder.dateEncodingStrategy
encoder.nonConformingFloatEncodingStrategy
encoder.outputFormatting = .prettyPrinted //格式化的json字符串
encoder.userInfo

let jsonData = try encoder.encode(我的牌)
String(data: jsonData, encoding: .utf8)

/*:
 ### 解码
 */
let decoder = JSONDecoder()
let decoded = try decoder.decode([扑克].self, from: jsonData)

/*: [首页](Table%20of%20contents) • [上一页](@previous) • [下一页](@next) */

/*:
 [首页](Table%20of%20contents) • [上一页](@previous) • [下一页](@next)

 ## `NSNumber` 桥接

 [SE-0170][SE-0170] 修正部分危险行为当桥接Swift原生数字类型和`NSNumber`的时候.
 
 [SE-0170]: https://github.com/apple/swift-evolution/blob/master/proposals/0170-nsnumber_bridge.md "Swift Evolution Proposal SE-0170: NSNumber bridging and Numeric types"
 */
import Foundation

let n = NSNumber(value: UInt32(301))
let v = n as? Int8 // nil(Swift 4). Swift 3会是45 (试试看!).

/*: [首页](Table%20of%20contents) • [上一页](@previous) • [Next page](@next) */

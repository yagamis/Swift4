/*:
 [首页](Table%20of%20contents) • [上一页](@previous)

 ## 类和协议的组合

 [SE-0156][SE-0156]: 你现在能写出OC这段 `UIViewController <SomeProtocol> *` 在Swift中的等价代码, 比如声明这样一个变量,这个变量拥有实体类型并同时遵守若干协议. 语法 `let 变量: 某个类 & 协议1 & 协议2`.

 [SE-0156]: https://github.com/apple/swift-evolution/blob/master/proposals/0156-subclass-existentials.md "Swift Evolution Proposal SE-0156: Class and Subtype existentials"
 */
import Cocoa

protocol HeaderView {}

class ViewController: NSViewController {
    let header: NSView & HeaderView

    init(header: NSView & HeaderView) {
        self.header = header
        super.init(nibName: nil, bundle: nil)!
    }

    required init(coder decoder: NSCoder) {
        fatalError("not implemented")
    }
}

// 不能传一个简单的NSView进去因为不遵守协议
//ViewController(header: NSView())
// 错误: argument type 'NSView' does not conform to expected type 'NSView & HeaderView'

// 必须穿一个 NSView (子类) 同时遵守协议
extension NSImageView: HeaderView {}

ViewController(header: NSImageView()) // 有用

/*: [首页](Table%20of%20contents) • [上一页](@previous) */

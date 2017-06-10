/*:
 [首页](Table%20of%20contents) • [上一页](@previous) • [下一页](@next)
 
 ## 字符串

 ### 多行字符串字面量

 [SE-0168][SE-0168] 带来一种简洁定义多行字符串的语法,使用 (`"""`). 在一个多行字符串里并不需要写转义字符, 也就是说大多数文本格式 (如JSON 或 HTML) 就可以直接粘贴而无须任何转义. 结尾三引号的缩进,决定了每一行头部被裁剪的空格多少. Python:致敬我吗😁  Kotlin:我也早有这功能了😓
 
 [SE-0168]: https://github.com/apple/swift-evolution/blob/master/proposals/0168-multi-line-string-literals.md "Swift Evolution Proposal SE-0168: Multi-Line String Literals"
 */
let 多行字符串 = """
    这是一个多行字符串.
    不需要在这里转义 "引号".
    结尾三引号的位置,
    控制空格的裁剪数.
    """
print(多行字符串)

/*:
 可以打开控制台 (_菜单View > Debug Area > Activate Console_) 来看 `print` 的输出.

 ### 字符串"又双"变回一个 `Collection`了, 没错, 天地暂停,时光倒流😂

 [SE-0163][SE-0163] 是 Swift 4 字符串模型的第一部分修正. 最大变化 `String` 再度是一个 `Collection`  (因为在Swift 1.x中是这样的), 比如 `String.CharacterView` 已经被并入其父类型中. (其他view, `UnicodeScalarView`, `UTF8View`, 和 `UTF16View`, 依旧存在.)
 
注意SE-0163还没完全实现并且这条建议中还有很多字符串相关的提议(意思是还有的折腾).

 [SE-0163]: https://github.com/apple/swift-evolution/blob/master/proposals/0163-string-revision-1.md "Swift Evolution Proposal SE-0163: String Revision: Collection Conformance, C Interop, Transcoding"
 */
let 欢迎语 = "侬好Bobo, 😜!"
// 不需要再钻到 .characters 属性里面去了
欢迎语.count
for 字 in 欢迎语 {
    print(字)
}

/*:
 ### `Substring` 是字符串切片后的新类型

 字符串切片现在是 `Substring`类型的实例.  `String` 和 `Substring` 两者都遵从 `StringProtocol`. 几乎所有字符串API都在 `StringProtocol` 所以 `String` 和 `Substring` 行为很大程度是一样的.
 */
let 逗号的位置 = 欢迎语.index(of: ",")!
let substring = 欢迎语[..<逗号的位置]
type(of: substring)
// Substring 可以调用 String 的 API
print(substring.uppercased())
/*:
 ### Unicode 9
 
 Swift 4 即将支持 Unicode 9, 当前正在修正 [一些时髦emoji适当的语义问题][Emoji 4.0]. 下面的所有字符计数是 `1`, 和实际的对比:

 [Emoji 4.0]: https://oleb.net/blog/2016/12/emoji-4-0/
 */
"👧🏽".count // 人 + 肤色
"👨‍👩‍👧‍👦".count // 有4个成员的家庭
"👱🏾\u{200D}👩🏽\u{200D}👧🏿\u{200D}👦🏻".count // 家庭 + 肤色
"👩🏻‍🚒".count // 人 + 肤色 + 职业

/*:
 ### `Character.unicodeScalars` 属性
 
 现在可以直接访问一个 `Character` 的unicode编码值,而不用先转成`String` ([SE-0178][SE-0178]):

 [SE-0178]: https://github.com/apple/swift-evolution/blob/master/proposals/0178-character-unicode-view.md "Swift Evolution Proposal SE-0178: Add `unicodeScalars` property to `Character`"
 */
let c: Character = "🇪🇺"
Array(c.unicodeScalars)

/*: [首页](Table%20of%20contents) • [上一页](@previous) • [下一页](@next) */

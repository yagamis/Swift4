/*:
 # Swift 4新功能Playground集锦
 
 By Ole Begemann •  翻译 by [小波说雨燕]
 
 **Swift 4.0 工具链版本: 2017/6/9.**
 
 [小波说雨燕]: http://xiaoboswift.com
 
 ## 内容

 1. 使用说明 (见下图)
 1. [开区间](One-sided%20ranges)
 1. [字符串](Strings)
 1. [同文件内的扩展, 私有声明可见](private%20in%20same-file%20extensions)
 1. [智能Key path](Key%20paths)
 1. [编码和解码](Encoding%20and%20decoding)
 1. [协议相关类型的约束](Associated%20type%20constraints)
 1. [字典(`Dictionary`)和集合(`Set`)的增强](Dictionary%20and%20Set%20enhancements)
 1. [`MutableCollection.swapAt` 方法](swapAt)
 1. [`reduce` 和 `inout`](reduce%20with%20inout)
 1. [泛型下标](Generic%20subscripts)
 1. [`NSNumber` 桥接](NSNumber%20bridging)
 1. [类和协议的组合](Composing%20classes%20and%20protocols)

 ## 使用说明

 此Playgroud需要Swift 4环境. Xcode 9 默认包含 Swift 4 (Xcode 9 beta可在[developer.apple.com][Xcode 9]下载). 不过也可以在 Xcode 8.3 下运行, 仅需安装一个 Swift 4 工具链 (分分钟搞定 666):

 1. 下载安装swift.org上的最新[Swift 4.0快照][Snapshot 下载].
 1. 在 Xcode 菜单, Preference > Component > Toolchains ,选择刚安装的snapshot:
 
    ![][snapshot-cofig.png]
 
    建议安装快照后重启XCode.
 
 
 [Xcode 9]: https://developer.apple.com/download/
 [Snapshot 下载]: https://swift.org/download/#snapshots
 [snapshot-cofig.png]: snapshot-cofig.png
 

 [下一页](@next)
 */


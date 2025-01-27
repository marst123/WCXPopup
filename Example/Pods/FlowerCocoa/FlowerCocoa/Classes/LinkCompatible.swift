import UIKit
@_exported import Moisture
/*
 定义了一个名为LinkCompatible的公共协议,
 它包含一个名为LinkBase的关联类型和一个只读计算属性link
 */
public protocol LinkCompatible {
    associatedtype LinkBase
    var link: LinkBase { get }// 
}

/*
 在LinkCompatible协议扩展中，提供了一个默认实现
 返回Link<Self>类型的link属性，其中Self表示实现LinkCompatible协议的具体类型(一切NSObject对象)
 */
extension LinkCompatible {
    /// Reactive extensions.
    public var link: Link<Self> {
        return Link(self)
    }
}

/*
 通过扩展NSObject类来实现LinkCompatible协议，这意味着所有NSObject的子类都将获得link属性
 */
extension NSObject: LinkCompatible {}// 主要是为了NSObject一个响应式扩展(常被用来扩展现有类型,以便添加自定义方法和属性)

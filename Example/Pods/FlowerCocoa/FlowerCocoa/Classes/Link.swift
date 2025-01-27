import Foundation

/*
 定义了一个名为Link的结构体
 包括:一个名为base的只读属性,一个泛型类型参数Base的init方法
 */
public struct Link<Base> {
    /// Base object to extend.
    public let base: Base

    /// Creates extensions with base object.
    ///
    /// - parameter base: Base object.
    public init(_ base: Base) {
        self.base = base
    }
}
/*
 它的好处是,使用Link对象来添加我们自定义的方法和属性,同时返回Link;避免了对原对象的修改操作
 */


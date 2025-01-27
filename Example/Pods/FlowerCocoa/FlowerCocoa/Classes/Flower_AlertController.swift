import UIKit


//MARK: - UIAlertController属性扩展

public extension Link where Base: UIAlertController {
    
    /// 标题
    func setTitle(_ title: String?) -> Link {
        self.base.title = title
        return self
    }
    
    /// 内容
    func setMessage(_ message: String?) -> Link {
        self.base.message = message
        return self
    }

    /// 添加按钮(外部UIAlertAction)
    ///
    /// - Parameters:
    /// - UIAlertActionStyle - sheet : `default` 默认类型,常规按钮样式 `cancel` 取消类型,加粗位于最下方按钮 `destructive` 销毁类型,红色显示
    /// - UIAlertActionStyle - alert : `default` 默认类型,常规按钮样式 `cancel` 取消类型,加粗位于最后方按钮 `destructive` 销毁类型,红色显示
    func addAction(_ action: UIAlertAction) -> Link {
        self.base.addAction(action)
        return self
    }
    
    /// 添加按钮(内部设置标题、样式和点击事件处理)
    ///
    /// - Parameters:
    ///   - title: 按钮标题
    ///   - style: 按钮样式，可以是 `UIAlertAction.Style` 中的 `.default`、`.cancel` 或 `.destructive`
    ///   - handler: 点击按钮后的处理闭包
    func addActionHandle(action title: String?, style: UIAlertAction.Style, handler: ((UIAlertAction) -> Void)? = nil) -> Link {
        let alert = UIAlertAction(title: title, style: style, handler: handler)
        self.base.addAction(alert)
        return self
    }
    
}


//MARK: - UIAlertAction属性扩展

public extension Link where Base: UIAlertAction {
    
    /// 设置按钮是否启用
    func isEnabled(_ enabled: Bool) -> Link {
        self.base.isEnabled = enabled
        return self
    }
}

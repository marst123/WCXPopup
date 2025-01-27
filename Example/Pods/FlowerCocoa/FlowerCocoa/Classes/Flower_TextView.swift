import UIKit


//MARK: - UITextView属性扩展

public extension Link where Base: UITextView {
    
    /// 文本视图的代理
    @discardableResult
    func delegate(_ delegate: UITextViewDelegate?) -> Link {
        self.base.delegate = delegate
        return self
    }
    
    /// 是否允许编辑文本内容, 默认true
    @discardableResult
    func isEditable(_ isEditable: Bool) -> Link {
        self.base.isEditable = isEditable
        return self
    }
    
    /// 文本匹配，实现超链接
    @discardableResult
    func dataDetectorTypes(_ dataDetectorTypes: UIDataDetectorTypes) -> Link {
        self.base.dataDetectorTypes = dataDetectorTypes
        return self
    }
    
    /// 文本内边距
    @discardableResult
    func edges(_ inset: UIEdgeInsets) -> Link {
        self.base.textContainerInset = inset
        return self
    }
    
    /// 文本颜色
    @discardableResult
    func textColor(_ textColor: UIColor) -> Link {
        self.base.textColor = textColor
        return self
    }
    
}

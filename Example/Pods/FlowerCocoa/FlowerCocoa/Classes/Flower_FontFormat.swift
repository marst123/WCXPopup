import Foundation


//MARK: - FontFormat协议扩展

public extension Link where Base: FontFormat {
    
    /// 字体
    @discardableResult
    func font(_ state: FontWeightStyle) -> Link {
        self.base.font(state)
        return self
    }
}


//MARK: - FontFormat协议

public protocol FontFormat {
    func font(_ style: FontWeightStyle)
}

extension UILabel: FontFormat {
    public func font(_ style: FontWeightStyle) {
        self.font = style.font
    }
}

extension UIButton: FontFormat {
    public func font(_ style: FontWeightStyle) {
        self.titleLabel?.font = style.font
    }
}

extension UITextView: FontFormat {
    public func font(_ style: FontWeightStyle) {
        self.font = style.font
    }
}


extension UITextField: FontFormat {
    public func font(_ style: FontWeightStyle) {
        self.font = style.font
    }
}

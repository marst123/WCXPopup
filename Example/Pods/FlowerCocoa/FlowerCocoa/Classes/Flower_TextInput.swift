import UIKit


//MARK: - TextInput协议扩展

extension Link where Base: TextInputLayer {
    
    /// 是否作为安全文本输入
    @discardableResult
    func secureTextEntry(_ secureTextEntry: Bool) -> Link {
        self.base.secureTextEntry(secureTextEntry)
        return self
    }
    
    /// 键盘类型
    @discardableResult
    func keyboardType(_ keyboardType: UIKeyboardType) -> Link {
        self.base.keyboardType(keyboardType)
        return self
    }
    
    /// return键盘的类型
    @discardableResult
    func returnKeyType(_ returnKeyType: UIReturnKeyType) -> Link {
        self.base.returnKeyType(returnKeyType)
        return self
    }
    
    /// 键盘外观风格
    @discardableResult
    func keyboardAppearance(_ keyboardAppearance: UIKeyboardAppearance) -> Link {
        self.base.keyboardAppearance(keyboardAppearance)
        return self
    }
}


//MARK: - TextInput协议

public protocol TextInputLayer {
    func keyboardType(_ keyboardType: UIKeyboardType)
    func secureTextEntry(_ secureTextEntry: Bool)
    func returnKeyType(_ returnKeyType: UIReturnKeyType)
    func keyboardAppearance(_ keyboardAppearance: UIKeyboardAppearance)
}


extension UITextView: TextInputLayer {
    public func keyboardType(_ keyboardType: UIKeyboardType) {
        self.keyboardType = keyboardType
    }
    
    public func secureTextEntry(_ secureTextEntry: Bool) {
        self.isSecureTextEntry = secureTextEntry
    }
    
    public func returnKeyType(_ returnKeyType: UIReturnKeyType) {
        self.returnKeyType = returnKeyType
    }
    
    public func keyboardAppearance(_ keyboardAppearance: UIKeyboardAppearance) {
        self.keyboardAppearance = keyboardAppearance
    }
}


extension UITextField: TextInputLayer {
    public func keyboardType(_ keyboardType: UIKeyboardType) {
        self.keyboardType = keyboardType
    }
    
    public func secureTextEntry(_ secureTextEntry: Bool) {
        self.isSecureTextEntry = secureTextEntry
    }
    
    public func returnKeyType(_ returnKeyType: UIReturnKeyType) {
        self.returnKeyType = returnKeyType
    }
    
    public func keyboardAppearance(_ keyboardAppearance: UIKeyboardAppearance) {
        self.keyboardAppearance = keyboardAppearance
    }
}
